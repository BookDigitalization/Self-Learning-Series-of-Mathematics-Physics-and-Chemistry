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

## 数学册（合集）与并行录入

- **合集的书签页码不可全信，且是合集页码**：原书页码 = 合集页码 − 偏移。先用 `scripts/split-volume.py` 切出单册，核对印刷页码再登记 `scripts/math-volumes.json`（解析几何的书签就落在错位的页）。注意区分“合集页码（1 起）”“切出 PDF 的页序（0 起）”“原书页码”，三者别混。
- `justfile` 的 `book` 默认是 physics-1：`just chapter 3` 会编到物理册，要写 `just chapter 3 algebra-1`；导出图片 `just chapter-png 3 1-4 70 algebra-1`（ppi 在册名之前）。并行 agent 更稳妥的做法是各自建 `build/solo-<代号>/main.typ`。
- 并行分章：**按节标题分界，不按页**（节可以从页中间开始，页首可能还是上一节的习题）；续篇文件不写章标题，测试时用 `#counter(heading).update((章, 节-1))` 和 `#counter(figure.where(kind: image)).update(K)` 对号。
- 分工：录入 agent 与核对 agent **必须是不同的**；核对 agent 直接改能确定的录入错误，其余只上报。录入时汇报“已核对”不算数，要独立再核一遍。
- **3 与 8、2 与 3 在低分辨率扫描里常混**：放大加算式自洽往往不够，用**书末答案反推**最可靠（本册靠它订正了十余处）。答案没有的题（习题 1·16/1·18/1·19、3·10 部分、复习题四 42–65）要在 CHECKLIST 里单列。油墨糊住时 3 的开口会闭合像 8，对照同页别处的 3 与 8。
- 共享 scratchpad 里的临时脚本会被别的 agent 覆盖：让每个 agent 用自己的子目录。
- `text(emphasis: ...)` 不存在；着重点用点状下划线 `underline(stroke: (dash: (array: (0pt, 1em), phase: 0.5em), cap: "round", ...))`。逐字 `box` 会破坏 CJK 断行和两端对齐。
- 解答的“【解】”标签放在页底、算式在下一页：用 sticky 块把标签与第一个块（独立公式、竖式、表格）粘住（见 `sol`、`ex`）；物理册的 `solution`/`example` 保持原样，数学册用自己的变体，避免改动已发版册的排版。
- Typst 数学：`(a+b)h/2` 会被解析成 (a+b)·(h/2)，要写 `((a+b)h)/2`；负分数写 `-frac(1,2)`；`#h(3em)` 或 `#edot[…]` 后面紧跟 `(` 会被当成函数参数，写成 `\(`；独立公式末尾的句号写 `class("normal", "。")`（在代码上下文里要写 `math.class`）。
- 提交说明里不要出现弯引号“”（PowerShell 会当成引号），用 `[IO.File]::WriteAllText` 写说明文件再 `git commit -F`。
## 几何册（平面几何 1–2 册）

- CeTZ 里自己的函数参数不要叫 `fill`、`stroke`（会遮住 `cetz.draw` 的同名函数）；`geo.typ` 里的点线样式叫 `dotted` 而不是 `dot`（会遮住数学里的 `dot`）。`seg` 已带 stroke，虚线段用 `dseg`。
- `anglearc` 不接受带角度单位的 `calc.rem`，先 `.deg()` 转成数。
- `#unclear[…]` 在 CeTZ 画布里不显黄底，要在图里写 `box(fill: rgb("#ffe58f"), …)`；`just todo` 已扫描 `figures/*.typ`。
- 扫描分辨率不同：几何第一册用 200 dpi、offset 6，第二册 120 dpi、offset 4，页宽都约 1000 像素，图缩放 `0.0152cm/px`。
- 旧用词替换会漏掉变体（如“补助直线”漏在“补助线”规则外）：独立核对时专门 grep 一遍旧词变体，补进 tsv 与 TERMINOLOGY。- 局部函数不要和数学算子同名：`#let sec(…)` 会遮住公式里的 `sec`，排成等宽字体（三角册答案区曾因此出 16 处 DejaVuSansMono）。`audit-pdf.py` 的字体清单能查出来。
- 行内公式后紧跟“；，。”时，Typst 会在公式和标点之间断行，标点落到下一行行首。main.typ 里给行内公式加不断行连接符：`#show math.equation.where(block: false): it => math.display(it) + sym.wj`。已加到全部分册（物理册没有 `math.display`，写 `it => it + sym.wj`）；新开一册照抄。检查时注意：分式后的标点，按字符坐标看“左侧无字”会误报（分子分母不在基线上）。
- `set text(weight: "bold")` 对公式不起作用。要整组公式加粗，用 show 规则改写成 `math.bold(it.body)`，并加标签防止递归（见三角册 ch02.typ 的 `c2a-b`）。


## 立体几何册新增经验（2026-11）

- **页底孤立的“已知/求证/定理/推论”行**：把该段包成 `#block(sticky: true)[…]`，必要时连续的几行（定理→已知→求证）都包，`audit-pdf.py` 的 ORPHAN 就消失；带【证】【解】标签的行是正常换页，不处理。
- **扫描缺页**：另找别的版本补录，规则写进 REVISIONS 第一节（每处 `#dnote` 说明“据另一版本补录”，两版差异记 CHECKLIST）；缺页上的编号图正常编号，不要用 counter 跳号。
- **答案区**：按“以题目为准”改答案，要用 python 重算每条数值答案；末位差、1′ 差也改（有负责人决定为准），原书按 π≈3.14 截尾的数值可照录并登记。录答案时会发现表外新错误（单位、实质错误），都要登记 REVISIONS。
- **核对员改图**：图中线型（实/虚）以扫描为准，扫描里手绘图自相矛盾时按几何画并登记；字母以正文和同组图为准。
- 并行核对 agent 之间不要同时改同一个文件；核对结果里的“登记”“注释”由主线统一补，别让 agent 改 REVISIONS。
