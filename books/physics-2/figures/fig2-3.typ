// 图 2·3 煤油灯上方的气流（原书 p.35）
// 写实插画，沿用原扫描裁剪二值化（fig2-3.png，400 dpi 裁剪）；图中文字已涂去，用 CeTZ 补回。
// 坐标是 fig2-3.png 的像素坐标（380×1070）。
#import "/common/series.typ": *

#let fig-2-3(width: 2.96cm) = px-canvas(380, 1070, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2-3.png", width: 380 * u))
})
