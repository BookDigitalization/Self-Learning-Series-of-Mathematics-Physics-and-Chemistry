// 图 2·5 空气在有火炉的房间中的对流情形（原书 p.36）
// 写实插画，沿用原扫描裁剪二值化（fig2-5.png，400 dpi 裁剪）；图中文字已涂去，用 CeTZ 补回。
// 坐标是 fig2-5.png 的像素坐标（840×730）。
#import "/common/series.typ": *

#let fig-2-5(width: 6.55cm) = px-canvas(840, 730, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2-5.png", width: 840 * u))
})
