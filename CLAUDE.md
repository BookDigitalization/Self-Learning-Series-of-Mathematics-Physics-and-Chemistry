# 数理化自学丛书 数字化项目

## 目标

把《数理化自学丛书》（上海科学技术出版社，1960–70 年代版）的扫描版 PDF 重新排版成**可检索、可复制、清晰的数字版 PDF**，用于普及教育。
不是 OCR 后叠一层文字，而是**用 Typst 源码重新排版**：正文、公式、表格、插图全部重建。
**重现的是内容，不是版面**：文字、公式、数据、编号、章节结构必须忠实于原书；版式（字号、页面、颜色、边注位置、分页）用统一的现代图书模板，不追求与原书逐页一致。

## 目录约定

```
original/                  原书扫描 PDF（只读，不提交 git）
books/<分册>/              每本书一个目录，用"英文学科名-册号"，例如 books/physics-1/（物理第一册）
  main.typ                 主文件：导入样式、目录、#include 各章
  chapters/ch01.typ …      每章一个文件（按原书章号）
  figures/                 插图：CeTZ 源码（.typ）或清理后的位图
  appendix/                总复习题、习题答案、附录
common/
  series.typ                 全丛书共用的样式与组件（页面、标题、习题、边注框等）
  TERMINOLOGY.md             全丛书共用的用词对照与替换规则（旧词→现代说法，及处理方式）
scripts/                   辅助脚本（渲染原书页、比对、构建）
build/                     编译产物（不提交）
```

- `.gitignore` 排除所有 `*.pdf`、`original/`、`build/`。**只提交源码**；成书 PDF 不入库，通过 GitHub Release 发布（见"发版"一节）。
- 永远不要修改、移动、删除 `original/` 下的文件。

## 原书情况（物理第一册，已核对）

- `original/数理化自学丛书物理第一册.pdf`：536 页，纯图片扫描（FreePic2Pdf 生成），**无文字层、无书签**，每页一张约 802×1200 的图。
- PDF 页码与原书页码对应：PDF 第 0–4 页（0 起计）= 目录 i–v；**PDF 第 n 页 = 原书第 n−4 页**（n ≥ 5）。
- 扫描缺封面、"第二版出版说明"、"编者的话"（目录里有，扫描里没有）。已决定不收录，也不留 TODO；不要编造这些内容。
- 结构：15 章，章 → 节（`§1·1` 形式）→ 小标题（粗体无编号）。
  每节后有"习题 x·y"（左侧带框的标签），每章末有"复习题"，书末有"总复习题""习题答案""附录一 本书主要物理量和单位""附录二 本书重要常数"。
  `books/physics-1/chapters/` 里的章、节标题暂取自原书目录，录入时以正文为准。
- 内容元素（需保留其语义，具体呈现方式由模板决定）：正文旁的**边注**（要点提示，如"量度就是将待测量与标准量进行比较"，可做成页边注或提示框）、粗体关键词、图号"图 1·10"＋图题、表格、行内及行间公式。
- 标点：原书句末用"．"（全角圆点），录入时**统一改用现代句号"。"**（这是唯一的标点改动，已与项目负责人确认）。
  其余标点照原书用全角中文标点（，、；：？！""（））。小数点、公式和数字里的"."不变（如 1.8 米）。
- 编号用中间点 `·`（§1·1、图 4·6、习题 1·2），保持原样，不要改成 `.`。
- 单位和术语为当年用法（公斤、公里、尔格、马力、"米/秒"等）。数字版是**改订版**：用词是否现代化，**以 `common/TERMINOLOGY.md` 为准**（逐条登记"替换 / 加注 / 照录 / 待定"）。表里没有的词一律照原书，不要自行现代化；发现新词条先加进该表，等项目负责人确认再改源码。注释只能用脚注并标明"数字版注"。

## 技术栈

- **Typst 0.15**（本机 `typst` 已在 PATH）。构建：`typst compile books/physics-1/main.typ build/physics-1.pdf --root . --font-path fonts --ignore-system-fonts`；写作时用 `typst watch`。
  导出某几页 PNG 核对：在上述命令里把输出改成 `"build/check-{p}.png"` 并加 `--pages 5-8 --ppi 150`。
  `--root .` 是为了让各书能 `#import "/common/series.typ": *`。
