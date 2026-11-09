// 图 9·1 直角三角形（斜边 25，直角边 x、y）。原书 p.365，坐标取自 200 dpi 页面像素。
#import "/common/series.typ": *

#let fig-9-1(width: 4.2cm) = px-canvas(270, 340, origin: (630, 625), width: width, (p, u) => {
  import cetz.draw: *
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 9pt, body))
  line(p(852, 640), p(852, 918), p(645, 914), close: true, stroke: 0.7pt)
  t(724, 779, $25$)
  t(870, 785, $x$)
  t(754, 936, $y$)
})
