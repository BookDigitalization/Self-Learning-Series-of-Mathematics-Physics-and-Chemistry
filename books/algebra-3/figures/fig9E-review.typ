// 复习题九 *15、*16 的插图（原书 p.357，无编号，题注“（第 15 题）”“（第 16 题）”由 plainfig 给出）。
// 坐标取自 200 dpi 带网格页面图（真实像素，y 向下）。
// *15：等边三角形，顶点 (510, 1610)、(270, 2052)、(770, 2052)；各边中点连成内接三角形，再取内接三角形各边中点，共三层。
// *16：圆心约 (1130, 1863)，外圆半径 183；内接正方形（转 45°，顶点在外圆上）；它的内切圆半径 183/√2；内切圆的内接正方形（边与坐标轴平行）。
// 原图手绘略有倾斜，这里画成正放；坐标未用更精的量度。
#import "/common/series.typ": *

#let fig-ex9-15(width: 4.6cm) = px-canvas(560, 500, origin: (250, 1590), width: width, (p, u) => {
  import cetz.draw: *
  let lw = 1.3pt
  let a = (510, 1610)
  let b = (270, 2052)
  let c = (770, 2052)
  let mid(s, t) = ((s.at(0) + t.at(0)) / 2, (s.at(1) + t.at(1)) / 2)
  let tri(s, t, v) = line(p(..s), p(..t), p(..v), close: true, stroke: lw)
  tri(a, b, c)
  let ab = mid(a, b)
  let bc = mid(b, c)
  let ca = mid(c, a)
  tri(ab, bc, ca)
  tri(mid(ab, bc), mid(bc, ca), mid(ca, ab))
})

#let fig-ex9-16(width: 4.2cm) = px-canvas(420, 440, origin: (920, 1645), width: width, (p, u) => {
  import cetz.draw: *
  let lw = 1.3pt
  let cx = 1130
  let cy = 1863
  let r = 183
  let r2 = r / calc.sqrt(2)
  let h = r2 / calc.sqrt(2)
  circle(p(cx, cy), radius: r, stroke: lw)
  line(p(cx, cy - r), p(cx + r, cy), p(cx, cy + r), p(cx - r, cy), close: true, stroke: lw)
  circle(p(cx, cy), radius: r2, stroke: lw)
  line(p(cx - h, cy - h), p(cx + h, cy - h), p(cx + h, cy + h), p(cx - h, cy + h), close: true, stroke: lw)
})
