// 图 9·44（原书 p.284）例 17：放在桌上的刻度尺，（a）挂 250 克，（b）挂 125 克。习题 9·7 第 4 题附图（原书 p.285）。
// CeTZ 重绘（桌子只画示意的几条线），坐标取自页面显示图，原点 (440,1240)。
#import "/common/series.typ": *

#let _arrow(p, a, b, th: 1.5pt) = cetz.draw.line(p(..a), p(..b), stroke: th, mark: (end: "stealth", fill: black, scale: 0.5))
#let _lab(p, x, y, body, size: 9pt) = cetz.draw.content(p(x, y), anchor: "center", text(size: size, body))

#let fig-9-44(width: 11cm) = px-canvas(800, 650, origin: (440, 1240), width: width, (p, u) => {
  import cetz.draw: *
  // （a）
  line(p(462, 1293), p(590, 1293), stroke: 1pt)
  line(p(462, 1333), p(1030, 1333), p(1032, 1348), stroke: 1.4pt)
  line(p(1030, 1293), p(1030, 1348), stroke: 1pt)
  for x in (920, 955, 1000) { line(p(x, 1348), p(x, 1405), stroke: 1pt) }
  rect(p(590, 1278), p(1182, 1306), stroke: 1pt, fill: luma(235))
  _arrow(p, (882, 1300), (880, 1467), th: 2.4pt)
  _arrow(p, (1178, 1300), (1178, 1440), th: 2.4pt)
  _lab(p, 572, 1275, $A$); _lab(p, 880, 1262, $B$); _lab(p, 1035, 1264, $C$); _lab(p, 1180, 1270, $D$)
  _lab(p, 878, 1487, $G$); _lab(p, 1172, 1462, [250 克], size: 8pt); _lab(p, 857, 1535, $(a)$)
  // （b）
  line(p(470, 1620), p(595, 1620), stroke: 1pt)
  line(p(470, 1655), p(962, 1655), stroke: 1.4pt)
  line(p(962, 1615), p(962, 1655), stroke: 1pt)
  for x in (840, 870, 915) { line(p(x, 1665), p(x, 1725), stroke: 1pt) }
  rect(p(595, 1603), p(1182, 1632), stroke: 1pt, fill: luma(235))
  _arrow(p, (885, 1630), (882, 1807), th: 2.4pt)
  _arrow(p, (1178, 1632), (1175, 1772), th: 2.4pt)
  _lab(p, 578, 1597, $A$); _lab(p, 888, 1587, $B$); _lab(p, 965, 1591, $C$); _lab(p, 1178, 1603, $D$)
  _lab(p, 878, 1825, $G$); _lab(p, 1170, 1798, [125 克], size: 8pt); _lab(p, 858, 1860, $(b)$)
})

// 习题 9·7 第 6 题：杆秤。坐标取自页面显示图，原点 (500,720)。
#let fig-ex-9-7-6(width: 8cm) = px-canvas(720, 380, origin: (500, 720), width: width, (p, u) => {
  import cetz.draw: *
  // 秤杆（向右渐细）
  line(p(525, 775), p(1195, 785), p(1195, 795), p(525, 795), close: true, stroke: 1pt, fill: luma(235))
  // 提纽（环）
  circle(p(641, 765), radius: (8 * u, 22 * u), stroke: 1pt)
  // 秤钩
  line(p(555, 795), p(555, 872), stroke: 1pt)
  arc(p(560, 880), start: 90deg, delta: 260deg, radius: 18 * u, stroke: 1.4pt, anchor: "origin")
  // 秤锤
  line(p(612, 795), p(612, 1040), stroke: 1.2pt)
  line(p(604, 1040), p(620, 1040), p(634, 1068), p(588, 1068), close: true, stroke: 1pt, fill: luma(200))
  _lab(p, 545, 805, $A$); _lab(p, 640, 808, $O$); _lab(p, 678, 807, $G$)
})

// 习题 9·7 第 4 题：T 字形
#let fig-ex-9-7-4(width: 4.2cm) = px-canvas(400, 380, origin: (1030, 1490), width: width, (p, u) => {
  import cetz.draw: *
  line(p(1063, 1530), p(1378, 1530), stroke: 2.2pt)
  line(p(1225, 1530), p(1222, 1840), stroke: 2.6pt)
  for q in ((1063, 1530), (1378, 1530), (1222, 1840)) { circle(p(..q), radius: 6 * u, fill: black) }
  _lab(p, 1063, 1512, $A$); _lab(p, 1225, 1512, $D$); _lab(p, 1378, 1512, $B$); _lab(p, 1245, 1840, $C$)
})
