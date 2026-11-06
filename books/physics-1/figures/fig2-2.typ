// 图 2·2 力的图示（原书 p.22）
// 人拉小车是写实插画，沿用原扫描裁剪（fig2-2.png，已涂去"1 公斤"）；该文字用 CeTZ 补回。
// 坐标是 fig2-2.png 的像素坐标（1504×619，y 向下）。
#import "/common/series.typ": *

#let fig-2-2(width: 9cm) = px-canvas(1504, 619, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2-2.png", width: 1504 * u))
  content(p(545, 360), anchor: "center", text(font: fonts.hei, size: 8pt, weight: "medium", [1 公斤]))
})
