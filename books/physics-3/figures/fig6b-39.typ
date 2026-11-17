// 图 6·39 P-N 结加反向电压（上）与二极电子管（下）；来源 原书 p.338，坐标取自 200 dpi 页面像素（1671×2500）。
#import "/common/series.typ": *
#import "fig6b-parts.typ": *

#let fig-6-39(width: 7.8cm) = px-canvas(540, 560, origin: (900, 250), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, size: 9pt) = content(p(x, y), anchor: "center", text(size: size, body))
  let ar = (end: "stealth", fill: black, scale: 0.45)
  // P-N 结
  rect(p(1009, 283), p(1325, 425), stroke: 1.8pt)
  vdash(p, 1090, 283, 425); vdash(p, 1245, 283, 425)
  line(p(1167, 283), p(1167, 425), stroke: 1.8pt)
  lab(1089, 267, $I$, size: 9.5pt); lab(1245, 267, $I$, size: 9.5pt)
  for y in (309, 342, 367, 395) {
    for x in (1102, 1124, 1146) { line(p(x - 7, y), p(x + 7, y), stroke: 1pt) }
    for x in (1185, 1207, 1227) {
      line(p(x - 6, y), p(x + 6, y), stroke: 1pt); line(p(x, y - 6), p(x, y + 6), stroke: 1pt)
    }
  }
  hole(p, 1067, 340); line(p(1054, 340), p(1023, 340), stroke: 1pt, mark: ar)
  hole(p, 1267, 340, sign: "-"); line(p(1280, 340), p(1310, 340), stroke: 1pt, mark: ar)
  lab(1055, 382, $P$, size: 10pt); lab(1278, 382, $N$, size: 10pt)
  wire(p, (1009, 355), (934, 355), (934, 482), (1147, 482))
  wire(p, (1325, 353), (1397, 353), (1397, 482), (1178, 482))
  battery(p, 1147, 482, cells: 2, long: 36, short: 20, step: 10.5)
  lab(1126, 466, [#sym.minus]); lab(1204, 463, [+])
  // 二极电子管
  rect(p(1063, 521), p(1265, 651), radius: 62, stroke: 1.8pt)
  line(p(1105, 560), p(1105, 613), stroke: 3pt)
  bezier(p(1241, 560), p(1241, 623), p(1220, 580), p(1220, 605), stroke: 2.8pt)
  wire(p, (1063, 587), (934, 587), (934, 739), (1147, 739))
  wire(p, (1243, 624), (1397, 624), (1397, 739), (1178, 739))
  battery(p, 1147, 739, cells: 2, long: 36, short: 20, step: 10.5)
  lab(1123, 722, [#sym.minus]); lab(1205, 722, [+])
})
