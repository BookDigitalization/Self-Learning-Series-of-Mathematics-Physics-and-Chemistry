// 图 1·10（原书 p.19，原图无图题）
// 写实插画沿用原扫描裁剪的 fig1-10.png（1386×1248），已涂去 a、b、c，用 CeTZ 补回。
#import "/common/series.typ": *

#let fig-1-10(width: 8cm) = px-canvas(1386, 1248, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1-10.png", width: 1386 * u))
  content(p(540, 510), anchor: "center", text(size: 9pt, [$a$]))
  content(p(240, 540), anchor: "center", text(size: 9pt, [$b$]))
  content(p(40, 607), anchor: "center", text(size: 9pt, [$c$]))
})
