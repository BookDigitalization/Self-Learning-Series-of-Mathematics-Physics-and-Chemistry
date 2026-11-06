// 图 13·19 匀速圆周运动的线速度沿切线方向（原书 p.438）
// 示意图，按原图重绘：圆周上各点的速度沿切线方向（上、右、下、左四点，及一点标 v）。
// 坐标是页面显示图（宽 1568）上的像素坐标；位置为目测。
#import "/common/series.typ": *

#let fig-13-19(width: 5.8cm) = px-canvas(360, 320, origin: (350, 550), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.55)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  circle(p(503, 700), radius: 135 * u, stroke: 1.4pt)
  circle(p(503, 700), radius: 2.5 * u, fill: black, stroke: none)
  line(p(368, 565), p(637, 565), stroke: 1.8pt, mark: arr)
  line(p(637, 700), p(637, 850), stroke: 1.8pt, mark: arr)
  line(p(637, 838), p(370, 838), stroke: 1.8pt, mark: arr)
  line(p(368, 835), p(368, 567), stroke: 1.8pt, mark: arr)
  line(p(618, 622), p(690, 735), stroke: 1.8pt, mark: arr)
  lab(692, 688, $v$)
})
