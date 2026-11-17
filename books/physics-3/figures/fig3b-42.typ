// 图 3·42 反向平行电流相斥（原书 p.202）
// CeTZ 重绘：以导线 A 横截面中心为圆心的磁力线圆（虚线，逆时针），B 处的 H（沿切线向下）、磁场力 F（向左）。
// 坐标是原页 130 dpi 渲染图的像素坐标，画布原点 (120, 615)。
#import "fig3b-lib.typ": *

#let fig-3-42(width: 5.3cm) = px-canvas(320, 230, origin: (120, 615), width: width, (p, u) => {
  import cetz.draw: *
  circle(p(313, 742), radius: 106, stroke: (thickness: 0.8pt, dash: "dashed"))
  ar(p, (330, 636), (303, 636), st: 0.9pt, scale: 0.55)
  ar(p, (194, 742), (128, 742))
  lab(p, 135, 728, $F$, size: 8.5pt)
  ar(p, (207, 755), (207, 830))
  lab(p, 222, 824, $H$, size: 8.5pt)
  isym(p, 207, 742, "in", r: 11)
  isym(p, 313, 742, "out", r: 11, filled: true)
  lab(p, 234, 742, $B$, size: 8.5pt)
  lab(p, 344, 737, $A$, size: 8.5pt)
})
