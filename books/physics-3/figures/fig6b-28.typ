// 图 6·28 简易广播发送机（电路图）；来源 原书 p.330，坐标取自 200 dpi 页面像素（1671×2500）。
#import "/common/series.typ": *
#import "fig6b-parts.typ": *

#let fig-6-28(width: 10.5cm) = px-canvas(760, 710, origin: (400, 250), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  // 天线、L2、L
  antenna(p, 448, 265, hw: 37, h: 39)
  wire(p, (448, 304), (448, 460), (523, 460))
  wire(p, (523, 460), (523, 470))
  coil-v(p, 523, 470, 6, r: 9, side: "left")
  wire(p, (523, 580), (523, 594), (448, 594), (448, 780))
  ground(p, 448, 780, hw: 17)
  wire(p, (531, 460), (531, 470))
  coil-v(p, 531, 470, 6, r: 9, side: "right")
  wire(p, (531, 580), (531, 600))
  lab(469, 523, $L_2$); lab(582, 527, $L$)
  wire(p, (531, 460), (888, 460))
  wire(p, (531, 600), (974, 600))
  // 可变电容 C
  wire(p, (746, 460), (746, 520)); cap-v(p, 746, 532, var: true); wire(p, (746, 543), (746, 600))
  node(p, 746, 460); node(p, 746, 600)
  lab(704, 531, $C$)
  // C1
  wire(p, (746, 600), (808, 600)); cap(p, 814, 600); wire(p, (820, 600), (875, 600))
  node(p, 875, 600)
  lab(819, 557, $C_1$)
  // 电子管
  tube(p, 887, 369, 115, 181, plate-y: 0.24, grid-y: 0.51, cat-y: 0.80)
  wire(p, (940, 352), (940, 405))
  wire(p, (940, 352), (855, 352), (855, 415), (538, 415))
  // L1
  wire(p, (538, 415), (538, 405)); coil-v(p, 538, 330, 3, r: 11, side: "left")
  wire(p, (538, 322), (538, 330)); wire(p, (538, 322), (1092, 322), (1092, 415))
  lab(585, 369, $L_1$)
  // 阴极、甲电
  wire(p, (912, 540), (912, 600)); wire(p, (974, 540), (974, 600))
  wire(p, (912, 600), (936, 600)); wire(p, (948, 600), (974, 600))
  battery(p, 936, 600, cells: 1, long: 24, short: 14, step: 11)
  node(p, 912, 600); node(p, 974, 600)
  lab(940, 651, $A$)
  // 乙电
  battery-v(p, 1092, 423, cells: 3, long: 30, short: 16, step: 11)
  wire(p, (1092, 415), (1092, 423)); wire(p, (1092, 479), (1092, 600), (974, 600))
  lab(1112, 395, [+]); lab(1112, 492, [#sym.minus]); lab(1140, 450, $B$)
  // 变压器
  wire(p, (746, 600), (746, 685), (757, 685)); coil-h(p, 757, 685, 4, r: 12.5)
  wire(p, (857, 685), (875, 685), (875, 600))
  line(p(743, 692), p(869, 692), stroke: 0.8pt); line(p(743, 697), p(869, 697), stroke: 0.8pt)
  wire(p, (743, 731), (757, 731)); coil-h(p, 757, 731, 4, r: 12.5)
  wire(p, (857, 731), (869, 731), (869, 800), (777, 800))
  wire(p, (743, 731), (743, 760))
  line(p(727, 760), p(759, 760), stroke: 2.4pt); line(p(735, 770), p(751, 770), stroke: 1.2pt)
  wire(p, (743, 770), (743, 782), (780, 782), (780, 790))
  // 炭粒
  for (x, y) in ((780, 793), (795, 790), (810, 793), (825, 790), (840, 793), (790, 799), (805, 797), (820, 799), (835, 797), (850, 799)) {
    circle(p(x, y), radius: 3, fill: black, stroke: none)
  }
  // 送话器 M 与声波
  line(p(770, 817), p(842, 817), p(870, 862), p(738, 862), close: true, stroke: 1.4pt, fill: white)
  line(p(738, 862), p(870, 862), stroke: 1.4pt)
  lab(885, 835, $M$)
  for r in (28, 55, 82) {
    arc(p(806, 915), start: 30deg, stop: 150deg, radius: r, anchor: "origin", stroke: 1.2pt)
  }
  arc(p(806, 915), start: 150deg, stop: 180deg, radius: 82, anchor: "origin", stroke: 1.2pt)
  arc(p(806, 915), start: 0deg, stop: 30deg, radius: 82, anchor: "origin", stroke: 1.2pt)
  circle(p(806, 915), radius: 4, fill: black, stroke: none)
  lab(810, 940, $S$)
})
