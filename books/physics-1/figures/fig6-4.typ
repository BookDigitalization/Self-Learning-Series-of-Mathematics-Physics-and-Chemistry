// 图 6·4 研究静摩擦力的装置（原书 p.168）
// 写实插画沿用原扫描裁剪（fig6-4.png，已涂去字母 f、F），字母用文字补回。
// 坐标是 fig6-4.png 的像素坐标（1312×811）。
#import "/common/series.typ": *

#let fig-6-4(width: 9cm) = px-canvas(1312, 811, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig6-4.png", width: 1312 * u))
  content(p(85, 205), anchor: "center", text(size: 9pt, $f$))
  content(p(789, 236), anchor: "center", text(size: 9pt, $F$))
})
