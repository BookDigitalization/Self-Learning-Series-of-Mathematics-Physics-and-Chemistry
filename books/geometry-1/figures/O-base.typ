// 段 O 图的共用小工具（几何第一册 p.253–272，第 4 章 §4·8–§4·13）。所有图文件都 import 本文件。
// 页面渲染 dpi：200（坐标取自 scripts/crop-view.py 的网格图，网格数字为真实像素）。
// 画圆相切的图时，用“圆心 + 半径 + 角度”算切点和顶点，保证相切是严格的（原图手绘，略有歪斜）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

#let O-dist(a, b) = calc.sqrt(calc.pow(a.at(0) - b.at(0), 2) + calc.pow(a.at(1) - b.at(1), 2))
// 单位向量 a→b
#let O-u(a, b) = {
  let l = O-dist(a, b)
  ((b.at(0) - a.at(0)) / l, (b.at(1) - a.at(1)) / l)
}
// 圆 (c, r) 上方向角为 a 度（数学角，逆时针为正，页面 y 向下）的点
#let O-pa(c, r, a) = (c.at(0) + r * calc.cos(a * 1deg), c.at(1) - r * calc.sin(a * 1deg))
// 圆上方向角 a1、a2 两点处的切线的交点
#let O-tv(c, r, a1, a2) = {
  let d = calc.rem(calc.rem(a2 - a1, 360) + 360, 360)
  if d > 180 { d = d - 360 }
  O-pa(c, r / calc.cos(calc.abs(d) / 2 * 1deg), a1 + d / 2)
}
// 点 pt 在直线 ab 上的垂足
#let O-foot(pt, a, b) = {
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let t = ((pt.at(0) - a.at(0)) * dx + (pt.at(1) - a.at(1)) * dy) / (dx * dx + dy * dy)
  (a.at(0) + t * dx, a.at(1) + t * dy)
}
// 三角形 abc 的内切圆：(圆心, 半径)
#let O-incircle(a, b, c) = {
  let la = O-dist(b, c)
  let lb2 = O-dist(c, a)
  let lc = O-dist(a, b)
  let s = la + lb2 + lc
  let cx = (la * a.at(0) + lb2 * b.at(0) + lc * c.at(0)) / s
  let cy = (la * a.at(1) + lb2 * b.at(1) + lc * c.at(1)) / s
  let area = calc.abs((b.at(0) - a.at(0)) * (c.at(1) - a.at(1)) - (c.at(0) - a.at(0)) * (b.at(1) - a.at(1))) / 2
  ((cx, cy), 2 * area / s)
}
// 三角形 abc 在顶点 a 对面的旁切圆：(圆心, 半径)
#let O-excircle(a, b, c) = {
  let la = O-dist(b, c)
  let lb2 = O-dist(c, a)
  let lc = O-dist(a, b)
  let den = -la + lb2 + lc
  let cx = (-la * a.at(0) + lb2 * b.at(0) + lc * c.at(0)) / den
  let cy = (-la * a.at(1) + lb2 * b.at(1) + lc * c.at(1)) / den
  let area = calc.abs((b.at(0) - a.at(0)) * (c.at(1) - a.at(1)) - (c.at(0) - a.at(0)) * (b.at(1) - a.at(1))) / 2
  ((cx, cy), area / ((la + lb2 + lc) / 2 - la))
}
// 两圆交点：(上面的, 下面的)（页面 y 较小者在前）
#let O-cc(c1, r1, c2, r2) = {
  let d = O-dist(c1, c2)
  let a = (d * d + r1 * r1 - r2 * r2) / (2 * d)
  let h = calc.sqrt(r1 * r1 - a * a)
  let u = O-u(c1, c2)
  let m = (c1.at(0) + a * u.at(0), c1.at(1) + a * u.at(1))
  let q1 = (m.at(0) - h * u.at(1), m.at(1) + h * u.at(0))
  let q2 = (m.at(0) + h * u.at(1), m.at(1) - h * u.at(0))
  if q1.at(1) <= q2.at(1) { (q1, q2) } else { (q2, q1) }
}
// 直线 p0→p1 与圆 (c, r) 的两个交点，按沿 p0→p1 的先后排列
#let O-lc(p0, p1, c, r) = {
  let (dx, dy) = (p1.at(0) - p0.at(0), p1.at(1) - p0.at(1))
  let (fx, fy) = (p0.at(0) - c.at(0), p0.at(1) - c.at(1))
  let qa = dx * dx + dy * dy
  let qb = 2 * (fx * dx + fy * dy)
  let qc = fx * fx + fy * fy - r * r
  let disc = calc.sqrt(qb * qb - 4 * qa * qc)
  let t1 = (-qb - disc) / (2 * qa)
  let t2 = (-qb + disc) / (2 * qa)
  ((p0.at(0) + t1 * dx, p0.at(1) + t1 * dy), (p0.at(0) + t2 * dx, p0.at(1) + t2 * dy))
}
// 点 a 沿 a→b 方向走 d 像素
#let O-go(a, b, d) = {
  let u = O-u(a, b)
  (a.at(0) + u.at(0) * d, a.at(1) + u.at(1) * d)
}
// 切点处的小短横（沿半径方向穿过切线，半长 s）
#let O-rtick(p, c, q, s: 6) = {
  import cetz.draw: *
  let u = O-u(c, q)
  line(p(q.at(0) - u.at(0) * s, q.at(1) - u.at(1) * s), p(q.at(0) + u.at(0) * s, q.at(1) + u.at(1) * s), stroke: lt)
}
// 空心小圆点（圆心标记）
#let O-ring(p, c) = ring(p, c, r: 2.6)
// 带白底的标注（压在线上的字母，如半径线上的 R、r）
#let O-lblw(p, pt, body) = {
  import cetz.draw: *
  content(p(..pt), box(fill: white, inset: (x: 1pt, y: 0pt), tt(body)))
}
// 子图小标题（楷体）
#let O-cap(p, pt, body) = {
  import cetz.draw: *
  content(p(..pt), text(font: fonts.kai, size: 8.5pt, body))
}
// 两端带箭头的尺寸线（任意方向），可在中点放带白底的文字
#let O-dim(p, a, b, lab: none, side: none, ..style) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lt, mark: arw2, ..style)
  if lab != none {
    let m = ((a.at(0) + b.at(0)) / 2, (a.at(1) + b.at(1)) / 2)
    if side == none {
      O-lblw(p, m, lab)
    } else {
      lbl(p, (m.at(0) + side.at(0), m.at(1) + side.at(1)), lab, dir: "c", d: 0)
    }
  }
}
