# 数理化自学丛书数字化项目的常用操作。运行 `just` 列出所有命令。
# 需要：just、typst、uv（Python 和 PyMuPDF 由 uv 自动安装）。字体先 `just fonts`。
# Windows 用 PowerShell（pwsh），Linux / macOS 用 bash：写法不同的命令各写一份，分别标 [windows] / [unix]，改一个要同步改另一个。
# 下载 @preview 包报 Proxy 错误时，先设置 HTTPS_PROXY（PowerShell：$env:HTTPS_PROXY=…；bash：export HTTPS_PROXY=…；见 CLAUDE.local.md）。

set shell := ["bash", "-euo", "pipefail", "-c"]
set windows-shell := ["pwsh", "-NoProfile", "-Command"]

book := "physics-1"
flags := "--root . --font-path fonts --ignore-system-fonts"
# Python 一律经 uv 运行，依赖见 pyproject.toml（首次运行自动建 .venv 并安装 PyMuPDF）
# Linux / macOS 经 scripts/py.sh（NixOS 上补 libstdc++ 的库路径，否则 PyMuPDF 无法 import）
python := if os_family() == "windows" { "uv run python" } else { "bash scripts/py.sh" }

# 列出所有命令
default:
    @just --list --unsorted

# ───────────── 构建 ─────────────

# 整书编译到 build/<分册>.pdf
build book=book:
    typst compile books/{{book}}/main.typ build/{{book}}.pdf {{flags}}

# 整书编译；有任何错误或警告就失败（提交前用这个）
[windows]
check book=book:
    $out = typst compile books/{{book}}/main.typ build/{{book}}.pdf {{flags}} 2>&1; if ($out) { $out; exit 1 } else { "OK：无错误、无警告" }

# 整书编译；有任何错误或警告就失败（提交前用这个）
[unix]
check book=book:
    mkdir -p build; out=$(typst compile books/{{book}}/main.typ build/{{book}}.pdf {{flags}} 2>&1) || { echo "$out"; exit 1; }; if [ -n "$out" ]; then echo "$out"; exit 1; else echo "OK：无错误、无警告"; fi

# 写作时监视整书，保存即重新编译
watch book=book:
    typst watch books/{{book}}/main.typ build/{{book}}.pdf {{flags}}

# 单章编译（章号 n，如 `just chapter 7`），输出 build/solo/chNN.pdf；章号、图号用 counter 偏移，所以很快
[windows]
chapter n book=book:
    @$nn = '{{n}}'.PadLeft(2,'0'); New-Item -ItemType Directory -Force build/solo | Out-Null; "#import `"/common/series.typ`": *`n#show: series-book.with(title: `"单章测试`")`n#show: main-matter`n#counter(heading).update({{n}} - 1)`n#include `"/books/{{book}}/chapters/ch$nn.typ`"" | Set-Content build/solo/main$nn.typ -Encoding utf8; typst compile build/solo/main$nn.typ build/solo/ch$nn.pdf {{flags}}

# 单章编译（章号 n，如 `just chapter 7`），输出 build/solo/chNN.pdf；章号、图号用 counter 偏移，所以很快
[unix]
chapter n book=book:
    @nn=$(printf %02d "$((10#{{n}}))"); mkdir -p build/solo; printf '#import "/common/series.typ": *\n#show: series-book.with(title: "单章测试")\n#show: main-matter\n#counter(heading).update({{n}} - 1)\n#include "/books/{{book}}/chapters/ch%s.typ"\n' "$nn" > build/solo/main$nn.typ; typst compile build/solo/main$nn.typ build/solo/ch$nn.pdf {{flags}}

# 数学册（代数、几何）单独编译若干章文件，如 `just solo geometry-1 "ch01.typ ch01b.typ" --ch 1 --sec 1 --fig 1 --png 1-3`；参数照 scripts/solo-compile.py（`chapter` 只认 chNN.typ，不认 ch01b 这类续篇）
solo book files *args:
    {{python}} scripts/solo-compile.py {{book}} {{files}} {{args}}

# 把整书某几页导出成 PNG 核对：`just png 20-24`（页号是成书 PDF 页序，从 1 起）。输出 build/check-<页>.png
png pages ppi="70" book=book:
    typst compile books/{{book}}/main.typ "build/check-{p}.png" {{flags}} --pages {{pages}} --ppi {{ppi}}

# 导出单章的 PNG：`just chapter-png 7 1-4`
[windows]
chapter-png n pages ppi="70" book=book:
    @$nn = '{{n}}'.PadLeft(2,'0'); typst compile build/solo/main$nn.typ "build/solo/ch$nn-{p}.png" {{flags}} --pages {{pages}} --ppi {{ppi}}

