"""从原书扫描页裁剪插图，转灰度并二值化（去掉纸张底色和噪点），保存为 PNG。

用法：
    python scripts/crop-figure.py <pdf> <原书页码> <x0,y0,x1,y1> <输出.png> [--offset 4] [--dpi 400] [--threshold 170]

坐标是 render-pages.py 默认输出的 200 dpi 页面图上的像素坐标（左上角为原点），
脚本会按 --dpi 重新以更高分辨率渲染再裁剪，所以裁出的图比 200 dpi 预览清晰。
--threshold：灰度低于它的像素变黑，其余变白；线条太细就调高，底色噪点多就调低。
"""
import argparse

import pymupdf

PREVIEW_DPI = 200


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("pdf")
    ap.add_argument("page", type=int, help="原书页码")
    ap.add_argument("box", help="x0,y0,x1,y1（200 dpi 预览图像素）")
    ap.add_argument("out")
    ap.add_argument("--offset", type=int, default=4)
    ap.add_argument("--dpi", type=int, default=400)
    ap.add_argument("--threshold", type=int, default=170)
    args = ap.parse_args()

    x0, y0, x1, y1 = (float(v) for v in args.box.split(","))
    k = 72 / PREVIEW_DPI  # 预览像素 → PDF 点
    page = pymupdf.open(args.pdf)[args.page + args.offset]
    clip = pymupdf.Rect(x0 * k, y0 * k, x1 * k, y1 * k) & page.rect
    pix = page.get_pixmap(dpi=args.dpi, clip=clip, colorspace=pymupdf.csGRAY)

    t = args.threshold
    table = bytes(0 if v < t else 255 for v in range(256))
    bw = pymupdf.Pixmap(pymupdf.csGRAY, pix.width, pix.height, pix.samples.translate(table), False)
    bw.set_dpi(args.dpi, args.dpi)
    bw.save(args.out)
    print(f"{args.out}  {bw.width}×{bw.height}")


if __name__ == "__main__":
    main()
