// 图 3·30 潜水艇（原书 p.74）
// 写实插画，沿用原扫描裁剪（已涂去“（横截面图）”），文字用 CeTZ 补回。
// 坐标是 fig3-30.png 的像素坐标；原页显示图 (425,125) 起，×2.1314。
#import "/common/series.typ": *

#let fig-3-30(width: 10cm) = px-canvas(1620, 948, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3-30.png", width: 1620 * u))
  content(p(277, 47), anchor: "center", text(font: fonts.kai, size: 8.5pt, [（横截面图）]))
})
