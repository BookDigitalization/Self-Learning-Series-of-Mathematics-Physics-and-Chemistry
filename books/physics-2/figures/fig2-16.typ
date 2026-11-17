// 图 2·16 保温瓶（原书 p.45）
// 写实插画，沿用原扫描裁剪二值化（fig2-16.png，400 dpi 裁剪）；图中文字已涂去，用 CeTZ 补回。
// 坐标是 fig2-16.png 的像素坐标（650×854）。
#import "/common/series.typ": *

#let fig-2-16(width: 5.07cm) = px-canvas(650, 854, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2-16.png", width: 650 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 8pt, weight: "medium", body))
  lab(264, 72, [玻璃杯])
  lab(430, 108, [塞子])
  lab(374, 384, [液体])
  lab(374, 558, [外壳])
  lab(366, 678, [玻璃胆])
  lab(538, 812, [橡皮垫])
})
