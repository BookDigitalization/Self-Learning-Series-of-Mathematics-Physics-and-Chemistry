// 图 6·23 三极电子管的构造和符号、图 6·24 栅压和板流的变化（原书 p.325）
// 图 6·23 左侧管子为写实插画，沿用原扫描裁剪（fig6-23.png，裁剪区 (152,812)–(305,1046)，150 dpi 页面像素坐标）；
// 右侧符号和字用 CeTZ 重绘。图 6·24 CeTZ 重绘。
#import "/common/series.typ": *
#import "fig6-parts.typ": *

#let fig-6-23(width: 6.6cm) = px-canvas(360, 245, origin: (150, 810), width: width, (p, u) => {
  import cetz.draw: *
  content(p(152, 812), anchor: "north-west", image("fig6-23.png", width: 153 * u))
  txt(p, 328, 868, [屏极], size: 9pt); txt(p, 332, 962, [栅极], size: 9pt); txt(p, 333, 1025, [阴极], size: 9pt)
  line(p(352, 870), p(418, 888), stroke: 0.5pt)
  line(p(358, 958), p(380, 936), stroke: 0.5pt)
  line(p(362, 1025), p(415, 1013), stroke: 0.5pt)
  // 符号
  circle(p(438, 928), radius: (48, 77), stroke: 1.2pt)
  wire(p, (442, 817), (442, 888))
  line(p(422, 888), p(458, 888), stroke: 2.4pt)
  line(p(398, 932), p(475, 932), stroke: (thickness: 1.4pt, dash: (7pt, 4pt)))
  bezier(p(415, 985), p(464, 985), p(425, 976), p(454, 976), stroke: 2.4pt)
  line(p(415, 985), p(415, 1035), stroke: sw)
  line(p(464, 985), p(464, 1035), stroke: sw)
})

#let fig-6-24(width: 8.8cm) = px-canvas(480, 435, origin: (590, 715), width: width, (p, u) => {
  import cetz.draw: *
  let vtxt(x, y, s, size: 9pt) = content(p(x, y), text(size: size, weight: "bold", stack(dir: ttb, spacing: 0.35em, ..s.clusters())))
  // 电子管
  circle(p(822, 845), radius: (41, 73), stroke: 1.8pt)
  line(p(813, 824), p(850, 824), stroke: 3pt)
  txt(p, 817, 810, [+], size: 8pt); txt(p, 842, 810, [+], size: 8pt)
  wire(p, (832, 824), (832, 763), (943, 763))
  line(p(802, 867), p(872, 867), stroke: (thickness: 1.4pt, dash: (6pt, 3pt)))
  for (x, y) in ((810, 852), (850, 852), (813, 894), (850, 894)) {
    circle(p(x, y), radius: 9, stroke: 0.8pt, fill: white)
    line(p(x - 5, y), p(x + 5, y), stroke: 0.8pt)
  }
  bezier(p(803, 917), p(853, 917), p(813, 905), p(843, 905), stroke: 3pt)
  // 屏极电路
  gmeter(p, 963, 758, r: 20)
  wire(p, (983, 763), (1060, 763), (1060, 1092), (967, 1092))
  txt(p, 967, 727, $G$, size: 9pt)
  txt(p, 882, 735, [屏流], size: 9pt)
  arrow(p, (893, 752), (860, 752))
  rect(p(900, 794), p(1028, 1062), radius: 8, stroke: (thickness: 0.7pt, dash: (5pt, 3pt)))
  vtxt(1007, 908, "屏极电路")
  // 乙电
  wire(p, (853, 1092), (940, 1092))
  battery-h(p, 940, 1092, n: 2, d: 9, long: 24, short: 14)
  wire(p, (967, 1092), (1060, 1092))
  txt(p, 932, 1108, [−], size: 9pt); txt(p, 1013, 1106, [+], size: 9pt)
  txt(p, 973, 1132, [乙电], size: 9pt)
  // 甲电
  wire(p, (659, 1092), (800, 1092))
  node(p, 800, 1092); node(p, 853, 1092)
  wire(p, (800, 1092), (822, 1092))
  battery-h(p, 822, 1092, n: 1, d: 9, long: 22, short: 12)
  wire(p, (840, 1092), (853, 1092))
  line(p(803, 922), p(803, 1092), stroke: sw)
  line(p(853, 922), p(853, 1092), stroke: sw)
  txt(p, 800, 1108, [−], size: 9pt); txt(p, 853, 1108, [+], size: 9pt)
  txt(p, 827, 1132, [甲电], size: 9pt)
  rect(p(809, 952), p(848, 1058), radius: 6, stroke: (thickness: 0.7pt, dash: (5pt, 3pt)))
  vtxt(829, 1005, "阴极电路", size: 8.5pt)
  // 丙电与栅极电路
  wire(p, (659, 867), (802, 867))
  wire(p, (659, 867), (659, 942))
  battery(p, 659, 945, n: 4, d: 8, long: 24, short: 12)
  wire(p, (659, 970), (659, 1092))
  txt(p, 641, 933, [+], size: 9pt); txt(p, 641, 998, [−], size: 9pt)
  txt(p, 610, 965, [丙电], size: 9pt)
  txt(p, 727, 835, [栅流], size: 9pt)
  arrow(p, (710, 855), (743, 855))
  rect(p(690, 880), p(777, 1065), radius: 8, stroke: (thickness: 0.7pt, dash: (5pt, 3pt)))
  vtxt(717, 958, "栅极电路")
})
