// 习题 1·7(1) 第 6、7 题附图：正、负点电荷的电场（原书 p.44）。CeTZ 重绘；坐标取自 150 dpi 页面图。
#import "fig1b-lib.typ": *

#let pair(p, u, cx, cy, sign, inward) = {
  import cetz.draw: *
  rays(p, cx, cy, 24, 150, inward: inward)
  circle(p(cx, cy), radius: 24 * u, stroke: 1pt, fill: white)
  lab(p, cx, cy, [#sign], size: 8pt)
  let ax = cx + 64
  let bx = cx + 96
  circle(p(ax, cy), radius: 3.5 * u, stroke: 0.7pt, fill: white)
  circle(p(bx, cy), radius: 3.5 * u, stroke: 0.7pt, fill: white)
  lab(p, ax + 2, cy + 18, [$A$], size: 8pt)
  lab(p, bx + 2, cy + 18, [$B$], size: 8pt)
}

#let fig-ex-1-7-6(width: 5.6cm) = px-canvas(320, 320, origin: (240, 188), width: width, (p, u) => {
  pair(p, u, 397, 348, [$+Q$], false)
})

#let fig-ex-1-7-7(width: 5.6cm) = px-canvas(320, 320, origin: (685, 188), width: width, (p, u) => {
  pair(p, u, 845, 348, [$-Q$], true)
})
