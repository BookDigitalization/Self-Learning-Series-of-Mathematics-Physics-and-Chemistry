// 图 5·12 自由落体运动（时间间隔 1/30 秒）（原书 p.145）
// 频闪照相示意图，按原图重绘：左侧是刻度尺，中间虚线上是小球在各个时刻的位置，位置对应的距离为 0、1、4、9、16。
// 坐标取自裁剪图（原页显示图 (960,690) 起，×2.1314）的像素坐标，画布 938×1472。
#import "/common/series.typ": *

#let fig-5-12(width: 4.6cm) = px-canvas(938, 1472, width: width, (p, u) => {
  import cetz.draw: *
  let kai(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.kai, size: 7pt, body))
  let (y0, uy) = (75, 67)
  let py(d) = y0 + d * uy
  // 刻度尺
  line(p(283, y0), p(283, py(20)), stroke: 0.9pt)
  line(p(300, y0), p(300, py(20)), stroke: 0.9pt)
  line(p(283, y0), p(300, y0), stroke: 0.9pt)
  line(p(283, py(20)), p(300, py(20)), stroke: 0.9pt)
  for d in range(0, 21) {
    let len = if calc.rem(d, 5) == 0 { 68 } else { 35 }
    line(p(283 - len, py(d)), p(283, py(d)), stroke: 0.7pt)
  }
  for d in (0, 5, 10, 15, 20) { content(p(190, py(d)), anchor: "center", text(size: 7pt, str(d))) }
  kai(70, 80, [距离])
  kai(718, 80, [位置])
  // 竖线
  line(p(367, y0), p(367, py(20)), stroke: 0.9pt)
  line(p(650, y0 + 10), p(650, py(20)), stroke: 1.2pt)
  line(p(482, y0), p(482, py(20)), stroke: (thickness: 1.2pt, dash: "dashed"))
  // 小球及对应的水平虚线
  for d in (0, 1, 4, 9, 16) {
    line(p(283, py(d)), p(450, py(d)), stroke: (thickness: 0.6pt, dash: "dashed"))
    circle(p(480, py(d)), radius: 27, stroke: 1pt, fill: white)
    circle(p(480, py(d)), radius: 2, stroke: none, fill: black)
  }
  // 运动方向短箭头
  line(p(567, 545), p(567, 825), stroke: 1.2pt, mark: (end: "stealth", fill: black, scale: 0.5))
})
