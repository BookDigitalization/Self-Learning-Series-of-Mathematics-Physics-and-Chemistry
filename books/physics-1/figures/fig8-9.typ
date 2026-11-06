// 图 8·9 甲、乙两物体的受力（原书 p.220）
// 写实插画沿用原扫描裁剪（fig8-9.png，已涂去力的字母和“甲”“乙”）；用 CeTZ 补回。
// 左：甲物体受 N_1（向上）、G_1（向下）；右：乙物体受 N_2（向上）、N_1′、G_2（向下）。
// 坐标是 fig8-9.png 的像素坐标（1451×907）：(显示图 x-540)×2.1314，(y-95)×2.1314。
// 原图中物体上的“甲”“乙”扫描里被箭头压住，位置按看到的补。
#import "/common/series.typ": *

#let fig-8-9(width: 10cm) = px-canvas(1451, 907, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig8-9.png", width: 1451 * u))
  let m(x, y, body) = content(p(x, y), anchor: "center", text(size: 10pt, body))
  let lab(x, y, body) = content(p(x, y), anchor: "center",
    text(font: fonts.hei, size: 7pt, weight: "medium", body))
  m(170, 49, $N_1$)
  m(168, 853, $G_1$)
  m(1098, 49, $N_2$)
  m(1151, 659, $N'_1$)
  m(1098, 853, $G_2$)
  lab(245, 426, [甲])
  lab(1187, 430, [乙])
})
