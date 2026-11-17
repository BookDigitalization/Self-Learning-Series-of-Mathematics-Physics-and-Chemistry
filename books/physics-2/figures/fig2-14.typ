// 图 2·14 火焰在铜丝网上面燃烧（原书 p.45）
// 写实插画，沿用原扫描裁剪二值化（fig2-14.png，400 dpi 裁剪）；图中文字已涂去，用 CeTZ 补回。
// 坐标是 fig2-14.png 的像素坐标（480×900）。
#import "/common/series.typ": *

#let fig-2-14(width: 3.74cm) = px-canvas(480, 900, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2-14.png", width: 480 * u))
})