- 图书模板：主选 `@preview/bookly`，备选 `orange-book`、`concise-history`（理由见 README）。模板只在 `common/series.typ` 中引用，各书不得直接 import 模板。
- 字体**只用开源免费字体**（OFL），避免版权纠纷：正文宋体 `Noto Serif SC`，标题/强调黑体 `Noto Sans SC`，边注与图题楷体 `霞鶩文楷`（LXGW WenKai，Typst 只认这个中文族名），西文与公式用 Typst 内置 `New Computer Modern`。
  **禁止使用** SimSun、SimHei、KaiTi、Microsoft YaHei、Times New Roman 等商业/系统字体。
  字体文件在 `fonts/`（不入库，`just fonts` 下载：Windows 走 `scripts/get-fonts.ps1`，Linux / macOS 走 `scripts/get-fonts.sh`），编译必须带 `--font-path fonts --ignore-system-fonts`。字体选择集中在 `common/series.typ`。
- 公式用 Typst 原生数学（`$ v = s / t $`）。中文单位写在公式外或用 `"米/秒"` 文本；三角函数写 Typst 内置的 `tan`、`cot`、`arctan`（原书作 tg、ctg、arc tg，已按 `common/TERMINOLOGY.md` 统一改）。
- 编号：章节、图、习题的编号格式统一用 `·` 分隔，在 `series.typ` 里用自定义 `numbering` 函数实现（如 `(..n) => n.pos().map(str).join("·")`）。
- 插图优先用 **CeTZ**（`@preview/cetz`）重绘示意图、受力图、坐标图、几何图；写实插画（人物、器械）用原扫描裁剪 + 去底色/二值化后的 PNG，放到 `figures/`，并在源码注释里记录来源页。首次使用 `@preview` 包需联网下载。
- 共用组件在 `common/series.typ`，各书只调用组件，不重复写样式：
  - 标题：`= 章名`（章号自动），`== 节名`（自动编号 §1·1），`=== 小标题`（不编号、不进书签）。
  - `#sidenote[…]`：边注，放在右侧页边。写在正文中对应的位置。
  - `#fig("1·1", image(...))[图题]`：编号插图。第一个参数写原书图号，和自动编号不一致时编译报错。
  - `#plainfig((图, [（第 4 题）]), …)`：不编号的小图，可多幅并排。
  - `#px-canvas(w, h, origin: …, width: …, (p, u) => { import cetz.draw: *; … })`：CeTZ 画布，坐标直接用原书页面像素坐标（y 向下），描图不用换算。一幅图一个文件 `figures/figX-Y.typ`，导出 `fig-X-Y(width: …)`，章文件里 `#fig("X·Y", fig-X-Y())[图题]`。
  - `#exercise("1·1")[+ … + …]`：习题，自动加标签 `<ex-1·1>`。
  - `#review[+ …]`：章末复习题。
  - `#answers("1·1")[+ …]`：习题答案，引用了不存在的习题时编译报错。
  - `#unclear[猜测]`：识别不清的字，用黄底标出。`#dnote[…]`：数字版注（脚注）。
  - `main.typ` 分区：`front-matter` → `tableofcontents` → `main-matter` → 各章 → `back-matter` → 总复习题、答案、附录（这几部分的一级标题不编号，照原书写全称）。
- Python 3.10 + PyMuPDF（`import pymupdf`，限定 1.x）用于渲染原书页面，一律经 **uv** 运行（依赖在 `pyproject.toml`，不要直接调用 `python`/`pip`）：
  `uv run python scripts/render-pages.py original/数理化自学丛书物理第一册.pdf 1-6` 按原书页码渲染到 `build/pages/p0001.png…`（默认 offset 4、150 dpi）；
  加 `--raw` 时按 PDF 页序（0 起计），用于目录页。

## 工作流程（每次处理一段内容）

> 核对扫描、改订（原书错误与旧用词）、整书版面通读、发版的操作经验和判断标准，见项目 skill `.claude/skills/digitize-book/`（`SKILL.md` 入口）；配套脚本 `scripts/audit-pdf.py`、`scripts/replace-terms.py`。

1. 用脚本把要处理的原书页渲染成 PNG（150–200 dpi，放到 scratchpad 或 `build/pages/`），**逐页看图**再录入。不要凭记忆或"常识"补写内容。
2. 按页录入为 Typst：文字、公式、表格逐字核对；遇到识别不清的字，写 `#unclear[猜测]` 并在提交说明里列出页码。
3. 在源码中用注释标出原书页码边界：`// p.96`，便于日后校对。
   页界落在段落中间时用行内注释 `……测量和/* p.2 */计算……`，不要断行（单独一行的注释会让前后的换行变成多余空格）。
   公式里的中文单位直接写在引号里、前面不加空格：`$1 "千米" = 1000 "米"$`。
