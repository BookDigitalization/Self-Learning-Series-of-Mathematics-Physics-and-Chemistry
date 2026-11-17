// 习题 3·2 第 4 题附图（原书 p.84）
// 写实插画沿用原扫描裁剪，已涂去标注，用 CeTZ 补回。
#import "/common/series.typ": *

#let fig-ex-3-2-4(width: 3.4cm) = px-canvas(315, 901, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("ex3-2-4.png", width: 315 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  lab(220, 146, [玻璃泡])
  lab(168, 412, [玻璃管])
  lab(244, 789, [有色液体])
})

