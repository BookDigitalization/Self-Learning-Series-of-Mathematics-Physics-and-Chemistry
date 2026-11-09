"""从《数学分册合集》里按册切出单册扫描 PDF，供 render-pages.py 使用。

用法：
    python scripts/split-volume.py algebra-1

册的页范围登记在 scripts/math-volumes.json（合集页码，从 1 起，含首尾）。
**页范围不要照抄合集书签**：书签有错（例如解析几何一级书签落在 2767，实际第 1 章从 2383 起），
登记前要看扫描页核实。offset 记的是"切出的单册 PDF 页序（0 起计）- 原书页码"，
即 render-pages.py 的 --offset 值。

输出 original/<册>.pdf（original/ 不入库，也不会被提交）。
"""
import json
import pathlib
import sys

import pymupdf

ROOT = pathlib.Path(__file__).resolve().parent.parent


def main() -> None:
    if len(sys.argv) != 2:
        sys.exit(__doc__)
    name = sys.argv[1]
    vols = json.loads((ROOT / "scripts" / "math-volumes.json").read_text(encoding="utf-8"))
    if name not in vols:
        sys.exit(f"未登记的册：{name}。已登记：{', '.join(vols)}")
    v = vols[name]
    src = next((ROOT / "original").glob("*数学分册合集*.pdf"))
    out = ROOT / "original" / f"{name}.pdf"
    doc = pymupdf.open(src)
    new = pymupdf.open()
    new.insert_pdf(doc, from_page=v["start"] - 1, to_page=v["end"] - 1)
    new.save(out, garbage=3, deflate=True)
    print(f"{out}：{new.page_count} 页；render-pages.py 用 --offset {v['offset']}")


if __name__ == "__main__":
    main()
