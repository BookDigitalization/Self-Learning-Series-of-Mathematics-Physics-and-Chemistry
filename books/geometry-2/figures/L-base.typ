// 段 L 图的共用小工具（几何第二册 p.206–230）。所有 L-*.typ 都 import 本文件。
// 页面渲染 dpi：120（坐标取自 build/pages/g2 的页面图与 crop-view 放大图）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

// 线性插值：lerp(a, b, t) = a + t (b − a)
#let lerp(a, b, t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)
// 点 pt 在直线 ab 上的垂足
#let foot(pt, a, b) = {
  let dx = b.at(0) - a.at(0)
  let dy = b.at(1) - a.at(1)
  let t = ((pt.at(0) - a.at(0)) * dx + (pt.at(1) - a.at(1)) * dy) / (dx * dx + dy * dy)
  lerp(a, b, t)
}
// 直线 ab 与直线 cd 的交点
#let isect(a, b, c, d) = {
  let (x1, y1) = a
  let (x2, y2) = b
  let (x3, y3) = c
  let (x4, y4) = d
  let den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
  let t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / den
  (x1 + t * (x2 - x1), y1 + t * (y2 - y1))
}
// 圆上的点：圆心 c、半径 r、数学角 deg（逆时针，页面 y 向下已处理）
#let cpt(c, r, deg) = (c.at(0) + r * calc.cos(deg * 1deg), c.at(1) - r * calc.sin(deg * 1deg))
// 正多边形顶点：圆心 c、外接圆半径 r、边数 n、第一个顶点的数学角 a0（度），逆时针依次
#let rpoly(c, r, n, a0) = range(n).map(i => cpt(c, r, a0 + 360 / n * i))
// 同心的 n 道角弧（表示相等的角）
#let amk(p, v, a, b, r, n: 1, gap: 3) = {
  for i in range(n) { anglearc(p, v, a, b, r + i * gap) }
}
// 三角形（闭合折线）
#let tri(p, a, b, c) = poly(p, (a, b, c), close: true)
// 以 v 为圆心的圆弧，数学角 s 到 e（度，逆时针），样式可传
#let carc(p, v, s, e, r, ..style) = {
  import cetz.draw: *
  arc(p(..v), start: s * 1deg, stop: e * 1deg, radius: r, anchor: "origin", stroke: lw, ..style)
}
// 带白底的标注（压在线上时用）
#let wl(p, pt, body, ang: 0deg) = {
  import cetz.draw: *
  content(p(..pt), tt(body), angle: ang, fill: white, frame: "rect", padding: 1.5, stroke: none)
}
// 竖直尺寸线：两端箭头；lab 在中间（白底）
#let dimv(p, x, y0, y1, lab: none, laby: auto, rot: true) = {
  import cetz.draw: *
  line(p(x, y0), p(x, y1), stroke: lt, mark: arw2)
  if lab != none {
    let m = if laby == auto { (y0 + y1) / 2 } else { laby }
    wl(p, (x, m), lab, ang: if rot { 90deg } else { 0deg })
  }
}
// 圆心小圈 + 字母 O 在下方
#let ocenter(p, c, d: 12) = {
  ring(p, c, r: 2.5)
  lbl(p, c, $O$, dir: "s", d: d)
}
