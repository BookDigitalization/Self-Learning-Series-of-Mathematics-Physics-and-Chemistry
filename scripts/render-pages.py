"""把原书扫描 PDF 的若干页渲染成 PNG，便于逐页看图录入。

用法：
    python scripts/render-pages.py <pdf> <页码范围> [--offset N] [--dpi 150] [--out build/pages]

页码范围写原书页码，例如 "1-6"、"12"、"1-3,8"。
--offset 是 PDF 页序（0 起计）与原书页码的差：PDF 第 n 页 = 原书第 n-offset 页。
物理第一册 offset = 4（PDF 第 5 页 = 原书 p.1）。用 --raw 时范围直接按 PDF 页序（0 起计）解释，
适合渲染目录等没有正文页码的页。

输出文件名：p0001.png（原书页码）或 pdf0003.png（--raw）。
"""
import argparse
import pathlib

import pymupdf


def parse_range(spec: str) -> list[int]:
    pages: list[int] = []
    for part in spec.split(","):
        part = part.strip()
        if "-" in part:
            a, b = part.split("-", 1)
            pages.extend(range(int(a), int(b) + 1))
        elif part:
            pages.append(int(part))
    return pages


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("pdf")
    ap.add_argument("pages", help='原书页码范围，如 "1-6"')
    ap.add_argument("--offset", type=int, default=4, help="PDF 页序 - 原书页码（默认 4）")
    ap.add_argument("--raw", action="store_true", help="范围按 PDF 页序（0 起计）解释")
    ap.add_argument("--dpi", type=int, default=150)
    ap.add_argument("--out", default="build/pages")
    args = ap.parse_args()

    out = pathlib.Path(args.out)
    out.mkdir(parents=True, exist_ok=True)
    doc = pymupdf.open(args.pdf)
    for p in parse_range(args.pages):
        idx = p if args.raw else p + args.offset
        if not 0 <= idx < doc.page_count:
            print(f"跳过：PDF 页序 {idx} 超出范围（共 {doc.page_count} 页）")
            continue
        name = f"pdf{idx:04d}.png" if args.raw else f"p{p:04d}.png"
        doc[idx].get_pixmap(dpi=args.dpi).save(out / name)
        print(out / name)


if __name__ == "__main__":
    main()
