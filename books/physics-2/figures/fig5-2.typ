// 图 5·2 水银滴在玻璃板上（原书 p.155）
// 写实插画沿用原扫描裁剪（fig5-2.png，1150×206）；图下说明文字用真文字补回。
#import "/common/series.typ": *

#let fig-5-2(width: 10cm) = px-canvas(1150, 300, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig5-2.png", width: 1150 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.kai, size: 9pt, body))
  lab(268, 262, [大的水银滴是扁平的])
  lab(882, 262, [小的水银滴成球形])
})
