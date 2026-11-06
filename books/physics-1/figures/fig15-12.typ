// 图 15·12 喷雾器（原书 p.502）
// 写实插图，沿用原扫描裁剪（fig15-12.png，已涂去字母）；A B E 用文字补回。
// 坐标是 fig15-12.png 的像素坐标（1280×459，y 向下）。
#import "/common/series.typ": *

#let fig-15-12(width: 8cm) = px-canvas(1280, 459, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig15-12.png", width: 1280 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 10pt, body))
  lab(966, 38, $A$)
  lab(950, 256, $B$)
  lab(1124, 326, $E$)
})
