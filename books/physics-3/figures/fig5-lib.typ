// 第 5 章图的共用小工具：位图（原扫描裁剪，已涂去文字）+ 真文字标注。
// 标注坐标用原书页面 200 dpi 网格坐标（render-pages.py --dpi 200 --grid 100）；bitfig 按裁剪框换算成位图像素坐标（放大 2 倍）。
#import "/common/series.typ": *

// png：裁剪位图；(x0, y0, x1, y1)：裁剪框（页面 200 dpi 坐标）；labels：((x, y, 内容), …)
#let bitfig(png, box, labels, width: 8cm, size: 10pt) = {
  let (x0, y0, x1, y1) = box
  let w = (x1 - x0) * 2
  let h = (y1 - y0) * 2
  px-canvas(w, h, width: width, (p, u) => {
    import cetz.draw: *
    content(p(0, 0), anchor: "north-west", image(png, width: w * u))
    for (x, y, body) in labels {
      content(p((x - x0) * 2, (y - y0) * 2), anchor: "center", text(size: size, body))
    }
  })
}
