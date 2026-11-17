// 图 5·5 说明液体表面张力的实验（原书 p.161）
// 写实插画沿用原扫描裁剪（fig5-5.png，590×1194，已涂去 (a)(b)(c)(d)）；分图标注用真文字补回。
// 换算：(x-630)×2, (y-168)×2。
#import "/common/series.typ": *

#let fig-5-5(width: 4.6cm) = px-canvas(590, 1194, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig5-5.png", width: 590 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  lab(475, 233, $(a)$)
  lab(465, 510, $(b)$)
  lab(461, 789, $(c)$)
  lab(447, 1057, $(d)$)
})
