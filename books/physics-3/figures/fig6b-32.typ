// 图 6·32 舌簧扬声器（结构图）
// 写实插画，沿用原扫描裁剪（已涂去图中文字），文字用 CeTZ 补回。
// 来源 原书 p.332，裁剪框（200 dpi 页面像素）170,1495–830,2085；图 fig6b-32.png 为 400 dpi 裁剪（1320×1180）。
#import "/common/series.typ": *

#let fig-6-32(width: 6.6cm) = px-canvas(660, 590, origin: (170, 1495), width: width, (p, u) => {
  import cetz.draw: *
  content(p(170, 1495), anchor: "north-west", image("fig6b-32.png", width: 660 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 7.5pt, weight: "medium", body))
  lab(372, 1577, [纸盆支架])
  lab(221, 1717, [纸盆])
  lab(467, 1690, [舌簧])
  lab(561, 1692, [极靴])
  lab(625, 1767, [厚铁板])
  lab(622, 1825, [铜螺丝])
  lab(575, 1901, [磁铁])
  lab(545, 1937, [接线焊片])
  lab(490, 1971, [传动支片])
  lab(785, 1551, [符号])
})
