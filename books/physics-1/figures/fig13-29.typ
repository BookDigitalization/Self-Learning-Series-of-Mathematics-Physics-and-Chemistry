// 图 13·29 单摆：静止时（左）与摆球通过最低点 C 时（右）（原书 p.449）
// 示意图，按原图重绘。坐标是页面显示图（宽 1568）上的像素坐标；位置为目测。
#import "/common/series.typ": *

#let fig-13-29(width: 11cm) = px-canvas(700, 400, origin: (560, 1440), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.55)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dsh = (thickness: 0.8pt, dash: "dashed")
  // 左
  line(p(722, 1478), p(718, 1755), stroke: 1.2pt)
  catmull(p(572, 1718), p(650, 1750), p(718, 1760), p(790, 1752), p(845, 1735), stroke: 1pt)
  line(p(718, 1758), p(718, 1700), stroke: 1.6pt, mark: arr)
  line(p(718, 1762), p(718, 1832), stroke: 1.6pt, mark: arr)
  circle(p(718, 1760), radius: 7 * u, fill: white)
  lab(735, 1468, $O$)
  lab(697, 1695, $T$)
  lab(690, 1777, $C$)
  lab(733, 1825, $G$)
  // 右
  line(p(1084, 1478), p(1084, 1750), stroke: 1.2pt)
  line(p(1068, 1470), p(1228, 1715), stroke: dsh)
  catmull(p(935, 1710), p(1010, 1745), p(1084, 1757), p(1160, 1748), p(1228, 1715), stroke: 1pt)
  line(p(1084, 1752), p(1084, 1690), stroke: 1.6pt, mark: arr)
  line(p(1084, 1758), p(1084, 1830), stroke: 1.6pt, mark: arr)
  line(p(1084, 1757), p(1000, 1762), stroke: 1.4pt, mark: arr)
  circle(p(1084, 1755), radius: 7 * u, fill: white)
  circle(p(1228, 1715), radius: 7 * u, fill: white)
  lab(1066, 1458, $O$)
  lab(1105, 1633, $T'$)
  lab(1100, 1777, $C$)
  lab(1103, 1825, $G$)
  lab(990, 1765, $v$)
})
