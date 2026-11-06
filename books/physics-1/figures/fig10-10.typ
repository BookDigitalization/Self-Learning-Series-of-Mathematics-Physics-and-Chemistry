// 图 10·10 第二类杠杆的实例 与 图 10·11 动滑轮的实际使用（原书 p.306）
// 写实插画沿用原扫描裁剪（已涂去字母）；F、G、P 用文字补回。
// 图 10·10：fig10-10.png（2175×1717），由原页显示图坐标换算：(x-315)×2.1314, (y-110)×2.1314。
// 图 10·11：fig10-11.png（534×1568），换算：(x-370)×2.1314, (y-1125)×2.1314。
#import "/common/series.typ": *

#let fig-10-10(width: 11cm) = px-canvas(2175, 1717, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig10-10.png", width: 2175 * u))
  let d(x, y) = ((x - 315) * 2.1314, (y - 110) * 2.1314)
  let lab(x, y, body) = content(p(..d(x, y)), anchor: "center", text(size: 9pt, body))
  lab(698, 232, $F$)
  lab(448, 350, $G$)
  lab(892, 193, $F$)
  lab(1153, 462, $G$)
  lab(793, 735, $P$)
  lab(950, 805, $F$)
})

#let fig-10-11(width: 3.6cm) = px-canvas(534, 1568, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig10-11.png", width: 534 * u))
  let d(x, y) = ((x - 370) * 2.1314, (y - 1125) * 2.1314)
  let lab(x, y, body) = content(p(..d(x, y)), anchor: "center", text(size: 9pt, body))
  lab(475, 1448, $F$)
  lab(566, 1840, $G$)
})
