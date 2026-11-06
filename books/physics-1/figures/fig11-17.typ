// 图 11·17 把物体匀速拉到高 h 处（原书 p.352）、图 11·18 零势能位置的选择（原书 p.353）
// 示意图，按原图重绘。坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
// 图 11·18 中 h₁ 线左侧原图有一小段粗竖线（疑为污点），未画。
#import "/common/series.typ": *

#let fig-11-17(width: 3.6cm) = px-canvas(190, 480, origin: (322, 205), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let arr = (end: "stealth", fill: black, scale: 0.4)
  let dash = (paint: black, thickness: 0.8pt, dash: "dashed")
  rect(p(332, 222), p(415, 300), stroke: dash)
  rect(p(332, 578), p(415, 660), stroke: 1.1pt)
  lab(373, 619, $m$)
  line(p(373, 578), p(373, 505), stroke: 1pt, mark: arr)
  lab(394, 518, $F$)
  line(p(415, 303), p(470, 303), stroke: 0.7pt)
  line(p(415, 660), p(470, 660), stroke: 0.7pt)
  line(p(455, 440), p(455, 303), stroke: 0.8pt, mark: (end: "stealth", fill: black, scale: 0.4))
  line(p(455, 520), p(455, 660), stroke: 0.8pt, mark: (end: "stealth", fill: black, scale: 0.4))
  lab(457, 480, $h$)
})

#let fig-11-18(width: 6.2cm) = px-canvas(360, 460, origin: (400, 165), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dash = (paint: black, thickness: 0.8pt, dash: "dashed")
  let st = (end: "stealth", fill: black, scale: 0.4)
  let sts = (start: "stealth", fill: black, scale: 0.4)
  // 物体（斜线）
  let (x0, y0, x1, y1) = (503, 175, 582, 245)
  let h = y1 - y0
  let t = -h
  while t < x1 - x0 {
    let s0 = calc.max(0, -t / h)
    let s1 = calc.min(1, (x1 - x0 - t) / h)
    if s1 > s0 {
      line(p(x0 + t + s0 * h, y1 - s0 * h), p(x0 + t + s1 * h, y1 - s1 * h), stroke: 0.4pt)
    }
    t += 12
  }
  rect(p(x0, y0), p(x1, y1), stroke: 1.1pt)
  // 虚线 M'N'、MN
  line(p(425, 245), p(700, 245), stroke: dash)
  line(p(425, 465), p(735, 465), stroke: dash)
  lab(425, 265, $M'$)
  lab(710, 247, $N'$)
  lab(418, 488, $M$)
  lab(727, 463, $N$)
  // 地面
  line(p(410, 553), p(740, 553), stroke: 1pt)
  for k in range(0, 28) {
    let x = 415 + k * 12
    line(p(x + 9, 553), p(x, 565), stroke: 0.5pt)
  }
  // h₁、h₂、h
  line(p(612, 360), p(612, 245), stroke: 0.8pt, mark: st)
  line(p(612, 380), p(612, 465), stroke: 0.8pt, mark: sts)
  lab(607, 369, $h_1$)
  line(p(612, 500), p(612, 465), stroke: 0.8pt, mark: st)
  line(p(612, 520), p(612, 553), stroke: 0.8pt, mark: sts)
  lab(612, 510, $h_2$)
  line(p(672, 380), p(672, 245), stroke: 0.8pt, mark: st)
  line(p(672, 405), p(672, 553), stroke: 0.8pt, mark: sts)
  lab(671, 392, $h$)
})
