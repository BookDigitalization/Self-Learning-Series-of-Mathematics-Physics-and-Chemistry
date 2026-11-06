// 习题 9·3 附图（原书 p.263–264）。CeTZ 重绘，坐标取自页面显示图。
#import "/common/series.typ": *

// 第 4 题：丁字形木架
#let fig-ex-9-3-4(width: 5.4cm) = px-canvas(480, 460, origin: (930, 1420), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  line(p(1043, 1432), p(1043, 1850), stroke: 1.6pt)
  line(p(1043, 1568), p(1380, 1565), stroke: 1.6pt)
  line(p(965, 1478), p(1040, 1478), stroke: 1.2pt, mark: (end: "stealth", fill: black, scale: 0.5))
  line(p(1325, 1566), p(1325, 1652), stroke: 1pt)
  rect(p(1298, 1652), p(1358, 1712), stroke: 1pt)
  line(p(950, 1856), p(1043, 1770), stroke: 2pt, mark: (end: "stealth", fill: black, scale: 0.5))
  line(p(1043, 1770), p(1160, 1625), stroke: (thickness: 0.8pt, dash: "dashed"))
  arc(p(1043, 1770), start: 90deg, stop: 50deg, radius: 75 * u, stroke: 0.6pt, anchor: "origin")
  lab(980, 1462, $F_1$); lab(1060, 1478, $B$); lab(1025, 1572, $O$); lab(1325, 1548, $A$)
  lab(1328, 1682, $G$); lab(1030, 1742, $C$); lab(945, 1840, $F_2$); lab(1068, 1695, $alpha$)
})

// 第 5 题：弯杆
#let fig-ex-9-3-5(width: 5cm) = px-canvas(420, 420, origin: (400, 650), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  line(p(540, 975), p(765, 818), stroke: 1.6pt)
  line(p(540, 975), p(475, 873), stroke: 1.6pt)
  line(p(468, 873), p(508, 873), stroke: 2pt)
  line(p(470, 688), p(472, 868), stroke: 1.4pt, mark: (end: "stealth", fill: black, scale: 0.5))
  line(p(672, 678), p(758, 812), stroke: 1.2pt, mark: (end: "stealth", fill: black, scale: 0.5))
  line(p(742, 806), p(768, 790), stroke: 1pt)
  line(p(418, 980), p(700, 982), stroke: (thickness: 0.7pt, dash: "dashed"))
  circle(p(540, 975), radius: 4 * u, fill: white, stroke: 1pt)
  arc(p(540, 975), start: 180deg, stop: 123deg, radius: 50 * u, stroke: 0.6pt, anchor: "origin")
  arc(p(540, 975), start: 0deg, stop: 35deg, radius: 50 * u, stroke: 0.6pt, anchor: "origin")
  lab(447, 692, $F_2$); lab(655, 675, $F_1$); lab(445, 893, $B$); lab(780, 825, $A$)
  lab(487, 960, $alpha_2$); lab(598, 962, $alpha_1$); lab(540, 1008, $O$)
})

// 第 6 题：弯成直角的铁棒悬挂在 O 点
#let fig-ex-9-3-6(width: 5.4cm) = px-canvas(500, 520, origin: (850, 540), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  line(p(1120, 672), p(1120, 562), stroke: 1pt)
  line(p(1095, 562), p(1150, 562), stroke: 1.2pt)
  for x in range(1100, 1150, step: 12) { line(p(x, 562), p(x + 8, 552), stroke: 0.6pt) }
  line(p(865, 667), p(1305, 672), stroke: (thickness: 0.7pt, dash: "dashed"))
  line(p(1120, 672), p(940, 722), stroke: 1.8pt)
  line(p(1120, 672), p(1225, 1022), stroke: 1.8pt)
  arc(p(1120, 672), start: 180deg, stop: 196deg, radius: 130 * u, stroke: 0.6pt, anchor: "origin")
  arc(p(1120, 672), start: 0deg, stop: -73deg, radius: 50 * u, stroke: 0.6pt, anchor: "origin")
  lab(1135, 650, $O$); lab(937, 730, $B$); lab(1240, 1022, $A$)
  lab(1010, 685, $alpha_2$); lab(1168, 702, $alpha_1$)
})
