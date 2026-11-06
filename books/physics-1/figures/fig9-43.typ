// 图 9·43（原书 p.283）例 16：两个连接的圆柱体。CeTZ 重绘（圆柱体的点彩阴影从略）。
// 坐标取自页面显示图，原点 (510,1290)。
#import "/common/series.typ": *

#let fig-9-43(width: 11cm) = px-canvas(760, 340, origin: (510, 1290), width: width, (p, u) => {
  import cetz.draw: *
  let arrow(a, b, th: 1.2pt) = line(p(..a), p(..b), stroke: th, mark: (end: "stealth", fill: black, scale: 0.5))
  let lab(x, y, body, size: 9pt) = content(p(x, y), anchor: "center", text(size: size, body))
  let dim(a, b) = line(p(..a), p(..b), stroke: 0.6pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.35))
  // 圆柱体
  rect(p(585, 1418), p(822, 1500), stroke: 1.4pt, fill: luma(215))
  rect(p(822, 1405), p(1222, 1505), stroke: 1.4pt, fill: luma(225), radius: 14 * u)
  // 轴线
  line(p(525, 1450), p(1255, 1450), stroke: (thickness: 0.6pt, dash: "dash-dotted"), mark: (end: "stealth", fill: black, scale: 0.4))
  // 重心与重力
  circle(p(712, 1450), radius: 4 * u, fill: white, stroke: 0.8pt)
  arrow((712, 1450), (712, 1480)); arrow((968, 1450), (968, 1480)); arrow((1020, 1450), (1020, 1480))
  // 尺寸线
  for x in (585, 822, 1220) { line(p(x, 1305), p(x, 1410), stroke: 0.5pt) }
  dim((585, 1358), (822, 1358)); dim((822, 1360), (1220, 1360))
  rect(p(670, 1348), p(740, 1368), stroke: none, fill: white)
  rect(p(975, 1350), p(1060, 1372), stroke: none, fill: white)
  lab(705, 1358, [12 厘米], size: 8pt); lab(1018, 1362, [20 厘米], size: 8pt)
  line(p(585, 1500), p(585, 1610), stroke: 0.5pt); line(p(968, 1500), p(968, 1600), stroke: 0.5pt)
  dim((585, 1558), (968, 1558))
  rect(p(750, 1546), p(790, 1568), stroke: none, fill: white)
  lab(770, 1556, $x$)
  lab(570, 1468, $O$); lab(1238, 1470, $O'$)
  lab(722, 1428, $C_2$, size: 8pt); lab(724, 1487, $G_2$, size: 8pt)
  lab(965, 1432, $C$, size: 8pt); lab(950, 1472, $G$, size: 8pt)
  lab(1035, 1430, $C_1$, size: 8pt); lab(1037, 1472, $G_1$, size: 8pt)
})
