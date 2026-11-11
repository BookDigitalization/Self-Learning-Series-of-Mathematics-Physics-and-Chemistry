"""把原书扫描页的一块区域放大并叠上带真实坐标的网格，用来给插图量坐标、核对文字。

用法：
    python scripts/crop-view.py original/geometry-1.pdf 112 "100,420,900,800" build/pages/f112.png --offset 6 --dpi 200 --zoom 2 --grid 50

坐标 x0,y0,x1,y1 是“按 --dpi 渲染的整页图”上的像素坐标（和 render-pages.py --dpi 同值输出的 *-grid.png 一致，
即你读坐标、画图用的那套坐标）；输出图放大 --zoom 倍，网格线按 --grid 像素间隔画，标的数字就是整页坐标。
--grid 0 不画网格（只放大看文字）。
几何第一册用 --offset 6 --dpi 200，几何第二册用 --offset 4 --dpi 120（页面宽约 1000 像素）。
"""
import argparse

import pymupdf


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("pdf")
    ap.add_argument("page", type=int, help="原书页码")
    ap.add_argument("box", help="x0,y0,x1,y1（整页图像素坐标）")
    ap.add_argument("out")
    ap.add_argument("--offset", type=int, default=0, help="单册 PDF 页序（0 起）= 原书页码 + offset")
    ap.add_argument("--dpi", type=int, default=200)
    ap.add_argument("--zoom", type=float, default=2.0)
    ap.add_argument("--grid", type=int, default=50)
    a = ap.parse_args()

    x0, y0, x1, y1 = (float(v) for v in a.box.split(","))
    doc = pymupdf.open(a.pdf)
    page = doc[a.page + a.offset]
    s = a.dpi / 72.0
    clip = pymupdf.Rect(x0 / s, y0 / s, x1 / s, y1 / s)
    z = a.zoom
    pix = page.get_pixmap(matrix=pymupdf.Matrix(s * z, s * z), clip=clip, colorspace=pymupdf.csGRAY)
    if a.grid > 0:
        # 在新页面上叠网格：先把 pixmap 当作图片放进去，再画线和数字
        out = pymupdf.open()
        pg = out.new_page(width=pix.width, height=pix.height)
        pg.insert_image(pg.rect, pixmap=pix)
        gx = int(x0 // a.grid + 1) * a.grid
        while gx < x1:
            X = (gx - x0) * z
            pg.draw_line((X, 0), (X, pix.height), color=(1, 0.2, 0.2), width=0.4)
            pg.insert_text((X + 2, 10), str(gx), fontsize=8, color=(1, 0, 0))
            gx += a.grid
        gy = int(y0 // a.grid + 1) * a.grid
        while gy < y1:
            Y = (gy - y0) * z
            pg.draw_line((0, Y), (pix.width, Y), color=(0.1, 0.3, 1), width=0.4)
            pg.insert_text((2, Y - 2), str(gy), fontsize=8, color=(0, 0, 1))
            gy += a.grid
        pg.get_pixmap(dpi=72).save(a.out)
    else:
        pix.save(a.out)
    print(f"{a.out}：{pix.width}×{pix.height}，区域 {a.box}（--dpi {a.dpi} 页面坐标），放大 {z} 倍")


if __name__ == "__main__":
    main()
