// 图 13·41 齿轮传动装置：（a）圆柱形齿轮，（b）锥形齿轮（原书 p.465）
// 写实插画，保留原扫描裁剪（fig13-41.png，已涂去（a）（b）及图下的图题，用 CeTZ 补回（a）（b））；图上的转向小箭头留在位图里。
// 坐标是 PNG 像素坐标（宽 1685、高 910）。
#import "/common/series.typ": *

#let fig-13-41(width: 11cm) = px-canvas(1685, 910, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig13-41.png", width: 1685 * u))
  content(p(420, 885), anchor: "center", text(size: 9pt, $(a)$))
  content(p(1368, 890), anchor: "center", text(size: 9pt, $(b)$))
})
