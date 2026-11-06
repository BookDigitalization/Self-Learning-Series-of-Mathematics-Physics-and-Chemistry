// 图 13·35 离心节速器（原书 p.459）
// 机器是写实插画，用原扫描裁剪（fig13-35.png，已涂去字母 A、B、N、M、M、K、C，用 CeTZ 补回；
// 涂白时可能带走了字母旁边的少量线条，见待核对记录）。坐标是页面显示图（宽 1568）上的像素坐标。
#import "/common/series.typ": *

#let fig-13-35(width: 13cm) = px-canvas(905, 600, origin: (440, 1280), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  content(p(440, 1280), anchor: "north-west", image("fig13-35.png", width: 905 * u))
  lab(760, 1299, $A$)
  lab(726, 1421, $N$)
  lab(631, 1609, $M$)
  lab(898, 1609, $M$)
  lab(712, 1639, $K$)
  lab(1132, 1880, $C$)
  lab(763, 1860, $B$)
})
