// 图 3·6 沸点的测定、图 3·7 冰点的测定（原书 p.80）
// 写实插画沿用原扫描裁剪，已涂去“100°”“0°”，用 CeTZ 补回。
#import "/common/series.typ": *

#let fig-3-6(width: 4cm) = px-canvas(436, 810, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3-6.png", width: 436 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  lab(348, 219, [100°])
})

#let fig-3-7(width: 4.1cm) = px-canvas(450, 811, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3-7.png", width: 450 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  lab(326, 243, [100°])
  lab(310, 380, [0°])
})

