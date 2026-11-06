// 图 7·3 质量 1 千克物体的重量（原书 p.200）
// 沿用原扫描裁剪 fig7-3.png（1152×1056，已涂去“G = 1.003 公斤”“G ≈ 0.997 公斤”“地球”）；文字用 CeTZ 补回。
// 换算：PNG 像素 = (显示图坐标 − (815, 410)) × 2.133。
#import "/common/series.typ": *

#let fig-7-3(width: 8cm) = px-canvas(1152, 1056, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig7-3.png", width: 1152 * u))
  content(p(655, 107), anchor: "west", text(size: 8pt)[$G = 1.003$ 公斤])
  content(p(750, 661), anchor: "west", text(size: 8pt)[$G approx 0.997$ 公斤])
  content(p(490, 512), anchor: "center", text(size: 8pt, fill: black)[地球])
})
