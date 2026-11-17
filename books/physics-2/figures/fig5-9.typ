// 图 5·9 杂质对液体表面张力的影响（原书 p.165）
// 写实插画沿用原扫描裁剪（fig5-9.png，1320×408，已涂去文字和 (a)(b)(c)）；标注用真文字补回。
// 换算：(x-235)×2, (y-1118)×2。
#import "/common/series.typ": *

#let fig-5-9(width: 13cm) = px-canvas(1320, 408, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig5-9.png", width: 1320 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  lab(226, 142, [粉笔灰])
  lab(1076, 140, [肥皂水层])
  lab(1240, 156, [纯水])
  lab(210, 374, $(a)$)
  lab(676, 374, $(b)$)
  lab(1100, 374, $(c)$)
})
