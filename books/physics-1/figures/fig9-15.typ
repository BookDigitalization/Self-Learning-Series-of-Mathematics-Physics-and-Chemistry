// 图 9·15（原书 p.249）例 5：木柱斜靠光滑墙。坐标取自页面显示图，原点 (420,740)。
#import "/common/series.typ": *

#let fig-9-15(width: 12cm) = px-canvas(940, 590, origin: (420, 740), width: width, (p, u) => {
  import cetz.draw: *
  let arrow(a, b, th: 1.4pt) = line(p(..a), p(..b), stroke: th, mark: (end: "stealth", fill: black, scale: 0.5))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dash(a, b) = line(p(..a), p(..b), stroke: (thickness: 0.6pt, dash: "dashed"))
  // （a）墙与地面
  line(p(450, 785), p(450, 1245), stroke: 1pt)
  line(p(440, 1245), p(740, 1243), stroke: 1pt)
  for y in range(800, 1245, step: 28) { line(p(450, y + 10), p(436, y + 22), stroke: 0.6pt) }
  for x in range(450, 740, step: 28) { line(p(x, 1245), p(x - 14, 1262), stroke: 0.6pt) }
  // 木柱 AB
  line(p(452, 890), p(668, 1243), stroke: 1.8pt)
  arrow((452, 890), (527, 890))
  dash((527, 890), (655, 892))
  arrow((563, 892), (563, 1278))
  dash((563, 892), (668, 1243))
  arrow((668, 1243), (612, 1040), th: 1.2pt)
  lab(437, 893, $A$); lab(472, 865, $N$); lab(578, 868, $O$); lab(547, 1085, $C$)
  lab(580, 1185, $G$); lab(658, 1122, $R$); lab(672, 1268, $B$); lab(568, 1315, $(a)$)
  // （b）
  let o = (1085, 1015)
  arrow((950, 1015), (1335, 1017), th: 0.7pt)
  arrow((1085, 1225), (1083, 757), th: 0.7pt)
  arrow(o, (1150, 1016))
  arrow(o, (1025, 803))
  arrow(o, (1085, 1225), th: 2pt)
  dash((1025, 803), (1025, 1015))
  dash((1025, 803), (1085, 803))
  arc(p(..o), start: 100deg, stop: 180deg, radius: 40 * u, stroke: 0.6pt, anchor: "origin")
  lab(1100, 757, $y$); lab(1340, 1017, $x$); lab(1105, 802, $R_y$); lab(1017, 1040, $R_x$)
  lab(1063, 855, $R$); lab(1142, 993, $N$); lab(1048, 986, $alpha$); lab(1067, 1038, $O$)
  lab(1103, 1175, $G$); lab(1088, 1290, $(b)$)
})
