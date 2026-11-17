// 图 5·6 棉线圈在肥皂膜上（原书 p.162）
// 写实插画沿用原扫描裁剪（fig5-6.png，1470×390），图中无文字。
#import "/common/series.typ": *

#let fig-5-6(width: 9.5cm) = px-canvas(1470, 390, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig5-6.png", width: 1470 * u))
})
