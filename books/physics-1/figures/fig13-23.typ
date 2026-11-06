// 图 13·23 速度方向变化的快慢（原书 p.441）
// 示意图，按原图重绘。（a）大小两圆上速度大小相同的匀速圆周运动，大圆走 1/4 周时小圆走半周；
// （b）同一圆上不同时间内转过不同角度的两种情形。坐标是页面显示图（宽 1568）上的像素坐标；位置为目测。
// 原图中 v、R 的下标、撇号较模糊：按 v_1、v_2、R_1、R_2、v_1′、v_2′ 录。
#import "/common/series.typ": *

#let fig-13-23(width: 13.5cm) = px-canvas(660, 670, origin: (565, 1215), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.5)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let ln(a, b, w: 1.2pt) = line(p(..a), p(..b), stroke: w)
  let vec(a, b, w: 1.4pt) = line(p(..a), p(..b), stroke: w, mark: arr)
  let arcv(c, r, a0, a1) = arc(p(c.at(0) + r * calc.cos(a0 * 1deg), c.at(1) - r * calc.sin(a0 * 1deg)),
    start: a0 * 1deg, stop: a1 * 1deg, radius: r * u, stroke: 0.9pt, mark: (end: "stealth", fill: black, scale: 0.4))

  // ---------- （a）左：大圆
  let c1 = (672, 1355)
  circle(p(..c1), radius: 105 * u, stroke: 1.5pt)
  ln(c1, (777, 1355))
  ln(c1, (672, 1250))
  arcv(c1, 32, 0, 90)
  vec((777, 1355), (777, 1295))
  vec((672, 1250), (592, 1250))
  lab(657, 1362, $O$)
  lab(718, 1377, $R_1$)
  lab(796, 1355, $A$)
  lab(676, 1232, $B$)
  lab(797, 1270, $v_1$)
  lab(590, 1228, $v_2$)
  // （a）右：小圆
  let c2 = (990, 1357)
  circle(p(..c2), radius: 67 * u, stroke: 1.5pt)
  ln((923, 1357), (1057, 1357))
  arcv(c2, 30, 0, 180)
  vec((1057, 1357), (1057, 1290))
  vec((923, 1357), (928, 1435))
  lab(967, 1372, $O'$)
  lab(1012, 1372, $R_2$)
  lab(1062, 1352, $A$)
  lab(910, 1352, $B$)
  lab(1062, 1272, $v_1$)
  lab(910, 1438, $v_2$)
  lab(860, 1497, $(a)$)

  // ---------- （b）左：同一圆上转过较小的角
  let c3 = (685, 1733)
  circle(p(..c3), radius: 112 * u, stroke: 1.5pt)
  ln(c3, (797, 1733))
  ln(c3, (723, 1627))
  arcv(c3, 35, 0, 70)
  vec((797, 1733), (806, 1690))
  vec((723, 1627), (645, 1605))
  lab(678, 1748, $O$)
  lab(815, 1733, $A$)
  lab(727, 1605, $B$)
  lab(816, 1660, $v_1$)
  lab(622, 1604, $v_2$)
  // （b）右：转过较大的角
  let c4 = (1050, 1733)
  circle(p(..c4), radius: 112 * u, stroke: 1.5pt)
  line(p(1060, 1733), p(1162, 1733), stroke: (thickness: 0.8pt, dash: "dashed"))
  ln(c4, (953, 1677))
  arcv(c4, 32, 0, 150)
  vec((1162, 1733), (1160, 1600))
  vec((953, 1677), (868, 1815))
  lab(1048, 1748, $O'$)
  lab(1182, 1728, $A'$)
  lab(955, 1648, $B'$)
  lab(1182, 1570, $v_1'$)
  lab(860, 1805, $v_2'$)
  lab(868, 1865, $(b)$)
})
