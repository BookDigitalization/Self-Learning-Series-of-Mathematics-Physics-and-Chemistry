// 图 1·26 带电导体接地（原书 p.52）。CeTZ 重绘；坐标取自 200 dpi 页面图（原点 (180,280)）。
#import "fig1b-lib.typ": *

#let fig-1-26(width: 6cm) = px-canvas(600, 330, origin: (180, 280), width: width, (p, u) => {
  import cetz.draw: *
  for (cx, sign, name, gx) in ((258, [$+Q$], [$U_1(+)$], 358), (535, [$-Q$], [$U_2(-)$], 632)) {
    circle(p(cx, 382), radius: 48 * u, stroke: 1pt)
    lab(p, cx, 382, sign, size: 8pt)
    lab(p, cx - 3, 308, name, size: 8pt)
    line(p(cx + 48, 382), p(gx, 382), p(gx, 540), stroke: 1.1pt)
    ground(p, gx, 543, w: 34)
    lab(p, gx + 78, 548, [$U = 0$], size: 8pt)
  }
})
