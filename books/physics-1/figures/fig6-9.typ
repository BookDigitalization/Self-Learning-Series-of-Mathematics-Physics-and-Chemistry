// 图 6·9 同一直线上两个共点力的合成（原书 p.176）
// 手、滑轮、砝码和橡皮筋是写实线图，沿用原扫描裁剪（fig6-9.png，已涂去全部字母和文字）；
// 字母 A B B' F₁ F₂ R、甲乙丙、（a）（b）用文字补回。
// 坐标是 fig6-9.png 的像素坐标（2249×1419）；由原页显示图坐标换算：(x-330)×2.1314, (y-105)×2.1314。
#import "/common/series.typ": *

#let fig-6-9(width: 14cm) = px-canvas(2249, 1419, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig6-9.png", width: 2249 * u))
  let d(x, y) = ((x - 330) * 2.1314, (y - 105) * 2.1314)
  let lab(x, y, body) = content(p(..d(x, y)), anchor: "center", text(size: 8pt, body))
  let zh(x, y, body) = content(p(..d(x, y)), anchor: "center", text(font: fonts.kai, size: 8pt, body))
  // （a）
  lab(372, 266, $A$); lab(510, 301, $B$); zh(452, 312, [甲])
  lab(372, 399, $A$); zh(452, 437, [乙]); lab(606, 437, $B'$)
  lab(875, 478, $F_1$); lab(787, 537, $F_2$)
  lab(375, 631, $A$); zh(452, 637, [丙]); lab(618, 631, $B'$)
  lab(538, 712, $(a)$); lab(820, 737, $R = F_1 + F_2$)
  // （b）
  lab(962, 298, $A$); zh(1036, 306, [甲]); lab(1098, 297, $B$)
  lab(962, 428, $A$); zh(1028, 437, [乙]); lab(1192, 435, $B'$)
  lab(1062, 516, $F_1$); lab(1352, 600, $F_2$)
  lab(962, 632, $A$); zh(1036, 633, [丙]); lab(1197, 632, $B'$)
  lab(1120, 710, $(b)$); lab(1298, 737, $R = F_2 - F_1$)
})
