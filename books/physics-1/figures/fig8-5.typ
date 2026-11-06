// 图 8·5 人推车子（原书 p.215）
// 写实插画沿用原扫描裁剪（fig8-5.png，已涂去 F₂、F₁ 及两端箭头）；力的箭头端点和字母用 CeTZ 补回。
// 坐标是 fig8-5.png 的像素坐标（1472×576）：(显示图 x-570)×2.1314，(y-100)×2.1314。
#import "/common/series.typ": *

#let fig-8-5(width: 9cm) = px-canvas(1472, 576, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig8-5.png", width: 1472 * u))
  line(p(262, 218), p(222, 218), stroke: 1.2pt, mark: (end: "stealth", fill: black, scale: 0.5))
  line(p(1230, 218), p(1272, 218), stroke: 1.2pt, mark: (end: "stealth", fill: black, scale: 0.5))
  content(p(165, 216), anchor: "center", text(size: 10pt, $F_2$))
  content(p(1335, 216), anchor: "center", text(size: 10pt, $F_1$))
})
