// 段 N 图的共用小工具（几何第一册 p.236–252）。所有图文件都 import 本文件。
// 页面渲染 dpi：200（坐标取自 crop-view.py 的网格图，网格数字为真实像素）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

// 圆上的点：圆心 c、半径 r、数学角 deg（逆时针为正，页面 y 向下）
#let N-cp(c, r, deg) = (c.at(0) + r * calc.cos(deg * 1deg), c.at(1) - r * calc.sin(deg * 1deg))

// 两直线交点（a1→a2 与 b1→b2 所在直线）
#let N-meet(a1, a2, b1, b2) = {
  let (x1, y1) = a1
  let (x2, y2) = a2
  let (x3, y3) = b1
  let (x4, y4) = b2
  let d = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
  let t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / d
  (x1 + t * (x2 - x1), y1 + t * (y2 - y1))
}

// 点 pt 在直线 a–b 上的垂足
#let N-foot(pt, a, b) = {
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let t = ((pt.at(0) - a.at(0)) * dx + (pt.at(1) - a.at(1)) * dy) / (dx * dx + dy * dy)
  (a.at(0) + t * dx, a.at(1) + t * dy)
}

// 三点的外接圆圆心
#let N-circum(a, b, c) = {
  let (ax, ay) = a
  let (bx, by) = b
  let (cx, cy) = c
  let d = 2 * (ax * (by - cy) + bx * (cy - ay) + cx * (ay - by))
  let a2 = ax * ax + ay * ay
  let b2 = bx * bx + by * by
  let c2 = cx * cx + cy * cy
  ((a2 * (by - cy) + b2 * (cy - ay) + c2 * (ay - by)) / d,
   (a2 * (cx - bx) + b2 * (ax - cx) + c2 * (bx - ax)) / d)
}

// 直线 a→d 与圆（圆心 c、半径 r，a 在圆上）的另一个交点
#let N-second(a, d, c) = {
  let (vx, vy) = (d.at(0) - a.at(0), d.at(1) - a.at(1))
  let t = -2 * ((a.at(0) - c.at(0)) * vx + (a.at(1) - c.at(1)) * vy) / (vx * vx + vy * vy)
  (a.at(0) + t * vx, a.at(1) + t * vy)
}

// 单位向量 a→b
#let N-unit(a, b) = {
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let l = calc.sqrt(dx * dx + dy * dy)
  (dx / l, dy / l)
}

// 点 a 沿方向向量 u 走 d 像素
#let N-mv(a, u, d) = (a.at(0) + u.at(0) * d, a.at(1) + u.at(1) * d)

// 数字标注（角 1、2…）：直接放在页面坐标处
#let N-num(p, x, y, body) = {
  import cetz.draw: *
  content(p(x, y), tsm(body))
}

// 圆心小圆点＋字母
#let N-ctr(p, c, body, dir: "s", d: 11) = {
  ring(p, c, r: 2.5)
  lbl(p, c, body, dir: dir, d: d)
}

// 小叉（作图时两弧的交点记号）
#let N-cross(p, c, s: 8) = {
  import cetz.draw: *
  line(p(c.at(0) - s, c.at(1) - s), p(c.at(0) + s, c.at(1) + s), stroke: lt)
  line(p(c.at(0) - s, c.at(1) + s), p(c.at(0) + s, c.at(1) - s), stroke: lt)
}
