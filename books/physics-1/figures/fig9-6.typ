// 图 9·6（原书 p.243）四个共点力及其封闭四边形。坐标取自页面显示图，原点 (390,1190)。
#import "/common/series.typ": *

#let fig-9-6(width: 11cm) = px-canvas(960, 400, origin: (390, 1190), width: width, (p, u) => {
  import cetz.draw: *
  let arrow(a, b) = line(p(..a), p(..b), stroke: 1.4pt, mark: (end: "stealth", fill: black, scale: 0.5))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  // 左：四个共点力
  let o = (565, 1423)
  arrow(o, (740, 1418))
  arrow(o, (400, 1195))
  arrow(o, (440, 1555))
  arrow(o, (675, 1527))
  lab(672, 1396, $F_1$); lab(522, 1305, $F_2$); lab(478, 1470, $F_3$); lab(662, 1483, $F_4$)
  lab(588, 1412, $O$)
  // 右：封闭四边形
  arrow((1127, 1445), (1315, 1442))
  arrow((1315, 1442), (1145, 1200))
  arrow((1145, 1200), (1022, 1335))
  arrow((1022, 1335), (1127, 1445))
  lab(1205, 1470, $F_1$); lab(1262, 1312, $F_2$); lab(1062, 1245, $F_3$); lab(1050, 1415, $F_4$)
})
