// 图 4·2 质点的运动轨迹（原书 p.87）
// 线条图 CeTZ 重绘；坐标取自 200 dpi 页面图的显示坐标（画布约 770×310，原点 (500,1140)）。
#import "/common/series.typ": *

#let fig-4-2(width: 11cm) = px-canvas(770, 360, origin: (500, 1140), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  let dot(x, y) = circle(p(x, y), radius: 3.5 * u, stroke: 0.6pt, fill: white)
  // 直线轨迹
  line(p(521, 1480), p(741, 1147), stroke: 0.9pt)
  for (x, y) in ((548, 1440), (576, 1398), (642, 1297), (694, 1214)) { dot(x, y) }
  lab(574, 1450, $A_1$)
  lab(600, 1407, $A_2$)
  lab(666, 1304, $A_3$)
  lab(716, 1222, $A_4$)
  // 曲线轨迹
  line(p(793, 1297), p(849, 1278), p(900, 1262), p(950, 1255), p(990, 1259), stroke: 0.9pt)
  bezier(p(990, 1259), p(1027, 1350), p(1003, 1270), p(1000, 1340), stroke: 0.9pt)
  bezier(p(1027, 1350), p(1207, 1214), p(1100, 1370), p(1150, 1275), stroke: 0.9pt)
  line(p(1207, 1214), p(1246, 1169), stroke: 0.9pt)
  for (x, y) in ((849, 1278), (990, 1259), (1027, 1350), (1207, 1214)) { dot(x, y) }
  lab(856, 1302, $A_1$)
  lab(994, 1231, $A_2$)
  lab(1032, 1373, $A_3$)
  lab(1220, 1236, $A_4$)
})
