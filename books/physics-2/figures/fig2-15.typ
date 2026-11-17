// 图 2·15 安全灯（原书 p.45）
// 写实插画，沿用原扫描裁剪二值化（fig2-15.png，400 dpi 裁剪）；图中文字已涂去，用 CeTZ 补回。
// 坐标是 fig2-15.png 的像素坐标（300×890）。
#import "/common/series.typ": *

#let fig-2-15(width: 2.34cm) = px-canvas(300, 890, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2-15.png", width: 300 * u))
})
