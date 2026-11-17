// 图 7·15 未饱和汽的压强和体积图线（原书 p.244）
// CeTZ 重绘，坐标是原页局部放大图（400 dpi 裁剪）的像素坐标，y 向下。
#import "/common/series.typ": *

#let fig-7-15(width: 5.6cm) = px-canvas(800, 700, width: width, (p, u) => {
  import cetz.draw: *
  let lw = 2 * u
  // 坐标轴
  line(p(90, 615), p(90, 62), stroke: 1.6 * u, mark: (end: ">", fill: black, scale: 0.7))
  line(p(90, 615), p(722, 630), stroke: 1.6 * u, mark: (end: ">", fill: black, scale: 0.7))
  // 曲线 A B C D
  line(p(172, 100), p(176, 220), p(182, 340), p(188, 410), p(198, 434), stroke: 6 * u)
  line(p(198, 434), p(405, 440), stroke: 6 * u)
  catmull(p(405, 440), p(450, 485), p(500, 525), p(560, 558), p(620, 580), p(655, 590), stroke: 6 * u, tension: 0.5)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 70 * u, body))
  lab(112, 38, $P$)
  lab(158, 76, $D$)
  lab(212, 410, $C$)
  lab(420, 418, $B$)
  lab(676, 594, $A$)
  lab(62, 618, $O$)
  lab(748, 622, $V$)
})
