// 图 6·18 支架的受力（原书 p.183）
// 线条图，按原图用 CeTZ 重绘；坐标取自 200 dpi 页面显示图（宽 1568），内部乘 1.0657 换成真实像素。
#import "/common/series.typ": *

#let fig-6-18(width: 7.6cm) = px-canvas(535, 480, width: width, origin: (885 * 1.0657, 1390 * 1.0657), (p, u) => {
  import cetz.draw: *
  let q(x, y) = p(x * 1.0657, y * 1.0657)
  let arr(a, b, w: 0.9pt) = line(q(..a), q(..b), stroke: w, mark: (end: "stealth", fill: black, scale: 0.5))
  let dash(a, b) = line(q(..a), q(..b), stroke: (thickness: 0.6pt, dash: "dashed"))
  let lab(x, y, body) = content(q(x, y), anchor: "center", text(size: 8pt, body))
  let B = (1178, 1438)
  let C = (918, 1830)
  let E = (1178, 1690)
  let F = (1011, 1690)
  let D = (1345, 1438)
  // 墙
  rect(q(893, 1832), q(922, 1435), stroke: 0.9pt)
  for y in range(0, 20) { line(q(893, 1445 + y * 20), q(922, 1435 + y * 20), stroke: 0.5pt) }
  // 横梁 A B 与斜撑 B C
  rect(q(922, 1442), q(1178, 1428), stroke: 0.8pt, fill: luma(235))
  line(q(1172, 1442), q(922, 1830), stroke: 1.4pt)
  line(q(1186, 1442), q(930, 1832), stroke: 1.4pt)
  // 受力
  arr(B, E, w: 1.2pt); arr(B, F); arr(B, D)
  dash(F, E); dash(D, E)
  line(q(922, 1456), q(938, 1456), q(938, 1442), stroke: 0.5pt)
  line(q(1162, 1442), q(1162, 1428), q(1178, 1428), stroke: 0.5pt)
  lab(905, 1405, $A$); lab(1182, 1412, $B$); lab(925, 1845, $C$)
  lab(1275, 1415, $G_1$); lab(1357, 1440, $D$); lab(1045, 1555, $G_2$); lab(1160, 1580, $G$)
  lab(1020, 1683, $F$); lab(1175, 1710, $E$)
})
