// 图 2·7 热水暖室装置简图；散热器（原书 p.37）
// 写实插画，沿用原扫描裁剪二值化（fig2-7.png，400 dpi 裁剪）；图中文字已涂去，用 CeTZ 补回。
// 坐标是 fig2-7.png 的像素坐标（1540×1144）。
#import "/common/series.typ": *

#let fig-2-7(width: 12.01cm) = px-canvas(1540, 1194, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2-7.png", width: 1540 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 8pt, weight: "medium", body))
  lab(584, 140, [膨胀箱])
  lab(340, 218, [配水管])
  lab(488, 220, [#emph[B]])
  lab(258, 456, [#emph[C]])
  lab(636, 448, [总管])
  lab(412, 874, [散热器])
  lab(212, 946, [回水管])
  lab(768, 912, [溢水管])
  lab(656, 966, [#emph[A]])
  lab(646, 1024, [锅炉])
  lab(420, 1164, [#emph[(a)]])
  lab(1252, 1160, [#emph[(b)]])
})
