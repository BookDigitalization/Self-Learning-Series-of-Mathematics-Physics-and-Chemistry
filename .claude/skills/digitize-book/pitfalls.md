# 踩过的坑

## PowerShell

- **没有 heredoc。** 多行 Python 写成 scratchpad 里的脚本文件再运行；提交信息写到文件，用 `git commit -F <文件>`。
- 命令参数里不要放弯引号和中文标点；`2>$null` 会让提交失败。
- **`Set-Location`/`cd` 会一直保留**，之后的相对路径全变了。尽量用绝对路径，或不 `cd`。
- `python -I`（隔离模式）看不到 `PYTHONPATH` 和用户站点包；需要第三方包就不用 `-I`。本机没有 Pillow；PyMuPDF 够用（画框用 `page.draw_rect`，拼缩略图用 `show_pdf_page`）。
- `render-pages.py` 的页码参数是一个字符串，范围写 `413,528-529`，不能用空格分隔多个页。
- 下载 `@preview` 包报代理错误时，在**同一条命令里**设 `$env:HTTPS_PROXY`（见 `CLAUDE.local.md`）。
- 终端里中文路径、中文输出偶尔乱码，不影响文件内容，必要时用 python 输出。

## Typst

- `//` 行注释会吃掉同一行后面的 `]`。注释必须另起一行，或改用 `/* */`。
- 页界注释写在行内：`……测量和/* p.2 */计算……`；单独一行的注释会让前后换行变成多余空格。
- `dnote` 里的英文撇号用直引号 `\'`，弯引号会让空格错位。
- 行内公式里有分式时，行框不会自动撑高 → 用 `#show math.equation.where(block: false): set text(top-edge: "bounds", bottom-edge: "bounds")`，不要只调 `leading`。
- 标题块要加 `sticky: true`，否则会孤立在页底。
- `#set` 写在被 `#include` 的文件顶部，只影响该文件的内容。
- 公式里 `"tg"` 一类中文/文本要放引号里；三角函数现在直接写 `tan`、`cot`、`arctan`。
- 编译警告不会让 `typst compile` 失败，所以用 `just check`（有任何输出就失败）。

## 数据与文字

- Python 读写 `.typ` 一律 `encoding='utf-8', newline=''`，并按文件里原有的换行（LF/CRLF）拼回，否则整文件 diff。
- 替换前先 `assert text.count(旧) == 1`，防止多处命中或一处都没命中。
- git 提示 "LF will be replaced by CRLF" 是无害警告。
- 子 agent 在后台改文件时，主会话不要同时改同一批文件；并行 agent 都不要编译（共用 `build/` 会冲突）。
- 汇总子 agent 报告时，**它们写的页码和结论要抽查**；我自己也曾写过估计的页码，务必从源码标记取。
