// 图 6·1 振荡电路（原书 p.305）。CeTZ 重绘，坐标为 150 dpi 页面像素坐标。
#import "/common/series.typ": *
#import "fig6-parts.typ": *

#let fig-6-1(width: 7cm) = px-canvas(445, 300, origin: (655, 185), width: width, (p, u) => {
  import cetz.draw: *
  // 线圈 L
  wire(p, (686, 228), (686, 272))
  coil(p, 686, 272, 402, n: 5, w: 16, side: -1)
  wire(p, (686, 402), (686, 475))
  txt(p, 712, 348, $L$)
  // 转换开关 K：打在位置 2
  wire(p, (686, 228), (815, 228))
  wire(p, (855, 288), (818, 228))
  circle(p(893, 230), radius: 3.5, stroke: sw, fill: white)
  circle(p(817, 228), radius: 3, stroke: sw, fill: white)
  node(p, 855, 288, r: 2.5)
  txt(p, 822, 204, [2], size: 9pt); txt(p, 895, 206, [1], size: 9pt)
  txt(p, 880, 297, $K$)
  // 电容器 C
  wire(p, (855, 288), (855, 365))
  cap(p, 855, 370, len: 28, gap: 10)
  wire(p, (855, 375), (855, 475))
  txt(p, 888, 372, $C$)
  // 电池 B
  wire(p, (896, 230), (1020, 230), (1020, 300))
  battery(p, 1020, 303, n: 4, d: 12, long: 34, short: 20)
  wire(p, (1020, 339), (1020, 475))
  txt(p, 1048, 345, $B$)
  // 底线
  wire(p, (686, 475), (1020, 475))
  node(p, 855, 475)
})
