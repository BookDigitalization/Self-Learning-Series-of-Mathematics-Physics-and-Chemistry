// 图 9·2 两力平衡（原书 p.240）
// 写实插画，沿用原扫描裁剪（fig9-2.png，已涂去 T、F、G、“衣钩”“衣服”）；文字用 CeTZ 补回。
// 坐标是 fig9-2.png 的像素坐标（1514×949）。
#import "/common/series.typ": *

#let fig-9-2(width: 9cm) = px-canvas(1514, 949, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig9-2.png", width: 1514 * u))
  let m(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 7pt, body))
  m(237, 368, $T$); m(237, 885, $G$)
  m(735, 42, $F$); m(735, 897, $G$)
  lab(795, 197, [衣钩]); lab(857, 508, [衣服])
})
