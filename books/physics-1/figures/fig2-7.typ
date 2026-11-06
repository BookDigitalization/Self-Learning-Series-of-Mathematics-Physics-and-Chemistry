// 图 2·7 弹簧的伸长（原书 p.34）
// 实验装置是写实插画，沿用原扫描裁剪（fig2-7.png，已涂去"100 克""200 克"和 (a)(b)(c)）；这些文字用 CeTZ 补回。
// 坐标是 fig2-7.png 的像素坐标（1631×1131）。换算：原页显示图 (480,120) 起，×2.1314。
#import "/common/series.typ": *

#let fig-2-7(width: 11.5cm) = px-canvas(1631, 1131, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2-7.png", width: 1631 * u))
  let d(x, y) = ((x - 480) * 2.1314, (y - 120) * 2.1314)
  let lab(x, y, body) = content(p(..d(x, y)), anchor: "center", text(font: fonts.hei, size: 8pt, weight: "medium", body))
  lab(883, 426, [100 克])
  lab(1118, 448, [200 克])
  let sub(x, y, body) = content(p(..d(x, y)), anchor: "center", text(size: 9.5pt, body))
  sub(596, 625, $(a)$)
  sub(848, 625, $(b)$)
  sub(1102, 625, $(c)$)
})
