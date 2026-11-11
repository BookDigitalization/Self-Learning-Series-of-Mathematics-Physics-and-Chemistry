"""打印某册原书扫描 PDF 路径和 offset，供 justfile 使用：uv run python scripts/book-scan.py geometry-1 -> "original/geometry-1.pdf 6"。
物理第一册的扫描件是整册 PDF，offset 4；数学各册是 split-volume.py 切出的 original/<册>.pdf，offset 取自 scripts/math-volumes.json。"""
import json
import sys
from pathlib import Path

book = sys.argv[1]
if book == "physics-1":
    print("original/数理化自学丛书物理第一册.pdf 4")
else:
    vols = json.loads(Path(__file__).with_name("math-volumes.json").read_text(encoding="utf-8"))
    if book not in vols:
        sys.exit(f"未登记的册：{book}（见 scripts/math-volumes.json）")
    print(f"original/{book}.pdf {vols[book]['offset']}")
