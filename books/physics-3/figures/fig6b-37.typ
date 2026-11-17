// 图 6·37 P-N 结（阻挡层）；来源 原书 p.337，坐标取自 200 dpi 页面像素（1671×2500）。
#import "/common/series.typ": *
#import "fig6b-parts.typ": *

#let fig-6-37(width: 7.2cm) = px-canvas(660, 260, origin: (760, 1015), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, size: 9pt) = content(p(x, y), anchor: "center", box(text(size: size, body)))
  rect(p(829, 1053), p(1337, 1200), stroke: 1.8pt)
  vdash(p, 1000, 1053, 1200); vdash(p, 1165, 1053, 1200)
  line(p(1083, 1053), p(1083, 1200), stroke: 1.8pt)
  wire(p, (763, 1130), (829, 1130)); wire(p, (1337, 1121), (1391, 1121))
  lab(998, 1028, $I$, size: 9.5pt); lab(1165, 1028, $I$, size: 9.5pt)
  for y in (1082, 1111, 1139, 1166) {
    for x in (1022, 1056) { line(p(x - 8, y), p(x + 8, y), stroke: 1.1pt) }
    for x in (1112, 1146) {
      line(p(x - 8, y), p(x + 8, y), stroke: 1.1pt); line(p(x, y - 8), p(x, y + 8), stroke: 1.1pt)
    }
  }
  lab(910, 1123, $P$, size: 10pt); lab(1266, 1118, $N$, size: 10pt)
  lab(1010, 1242, [#sym.minus 负离子], size: 9pt)
  lab(1183, 1240, [#sym.plus 正离子], size: 9pt)
})
