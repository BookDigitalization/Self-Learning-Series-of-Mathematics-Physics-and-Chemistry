// 图 2·11 空气是不善于导热的物质（原书 p.41）
// 写实插画，沿用原扫描裁剪二值化（fig2-11.png，400 dpi 裁剪）；图中文字已涂去，用 CeTZ 补回。
// 坐标是 fig2-11.png 的像素坐标（650×444）。
#import "/common/series.typ": *

#let fig-2-11(width: 5.07cm) = px-canvas(650, 444, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2-11.png", width: 650 * u))
})
