# 构建、字体与常用命令

返回 [README](../README.md)。

## 构建

需要 Typst 0.15 及以上版本、[uv](https://docs.astral.sh/uv/)（运行 Python 辅助脚本，PyMuPDF 等依赖见 `pyproject.toml`，首次运行自动安装），常用操作用 [just](https://github.com/casey/just) 封装（`just` 列出所有命令，Windows 用 PowerShell，Linux / macOS 用 bash）。首次编译时会从 Typst Universe 下载所需的包，需要联网。

```bash
# 首次：下载字体到 fonts/（即 `just fonts`）
./scripts/get-fonts.ps1    # Windows（PowerShell）
./scripts/get-fonts.sh     # Linux / macOS

typst compile books/physics-1/main.typ build/physics-1.pdf --root . --font-path fonts --ignore-system-fonts
# 写作时自动重新编译
typst watch   books/physics-1/main.typ build/physics-1.pdf --root . --font-path fonts --ignore-system-fonts

# 其他分册同理，把 physics-1 换成目录名，例如代数第四册
typst compile books/algebra-4/main.typ build/algebra-4.pdf --root . --font-path fonts --ignore-system-fonts

# 把原书第 1–6 页渲染成 PNG（build/pages/），录入时对照看图
uv run python scripts/render-pages.py original/数理化自学丛书物理第一册.pdf 1-6

# 数学分册的扫描在合集 PDF 里：先按册切出单册（页范围登记在 scripts/math-volumes.json），再渲染
uv run python scripts/split-volume.py algebra-4
uv run python scripts/render-pages.py original/algebra-4.pdf 1-6 --offset 6
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

字体文件不入库，用 `scripts/get-fonts.ps1`（Windows）或 `scripts/get-fonts.sh`（Linux / macOS）下载到 `fonts/`。使用静态字重的 OTF/TTF，不用系统自带的可变字体版本（Typst 会嵌入最细字重）。

## 常用命令（just）

装好 [just](https://github.com/casey/just) 后，在仓库根目录运行 `just` 列出全部命令。凡是针对某一册的命令，**第一个参数都是分册目录名**（`physics-1`、`algebra-4`、`geometry-1` 等，没有默认册），如 `just check algebra-4`。

```sh
just fonts                          # 下载字体（只需一次）
just build algebra-4                # 整书编译到 build/algebra-4.pdf
just check algebra-4                # 整书编译，有错误或警告就失败（提交前用，只检查指定的一册）
just watch algebra-4                # 写作时监视整书，保存即重新编译
just chapter algebra-4 7            # 只编译第 7 章，很快（输出 build/solo/ch07.pdf）
just solo geometry-1 "ch01.typ ch01b.typ" --png 1-3   # 数学册单独编译若干章文件（参数见 scripts/solo-compile.py；几何册见 .claude/skills/digitize-book/geometry.md）
just png algebra-4 20-24            # 把成书 PDF 的 20–24 页导出成 PNG 核对
just scan algebra-4 7-9             # 渲染原书第 7–9 页（带坐标网格），用来量图
just scan-plain algebra-4 7-9       # 渲染原书页（不带网格）
just crop physics-1 8 "520,900,1155,1275" books/physics-1/figures/x.png   # 从原书页裁图
just crop-view geometry-1 112 "150,350,800,700" build/pages/f112.png     # 裁剪放大并叠页坐标网格，量图、读小字用
just todo algebra-4                 # 列出 #unclear 和 TODO 的位置
just stats algebra-4                # 成书页数、书签数
just find algebra-4 牛顿            # 在成书 PDF 里找一个词（验证可检索）
just clean                          # 清理核对用的临时 PNG
just tag-all 0.0.3                  # 发版：检查全部 10 册后在本地打 tag v0.0.3（不推送）
just tag algebra-4 0.1.0            # 只发一册：tag algebra-4-v0.1.0
```

发版只推送 tag（`git push origin v0.0.3`），由 GitHub Actions 编译全部分册并发布一个 Release；推送前请先确认 `just todo` 与各册 `REVISIONS.md`，见 `.claude/skills/digitize-book/SKILL.md` 的“发版”。
