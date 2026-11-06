// 图 7·1 研究质量、加速度和作用力三者之间的关系（原书 p.191）
// 写实插画（手、小车、斜面）沿用原扫描裁剪的 fig7-1.png（1791×896）；原图中没有文字，无需补字。
#import "/common/series.typ": *

#let fig-7-1(width: 10cm) = px-canvas(1791, 896, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig7-1.png", width: 1791 * u))
})
