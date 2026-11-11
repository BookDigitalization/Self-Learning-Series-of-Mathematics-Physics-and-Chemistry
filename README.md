# 数理化自学丛书 · 数字化重排

把上海科学技术出版社出版的《数理化自学丛书》（1960–70 年代版）扫描版 PDF，用 [Typst](https://typst.app) 重新排版成清晰、可检索、可复制的数字版 PDF，供普及教育使用。

> 本项目仅供学习研究，**请勿用于商业目的**。项目源码以 [CC BY-NC-SA 4.0](LICENSE) 授权，详见文末[版权说明](#版权说明)。

**本项目重现的是内容，不是版面。** 文字、公式、数据、编号、章节结构忠实于原书；字号、页面、配色、分页等版式交给统一的现代图书模板。

## 进度

各册按“录入 → 逐章对照扫描核对 → 改订（订正原书错误、旧词现代化）→ 整书版面通读 → 发版”五个阶段推进（做法见 `.claude/skills/digitize-book/`）。**目前还没有分册正式发版。** 各册改动见该册 `REVISIONS.md`，存疑处见 `CHECKLIST.md`。

| 分册 | 目录 | 原书页数 | 录入 | 核对 | 改订 | 版面通读 | 发版 | 说明 |
|---|---|---|---|---|---|---|---|---|
| 物理 第一册 | `books/physics-1` | 536 | ✔ | ✔ | ✔ | ✔ | ☐ | 全书录入完毕；已按书末答案核实改正，旧词、单位加数字版注，封面署“数字重排改订版（非官方）”；待发版 |
| 代数 第一册 | `books/algebra-1` | 304 | ✔ | ✔ | ✔ | ✔ | ☐ | p.1–304 全部录入，每章由另一位核对员对照扫描重核；据答案订正的错误、旧词替换已登记；待发版 |
| 代数 第二册 | `books/algebra-2` | 436 | ✔ | ✔ | ✔ | ☐ | ☐ | 全部录入，答案区独立核对；订正 16 处原书错误，选学节加星；待版面通读 |
| 代数 第三册 | `books/algebra-3` | 384 | ✔ | ✔ | ✔ | ✔ | ☐ | 全部录入并独立核对；订正 40 处原书错误，页码引用改节号，p.78 比重加注；待发版 |
| 代数 第四册 | `books/algebra-4` | 241 | ✔ | ✔ | ✔ | ☐ | ☐ | 全部录入（排列组合、数学归纳法、二项式定理、复数、方程论初步、行列式，及总复习题、习题答案）；全书分 10 段对照扫描独立核对；订正 32 处原书错误、旧词按 `TERMINOLOGY.md` 4.7 现代化；另有 5 处疑点照录，见 `CHECKLIST.md` 第四节；版面通读已跑脚本检查，缩略图尚未逐张目测 |

其余各册（代数以外的数学分册、物理第二至第四册、化学等）尚未开始。原书扫描见 `original/`（不入库）。

## 目录结构

```
original/            原书扫描 PDF（不入库）
books/<分册>/        每本书的 Typst 源码，目录名为"英文学科名-册号"，如 physics-1
  main.typ           主文件
  chapters/          每章一个 .typ 文件
  figures/           插图（CeTZ 源码或清理后的位图）
  appendix/          总复习题、习题答案、附录
common/series.typ      全丛书共用样式：封装图书模板，定义习题、复习题、边注等组件
fonts/               开源字体（不入库，由脚本下载）
scripts/             辅助脚本（下载字体、渲染原书页面等）
build/               编译产物（不入库）
```

仓库只提交源码，所有 PDF（包括原书扫描和生成结果）都不提交；成书 PDF 通过 [GitHub Releases](../../releases) 发布。

## 构建

需要 Typst 0.15 及以上版本。首次编译时会从 Typst Universe 下载所需的包，需要联网。

```powershell
# 首次：下载字体到 fonts/
./scripts/get-fonts.ps1

typst compile books/physics-1/main.typ build/physics-1.pdf --root . --font-path fonts --ignore-system-fonts
# 写作时自动重新编译
typst watch   books/physics-1/main.typ build/physics-1.pdf --root . --font-path fonts --ignore-system-fonts

# 把原书第 1–6 页渲染成 PNG（build/pages/），录入时对照看图
python scripts/render-pages.py original/数理化自学丛书物理第一册.pdf 1-6
```

`--ignore-system-fonts` 保证只使用项目指定的开源字体，不会误用系统里的商业字体。

`--root .` 让各分册可以用 `#import "/common/series.typ": *` 引用共用样式。

## 字体

为避免版权纠纷，全部使用开源免费字体（SIL Open Font License 1.1，可免费商用、可嵌入 PDF）：

| 用途 | 字体 | Typst 中的字体名 | 来源 |
|---|---|---|---|
| 宋体（正文） | Noto Serif SC（思源宋体） | `Noto Serif SC` | [notofonts/noto-cjk](https://github.com/notofonts/noto-cjk) |
| 黑体（标题、强调） | Noto Sans SC（思源黑体） | `Noto Sans SC` | [notofonts/noto-cjk](https://github.com/notofonts/noto-cjk) |
| 楷体（边注、图题） | 霞鹜文楷 LXGW WenKai | `霞鶩文楷` | [lxgw/LxgwWenKai](https://github.com/lxgw/LxgwWenKai) |
| 西文、公式 | New Computer Modern | `New Computer Modern` | Typst 内置 |

字体文件不入库，用 `scripts/get-fonts.ps1` 下载到 `fonts/`。使用静态字重的 OTF/TTF，不用系统自带的可变字体版本（Typst 会嵌入最细字重）。

## 图书模板

各分册只引用 `common/series.typ`，由它调用具体的模板。更换模板只需要改这一个文件。

### 主选：[bookly](https://typst.app/universe/package/bookly)

面向学术著作和科技书籍的模板，当前版本 3.1.0。

- 内置公式编号、图表题注、按章编号，适合理科教材
- 支持页边注版式（基于 marginalia），原书正文旁的要点提示可以放进页边
- 有多套主题，包括仿 Legrand Orange Book 的主题
- 持续维护中
- 需要注意：这是西文模板，中文字体、首行缩进、标点挤压等可能需要在 `series.typ` 中补充设置

### 备选

- **[orange-book](https://typst.app/universe/package/orange-book)**：仿 LaTeX 的 Legrand Orange Book 模板，有彩色章节页，现代教材风格，但可调整的余地比 bookly 小。
- **[concise-history](https://typst.app/universe/package/concise-history)**：原生面向中文书籍的模板，中文排版规范（封面、目录、页眉、脚注、着重号）最完善，但为文史类书籍设计，没有考虑公式和习题。

### 辅助包

| 包 | 用途 |
|---|---|
| cetz | 重绘示意图、受力图、坐标图 |
| marginalia | 页边注 |
| hydra | 页眉显示当前章节 |
| i-figured | 图号、公式号按章计数 |

## 录入原则

- 忠实原文：不改写、不删节、不把旧术语改成现代说法（公斤、尔格、马力、tg 等照原书保留）。
- 编号沿用原书的中间点写法：§1·1、图 4·6、习题 1·2。
- 公式一律用 Typst 数学排版，不用图片。
- 原书明显的印刷错误可以改正，但要在源码中注释原文。
- 扫描本缺页（如物理第一册的封面、“第二版出版说明”“编者的话”）不补写，也不收录。
- 源码中用 `// p.96` 注释标出原书页码，便于校对。

详细的录入规范见 [CLAUDE.md](CLAUDE.md)。

## 版权说明

**本项目的内容请勿用于任何商业目的。**

- **原书版权**：《数理化自学丛书》的文字、公式、习题、插图等内容，著作权归原作者（数理化自学丛书编委会及各编写小组）及上海科学技术出版社所有。依照《中华人民共和国著作权法》，单位作品的保护期为首次发表后五十年，个人作品为作者终生及其死亡后五十年。本丛书第二版出版于 1977 年前后，原书内容目前可能仍在著作权保护期内。
- **本项目的性质**：本项目以学习研究和普及教育为目的，对原书内容进行数字化重排，不以营利为目的。
- **不提供原书文件**：仓库只包含排版源码，不包含原书扫描件。
- **数字版 PDF**：在 Releases 页发布的成书 PDF 是本项目重新排版的改订版（改动记录见各册 `REVISIONS.md` 和 `common/TERMINOLOGY.md`），同样受下面“使用限制”的约束，仅供非商业的学习研究。
- **使用限制**：本仓库的内容仅供个人学习和研究，禁止出售、付费分发、商业印刷，也不得用于任何商业产品或服务。
- **许可证**：本项目贡献者编写的部分（Typst 排版源码、样式、重绘插图源码、脚本、文档）采用 [知识共享 署名-非商业性使用-相同方式共享 4.0 国际许可协议（CC BY-NC-SA 4.0）](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.zh-hans) 授权，全文见 [LICENSE](LICENSE)。该许可证**不适用于原书内容本身**，原书内容的权利仍归原权利人。
- **字体**：`fonts/` 中的字体由各自作者以 SIL Open Font License 1.1 授权，不受本项目许可证约束。
- **权利人联系**：如果您是相关权利人，认为本项目侵犯了您的合法权益，请通过 GitHub Issues 联系我们，我们会及时处理或删除相关内容。

## 常用命令（just）

装好 [just](https://github.com/casey/just) 后，在仓库根目录运行 `just` 列出全部命令。常用：

```powershell
just fonts            # 下载字体（只需一次）
just build            # 整书编译到 build/physics-1.pdf
just check            # 整书编译，有错误或警告就失败（提交前用）
just chapter 7        # 只编译第 7 章，很快（输出 build/solo/ch07.pdf）
just png 20-24        # 把成书 PDF 的 20–24 页导出成 PNG 核对
just scan 7-9         # 渲染原书第 7–9 页（带坐标网格），用来量图
just crop 8 "520,900,1155,1275" books/physics-1/figures/x.png   # 从原书页裁图
just todo             # 列出 #unclear 和 TODO 的位置
just tag 0.1.0        # 发版：检查后在本地打 tag physics-1-v0.1.0（不推送）；推送 tag 后 GitHub Actions 编译并发布 Release
```
