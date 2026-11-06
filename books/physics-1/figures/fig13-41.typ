// 图 13·41 齿轮传动装置：（a）圆柱形齿轮，（b）锥形齿轮（原书 p.465）
// 写实插画，保留原扫描裁剪（fig13-41.png，已涂去（a）（b），用 CeTZ 补回）；图上的转向小箭头留在位图里。
// 坐标是页面显示图（宽 1568）上的像素坐标；位置为目测。
#import "/common/series.typ": *

#let fig-13-41(width: 11cm) = px-canvas(790, 495, origin: (515, 780), width: width, (p, u) => {
  import cetz.draw: *
  content(p(515, 780), anchor: "north-west", image("fig13-41.png", width: 790 * u))
  content(p(712, 1207), anchor: "center", text(size: 9pt, $(a)$))
  content(p(1157, 1210), anchor: "center", text(size: 9pt, $(b)$))
})
