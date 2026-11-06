// 图 4·4 位移的图示（原书 p.90）
// 线条图 CeTZ 重绘；坐标取自 200 dpi 页面图的显示坐标（原点 (940,730)）。
#import "/common/series.typ": *

#let fig-4-4(width: 6cm) = px-canvas(420, 200, origin: (940, 730), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  // 9 米的位移，向东
  line(p(991, 880), p(1294, 880), stroke: 0.9pt, mark: (end: "stealth", fill: black, scale: 0.5))
  circle(p(991, 880), radius: 3 * u, stroke: none, fill: black)
  for x in (1097, 1197) { line(p(x, 880), p(x, 872), stroke: 0.6pt) }
  // 3 米 一段的标注
  line(p(991, 822), p(1097, 822), stroke: 0.6pt)
  line(p(991, 880), p(991, 812), stroke: 0.6pt)
  line(p(1097, 880), p(1097, 812), stroke: 0.6pt)
  lab(1044, 822, text(fill: black)[#box(fill: white, inset: 1pt)[3 米]])
  // 1 厘米 的标尺
  line(p(994, 765), p(1097, 765), stroke: 0.6pt)
  line(p(994, 765), p(994, 782), stroke: 0.6pt)
  line(p(1097, 765), p(1097, 782), stroke: 0.6pt)
  lab(1044, 748, [（1 厘米）])
  lab(965, 876, [西])
  lab(1318, 876, [东])
})