# 导出单章的 PNG：`just chapter-png 7 1-4`
[unix]
chapter-png n pages ppi="70" book=book:
    @nn=$(printf %02d "$((10#{{n}}))"); typst compile build/solo/main$nn.typ "build/solo/ch$nn-{p}.png" {{flags}} --pages {{pages}} --ppi {{ppi}}

# ───────────── 原书扫描 ─────────────

# 渲染原书页（按原书页码，如 `just scan 7-9`；其他册 `just scan 7-9 200 100 geometry-1`），带坐标网格，用来量图的坐标。册的扫描件路径和 offset 取自 scripts/book-scan.py
[windows]
scan pages dpi="200" grid="100" book=book:
    $i = ({{python}} scripts/book-scan.py {{book}}) -split ' '; {{python}} scripts/render-pages.py $i[0] {{pages}} --offset $i[1] --dpi {{dpi}} --grid {{grid}}

# 渲染原书页（按原书页码，如 `just scan 7-9`；其他册 `just scan 7-9 200 100 geometry-1`），带坐标网格，用来量图的坐标。册的扫描件路径和 offset 取自 scripts/book-scan.py
[unix]
scan pages dpi="200" grid="100" book=book:
    read -r scan off <<< "$({{python}} scripts/book-scan.py {{book}})"; {{python}} scripts/render-pages.py "$scan" {{pages}} --offset "$off" --dpi {{dpi}} --grid {{grid}}

# 渲染原书页，不带网格（只想看内容时）：`just scan-plain 7-9 150 geometry-1`
[windows]
scan-plain pages dpi="150" book=book:
    $i = ({{python}} scripts/book-scan.py {{book}}) -split ' '; {{python}} scripts/render-pages.py $i[0] {{pages}} --offset $i[1] --dpi {{dpi}}

# 渲染原书页，不带网格（只想看内容时）：`just scan-plain 7-9 150 geometry-1`
[unix]
scan-plain pages dpi="150" book=book:
    read -r scan off <<< "$({{python}} scripts/book-scan.py {{book}})"; {{python}} scripts/render-pages.py "$scan" {{pages}} --offset "$off" --dpi {{dpi}}

# 渲染目录页（PDF 页序，0 起）
[windows]
scan-toc pages="0-4" book=book:
    $i = ({{python}} scripts/book-scan.py {{book}}) -split ' '; {{python}} scripts/render-pages.py $i[0] {{pages}} --offset $i[1] --raw

# 渲染目录页（PDF 页序，0 起）
[unix]
scan-toc pages="0-4" book=book:
    read -r scan off <<< "$({{python}} scripts/book-scan.py {{book}})"; {{python}} scripts/render-pages.py "$scan" {{pages}} --offset "$off" --raw

# 从原书页裁图：`just crop 7 "520,900,1155,1275" books/physics-1/figures/fig1-10.png`；其他册在 out 后加册名 `… out.png geometry-1`；额外参数照 crop-figure.py 写，如 `--blank x0,y0,x1,y1`
[windows]
crop page box out book=book *args:
    $i = ({{python}} scripts/book-scan.py {{book}}) -split ' '; {{python}} scripts/crop-figure.py $i[0] {{page}} "{{box}}" {{out}} --offset $i[1] --scale 1.0657 {{args}}

# 从原书页裁图：`just crop 7 "520,900,1155,1275" books/physics-1/figures/fig1-10.png`；其他册在 out 后加册名 `… out.png geometry-1`；额外参数照 crop-figure.py 写，如 `--blank x0,y0,x1,y1`
[unix]
crop page box out book=book *args:
    read -r scan off <<< "$({{python}} scripts/book-scan.py {{book}})"; {{python}} scripts/crop-figure.py "$scan" {{page}} "{{box}}" {{out}} --offset "$off" --scale 1.0657 {{args}}

# 扫描页的一块放大并叠页坐标网格（坐标即整页坐标），量图、读小字用：`just crop-view 112 "150,350,800,700" build/pages/f112.png geometry-1`（几何一册 200 dpi，二册 120 dpi）
[windows]
crop-view page box out book=book dpi="200" zoom="2" grid="25":
    $i = ({{python}} scripts/book-scan.py {{book}}) -split ' '; {{python}} scripts/crop-view.py $i[0] {{page}} "{{box}}" {{out}} --offset $i[1] --dpi {{dpi}} --zoom {{zoom}} --grid {{grid}}

