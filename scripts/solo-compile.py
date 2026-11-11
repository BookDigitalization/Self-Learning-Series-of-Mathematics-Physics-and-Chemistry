"""单独编译某册的一个或几个章文件（录入时用，整书还没拼好也能编译）。

用法：
    uv run python scripts/solo-compile.py geometry-1 ch01b.typ --ch 1 --sec 4 --fig 12 --png 1-3 --ppi 90
    uv run python scripts/solo-compile.py geometry-1 ch02.typ ch02b.typ --ch 2 --sec 0 --fig 0

参数（都是“进入这个文件之前”的计数器值，保证节号、图号和整书一致）：
    --ch N    进入文件前已有 N 章；文件以 `= 章名` 开头时填 前一章号（即 章号 − 1），文件从章中间开始时填 当前章号
    --sec M   当前章里进入文件前已有 M 节（文件以 `== 节名` 开头时填 前一节号）
    --fig K   当前章里进入文件前已有 K 幅编号插图
    --back    文件放在 appendix/ 里（总复习题、习题答案），用 back-matter 排版
    --png 1-3 同时把输出的这几页导出成 build/solo/<名>-N.png（--ppi 默认 90）

输出 build/solo/<名>.pdf；有错误或警告时打印出来并以非 0 退出。
文件名里带路径（如 appendix/review.typ）则按 books/<册>/ 下的相对路径找，否则在 chapters/ 下找。
"""
import argparse
import pathlib
import subprocess
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent

ap = argparse.ArgumentParser()
ap.add_argument("book")
ap.add_argument("files", nargs="+")
ap.add_argument("--ch", type=int, default=0)
ap.add_argument("--sec", type=int, default=0)
ap.add_argument("--fig", type=int, default=0)
ap.add_argument("--back", action="store_true")
ap.add_argument("--png")
ap.add_argument("--ppi", type=int, default=90)
a = ap.parse_args()

paths = []
for f in a.files:
    p = f if "/" in f else f"chapters/{f}"
    if not (ROOT / "books" / a.book / p).exists():
        sys.exit(f"找不到 books/{a.book}/{p}")
    paths.append(p)

name = "solo-" + a.book + "-" + pathlib.Path(paths[0]).stem
solo = ROOT / "build" / "solo"
solo.mkdir(parents=True, exist_ok=True)
src = f"""#import "/common/series.typ": *
#show: series-book.with(title: "单段测试：{name}")
#show math.equation.where(block: false): it => math.display(it)
#show math.equation.where(block: false): set text(top-edge: "bounds", bottom-edge: "bounds")
#show: {"back-matter" if a.back else "main-matter"}
{"" if a.back else f"#counter(heading).update(({a.ch}, {a.sec}))" + chr(10) + f"#counter(figure.where(kind: image)).update({a.fig})"}
""" + "\n".join(f'#include "/books/{a.book}/{p}"' for p in paths) + "\n"
main = solo / f"{name}.typ"
main.write_text(src, encoding="utf-8")
flags = ["--root", str(ROOT), "--font-path", str(ROOT / "fonts"), "--ignore-system-fonts"]
out = solo / f"{name}.pdf"
r = subprocess.run(["typst", "compile", str(main), str(out), *flags], capture_output=True, text=True, encoding="utf-8")
msg = (r.stdout + r.stderr).strip()
if msg:
    print(msg)
if r.returncode != 0 or msg:
    sys.exit(1)
print(f"OK：{out}")
if a.png:
    r = subprocess.run(["typst", "compile", str(main), str(solo / f"{name}-{{p}}.png"), *flags,
                        "--pages", a.png, "--ppi", str(a.ppi)], capture_output=True, text=True, encoding="utf-8")
    print((r.stdout + r.stderr).strip() or f"PNG：build/solo/{name}-<页>.png")
