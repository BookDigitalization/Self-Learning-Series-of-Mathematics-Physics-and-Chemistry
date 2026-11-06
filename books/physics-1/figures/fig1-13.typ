// 图 1·13 眼睛要跟液面相平（原书 p.9）
// 量筒、眼睛是写实插画，沿用原扫描裁剪（fig1-13.png，已涂去刻度数字）；刻度数字用 CeTZ 补回。
// 原图液面处（约 80 的位置）本来就没有数字，不补。
// 坐标是 fig1-13.png 的像素坐标（705×1344，y 向下）。
#import "/common/series.typ": *

#let fig-1-13(width: 3.6cm) = px-canvas(705, 1344, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1-13.png", width: 705 * u))
  for (n, y) in ((100, 125), (90, 225), (70, 450), (60, 560), (50, 670), (40, 775), (30, 885), (20, 995), (10, 1105)) {
    content(p(248, y), anchor: "east", text(size: 8pt, str(n)))
  }
})
