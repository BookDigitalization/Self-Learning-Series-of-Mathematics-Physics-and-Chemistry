// 图 11·27（a）（b）斜面上的小车（原书 p.369）
// 写实部分（斜面木块、小车）沿用原扫描裁剪（fig11-27.png，2340×860，已涂去 v₁ a v₂ l h₁ h₂ θ F f mg sinθ （a）（b））；
// 这些文字用 CeTZ 补回；坐标是 fig11-27.png 的像素坐标（y 向下）。
// 近似：mg sinθ 的箭杆左段被涂去，用一段细线加箭头补画；h₁、h₂ 尺寸线被标注涂断处未补（原图在木纹里本就不清）。
#import "/common/series.typ": *

#let fig-11-27(width: 11cm) = px-canvas(2340, 860, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig11-27.png", width: 2340 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 7.5pt, body))
  lab(422, 247, $v_1$)
  lab(722, 152, $a$)
  lab(1035, 68, $v_2$)
  lab(835, 335, $l$)
  lab(552, 550, $h_1$)
  lab(1155, 468, $h_2$)
  lab(418, 630, $theta$)
  lab(845, 800, [（$a$）])
  lab(1975, 645, [（$b$）])
  lab(2250, 150, $F$)
  lab(1597, 485, $f$)
  // mg sinθ 的箭杆（向左下）
  line(p(1745, 313), p(1560, 368), stroke: 0.6pt, mark: (end: ">", fill: black, scale: 0.5))
  content(p(1615, 280), anchor: "center", std.rotate(15deg, text(size: 7.5pt, $m g sin theta$)))
})

