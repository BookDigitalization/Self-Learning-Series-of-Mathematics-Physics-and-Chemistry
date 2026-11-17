// 图 2·1 做功增加了内能（原书 p.30）
// 写实插画，沿用原扫描裁剪二值化（fig2-1.png，400 dpi 裁剪）；图中文字已涂去，用 CeTZ 补回。
// 坐标是 fig2-1.png 的像素坐标（930×600）。
#import "/common/series.typ": *

#let fig-2-1(width: 7.25cm) = px-canvas(930, 600, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2-1.png", width: 930 * u))
})
