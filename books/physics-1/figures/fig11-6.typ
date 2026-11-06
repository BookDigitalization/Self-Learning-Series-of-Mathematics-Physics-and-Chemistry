// 图 11·6 起重机吊起重物加速上升（原书 p.334）
// 示意图，按原图重绘。坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
#import "/common/series.typ": *

#let fig-11-6(width: 7.4cm) = px-canvas(560, 370, origin: (290, 240), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 10pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.45)
  // 车身
  rect(p(298, 458), p(360, 505), stroke: 1.2pt)
  rect(p(360, 423), p(440, 500), stroke: 1.2pt)
  circle(p(372, 515), radius: 10 * u, stroke: 1pt)
  circle(p(422, 515), radius: 10 * u, stroke: 1pt)
  // 吊臂（双线）与滑轮
  line(p(362, 428), p(712, 253), stroke: 1pt)
  line(p(440, 462), p(728, 272), stroke: 1pt)
  line(p(375, 445), p(715, 262), stroke: 0.6pt)
  circle(p(722, 262), radius: 10 * u, stroke: 1pt)
  // 钢绳、重物
  line(p(731, 272), p(738, 472), stroke: 1.6pt)
  rect(p(712, 472), p(765, 528), stroke: 1.2pt)
  line(p(738, 528), p(738, 592), stroke: 1.6pt)
  line(p(738, 560), p(738, 592), stroke: 1pt, mark: arr)
  line(p(733, 345), p(733, 378), stroke: 1pt, mark: arr)
  lab(758, 372, $F$)
  lab(762, 576, $G$)
  // 加速度
  line(p(797, 495), p(797, 400), stroke: 1pt, mark: arr)
  lab(818, 452, $a$)
})
