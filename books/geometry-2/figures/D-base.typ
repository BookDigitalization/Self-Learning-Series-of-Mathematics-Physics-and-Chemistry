// 段 D 图的共用小工具（几何第二册 p.52–74）。所有 D-*.typ 都 import 本文件。
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
// 同心的 n 道角弧（表示相等的角）
#let amk(p, v, a, b, r, n: 1, gap: 3) = {
  for i in range(n) { anglearc(p, v, a, b, r + i * gap) }
}
// 以 v 为圆心、从 a 方向到 b 方向的实线圆弧（线宽 lw）
#let varc(p, v, a, b, r) = {
  import cetz.draw: *
  let t1 = dirang(a.at(0) - v.at(0), a.at(1) - v.at(1))
  let t2 = dirang(b.at(0) - v.at(0), b.at(1) - v.at(1))
  let d = calc.rem(calc.rem((t2 - t1).deg(), 360) + 360, 360) * 1deg
  let (s, e) = if d <= 180deg { (t1, t1 + d) } else { (t2, t2 + (360deg - d)) }
  arc(p(..v), start: s, stop: e, radius: r, anchor: "origin", stroke: lw)
}
// 三角形（闭合折线）
#let tri(p, a, b, c) = poly(p, (a, b, c), close: true)
