// 图 1·2 两块铅圆柱体由于分子引力的作用而结合在一起
// 写实插画，沿用原扫描裁剪（已涂去图中文字），文字用 CeTZ 补回。
// 坐标是 fig1-2.png 的像素坐标（540×1220，400 dpi 裁剪）；来源页 原书 p.10。
#import "/common/series.typ": *

#let fig-1-2(width: 3.8cm) = px-canvas(540, 1220, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1-2.png", width: 540 * u))
  let lab(x, y, body, angle: 0deg) = content(p(x, y), anchor: "center", angle: angle, text(font: fonts.hei, size: 8pt, weight: "medium", body))
  lab(178, 308, [铅圆])
  lab(178, 336, [柱体])
  lab(354, 476, [支架])
})
