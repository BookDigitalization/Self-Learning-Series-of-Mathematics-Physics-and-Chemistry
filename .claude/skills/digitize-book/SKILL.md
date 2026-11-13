---
name: digitize-book
description: 《数理化自学丛书》及同类扫描教材的数字化工作流——用 Typst 重排、逐章对照扫描核对、改订（订正原书错误、旧用词现代化、加数字版注）、整书版面通读、发版。开始新一册、核对某一章、做用词替换或加脚注、检查成书 PDF、打 tag 发版时使用。
---

# 数理化自学丛书数字化工作流

本 skill 只讲"怎么做"。**规则在别处，先读规则再动手**：

1. `CLAUDE.md`：项目规则（内容忠实、编号、标点、字体、插图做法、发版规则）。
2. `common/TERMINOLOGY.md`：全丛书共用的用词对照表（替换 / 加注 / 照录），**新册沿用，不要重新讨论已定词条**。
3. `books/<分册>/REVISIONS.md`：该册相对原书的全部改动。`CHECKLIST.md`：核对记录。

## 五个阶段

| 阶段 | 做什么 | 细则 |
|---|---|---|
| 1 录入 | 渲染扫描页，逐页看图录入 Typst，页界用 `/* p.N */` 标注 | `CLAUDE.md` 的"工作流程" |
| 2 逐章核对 | 对着放大的扫描逐项核对文字、数字、图中标注，结论写进 CHECKLIST | [verify-scans.md](verify-scans.md) |
| 3 改订 | A：原书错误；B：旧用词。先登记，再改源码 | [revise-book.md](revise-book.md) |
| 4 版面通读 | `scripts/audit-pdf.py` 自动检查 + 缩略图目测 | 见下"版面通读" |
| 5 发版 | `just tag` → 项目负责人确认 → 推送 tag，Actions 编译并发布 Release | 见下"发版" |

踩过的坑（PowerShell、Typst、git）见 [pitfalls.md](pitfalls.md)，动手前扫一眼。

数学册（代数、几何等）的整册流水线与给子 agent 的简报：[parallel-brief.md](parallel-brief.md)；**几何册（图多、有证明格式）另见 [geometry.md](geometry.md)**，术语表 `common/geo-terms.tsv`，图工具 `common/geo.typ`，辅助脚本 `scripts/crop-view.py`（裁剪放大并叠页坐标网格）、`scripts/solo-compile.py`（单文件独立编译）。

## 必须遵守的几条

- **先登记，再改源码。** 用词改动先进 `TERMINOLOGY.md`，具体改动进 `REVISIONS.md`，然后才改 `.typ`。
- **哪些要先问项目负责人**：任何改变原书数字或结论的改动（题目、答案、例题）、新的用词处理方式、推送到远程、打 tag、公开 Release。"原书错误"不要自行判断后直接改。
- **不要凭常识补内容或猜数字。** 看不清的字写 `#unclear[猜测]`，或用答案、算式反推并在 REVISIONS 里写明依据。
- **页码必须从源码 `/* p.N */` 标记里取，不要估。** 写进 REVISIONS 的页码要核实过。
- 每批改动后 `just check`（必须"无错误、无警告"）再提交；提交信息用文件传入（`git commit -F`）。**不要自行 push**，用户明确说推送才推。

## 整册流水线（数学册实践）

录入（按节分段并行）→ 改订（先用 `scripts/replace-terms.py` 按 tsv 批量换词，再逐条订正原书错误并登记）→ **独立核对**（换一批 agent 对照扫描重核，直接改能确定的错、其余上报）→ 整书版面通读 → 提交。每步之后主会话抽查 agent 结论（重算题目数字、核对页码），汇总状态时数字要从文件里数，别凭印象。各段备忘汇总进该册 `CHECKLIST.md`（一至五节），不留 `notes/` 目录。**疑点先记录、不擅自改**：看不清的、改法不唯一的原书疑似错误只记 CHECKLIST，等负责人定。

## 版面通读

```powershell
just check
uv run python scripts/audit-pdf.py build/physics-1.pdf --sheets build/sheets
```

脚本检查：字体是否都是开源字体、书签目标页、目录页码与页脚是否一致、相邻文字行重叠、页底孤立标题、字数过少的页，并生成每 20 页一张的缩略图，逐张看整体版面（有没有溢出、被截断的图、意外空白页）。

- `OVERLAP` 里图中旋转标注、独立公式的命中通常是误报，要放大看（裁页：`pymupdf` 按 clip 区域 150dpi 渲染）。
- `ORPHAN` 里"［解］"、答案行开头的命中是正常换页，不用管。
- 几何册常见的版面问题：章末孤图页 → 缩小末尾几幅图的 `width`（`k·像素` 即 `px * 0.0152cm` 一类）直到回到上一页；图与题分页 → 用 `#block(breakable: false)[题 + 图]`；“本章提要”表被拆页 → 同样包 `breakable: false`；答案区窄行两端对齐难看 → `#set par(justify: false)`。`audit-pdf.py` 对插图内的旋转标注会报 OVERLAP 误报。
- 已知的修法：答案里的行内分式压行 → `#show math.equation.where(block: false): set text(top-edge: "bounds", bottom-edge: "bounds")`（单加大行距没用）；标题孤立页底 → 标题块加 `sticky: true`；目录多出一页孤行 → 收紧 `outline.entry` 的块间距。

## 发版

PDF 不入库，由 GitHub Actions 编译后作为 Release 附件发布（`.github/workflows/release.yml`）。

1. 本机 `just check` 通过，`just todo` 无遗留，`REVISIONS.md`、`TERMINOLOGY.md` 与源码一致，工作区干净。
2. `just tag-all 0.0.1`（全部分册，tag `v0.0.1`）或 `just tag 0.1.0 <分册>`（单册，tag `<分册>-v0.1.0`）：检查后在本地打 tag（不推送）。
3. 向项目负责人确认后再 `git push origin v0.0.1`。第一次建议先在 Actions 页手动运行 release 工作流（默认只生成草稿），确认流程能跑通。
4. Release 说明模板 `.github/release-notes.md` 含"仅供非商业学习"声明，不得删除。封面和说明里不要让读者误以为是原出版社的官方版本。

## 新开一册时

1. 读上面三份文档，复制上一册的目录结构（`books/<分册>/main.typ`、`chapters/`、`figures/`、`appendix/`）。
2. 不重复造组件：用 `common/series.typ` 里的 `fig`、`exercise`、`answers`、`dnote`、`unit-check` 等。
3. 用词按 `TERMINOLOGY.md` 已定条目一开始就写成现代说法并加注，不要先照录再改。
4. 本册新出现的旧词，先加进 `TERMINOLOGY.md` 的候选表再请负责人定。
