// 图 13·35 离心节速器（原书 p.459）
// 机器是写实插画，用原扫描裁剪（fig13-35.png，已涂去全部字母 A、B、N、M、M、K、C，用 CeTZ 补回）。
// 坐标是 PNG 像素坐标（宽 1930、高 1280），字母位置按涂去前的原位量取。
#import "/common/series.typ": *

#let fig-13-35(width: 13cm) = px-canvas(1930, 1280, width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  content(p(0, 0), anchor: "north-west", image("fig13-35.png", width: 1930 * u))
  lab(685, 45, $A$)
  lab(610, 300, $N$)
  lab(410, 705, $M$)
  lab(980, 700, $M$)
  lab(582, 772, $K$)
  lab(1462, 1067, $C$)
  lab(690, 1187, $B$)
})
