// 图 2·13 火焰在铜丝网下面燃烧（原书 p.45）
// 写实插画，沿用原扫描裁剪二值化（fig2-13.png，400 dpi 裁剪）；图中文字已涂去，用 CeTZ 补回。
// 坐标是 fig2-13.png 的像素坐标（420×710）。
#import "/common/series.typ": *

#let fig-2-13(width: 3.28cm) = px-canvas(420, 710, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2-13.png", width: 420 * u))
})
