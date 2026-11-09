// 图 8·3：直角三角形，直角边 9 与 x，斜边 √(81+x²)。原书 p.352（像素坐标取自 200 dpi 网格图）。
#import "/common/series.typ": *

#let fig8-3(width: 4.6cm) = px-canvas(260, 310, origin: (140, 225), width: width, (p, u) => {
  import cetz.draw: *
  line(p(152, 508), p(365, 508), p(365, 235), close: true, stroke: 1.1pt)
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 9pt, body))
  t(205, 372, $sqrt(81 + x^2)$)
  t(378, 378, $x$)
  t(270, 524, $9$)
})