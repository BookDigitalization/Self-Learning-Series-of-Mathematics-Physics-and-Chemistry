// 图 9·27（原书 p.261）直尺上挂三个砝码。坐标取自页面显示图，原点 (400,570)。
#import "/common/series.typ": *

#let fig-9-27(width: 12cm) = px-canvas(930, 340, origin: (400, 570), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  rect(p(425, 590), p(1305, 607), stroke: 1pt)
  line(p(865, 607), p(852, 632), p(878, 632), close: true, stroke: 1pt, fill: black)
  line(p(468, 607), p(468, 785), stroke: 1pt)
  rect(p(446, 795), p(492, 845), stroke: 1pt, fill: luma(225))
  rect(p(458, 785), p(480, 795), stroke: 1pt)
  line(p(1065, 607), p(1065, 795), stroke: 1pt)
  rect(p(1048, 802), p(1082, 828), stroke: 1pt, fill: luma(225))
  rect(p(1056, 795), p(1074, 802), stroke: 1pt)
  line(p(1260, 607), p(1260, 790), stroke: 1pt)
  rect(p(1242, 798), p(1285, 838), stroke: 1pt, fill: luma(225))
  rect(p(1252, 790), p(1272, 798), stroke: 1pt)
  lab(470, 868, [400 克]); lab(1068, 848, [200 克]); lab(1265, 855, [300 克])
})
