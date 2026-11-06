// 图 13·13 斜抛运动的验证：小球从玻璃管 L 射出，沿 OA′ 匀速运动的位置与抛体位置的差是 ½gt（原书 p.429）
// 示意图，按原图重绘。原图里 A、P 之间和 P、B 之间画的是花括号，这里改为带箭头的尺寸线（含义相同）。
// 坐标是页面显示图（宽 1568）上的像素坐标；位置为目测。
#import "/common/series.typ": *

#let fig-13-13(width: 12cm) = px-canvas(960, 720, origin: (430, 1140), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.5)
  let dim = (start: "stealth", end: "stealth", fill: black, scale: 0.4)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dsh = (thickness: 0.8pt, dash: "dashed")
  // 坐标轴
  line(p(553, 1745), p(553, 1200), stroke: 1.6pt, mark: arr)
  line(p(553, 1745), p(1355, 1745), stroke: 1.6pt, mark: arr)
  lab(566, 1208, $y$)
  lab(1362, 1738, $x$)
  lab(566, 1763, $O$)
  // 玻璃管 L
  line(p(470, 1850), p(547, 1750), stroke: 1.4pt)
  line(p(453, 1838), p(531, 1740), stroke: 1.4pt)
  line(p(547, 1750), p(531, 1740), stroke: 1.4pt)
  lab(472, 1795, $L$)
  // 直线 OA′（匀速运动的位置）
  line(p(553, 1745), p(1135, 1200), stroke: 2pt)
  lab(1180, 1160, $O'$)
  lab(1115, 1178, $A'$)
  circle(p(1130, 1203), radius: 6 * u, fill: black)
  // 抛物线
  catmull(p(553, 1745), p(640, 1678), p(750, 1618), p(850, 1588), p(920, 1583), p(995, 1590), p(1060, 1615), p(1128, 1650), p(1190, 1695), p(1240, 1743),
    tension: 0.5, stroke: 1.4pt)
  line(p(1240, 1743), p(1335, 1743), stroke: 2pt)
  // A、P、B、P′
  circle(p(997, 1325), radius: 6 * u, fill: black)
  circle(p(997, 1590), radius: 5 * u, fill: black)
  circle(p(1128, 1650), radius: 6 * u, stroke: 1.2pt)
  circle(p(553, 1745), radius: 5 * u, fill: black)
  lab(995, 1300, $A$)
  lab(1030, 1580, $P$)
  lab(1008, 1763, $B$)
  lab(1148, 1635, $P'$)
  // 竖直虚线与尺寸线
  line(p(997, 1325), p(997, 1745), stroke: 1.6pt)
  line(p(1130, 1203), p(1130, 1650), stroke: 2pt)
  line(p(1003, 1325), p(1003, 1590), stroke: 0.8pt, mark: dim)
  line(p(1003, 1595), p(1003, 1745), stroke: 0.8pt, mark: dim)
  lab(1052, 1475, $display(1 / 2) g t$)
  lab(1038, 1678, $y$)
  lab(970, 1585, text(size: 8pt, [1]))
  lab(1020, 1618, text(size: 8pt, [2]))
  // v0 sinθ·t 的水平虚线与竖直分量
  line(p(553, 1322), p(997, 1322), stroke: (thickness: 1.4pt, dash: "dashed"))
  lab(487, 1315, $v_0 sin theta dot t$)
  line(p(800, 1505), p(800, 1590), stroke: dsh)
  line(p(855, 1465), p(855, 1580), stroke: dsh)
  lab(920, 1553, $v_0 sin theta dot t$)
  lab(762, 1527, $v_0 t$)
  lab(640, 1607, $v_0$)
  lab(622, 1715, $theta$)
  // 水平分量
  line(p(553, 1745), p(553, 1835), stroke: dsh)
  line(p(1000, 1745), p(1000, 1835), stroke: dsh)
  line(p(553, 1797), p(1000, 1797), stroke: 0.8pt, mark: dim)
  lab(800, 1782, $v_0 cos theta dot t$)
})
