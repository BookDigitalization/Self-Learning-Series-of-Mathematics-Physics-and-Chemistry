// 图 3·45 安培计构造示意图（原书 p.207）
// CeTZ 重绘：线圈 C 与分路 S 并联，总电流 I、通过线圈的 i_C 和通过分路的 i_S。
// 坐标是原页 130 dpi 渲染图的像素坐标，画布原点 (650, 755)。
#import "fig3b-lib.typ": *

#let fig-3-45(width: 5.4cm) = px-canvas(300, 250, origin: (650, 755), width: width, (p, u) => {
  import cetz.draw: *
  circle(p(795, 877), radius: 110, stroke: 1.1pt)
  // 线圈 C
  pl(p, (718, 957), (747, 837))
  zig(p, 747, 832, 837, n: 5, lead: 0.12)
  pl(p, (832, 837), (873, 957))
  lab(p, 795, 852, $C$, size: 9pt)
  // 分路 S
  zig(p, 718, 873, 957, n: 6, lead: 0.15)
  lab(p, 793, 985, $S$, size: 9pt)
  // 引线和结点
  pl(p, (655, 957), (718, 957))
  ar(p, (655, 957), (690, 957))
  pl(p, (873, 957), (935, 957))
  ar(p, (900, 957), (935, 957))
  node(p, 718, 957)
  node(p, 873, 957)
  lab(p, 672, 976, $I$, size: 9pt)
  lab(p, 908, 976, $I$, size: 9pt)
  ar(p, (731, 905), (738, 872), scale: 0.4)
  lab(p, 719, 882, $i_C$, size: 8.5pt)
  ar(p, (733, 946), (762, 946), scale: 0.4)
  lab(p, 737, 934, $i_S$, size: 8.5pt)
})
