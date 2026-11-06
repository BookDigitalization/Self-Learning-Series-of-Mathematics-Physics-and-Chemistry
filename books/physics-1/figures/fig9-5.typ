// 图 9·5（原书 p.243）三幅：（a）平行四边形，（b）三角形作 R，（c）封闭三角形。
// 坐标取自页面显示图，原点 (330,90)。
#import "/common/series.typ": *

#let fig-9-5(width: 13cm) = px-canvas(1060, 250, origin: (330, 90), width: width, (p, u) => {
  import cetz.draw: *
  let arrow(a, b, th: 1.2pt) = line(p(..a), p(..b), stroke: th, mark: (end: "stealth", fill: black, scale: 0.5))
  let dash(a, b) = line(p(..a), p(..b), stroke: (thickness: 0.6pt, dash: "dashed"))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  // （a）
  arrow((570, 218), (735, 215))
  arrow((570, 218), (630, 125))
  arrow((570, 218), (348, 308))
  arrow((570, 218), (790, 125), th: 0.7pt)
  dash((630, 125), (790, 125))
  dash((735, 215), (790, 125))
  lab(630, 112, $B$); lab(797, 112, $C$); lab(572, 175, $F_2$); lab(672, 155, $R$)
  lab(440, 243, $F_3$); lab(573, 240, $O$); lab(655, 240, $F_1$); lab(728, 236, $A$)
  lab(665, 278, $(a)$)
  // （b）
  arrow((805, 222), (980, 208))
  arrow((980, 208), (1033, 122))
  arrow((805, 222), (1033, 122))
  lab(915, 152, $R$); lab(905, 235, $F_1$); lab(1022, 183, $F_2$)
  lab(803, 232, $O$); lab(985, 228, $A$); lab(1042, 105, $C$)
  lab(937, 272, $(b)$)
  // （c）
  arrow((1110, 208), (1250, 207))
  arrow((1250, 207), (1340, 120))
  arrow((1340, 120), (1110, 208))
  lab(1195, 233, $F_1$); lab(1310, 182, $F_2$); lab(1218, 133, $F_3$)
  lab(1098, 222, $O$); lab(1268, 227, $A$); lab(1345, 105, $C$)
  lab(1175, 272, $(c)$)
})
