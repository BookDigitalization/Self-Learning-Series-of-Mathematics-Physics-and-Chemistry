// 图 2·4 液体受热时发生运动（原书 p.35）
// 写实插画，沿用原扫描裁剪二值化（fig2-4.png，400 dpi 裁剪）；图中文字已涂去，用 CeTZ 补回。
// 坐标是 fig2-4.png 的像素坐标（640×1170）。
#import "/common/series.typ": *

#let fig-2-4(width: 4.99cm) = px-canvas(640, 1170, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2-4.png", width: 640 * u))
})
