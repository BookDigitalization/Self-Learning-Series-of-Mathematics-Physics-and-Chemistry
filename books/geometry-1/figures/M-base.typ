// 段 M 图的共用小工具（几何第一册 p.221–235，圆）。页面渲染 dpi：200，坐标取自 crop-view 网格图（页面真实像素）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

// 圆 c（页面坐标）、半径 r 上，数学角 a（度，逆时针）处的点
#let M-pt(c, r, a) = (c.at(0) + r * calc.cos(a * 1deg), c.at(1) - r * calc.sin(a * 1deg))
#let M-mid(a, b) = ((a.at(0) + b.at(0)) / 2, (a.at(1) + b.at(1)) / 2)

// 过圆外（或圆内）一点 m、沿方向 d 的直线与圆 (c, r) 的两个交点，按沿 d 的先后排列
#let M-sec(c, r, m, d) = {
  let l = calc.sqrt(d.at(0) * d.at(0) + d.at(1) * d.at(1))
  let (ux, uy) = (d.at(0) / l, d.at(1) / l)
  let (wx, wy) = (m.at(0) - c.at(0), m.at(1) - c.at(1))
  let b = ux * wx + uy * wy
  let q = wx * wx + wy * wy - r * r
  let s = calc.sqrt(b * b - q)
  let (t1, t2) = (-b - s, -b + s)
  ((m.at(0) + t1 * ux, m.at(1) + t1 * uy), (m.at(0) + t2 * ux, m.at(1) + t2 * uy))
}

// 直线 ab 与直线 cd 的交点
#let M-isect(a, b, c, d) = {
  let (x1, y1) = a
  let (x2, y2) = b
  let (x3, y3) = c
  let (x4, y4) = d
  let den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
  let t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / den
  (x1 + t * (x2 - x1), y1 + t * (y2 - y1))
}

// 点 o 到直线 ab 的垂足
#let M-foot(a, b, o) = {
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let t = ((o.at(0) - a.at(0)) * dx + (o.at(1) - a.at(1)) * dy) / (dx * dx + dy * dy)
  (a.at(0) + t * dx, a.at(1) + t * dy)
}

// 粗线段（原图里描粗的线）
#let M-bold(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lb)
}

// 圆 c 上从数学角 a0 到 a1（逆时针）的弧；r 为半径
#let M-arc(p, c, r, a0, a1, ..style) = {
  import cetz.draw: *
  arc(p(..c), start: a0 * 1deg, stop: a1 * 1deg, radius: r, anchor: "origin", ..style)
}

// 圆内某点 v 处的角标：从方向 a 到 b（由 anglearc 画，这里只是换个名字，半径 r）
#let M-ang(p, v, a, b, r) = anglearc(p, v, a, b, r)

// 圆上一点处沿半径方向的小短横（原图里标在分点上的记号）
#let M-rtick(p, c, r, a, s: 5) = {
  import cetz.draw: *
  line(p(..M-pt(c, r - s, a)), p(..M-pt(c, r + s, a)), stroke: lt)
}

// 圆心小圈
#let M-ctr(p, c) = ring(p, c, r: 2.6)
