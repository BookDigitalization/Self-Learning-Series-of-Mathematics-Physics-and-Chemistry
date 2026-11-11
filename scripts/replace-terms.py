"""整词批量替换（用词现代化用）。默认只试运行，加 --apply 才写文件。

用法：
  uv run python scripts/replace-terms.py --book physics-1 --map terms.tsv            # 试运行：只统计
  uv run python scripts/replace-terms.py --book physics-1 --map terms.tsv --apply    # 写入

terms.tsv：每行“旧词<TAB>新词”；以 # 开头的行和空行忽略。旧词以 re: 开头表示正则，如
  re:(?<![第十])二个<TAB>两个
  re:(?<![现对形印气抽景迹大万假表想意星物天具])象(?![征限牙])<TAB>像

只改 Typst 正文：
  - 跳过 `//` 行注释和 `/* */` 块注释里的内容（`// 原书作 xxx` 记录必须保留旧词）；
  - 跳过标题行（以 =、==、=== 加空格再加汉字开头的行）：标题要不要改由项目负责人另定，脚本只报告；
  - 公式续行（以“= 数字”开头的行）不是标题，会被正常处理。
范围：books/<分册>/ 下所有 .typ（章、附录、图的源码）。

用法约定见 .claude/skills/digitize-book/revise-book.md。先试运行，逐条看 re: 规则的上下文，再 --apply。
"""
import argparse, glob, os, re, sys

COMMENT = re.compile(r'(/\*.*?\*/|//.*$)')
HEADING = re.compile(r'\s*=+ [一-鿿]')


def load_map(path):
    rules = []
    for line in open(path, encoding='utf-8'):
        line = line.rstrip('\n')
        if not line.strip() or line.lstrip().startswith('#'):
            continue
        old, new = line.split('\t')
        if old.startswith('re:'):
            rules.append((re.compile(old[3:]), new, old))
        else:
            rules.append((old, new, old))
    return rules


def apply_rules(seg, rules, counts):
    for pat, new, label in rules:
        if isinstance(pat, str):
            n = seg.count(pat)
            if n:
                counts[label] = counts.get(label, 0) + n
                seg = seg.replace(pat, new)
        else:
            seg, n = pat.subn(new, seg)
            if n:
                counts[label] = counts.get(label, 0) + n
    return seg


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--book', required=True)
    ap.add_argument('--map', required=True)
    ap.add_argument('--apply', action='store_true')
    a = ap.parse_args()
    rules = load_map(a.map)
    counts, skipped_heads, changed = {}, [], 0
    files = sorted(glob.glob(os.path.join('books', a.book, '**', '*.typ'), recursive=True))
    for f in files:
        text = open(f, encoding='utf-8', newline='').read()
        nl = '\r\n' if '\r\n' in text else '\n'
        out = []
        for no, line in enumerate(text.split(nl), 1):
            if HEAD_MATCH(line):
                if apply_rules(line, rules, {}) != line:
                    skipped_heads.append((os.path.basename(f), no, line.strip()[:50]))
                out.append(line)
                continue
            parts = COMMENT.split(line)
            for k in range(0, len(parts), 2):          # 偶数下标是非注释片段
                parts[k] = apply_rules(parts[k], rules, counts)
            out.append(''.join(parts))
        new = nl.join(out)
        if new != text:
            changed += 1
            if a.apply:
                open(f, 'w', encoding='utf-8', newline='').write(new)
    for k, v in sorted(counts.items(), key=lambda x: -x[1]):
        print(f'{v:5d}  {k}')
    print(f'合计 {sum(counts.values())} 处，涉及 {changed} 个文件（{"已写入" if a.apply else "试运行，未写入"}）')
    if skipped_heads:
        print('含旧词但被跳过的标题行（请项目负责人决定）：')
        for h in skipped_heads:
            print('  ', h)


def HEAD_MATCH(line):
    return bool(HEADING.match(line))


if __name__ == '__main__':
    sys.exit(main())
