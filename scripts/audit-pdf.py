"""整书 PDF 版面与结构审计（只读）。

用法：python scripts/audit-pdf.py build/physics-1.pdf [--sheets build/sheets]

检查：
  1. 字体：列出嵌入字体，提示不在开源名单里的字体。
  2. 书签：每个书签的标题是否出现在目标页。
  3. 目录：目录里印的页码与书签目标页的页脚页码是否一致（目录取前 6 页，格式“标题 …… 页码”）。
  4. 版面：同页相邻文字行是否重叠（字号 >= 8 的 span，排除图中旋转标注的误报需人工看）、
     页底是否孤立着标题、字数过少的页（章首页、整页大图页属正常）。
  5. 可选 --sheets DIR：把全书拼成每 20 页一张的缩略图 PNG，用来目测整体版面。

需要 PyMuPDF。输出里 MISMATCH / OVERLAP / ORPHAN 开头的行需要人工看一眼。
"""
import argparse, collections, os, re, sys
import pymupdf

OPEN_FONT_HINTS = ('LXGW', 'WenKai', 'Noto', 'NewCM', 'NewComputerModern', 'NewCMMath')


def footer(page, height):
    ws = page.get_text('words')
    if not ws:
        return ''
    ymax = max(w[3] for w in ws)
    return ''.join(w[4] for w in ws if w[3] >= ymax - 3)


def check_fonts(d):
    fonts = collections.Counter()
    for p in d:
        for f in p.get_fonts():
            fonts[f[3].split('+')[-1]] += 1
    print('== 字体')
    for name, n in fonts.most_common():
        flag = '' if any(h in name for h in OPEN_FONT_HINTS) else '   <-- 不在开源字体名单里，核对！'
        print(f'  {name}: {n} 页{flag}')


def check_bookmarks(d):
    toc = d.get_toc()
    print(f'== 书签：{len(toc)} 条，层级 {dict(collections.Counter(t[0] for t in toc))}')
    bad = 0
    for lvl, title, pg in toc:
        key = re.sub(r'\s+', '', title)[:6]
        if key not in re.sub(r'\s+', '', d[pg - 1].get_text()):
            bad += 1
            print(f'  MISMATCH 书签 “{title}” 在 PDF 第 {pg} 页找不到')
    print(f'  标题找不到的书签：{bad}')
    return toc


def check_toc_numbers(d, toc, ntoc_pages=6):
    lines = {}
    for i in range(1, min(ntoc_pages + 1, len(d))):
        for l in d[i].get_text().split('\n'):
            m = re.match(r'(.*?)[\s.．]*⁠?(\d+|[ivx]+)\s*$', l.strip())
            if m and '. .' in l:
                lines[re.sub(r'[\s.]+', '', m.group(1))] = m.group(2)
    bad = 0
    for lvl, title, pg in toc:
        key = re.sub(r'[\s.]+', '', title)
        printed = lines.get(key)
        if printed is None:
            for k, v in lines.items():
                if k.startswith(key[:8]) or key.startswith(k[:8]):
                    printed = v
                    break
        foot = footer(d[pg - 1], d[pg - 1].rect.height)
        if printed != foot:
            bad += 1
            print(f'  MISMATCH 目录 “{title}”：目录印 {printed}，页脚 {foot}（PDF 第 {pg} 页）')
    print(f'== 目录页码：解析 {len(lines)} 行，不一致 {bad}')


def check_layout(d):
    H = d[0].rect.height
    overlaps, orphans, sparse = [], [], []
    for i, p in enumerate(d):
        spans, body = [], []
        for b in p.get_text('dict')['blocks']:
            if b.get('type') != 0:
                continue
            for l in b['lines']:
                txt = ''.join(s['text'] for s in l['spans']).strip()
                if not txt:
                    continue
                sp = l['spans'][0]
                for s in l['spans']:
                    if s['text'].strip() and s['size'] >= 8:
                        spans.append((s['bbox'], s['text']))
                if l['bbox'][3] <= H - 60:
                    body.append((l['bbox'][3], txt, sp['font'], sp['size'], l['bbox'][0]))
        n = 0
        for a in range(len(spans)):
            A = spans[a][0]
            for c in range(a + 1, len(spans)):
                B = spans[c][0]
                ox = min(A[2], B[2]) - max(A[0], B[0])
                oy = min(A[3], B[3]) - max(A[1], B[1])
                if ox > 3 and oy > 4.5 and abs(A[1] - B[1]) > 6:
                    n += 1
                    if n == 1:
                        overlaps.append((i + 1, spans[a][1][:10], spans[c][1][:10], round(oy, 1)))
        if body:
            last = max(body)
            if 'Sans' in last[2] and last[3] >= 10 and last[4] < 120 and len(last[1]) < 40:
                orphans.append((i + 1, last[1][:30]))
        if len(p.get_text('words')) < 40:
            sparse.append(i + 1)
    print('== 版面')
    for o in overlaps:
        print(f'  OVERLAP 第 {o[0]} 页：“{o[1]}” 与 “{o[2]}” 重叠 {o[3]}pt（图中旋转标注、独立公式常是误报）')
    for o in orphans:
        print(f'  ORPHAN 第 {o[0]} 页末行像标题：“{o[1]}”（带“［解］”等标签的行属正常换页）')
    print(f'  字数少于 40 的页（章首页、大图页正常）：{sparse}')


def sheets(d, outdir, cols=5, rows=4):
    os.makedirs(outdir, exist_ok=True)
    cw, ch = 150, 214
    per = cols * rows
    for s in range(0, len(d), per):
        doc = pymupdf.open()
        page = doc.new_page(width=cols * cw, height=rows * ch)
        for k in range(per):
            i = s + k
            if i >= len(d):
                break
            r, c = divmod(k, cols)
            rect = pymupdf.Rect(c * cw + 2, r * ch + 8, (c + 1) * cw - 2, (r + 1) * ch - 2)
            page.show_pdf_page(rect, d, i)
            page.draw_rect(rect, color=(0.6, 0.6, 0.6), width=0.4)
            page.insert_text((rect.x0 + 2, rect.y0 - 1), str(i + 1), fontsize=6, color=(1, 0, 0))
        page.get_pixmap(dpi=150).save(os.path.join(outdir, f'sheet{s // per + 1:02d}.png'))
    print(f'== 缩略图：{(len(d) + per - 1) // per} 张，在 {outdir}')


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('pdf')
    ap.add_argument('--sheets', help='缩略图输出目录')
    a = ap.parse_args()
    d = pymupdf.open(a.pdf)
    print(f'页数 {len(d)}，页面 {d[0].rect.width:.0f}x{d[0].rect.height:.0f}pt，标题 {d.metadata.get("title")}')
    check_fonts(d)
    toc = check_bookmarks(d)
    check_toc_numbers(d, toc)
    check_layout(d)
    if a.sheets:
        sheets(d, a.sheets)


if __name__ == '__main__':
    sys.exit(main())
