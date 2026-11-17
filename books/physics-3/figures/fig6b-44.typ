// 图 6·44 示波器荧光屏；来源 原书 p.343，坐标取自 200 dpi 页面像素（1671×2500）。
#import "/common/series.typ": *
#import "fig6b-parts.typ": *

#let fig-6-44(width: 5.6cm) = px-canvas(510, 530, origin: (940, 790), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, size: 9pt) = content(p(x, y), anchor: "center", text(size: size, body))
  circle(p(1195, 1051), radius: 247, stroke: 2pt)
  // 水平扫描线与两个脉冲
  line(p(993, 1053), p(1018, 1053), stroke: 1.8pt)
  bezier(p(1018, 1053), p(1040, 970), p(1030, 1053), p(1030, 970), stroke: 1.8pt)
  bezier(p(1040, 970), p(1062, 1055), p(1050, 970), p(1052, 1055), stroke: 1.8pt)
  line(p(1062, 1055), p(1273, 1055), stroke: 1.8pt)
  bezier(p(1273, 1055), p(1289, 1027), p(1281, 1055), p(1281, 1027), stroke: 1.8pt)
  bezier(p(1289, 1027), p(1303, 1057), p(1297, 1027), p(1297, 1057), stroke: 1.8pt)
  line(p(1303, 1057), p(1400, 1057), stroke: 1.8pt)
  line(p(1130, 1055), p(1130, 1044), stroke: 1pt); line(p(1255, 1055), p(1255, 1044), stroke: 1pt)
  lab(1071, 968, $P$, size: 10pt); lab(1293, 1000, $P'$, size: 10pt)
  lab(991, 1077, [0]); lab(1130, 1077, [50]); lab(1248, 1077, [100]); lab(1362, 1077, [150]); lab(1403, 1079, $k m$)
})
