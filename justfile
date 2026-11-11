# 数理化自学丛书数字化项目的常用操作。运行 `just` 列出所有命令。
# 需要：just、typst、Python（PyMuPDF）。字体先 `just fonts`。
# 下载 @preview 包报 Proxy 错误时，先在同一个 PowerShell 里设置 $env:HTTPS_PROXY（见 CLAUDE.local.md）。

set shell := ["pwsh", "-NoProfile", "-Command"]
set windows-shell := ["pwsh", "-NoProfile", "-Command"]

book := "physics-1"
scan := "original/数理化自学丛书物理第一册.pdf"
flags := "--root . --font-path fonts --ignore-system-fonts"

# 列出所有命令
default:
    @just --list --unsorted

# ───────────── 构建 ─────────────

# 整书编译到 build/<分册>.pdf
build book=book:
    typst compile books/{{book}}/main.typ build/{{book}}.pdf {{flags}}

# 整书编译；有任何错误或警告就失败（提交前用这个）
check book=book:
    $out = typst compile books/{{book}}/main.typ build/{{book}}.pdf {{flags}} 2>&1; if ($out) { $out; exit 1 } else { "OK：无错误、无警告" }

# 写作时监视整书，保存即重新编译
watch book=book:
    typst watch books/{{book}}/main.typ build/{{book}}.pdf {{flags}}

# 单章编译（章号 n，如 `just chapter 7`），输出 build/solo/chNN.pdf；章号、图号用 counter 偏移，所以很快
chapter n book=book:
    @$nn = '{{n}}'.PadLeft(2,'0'); New-Item -ItemType Directory -Force build/solo | Out-Null; "#import `"/common/series.typ`": *`n#show: series-book.with(title: `"单章测试`")`n#show: main-matter`n#counter(heading).update({{n}} - 1)`n#include `"/books/{{book}}/chapters/ch$nn.typ`"" | Set-Content build/solo/main$nn.typ -Encoding utf8; typst compile build/solo/main$nn.typ build/solo/ch$nn.pdf {{flags}}

# 把整书某几页导出成 PNG 核对：`just png 20-24`（页号是成书 PDF 页序，从 1 起）。输出 build/check-<页>.png
png pages ppi="70" book=book:
    typst compile books/{{book}}/main.typ "build/check-{p}.png" {{flags}} --pages {{pages}} --ppi {{ppi}}

# 导出单章的 PNG：`just chapter-png 7 1-4`
chapter-png n pages ppi="70" book=book:
    @$nn = '{{n}}'.PadLeft(2,'0'); typst compile build/solo/main$nn.typ "build/solo/ch$nn-{p}.png" {{flags}} --pages {{pages}} --ppi {{ppi}}

# ───────────── 原书扫描 ─────────────

# 渲染原书页（按原书页码，如 `just scan 7-9`）到 build/pages/，带坐标网格，用来量图的坐标
scan pages dpi="200" grid="100":
    python scripts/render-pages.py {{scan}} {{pages}} --dpi {{dpi}} --grid {{grid}}

# 渲染原书页，不带网格（只想看内容时）
scan-plain pages dpi="150":
    python scripts/render-pages.py {{scan}} {{pages}} --dpi {{dpi}}

# 渲染目录页（PDF 页序，0 起）
scan-toc pages="0-4":
    python scripts/render-pages.py {{scan}} {{pages}} --raw

# 从原书页裁图：`just crop 7 "520,900,1155,1275" books/physics-1/figures/fig1-10.png`；额外参数照 crop-figure.py 写，如 `--blank x0,y0,x1,y1`
crop page box out *args:
    python scripts/crop-figure.py {{scan}} {{page}} {{box}} {{out}} --scale 1.0657 {{args}}

# ───────────── 检查 ─────────────

# 汇总待核对项：黄底标记 #unclear 和 TODO 的位置
todo book=book:
    @"── #unclear（黄底，看不清的字）──"; Select-String -Path books/{{book}}/chapters/*.typ, books/{{book}}/appendix/*.typ, books/{{book}}/figures/*.typ -Pattern '#unclear|[^#]unclear\[' | Where-Object { $_.Line -notmatch '^\s*//' } | ForEach-Object { "{0}:{1}" -f $_.Filename, $_.LineNumber }; "── TODO ──"; Select-String -Path books/{{book}}/*.typ, books/{{book}}/chapters/*.typ, books/{{book}}/appendix/*.typ, books/{{book}}/figures/*.typ -Pattern 'TODO' | ForEach-Object { "{0}:{1}  {2}" -f $_.Filename, $_.LineNumber, $_.Line.Trim() }

# 统计：成书页数、书签数
stats book=book:
    python -c "import pymupdf; d=pymupdf.open('build/{{book}}.pdf'); print('页数', len(d), '书签', len(d.get_toc()))"

# 在成书 PDF 里找一个词（验证可检索），如 `just find 牛顿`
find word book=book:
    python -c "import pymupdf; d=pymupdf.open('build/{{book}}.pdf'); [print('第', i+1, '页') for i in range(len(d)) if '{{word}}' in d[i].get_text()]"

# ───────────── 发版 ─────────────

# 发版：检查无误后在本地打 tag（不推送），如 `just tag 0.1.0`。推送 tag 后由 GitHub Actions（.github/workflows/release.yml）编译并发布 Release
tag version book=book:
    just check {{book}}
    $s = git status --porcelain; if ($s) { "有未提交的改动，先提交再发版"; exit 1 }
    git tag -a {{book}}-v{{version}} -m "{{book}} v{{version}}"
    "已创建 tag {{book}}-v{{version}}。确认无误后推送：git push origin {{book}}-v{{version}}"

# ───────────── 环境与清理 ─────────────

# 下载开源字体到 fonts/（不入库）
fonts:
    pwsh -NoProfile -File scripts/get-fonts.ps1

# 清理核对用的临时 PNG（不动成书 PDF 和 build/pages）
clean:
    Remove-Item build/check-*.png, build/solo/*.png -ErrorAction SilentlyContinue; "已清理"
