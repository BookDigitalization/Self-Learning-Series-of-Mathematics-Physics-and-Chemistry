// 段 H 图的共用小工具（几何第二册 p.136–151）。所有 H-*.typ 都 import 本文件。
// 页面渲染 dpi：120（坐标取自 build/pages/g2H 的页面图与 crop-view 放大图）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

// 圆上的点：圆心 c、半径 r、数学角 deg（逆时针，页面 y 向下已处理）
#let cpt(c, r, deg) = (c.at(0) + r * calc.cos(deg * 1deg), c.at(1) - r * calc.sin(deg * 1deg))
// 点 pt 在直线 ab 上的垂足
#let lerp(a, b, t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)
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
// 直线 PQ 与圆（c, r）的交点中异于 Q 的那个（Q 在圆上）
#let lc2(pp, q, c, r) = {
  let d = (pp.at(0) - q.at(0), pp.at(1) - q.at(1))
  let dd = d.at(0) * d.at(0) + d.at(1) * d.at(1)
  let t = -2 * (d.at(0) * (q.at(0) - c.at(0)) + d.at(1) * (q.at(1) - c.at(1))) / dd
  (q.at(0) + t * d.at(0), q.at(1) + t * d.at(1))
}
// 从圆外一点 pp 到圆 (c, r) 的切点；side = 1 或 -1 取两个切点之一（以页面上 y 较小者为 -1 的选取由调用者检验）
#let tanp(pp, c, r, side) = {
  let vx = pp.at(0) - c.at(0)
  let vy = pp.at(1) - c.at(1)
  let d = calc.sqrt(vx * vx + vy * vy)
  let phi = calc.atan2(vx, vy)   // 页面坐标下 (vx, vy) 的方向角（不翻转 y）
  let al = calc.acos(r / d)
  (c.at(0) + r * calc.cos(phi + side * al), c.at(1) + r * calc.sin(phi + side * al))
}
// 两圆交点：side = 1 或 -1
#let cc2(c1, r1, c2, r2, side) = {
  let dx = c2.at(0) - c1.at(0)
  let dy = c2.at(1) - c1.at(1)
  let d = calc.sqrt(dx * dx + dy * dy)
  let a = (r1 * r1 - r2 * r2 + d * d) / (2 * d)
  let h = calc.sqrt(r1 * r1 - a * a)
  let mx = c1.at(0) + a * dx / d
  let my = c1.at(1) + a * dy / d
  (mx + side * h * dy / d, my - side * h * dx / d)
}
// 同心的 n 道角弧（表示相等的角）
#let amk(p, v, a, b, r, n: 1, gap: 3) = {
  for i in range(n) { anglearc(p, v, a, b, r + i * gap) }
}
// 竖直尺寸线（两端箭头，中间在 laby 处断开放文字）
#let dimv(p, x, y0, y1, lab: none, laby: auto, gaph: 22) = {
  import cetz.draw: *
  if lab == none {
    line(p(x, y0), p(x, y1), stroke: lt, mark: arw2)
  } else {
    let m = if laby == auto { (y0 + y1) / 2 } else { laby }
    line(p(x, y0), p(x, m - gaph / 2), stroke: lt, mark: (start: "stealth", fill: black, scale: 0.45))
    line(p(x, m + gaph / 2), p(x, y1), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.45))
    lbl(p, (x, m), lab, dir: "c", d: 0)
  }
}
