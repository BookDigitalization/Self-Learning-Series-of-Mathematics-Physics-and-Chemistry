// 习题 13·7 第 4 题附图（原书 p.462）：圆锥形的壁（高速旋转的杂技表演壁），半径 R，倾斜度 α，虚线为转轴。
// 线条图，按原图重绘；坐标是页面显示图（宽 1568）上的像素坐标，位置为目测。
#import "/common/series.typ": *

#let fig-ex-13-7-4(width: 8cm) = px-canvas(560, 400, origin: (850, 450), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (start: "stealth", end: "stealth", fill: black, scale: 0.4)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  // 上沿椭圆、下沿椭圆
  circle(p(1108, 543), radius: (247 * u, 38 * u), stroke: 1.4pt)
  circle(p(1105, 678), radius: (110 * u, 27 * u), stroke: 1.2pt)
  // 壁
  line(p(866, 555), p(1000, 690), stroke: 1.4pt)
  line(p(1350, 555), p(1213, 690), stroke: 1.4pt)
  // 转轴
  line(p(1105, 455), p(1105, 775), stroke: (thickness: 0.8pt, dash: "dash-dotted"))
  // R
  line(p(940, 615), p(1105, 615), stroke: 0.8pt, mark: arr)
  lab(1045, 603, $R$)
  lab(980, 640, $alpha$)
  line(p(995, 655), p(995, 690), stroke: 0.7pt)
})
