// 图 1·12 量筒（左）、量杯（右）（原书 p.9）
// 量筒、量杯是写实插画，沿用原扫描裁剪（fig1-12.png，已涂去刻度数字）；刻度数字 0–100 用 CeTZ 补回。
// 坐标是 fig1-12.png 的像素坐标（907×1461，y 向下）。
#import "/common/series.typ": *

#let fig-1-12(width: 5.6cm) = px-canvas(907, 1461, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1-12.png", width: 907 * u))
  let num(x, y, n, anchor: "center") = content(p(x, y), anchor: anchor, text(size: 8pt, str(n)))
  // 量筒：数字右对齐于 x = 250
  for (n, y) in ((100, 243), (90, 362), (80, 467), (70, 572), (60, 690), (50, 800), (40, 915), (30, 1040), (20, 1145), (10, 1262)) {
    num(250, y, n, anchor: "east")
  }
  // 量杯：数字居中于 x = 637
  for (n, y) in ((100, 755), (90, 800), (80, 852), (70, 905), (60, 958), (50, 1018), (40, 1080), (30, 1143), (20, 1210), (10, 1280), (0, 1360)) {
    num(637, y, n)
  }
})
