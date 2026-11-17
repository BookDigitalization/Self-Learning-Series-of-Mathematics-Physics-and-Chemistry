// 图 2·2 蒸汽做功后内能减少（原书 p.30）
// 写实插画，沿用原扫描裁剪二值化（fig2-2.png，400 dpi 裁剪）；图中文字已涂去，用 CeTZ 补回。
// 坐标是 fig2-2.png 的像素坐标（380×800）。
#import "/common/series.typ": *

#let fig-2-2(width: 2.96cm) = px-canvas(380, 800, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2-2.png", width: 380 * u))
})
