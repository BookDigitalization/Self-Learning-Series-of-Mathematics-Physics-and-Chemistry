// 图 13·3 曲线运动的速度方向（原书 p.418）
// 示意图，按原图重绘：曲线 O–A″–A′–A–N，弦 OA、OA′、OA″，切线 MO，速度矢量 v、v_A、v_A′。
// 坐标是页面显示图（宽 1568）上的像素坐标；位置为目测。
#import "/common/series.typ": *

#let fig-13-3(width: 5.6cm) = px-canvas(430, 470, origin: (340, 1330), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.55)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let O = (430, 1742)
  let A = (737, 1440)
  let A1 = (690, 1580)
  let A2 = (600, 1690)
  // 曲线
  line(p(..O), p(520, 1722), p(..A2), p(..A1), p(715, 1510), p(..A), p(739, 1400), p(739, 1352),
    stroke: 1.5pt, mark: (end: "stealth", fill: black, scale: 0.5))
  // 弦
  line(p(..O), p(..A), stroke: 1.5pt)
  line(p(..O), p(..A1), stroke: 1.5pt)
  line(p(..O), p(..A2), stroke: 1.5pt)
  // 切线 MO 与速度 v
  line(p(357, 1743), p(430, 1743), stroke: 1.5pt)
  line(p(430, 1743), p(612, 1733), stroke: 1.5pt, mark: arr)
  // 弦上的速度矢量
  line(p(488, 1673), p(535, 1627), stroke: 2.2pt, mark: arr)
  line(p(530, 1695), p(582, 1664), stroke: 2.2pt, mark: arr)
  line(p(500, 1720), p(580, 1692), stroke: 2.2pt, mark: arr)
  for pt in (A, A1, A2) { circle(p(..pt), radius: 2.5 * u, fill: black, stroke: none) }
  lab(430, 1765, $O$)
  lab(358, 1730, $M$)
  lab(752, 1352, $N$)
  lab(753, 1438, $A$)
  lab(703, 1572, $A'$)
  lab(618, 1685, $A''$)
  lab(508, 1612, $v_A$)
  lab(592, 1607, $v_(A')$)
  lab(618, 1727, $v$)
})
