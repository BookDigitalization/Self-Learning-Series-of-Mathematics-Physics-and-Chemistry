// 图 9·16（原书 p.250）例 6：横梁 AB 与斜梁 BC 挂重物，及 B 点受力图。坐标取自页面显示图，原点 (400,470)。
#import "/common/series.typ": *

#let fig-9-16(width: 12cm) = px-canvas(880, 640, origin: (400, 470), width: width, (p, u) => {
  import cetz.draw: *
  let arrow(a, b, th: 1.4pt) = line(p(..a), p(..b), stroke: th, mark: (end: "stealth", fill: black, scale: 0.5))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dash(a, b) = line(p(..a), p(..b), stroke: (thickness: 0.6pt, dash: "dashed"))
  // 左：结构
  line(p(450, 675), p(450, 1100), stroke: 1pt)
  for y in range(690, 1100, step: 26) { line(p(450, y + 8), p(436, y + 22), stroke: 0.6pt) }
  line(p(452, 722), p(610, 722), stroke: 1.8pt)
  line(p(610, 722), p(452, 1043), stroke: 1.8pt)
  line(p(610, 722), p(610, 935), stroke: 1.2pt)
  rect(p(565, 935), p(655, 1030), stroke: 1pt, fill: luma(240))
  line(p(610, 935), p(610, 1030), stroke: 0.6pt)
  line(p(565, 982), p(655, 982), stroke: 0.6pt)
  arc(p(610, 722), start: 180deg, stop: 240deg, radius: 50 * u, stroke: 0.6pt, anchor: "origin")
  lab(415, 722, $A$); lab(630, 716, $B$); lab(425, 1045, $C$); lab(555, 755, $alpha$)
  // 右：受力图
  let b = (1015, 722)
  line(p(870, 680), p(870, 1028), stroke: 1pt)
  line(p(870, 990), p(..b), stroke: 0.8pt)
  arrow((880, 722), (1225, 722), th: 0.7pt)
  arrow((1015, 925), (1015, 485), th: 0.7pt)
  arrow(b, (925, 722), th: 1.8pt)
  arrow(b, (1115, 535))
  arrow(b, (1015, 925), th: 2pt)
  dash((1015, 535), (1115, 535))
  dash((1120, 535), (1120, 722))
  arc(p(..b), start: 0deg, stop: 57deg, radius: 45 * u, stroke: 0.6pt, anchor: "origin")
  arc(p(..b), start: 180deg, stop: 237deg, radius: 45 * u, stroke: 0.6pt, anchor: "origin")
  lab(852, 725, $A$); lab(852, 997, $C$); lab(993, 700, $B$); lab(938, 697, $F_1$)
  lab(1140, 543, $F_2$); lab(985, 530, $F_(2y)$); lab(1135, 753, $F_(2x)$)
  lab(1068, 695, $alpha$); lab(962, 785, $alpha$); lab(1040, 905, $G$)
  lab(1238, 727, $x$); lab(1035, 490, $y$)
})
