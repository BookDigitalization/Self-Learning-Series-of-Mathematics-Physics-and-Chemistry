// 图 1·5 尺放斜了（原书 p.4）
// 线条图，按原图描绘。坐标是 build/ref 里同区域裁剪图（400 dpi）的像素坐标。
#import "/common/series.typ": *

#let fig-1-5(width: 8cm) = px-canvas(1110, 598, width: width, (p, u) => {
  import cetz.draw: *
  let w = 1.3pt

  // 木块上半部（尺的后面）
  line(p(165, 245), p(165, 135), p(830, 152), p(828, 322), stroke: w)
  line(p(165, 135), p(300, 22), p(940, 45), p(830, 152), stroke: w)
  line(p(940, 45), p(935, 335), stroke: w)
  // 木块下半部（尺的下面）
  line(p(160, 440), p(155, 572), p(822, 592), p(820, 495), stroke: w)
  line(p(822, 592), p(865, 525), stroke: w)

  // 斜放的尺：左端、上缘、右端（断口）、下缘
  line(p(45, 230), p(1085, 360), p(1075, 432), p(1050, 470), p(1062, 540), p(30, 410), p(25, 405), p(45, 230),
    stroke: 1.6pt)
  line(p(1062, 540), p(1052, 520), stroke: w)
  // 刻度：沿上缘每毫米一条，厘米处加长；0 刻度在 x = 77，1 厘米 ≈ 166.6 像素
  let top(x) = 230 + (x - 45) * 0.125
  for k in range(0, 60) {
    let x = 77 + 16.66 * k
    let len = if calc.rem(k, 10) == 0 { 38 } else if calc.rem(k, 5) == 0 { 30 } else { 21 }
    line(p(x, top(x)), p(x - 4, top(x) + len), stroke: 0.5pt)
  }
  for (x, n) in ((92, 0), (258, 1), (420, 2), (585, 3), (752, 4), (925, 5)) {
    content(p(x, top(x) + 98), anchor: "center", text(size: 9pt, weight: "bold", str(n)))
  }
})
