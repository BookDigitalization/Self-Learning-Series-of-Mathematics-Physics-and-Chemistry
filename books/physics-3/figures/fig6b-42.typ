// 图 6·42 电子射线管
// 写实插画，沿用原扫描裁剪（已涂去图中字母），字母用 CeTZ 补回。
// 来源 原书 p.341，裁剪框（200 dpi 页面像素）380,1895–1340,2145；图 fig6b-42.png 为 400 dpi 裁剪（1920×500）。
#import "/common/series.typ": *

#let fig-6-42(width: 10cm) = px-canvas(960, 250, origin: (380, 1895), width: width, (p, u) => {
  import cetz.draw: *
  content(p(380, 1895), anchor: "north-west", image("fig6b-42.png", width: 960 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 10pt, body))
  lab(495, 2052, $K$); lab(815, 1988, $A$); lab(713, 2056, $B$)
  lab(915, 2057, $C_1$); lab(1008, 2051, $C_2$); lab(1251, 1936, $P$)
})
