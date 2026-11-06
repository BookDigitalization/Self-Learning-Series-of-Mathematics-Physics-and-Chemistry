// 图 9·10（原书 p.245）例 1 的封闭三角形（左）与平行四边形法（右）。坐标取自页面显示图，原点 (560,90)。
#import "/common/series.typ": *

#let fig-9-10(width: 11cm) = px-canvas(760, 560, origin: (560, 90), width: width, (p, u) => {
  import cetz.draw: *
  let arrow(a, b, th: 1.4pt) = line(p(..a), p(..b), stroke: th, mark: (end: "stealth", fill: black, scale: 0.5))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dash(a, b) = line(p(..a), p(..b), stroke: (thickness: 0.6pt, dash: "dashed"))
  // 左
  arrow((615, 490), (748, 330))
  arrow((748, 330), (620, 238))
  arrow((620, 238), (615, 490))
  dash((748, 330), (832, 222))
  arc(p(765, 308), start: 120deg, stop: 215deg, radius: 22 * u, stroke: 0.6pt, anchor: "origin")
  lab(610, 222, $C$); lab(768, 338, $B$); lab(608, 515, $A$)
  lab(705, 262, $F_2$); lab(712, 418, $F_1$); lab(585, 348, $F_3$); lab(742, 292, $alpha$)
  // 右
  let o = (1143, 360)
  arrow(o, (1262, 190))
  arrow(o, (1030, 272))
  arrow(o, (1143, 610))
  arrow(o, (1147, 100), th: 0.7pt)
  dash((1262, 190), (1147, 100))
  dash((1030, 272), (1147, 100))
  arc(p(..o), start: 55deg, stop: 142deg, radius: 22 * u, stroke: 0.6pt, anchor: "origin")
  lab(1165, 207, $R$); lab(1228, 298, $F_1$); lab(1065, 327, $F_2$); lab(1167, 522, $F_3$)
  lab(1160, 312, $alpha$); lab(1162, 380, $O$)
})
