// 图 1·8 法拉第圆筒实验（原书 p.18）
// 写实插画沿用原扫描裁剪的 fig1-8.png（2094×1247），已涂去 A、B、C 和 (a)、(b)，用 CeTZ 补回。
#import "/common/series.typ": *

#let fig-1-8(width: 8cm) = px-canvas(2094, 1247, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1-8.png", width: 2094 * u))
  content(p(25, 823), anchor: "center", text(size: 9pt, [$A$]))
  content(p(525, 838), anchor: "center", text(size: 9pt, [$B$]))
  content(p(865, 300), anchor: "center", text(size: 9pt, [$C$]))
  content(p(497, 1180), anchor: "center", text(size: 9pt, [($a$)]))
  content(p(1085, 835), anchor: "center", text(size: 9pt, [$A$]))
  content(p(1597, 822), anchor: "center", text(size: 9pt, [$B$]))
  content(p(1962, 297), anchor: "center", text(size: 9pt, [$C$]))
  content(p(1572, 1187), anchor: "center", text(size: 9pt, [($b$)]))
})
