// 图 1·22、1·23 等电势面（原书 p.46）。CeTZ 重绘；坐标取自 150 dpi 页面图。
#import "fig1b-lib.typ": *

#let fig-1-22(width: 7cm) = px-canvas(430, 260, origin: (125, 225), width: width, (p, u) => {
  import cetz.draw: *
  for y in (267, 302, 337, 372, 407, 442) {
    arr(p, (135, y), (542, y), w: 0.7pt, s: 0.45)
  }
  line(p(248, 260), p(248, 458), stroke: 0.9pt)
  for x in (310, 368, 425) {
    line(p(x, 260), p(x, 458), stroke: 1.6pt)
  }
  lab(p, 248, 240, [$A$])
  lab(p, 308, 240, [$C$])
  lab(p, 248, 473, [$B$])
  lab(p, 308, 473, [$D$])
})

#let fig-1-23(width: 5.5cm) = px-canvas(320, 320, origin: (680, 180), width: width, (p, u) => {
  import cetz.draw: *
  let cx = 835
  let cy = 340
  rays(p, cx, cy, 25, 150)
  for r in (47, 68, 92) {
    circle(p(cx, cy), radius: r * u, stroke: 1.1pt)
  }
  circle(p(cx, cy), radius: 25 * u, stroke: 1.1pt, fill: white)
  lab(p, cx, cy, [$+Q$], size: 8pt)
})
