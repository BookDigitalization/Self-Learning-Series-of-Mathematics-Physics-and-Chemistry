// 图 14·1（原书 p.476）开普勒面积定律示意：椭圆轨道，日（太阳）在轨道内，两块斜线面积相等。
// 线条图，按原图重绘。坐标取 200 dpi 页面图的“显示图”像素（宽 1568），不是真实坐标，比例只用于相对位置。
// 原图的斜线阴影用平行于弦的等距线表示；原图中地球的小箭头未画。
#import "/common/series.typ": *

#let fig-14-1(width: 6cm) = px-canvas(390, 270, origin: (290, 230), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 10pt, body))
  circle(p(478, 367), radius: (178, 99), stroke: 1.4pt)
  let sun = (553, 375)
  let D = (385, 282)
  let C = (430, 272)
  let B = (588, 289)
  let A = (640, 326)
  let mix(a, b, t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)
  for (P, Q) in ((D, C), (B, A)) {
    line(p(..sun), p(..P), stroke: 0.9pt)
    line(p(..sun), p(..Q), stroke: 0.9pt)
    line(p(..P), p(..Q), stroke: 0.9pt)
    for k in range(1, 9) {
      let t = k / 9
      line(p(..mix(P, sun, t)), p(..mix(Q, sun, t)), stroke: 0.5pt)
    }
  }
  lab(368, 258, $D$)
  lab(430, 248, $C$)
  lab(601, 271, $B$)
  lab(653, 311, $A$)
  lab(553, 389, [日])
})
