// 图 1·17 砝码
// 砝码盒、镊子、砝码是写实插画，沿用原扫描裁剪（fig1-17.png，已涂去砝码上的数字）；数字 20、10、100、50、500、200 用 CeTZ 补回。
// 坐标是 fig1-17.png 的像素坐标（2079×1238，y 向下）。
#import "/common/series.typ": *

#let fig-1-17(width: 9.4cm) = px-canvas(2079, 1238, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1-17.png", width: 2079 * u))
  for (n, x, y) in (("20", 1633, 522), ("10", 1960, 540), ("100", 1610, 722), ("50", 1913, 722), ("500", 1558, 958), ("200", 1950, 957)) {
    content(p(x, y), anchor: "center", text(size: 8pt, n))
  }
})