# 扫描页的一块放大并叠页坐标网格（坐标即整页坐标），量图、读小字用：`just crop-view 112 "150,350,800,700" build/pages/f112.png geometry-1`（几何一册 200 dpi，二册 120 dpi）
[unix]
crop-view page box out book=book dpi="200" zoom="2" grid="25":
    read -r scan off <<< "$({{python}} scripts/book-scan.py {{book}})"; {{python}} scripts/crop-view.py "$scan" {{page}} "{{box}}" {{out}} --offset "$off" --dpi {{dpi}} --zoom {{zoom}} --grid {{grid}}

# ───────────── 检查 ─────────────

# 汇总待核对项：黄底标记 #unclear 和 TODO 的位置
[windows]
todo book=book:
    @"── #unclear（黄底，看不清的字）──"; Select-String -Path books/{{book}}/chapters/*.typ, books/{{book}}/appendix/*.typ, books/{{book}}/figures/*.typ -Pattern '#unclear|[^#]unclear\[' | Where-Object { $_.Line -notmatch '^\s*//' } | ForEach-Object { "{0}:{1}" -f $_.Filename, $_.LineNumber }; "── TODO ──"; Select-String -Path books/{{book}}/*.typ, books/{{book}}/chapters/*.typ, books/{{book}}/appendix/*.typ, books/{{book}}/figures/*.typ -Pattern 'TODO' | ForEach-Object { "{0}:{1}  {2}" -f $_.Filename, $_.LineNumber, $_.Line.Trim() }

# 汇总待核对项：黄底标记 #unclear 和 TODO 的位置
[unix]
todo book=book:
    @shopt -s nullglob; b=books/{{book}}; echo "── #unclear（黄底，看不清的字）──"; { grep -niHE '#unclear|[^#]unclear\[' $b/chapters/*.typ $b/appendix/*.typ $b/figures/*.typ /dev/null || true; } | awk -F: '$3 !~ /^[ \t]*\/\// { f=$1; sub(/.*\//, "", f); print f ":" $2 }'; echo "── TODO ──"; { grep -niH 'TODO' $b/*.typ $b/chapters/*.typ $b/appendix/*.typ $b/figures/*.typ /dev/null || true; } | awk '{ f=$0; sub(/:.*/, "", f); sub(/.*\//, "", f); r=$0; sub(/^[^:]*:/, "", r); n=r; sub(/:.*/, "", n); sub(/^[^:]*:[ \t]*/, "", r); sub(/[ \t\r]+$/, "", r); print f ":" n "  " r }'

# 统计：成书页数、书签数
stats book=book:
    {{python}} -c "import pymupdf; d=pymupdf.open('build/{{book}}.pdf'); print('页数', len(d), '书签', len(d.get_toc()))"

# 在成书 PDF 里找一个词（验证可检索），如 `just find 牛顿`
find word book=book:
    {{python}} -c "import pymupdf; d=pymupdf.open('build/{{book}}.pdf'); [print('第', i+1, '页') for i in range(len(d)) if '{{word}}' in d[i].get_text()]"

# ───────────── 发版 ─────────────

# 发版：检查无误后在本地打 tag（不推送），如 `just tag 0.1.0`。推送 tag 后由 GitHub Actions（.github/workflows/release.yml）编译并发布 Release
[windows]
tag version book=book:
    just check {{book}}
    $s = git status --porcelain; if ($s) { "有未提交的改动，先提交再发版"; exit 1 }
    git tag -a {{book}}-v{{version}} -m "{{book}} v{{version}}"
    "已创建 tag {{book}}-v{{version}}。确认无误后推送：git push origin {{book}}-v{{version}}"

# 发版：检查无误后在本地打 tag（不推送），如 `just tag 0.1.0`。推送 tag 后由 GitHub Actions（.github/workflows/release.yml）编译并发布 Release
[unix]
tag version book=book:
    just check {{book}}
    if [ -n "$(git status --porcelain)" ]; then echo "有未提交的改动，先提交再发版"; exit 1; fi
    git tag -a {{book}}-v{{version}} -m "{{book}} v{{version}}"
    @echo "已创建 tag {{book}}-v{{version}}。确认无误后推送：git push origin {{book}}-v{{version}}"

# ───────────── 环境与清理 ─────────────

# 下载开源字体到 fonts/（不入库）
[windows]
fonts:
    pwsh -NoProfile -File scripts/get-fonts.ps1

# 下载开源字体到 fonts/（不入库）
[unix]
fonts:
    bash scripts/get-fonts.sh

# 清理核对用的临时 PNG（不动成书 PDF 和 build/pages）
[windows]
clean:
    Remove-Item build/check-*.png, build/solo/*.png -ErrorAction SilentlyContinue; "已清理"

# 清理核对用的临时 PNG（不动成书 PDF 和 build/pages）
[unix]
clean:
    rm -f build/check-*.png build/solo/*.png; echo "已清理"
