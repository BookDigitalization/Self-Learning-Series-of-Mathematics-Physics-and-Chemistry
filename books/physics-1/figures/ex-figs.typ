// 习题 1·5 第 6 题附图（单摆，原书 p.17）、复习题一 第 5 题附图（p.18）、第 7 题附图（p.18）
// 单摆、切去阴影部分的薄板用 CeTZ 重绘；第 7 题的铅笔与尺子是写实插画，沿用原扫描裁剪（rev1-7.png，已涂去数字）。
// 坐标是原页显示图（render-pages.py --dpi 200，宽 1568）上的像素坐标。
#import "/common/series.typ": *

// 单摆：悬点在上，三个位置的摆线（左、中为虚线，右为实线）
#let fig-ex-1-5-6(width: 3.4cm) = px-canvas(220, 400, origin: (1150, 765), width: width, (p, u) => {
  import cetz.draw: *
  let (px, py) = (1252, 800)
  line(p(1215, 790), p(1288, 790), stroke: 1.6pt)
  for k in range(0, 7) {
    line(p(1218 + k * 11, 790), p(1212 + k * 11, 777), stroke: 0.6pt)
  }
  line(p(px, py), p(1168, 1133), stroke: (thickness: 1pt, dash: "dashed"))
  line(p(px, py), p(1252, 1143), stroke: (thickness: 1pt, dash: "dashed"))
  line(p(px, py), p(1337, 1135), stroke: 1.8pt)
  circle(p(1168, 1140), radius: 7 * u, fill: white, stroke: 1pt)
  circle(p(1252, 1151), radius: 7 * u, fill: white, stroke: 1pt)
  circle(p(1337, 1142), radius: 7 * u, fill: white, stroke: 1pt)
})

// 复习题一 第 5 题：长 1 米、宽 50 厘米的薄板，从宽边中点处切去阴影部分
#let fig-rev-1-5(width: 6.4cm) = px-canvas(560, 340, origin: (320, 1550), width: width, (p, u) => {
  import cetz.draw: *
  let (x0, x1, yt, yb) = (328, 797, 1558, 1853)
  let ym = 1695
  rect(p(x0, yt), p(x1, yb), stroke: 1.8pt)
  // 阴影：左下角到右边中点、再回到右下角的三角形，用斜线表示
  line(p(333, yb), p(x1, ym), p(x1, yb), close: true, stroke: 1.2pt)
  // 斜线从底边向右上方（斜率 2），止于斜边或右边：t = k(xs-333)/(2-k)，k 是斜边斜率
  let k = (yb - ym) / (x1 - 333)
  for i in range(1, 28) {
    let xs = 333 + i * 17
    if xs < x1 {
      let xe = calc.min(xs + k * (xs - 333) / (2 - k), x1)
      line(p(xs, yb), p(xe, yb - 2 * (xe - xs)), stroke: 0.6pt)
    }
  }
  content(p(822, 1722), anchor: "center", std.rotate(-90deg, text(font: fonts.hei, size: 8pt, weight: "medium", [50 厘米])))
  content(p(575, 1873), anchor: "center", text(font: fonts.hei, size: 8pt, weight: "medium", [1 米]))
})

// 复习题一 第 7 题：铅笔挨着直尺，铅笔尖处是一个 10 格的“游标”
#let fig-rev-1-7(width: 6.8cm) = px-canvas(1067, 566, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("rev1-7.png", width: 1067 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9.5pt, body))
  lab(646, 90, [0])
  lab(801, 90, [5])
  lab(985, 85, [10])
  lab(283, 430, [9])
  lab(714, 437, [10])
})
