// 图 5·11 用滴管测定表面张力系数（原书 p.167）
// 写实装置图沿用原扫描裁剪（fig5-11.png，850×1060，已涂去字母和 (a)(b)）；标注用真文字补回。
// 换算：(x-355)×2, (y-610)×2。
#import "/common/series.typ": *

#let fig-5-11(width: 8.5cm) = px-canvas(850, 1060, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig5-11.png", width: 850 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  lab(400, 658, $K$)
  lab(662, 750, $A$)
  lab(808, 736, $B$)
  lab(734, 904, $C$)
  lab(260, 1032, $(a)$)
  lab(740, 1014, $(b)$)
})
