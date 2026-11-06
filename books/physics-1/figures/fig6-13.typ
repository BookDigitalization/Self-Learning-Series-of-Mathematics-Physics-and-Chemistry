// 图 6·13 求两个共点力的合力（原书 p.178）
// 几何图，按原图用 CeTZ 重绘；坐标取自 200 dpi 页面显示图（宽 1568），内部乘 1.0657 换成真实像素。
#import "/common/series.typ": *

#let fig-6-13(width: 6.6cm) = px-canvas(560, 620, width: width, origin: (860 * 1.0657, 1115 * 1.0657), (p, u) => {
  import cetz.draw: *
  let q(x, y) = p(x * 1.0657, y * 1.0657)
  let arr(a, b, w: 1pt) = line(q(..a), q(..b), stroke: w, mark: (end: "stealth", fill: black, scale: 0.5))
  let dash(a, b) = line(q(..a), q(..b), stroke: (thickness: 0.5pt, dash: "dashed"))
  let lab(x, y, body) = content(q(x, y), anchor: "center", text(size: 8pt, body))
  let A = (1035, 1408)
  let D = (1280, 1408)
  let E = (925, 1210)
  let G = (1160, 1210)
  let C = (878, 1140)
  let H = (932, 1595)
  let B = (1350, 1408)
  line(q(..A), q(..B), stroke: 1pt)
  line(q(..C), q(..A), stroke: 1pt)
  line(q(..A), q(..H), stroke: 1.4pt)
  arr(A, G, w: 1.4pt)
  dash(E, G); dash(G, D)
  lab(1180, 1183, $G$); lab(900, 1208, $E$); lab(870, 1128, $C$)
  lab(1283, 1425, $D$); lab(1353, 1425, $B$); lab(1012, 1425, $A$); lab(915, 1597, $H$)
  lab(1155, 1432, $F_1$); lab(960, 1320, $F_2$); lab(1103, 1265, $R$); lab(1000, 1515, $R'$)
  lab(1045, 1345, text(size: 7pt)[$120°$]); lab(1115, 1381, text(size: 7pt)[$60°$])
  arc(p(1035 * 1.0657 + 36, 1408 * 1.0657), start: 0deg, stop: 120deg, radius: 36, stroke: 0.6pt)
  arc(p(1035 * 1.0657 + 60, 1408 * 1.0657), start: 0deg, stop: 60deg, radius: 60, stroke: 0.6pt)
})