4. 插图：先判断能否 CeTZ 重绘；保留原图号、图题和图中标注字母（F、G、O、s、t 等）。
   - 示意图、几何图、坐标图、受力图、刻度、线条图一律 CeTZ 重绘（矢量，放大不失真，标注是真文字）；图中文字、数字不得留在位图里。
   - 写实插画（人物、器械、木纹）保留原扫描裁剪的二值化 PNG；要在其上加文字标注的，用 `--blank` 涂掉原有文字再用 CeTZ 补。
   - **不要用自动描摹（vtracer 等）把位图转 SVG**：原扫描只有约 130 dpi，描摹不会增加细节，还会把图中的字弄错（试过，"0"变"U"）。
   - 量坐标：`render-pages.py … --dpi 200 --grid 100` 输出带真实坐标网格的页面图（`*-grid.png`），按网格数字读坐标。
     **不要凭看图工具里缩小显示的图估坐标**（显示宽 1568 px，真实宽 1671 px，差 6%）；若确实在显示图上量，裁图时加 `--scale 1.0657`。
   - 原图里看不清的刻度值、数字：图中用 `unclear` 的黄底标出，在源码里写 TODO 说明，提交说明里列出页码，不得凭常识补。
5. 编译无错误、无警告后，导出对应内容为 PNG，与原书对应页**逐段核对内容**（文字、公式、数字、图中标注），不核对版面。
6. 一次提交一个或几个小节，提交信息写明范围，例如 `物理第一册: §4·5 匀速直线运动的路程图线和速度图线 (p.96–101)`。

## 质量要求

- 忠实原文第一：不改写、不删节、不擅自"纠正"原书说法；改动只限已登记的项目：
  - 明显印刷错误、原书错误：经项目负责人确认后可改，源码加 `// 原书作 xxx` 注释，并登记各书 `REVISIONS.md`；
  - 用词现代化：按 `common/TERMINOLOGY.md`；
  - 改动顺序：先登记（TERMINOLOGY.md / REVISIONS.md），再改源码。
- 公式必须是真正的 Typst 数学，不能是图片。
- 生成的 PDF 要有书签（`outline` + heading 自动生成，章/节两级）、可复制中文文本、可搜索；设置 `document(title: …)`。
- 习题答案与习题编号一致，建议用 label/ref 交叉引用核对。
- 风格统一：同一丛书的所有分册共用 `common/series.typ`，新书开始前先看已有分册的做法。

## 发版

成书 PDF 由 GitHub Actions 编译并作为 **GitHub Release 附件**发布，PDF 本身不进 git。原书扫描件永远不发布。

- 工作流：`.github/workflows/release.yml`；Release 说明模板：`.github/release-notes.md`（含"仅供非商业学习"的使用声明，不得删除）。
- tag 格式：`<分册>-v<版本>`，分册名即 `books/` 下的目录名，例如 `physics-1-v0.1.0`。
- 发版前：
  1. `just check` 无错误、无警告；`just todo` 里没有遗留的 `#unclear` 和 TODO（有就先说明）；
  2. `books/<分册>/REVISIONS.md`、`common/TERMINOLOGY.md` 已更新，与源码一致；
  3. 工作区干净，所有改动已提交。
- 发版步骤：`just tag 0.1.0`（检查并在本地打 tag，不推送）→ 项目负责人确认 → `git push origin physics-1-v0.1.0`（推送 tag 触发发布）。也可在 Actions 页手动运行 release 工作流，手动运行默认只生成草稿。
- 推送 tag、公开 Release 属于对外发布，**必须先得到项目负责人明确同意**，不得自行 push。
- 工作流产出：`<分册>-v<版本>.pdf`、`.pdf.sha256`、`-REVISIONS.md`；构建时会检查页数、书签、文本层。

## 不要做的事

- 不要把 PDF 或扫描图片原件提交进 git（裁剪重制的插图 PNG 除外）；成书 PDF 只通过 Release 发布。
- 不要一次性批量 OCR 后不加校对就入库。
- 不要为了排版好看而改动原书的章节结构、编号或措辞（版式可以自由，内容不能动）。
