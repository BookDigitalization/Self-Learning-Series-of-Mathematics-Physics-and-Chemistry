// 图 6·34 扬声器的连接法（(a) 并联 (b) 串联 (c) 混联）；来源 原书 p.334，200 dpi 页面像素坐标。
#import "/common/series.typ": *
#import "fig6b-parts.typ": *

#let fig-6-34(width: 5.6cm) = px-canvas(420, 580, origin: (290, 1515), width: width, (p, u) => {
  import cetz.draw: *
  let cap(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.kai, size: 8pt, body))
  let xs = (505, 587, 669)
  // (a) 并联
  amp(p, 298, 1527, 418, 1614)
  wire(p, (418, 1550), (451, 1550), (451, 1529), (697, 1529))
  wire(p, (418, 1594), (451, 1594), (451, 1614), (697, 1614))
  wire(p, (697, 1529), (697, 1614))
  for x in xs {
    wire(p, (x, 1529), (x, 1557)); wire(p, (x, 1584), (x, 1614))
    spk-r(p, x, 1570.5)
  }
  node(p, 587, 1529, r: 4); node(p, 587, 1614, r: 4); node(p, 505, 1614, r: 4)
  cap(503, 1659, [($a$)并联])
  // (b) 串联
  amp(p, 298, 1695, 418, 1773)
  wire(p, (418, 1725), (715, 1725), (715, 1762), (418, 1762))
  for x in xs { spk-u(p, x + 0, 1725) }
  cap(521, 1807, [($b$)串联])
  // (c) 混联
  amp(p, 298, 1900, 418, 1982)
  wire(p, (418, 1918), (451, 1918), (451, 1859), (697, 1859))
  wire(p, (418, 1968), (451, 1968), (451, 2027), (697, 2027))
  wire(p, (697, 1859), (697, 2027))
  for x in xs {
    wire(p, (x, 1859), (x, 1882)); wire(p, (x, 1914), (x, 1964)); wire(p, (x, 1995), (x, 2027))
    spk-r(p, x, 1898); spk-r(p, x, 1979.5)
  }
  node(p, 505, 1859, r: 4); node(p, 587, 1859, r: 4); node(p, 505, 2027, r: 4); node(p, 587, 2027, r: 4)
  cap(507, 2075, [($c$)混联])
})
