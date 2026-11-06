// 图 3·1 注射器内水的压力和压强（原书 p.46）
// 写实插画，沿用原扫描裁剪（已涂去"水""空气泡"），文字用 CeTZ 补回。
// 坐标是 fig3-1.png 的像素坐标（1376×321）；原页显示图 (540,505) 起，×2.1314。
#import "/common/series.typ": *

#let fig-3-1(width: 8cm) = px-canvas(1376, 321, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3-1.png", width: 1376 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 8pt, weight: "medium", body))
  lab(110, 38, [水])
  lab(430, 38, [空气泡])
})
