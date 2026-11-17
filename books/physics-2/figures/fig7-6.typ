// 图 7·6 砂型铸造（原书 p.231）
// 铸型、模子是剖面插画，沿用原扫描裁剪（fig7-6.png，已涂去 (a)(b)(c)）；分图字母用 CeTZ 补回。
// 坐标是 fig7-6.png 的像素坐标（1000×490，y 向下）。
#import "/common/series.typ": *

#let fig-7-6(width: 9cm) = px-canvas(1000, 490, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig7-6.png", width: 1000 * u))
  for (t, x, y) in (([a], 90, 446), ([b], 402, 454), ([c], 804, 460),) {
    content(p(x, y), anchor: "center", text(size: 8pt, [（$#t$）]))
  }
})
