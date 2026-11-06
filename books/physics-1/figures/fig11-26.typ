// 图 11·26 光滑斜面上的物体（原书 p.366）
// 示意图，按原图重绘。坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
// 斜面上两个小物体的位置、重力 mg 与垂直于斜面的小箭头按原图大致重绘。
#import "/common/series.typ": *

#let fig-11-26(width: 8cm) = px-canvas(520, 330, origin: (340, 380), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.4)
  let dash = (paint: black, thickness: 0.7pt, dash: "dashed")
  // 斜面三角形
  line(p(395, 647), p(840, 472), p(840, 650), p(395, 650), close: true, stroke: 1.2pt)
  // 顶部物体（斜线）
  line(p(785, 440), p(830, 428), p(842, 470), p(800, 484), close: true, stroke: 1pt)
  for k in range(1, 6) {
    line(p(785 + k * 8, 438 - k * 2), p(790 + k * 8, 482 - k * 2), stroke: 0.4pt)
  }
  lab(795, 418, $m$)
  // 底部物体
  line(p(383, 600), p(428, 618), p(410, 650), p(380, 640), close: true, stroke: 1pt)
  // 长度 L
  line(p(760, 385), p(358, 550), stroke: 0.8pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.4))
  lab(525, 488, $L$)
  // 斜面上的受力
  line(p(590, 568), p(590, 612), stroke: 1pt, mark: arr)
  lab(626, 607, $m g$)
  line(p(590, 568), p(577, 512), stroke: 1pt, mark: arr)
  lab(598, 490, $N$)
  // 高 h
  line(p(795, 520), p(795, 480), stroke: 0.8pt, mark: arr)
  line(p(795, 600), p(795, 648), stroke: 0.8pt, mark: arr)
  lab(795, 560, $h$)
})
