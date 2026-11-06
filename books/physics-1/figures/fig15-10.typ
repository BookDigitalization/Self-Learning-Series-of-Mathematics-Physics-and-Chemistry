// 图 15·10 空吸现象（原书 p.501）
// 写实插图，沿用原扫描裁剪（fig15-10.png，已涂去字母）；A B C D E 用文字补回。
// 坐标是 fig15-10.png 的像素坐标（1685×939，y 向下）。
#import "/common/series.typ": *

#let fig-15-10(width: 10.5cm) = px-canvas(1685, 939, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig15-10.png", width: 1685 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 10pt, body))
  lab(58, 118, $A$)
  lab(1613, 22, $B$)
  lab(948, 244, $C$)
  lab(663, 648, $E$)
  lab(948, 783, $D$)
})
