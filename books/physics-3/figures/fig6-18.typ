// 图 6·18 二极电子管的单向导电性（原书 p.322）。CeTZ 重绘，坐标为 150 dpi 页面像素坐标。
#import "/common/series.typ": *
#import "fig6-parts.typ": *

#let fig-6-18(width: 8.8cm) = px-canvas(520, 720, origin: (555, 850), width: width, (p, u) => {
  import cetz.draw: *
  // 电子管：ox、oy 为泡壳中心
  let tube(ox, oy, sign) = {
    circle(p(ox, oy), radius: (58, 62), stroke: 1.2pt)
    line(p(ox - 18, oy - 38), p(ox + 18, oy - 38), stroke: 2.4pt)
    bezier(p(ox - 22, oy + 45), p(ox + 22, oy + 45), p(ox - 12, oy + 34), p(ox + 12, oy + 34), stroke: 2.4pt)
    for dx in (-30, 0, 28) {
      circle(p(ox + dx, oy + 8), radius: 8, stroke: 0.7pt, fill: white)
      line(p(ox + dx - 4, oy + 8), p(ox + dx + 4, oy + 8), stroke: 0.7pt)
    }
    txt(p, ox - 18, oy - 66, text(weight: "bold")[#sign], size: 10pt)
    txt(p, ox + 10, oy - 66, text(weight: "bold")[#sign], size: 10pt)
    // 灯丝电池 甲电
    wire(p, (ox - 28, oy + 45), (ox - 28, oy + 133), (ox - 14, oy + 133))
    wire(p, (ox + 27, oy + 45), (ox + 27, oy + 133), (ox + 14, oy + 133))
    line(p(ox - 14, oy + 125), p(ox - 14, oy + 141), stroke: 1.2pt)
    line(p(ox - 6, oy + 121), p(ox - 6, oy + 145), stroke: 2.2pt)
    line(p(ox + 2, oy + 125), p(ox + 2, oy + 141), stroke: 1.2pt)
    line(p(ox + 10, oy + 121), p(ox + 10, oy + 145), stroke: 2.2pt)
    txt(p, ox - 28, oy + 150, [−], size: 9pt); txt(p, ox + 27, oy + 150, [+], size: 9pt)
  }
  // (a)
  tube(625, 985, [+])
  wire(p, (625, 947), (625, 905), (725, 905))
  res-h(p, 758, 905, w: 66, h: 20)
  txt(p, 758, 880, $R$)
  wire(p, (791, 905), (863, 905))
  gmeter(p, 880, 905, r: 18)
  wire(p, (898, 905), (985, 905), (985, 960))
  battery(p, 985, 975, n: 4, d: 11, long: 30, short: 16)
  wire(p, (985, 1008), (985, 1118), (640, 1118), (640, 1130))
  txt(p, 884, 862, $G$)
  txt(p, 996, 962, [+], size: 9pt); txt(p, 997, 1047, [−], size: 9pt)
  txt(p, 1025, 1002, [乙电], size: 9pt)
  arrow(p, (770, 928), (735, 928))
  txt(p, 759, 945, $I$, size: 9pt)
  line(p(708, 978), p(920, 978), p(920, 1078), p(708, 1078), close: true, stroke: (thickness: 0.6pt, dash: "dashed"))
  txt(p, 815, 1003, [电子流方向], size: 9pt)
  arrow(p, (750, 980), (860, 980))
  arrow(p, (900, 1078), (780, 1078))
  txt(p, 797, 1165, [($a$)])
  // (b)
  let oy = 385
  tube(625, 985 + oy, [−])
  wire(p, (625, 947 + oy), (625, 895 + oy), (715, 895 + oy))
  res-h(p, 750, 895 + oy, w: 66, h: 20)
  txt(p, 750, 870 + oy, $R$)
  wire(p, (783, 895 + oy), (871, 895 + oy))
  gmeter(p, 892, 895 + oy, r: 18, needle: false)
  line(p(892, 905 + oy), p(892, 884 + oy), stroke: sw, mark: (end: ">", fill: black, scale: 0.5))
  wire(p, (910, 895 + oy), (985, 895 + oy), (985, 950 + oy))
  battery(p, 985, 967 + oy, n: 4, d: 11, long: 30, short: 16, first-long: false)
  wire(p, (985, 1000 + oy), (985, 1118 + oy), (640, 1118 + oy), (640, 1130 + oy))
  txt(p, 893, 855 + oy, $G$)
  txt(p, 890, 942 + oy, [无电流], size: 9pt)
  txt(p, 998, 960 + oy, [−], size: 9pt); txt(p, 998, 1045 + oy, [+], size: 9pt)
  txt(p, 1028, 998 + oy, [乙电], size: 9pt)
  txt(p, 806, 1163 + oy, [($b$)])
})
