# 数理化自学丛书 · 数字化重排

把上海科学技术出版社出版的《数理化自学丛书》（1960–70 年代版）扫描版 PDF，用 [Typst](https://typst.app) 重新排版成清晰、可检索、可复制的数字版 PDF，供普及教育使用。

**本项目重现的是内容，不是版面。** 文字、公式、数据、编号、章节结构忠实于原书；字号、页面、配色、分页等版式交给统一的现代图书模板。

## 进度

| 分册 | 原书页数 | 状态 |
|---|---|---|
| 物理 第一册 | 536 | 准备中 |

## 目录结构

```
original/            原书扫描 PDF（不入库）
books/<书名>/        每本书的 Typst 源码
  main.typ           主文件
  chapters/          每章一个 .typ 文件
  figures/           插图（CeTZ 源码或清理后的位图）
  appendix/          总复习题、习题答案、附录
common/sxzx.typ      全丛书共用样式：封装图书模板，定义习题、复习题、边注等组件
scripts/             辅助脚本（渲染原书页面等）
build/               编译产物（不入库）
```

仓库只提交源码，所有 PDF（包括原书扫描和生成结果）都不提交。

## 构建

需要 Typst 0.15 及以上版本。首次编译时会从 Typst Universe 下载所需的包，需要联网。

```powershell
typst compile books/物理第一册/main.typ build/物理第一册.pdf --root .
# 写作时自动重新编译
typst watch   books/物理第一册/main.typ build/物理第一册.pdf --root .
```

`--root .` 让各分册可以用 `#import "/common/sxzx.typ": *` 引用共用样式。

## 图书模板

各分册只引用 `common/sxzx.typ`，由它调用具体的模板。更换模板只需要改这一个文件。

### 主选：[bookly](https://typst.app/universe/package/bookly)

面向学术著作和科技书籍的模板，当前版本 3.1.0。

- 内置公式编号、图表题注、按章编号，适合理科教材
- 支持页边注版式（基于 marginalia），原书正文旁的要点提示可以放进页边
- 有多套主题，包括仿 Legrand Orange Book 的主题
- 持续维护中
- 需要注意：这是西文模板，中文字体、首行缩进、标点挤压等可能需要在 `sxzx.typ` 中补充设置

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
- 扫描本缺页（如物理第一册的封面、“第二版出版说明”“编者的话”）不补写，在源码中标注缺失。
- 源码中用 `// p.96` 注释标出原书页码，便于校对。

详细的录入规范见 [CLAUDE.md](CLAUDE.md)。

## 版权说明

原书版权归原出版社及作者所有。本项目仅用于学习和普及教育，不提供原书扫描文件。
