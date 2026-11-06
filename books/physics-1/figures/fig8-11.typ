// 图 8·11 甲、乙两物体的受力图（原书 p.222）
// 线条图沿用原扫描裁剪（fig8-11.png，已涂去各力的字母）；字母用 CeTZ 补回。
// 左：甲物体受 N_1（向上）、T_1（向右）、f_1（向左）、G_1（向下）；
// 右：乙物体受 N_2（向上）、F（向右）、T_1′、f_2（向左）、G_2（向下）。
// 坐标是 fig8-11.png 的像素坐标（1429×470）：(显示图 x-540)×2.1314，(y-125)×2.1314。
#import "/common/series.typ": *

#let fig-8-11(width: 10cm) = px-canvas(1429, 470, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig8-11.png", width: 1429 * u))
  // 涂字后残留的小墨迹
  rect(p(895, 315), p(925, 335), fill: white, stroke: none)
  rect(p(1038, 318), p(1062, 338), fill: white, stroke: none)
  let m(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  m(168, 130, $N_1$)
  m(407, 175, $T_1$)
  m(81, 309, $f_1$)
  m(185, 362, $G_1$)
  m(1015, 113, $N_2$)
  m(814, 177, $T'_1$)
  m(946, 296, $f_2$)
  m(1029, 300, $G_2$)
  m(1349, 156, $F$)
})
