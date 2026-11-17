// 图 3·10 最高温度计和最低温度计（原书 p.83）
// 写实插画沿用原扫描裁剪，已涂去 (a)(b)，用 CeTZ 补回；温度计刻度数字留在位图里。
#import "/common/series.typ": *

#let fig-3-10(width: 12.5cm) = px-canvas(1043, 436, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3-10.png", width: 1043 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  lab(543, 190, [$(a)$])
  lab(546, 416, [$(b)$])
})

