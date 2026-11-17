// 图 3·9 医用温度计（原书 p.82）
// 写实插画沿用原扫描裁剪，已涂去 A，用 CeTZ 补回；刻度数字留在位图里。
#import "/common/series.typ": *

#let fig-3-9(width: 1.55cm) = px-canvas(173, 1170, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3-9.png", width: 173 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  lab(146, 861, [$A$])
})

