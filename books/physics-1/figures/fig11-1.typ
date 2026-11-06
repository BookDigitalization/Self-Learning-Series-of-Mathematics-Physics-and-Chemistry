// 图 11·1 从井中提水（原书 p.329）
// 写实插画，沿用原扫描裁剪（fig11-1.png，已涂去“水桶”二字）；“水桶”用文字补回。
// 坐标是 fig11-1.png 的像素坐标（917×1454）。
#import "/common/series.typ": *

#let fig-11-1(width: 4.6cm) = px-canvas(917, 1454, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig11-1.png", width: 917 * u))
  content(p(600, 1225), anchor: "center", text(font: fonts.hei, size: 7pt, weight: "medium", [水桶]))
})
