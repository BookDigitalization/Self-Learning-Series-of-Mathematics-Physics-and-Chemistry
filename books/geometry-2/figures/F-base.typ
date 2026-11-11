// 段 F 图的共用小工具（几何第二册 p.93–114）。所有 F-*.typ 都 import 本文件。
// 页面渲染 dpi：120（坐标取自 build/pages/g2f 的页面图）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

// 点 P 关于位似中心 O、比 r 的位似像：O + r (P − O)
#let hom(O, r, P) = (O.at(0) + r * (P.at(0) - O.at(0)), O.at(1) + r * (P.at(1) - O.at(1)))
// 线性插值
#let lerp(a, b, t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)
// 从 O 沿 O→P 方向的虚线，t0、t1 为以 |OP| 为单位的起止位置
#let dray(p, O, P, t0, t1) = {
  import cetz.draw: *
  line(p(..hom(O, t0, P)), p(..hom(O, t1, P)), stroke: dsh)
}
// 粗线折线（原图里描粗的线）
#let bpoly(p, pts, close: false) = {
  import cetz.draw: *
  line(..pts.map(t => p(..t)), close: close, stroke: lb)
}
// 线段中点处沿 a→b 方向的小箭头
#let amid(p, a, b, s: 7) = {
  import cetz.draw: *
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let l = calc.sqrt(dx * dx + dy * dy)
  let (ux, uy) = (dx / l, dy / l)
  let (mx, my) = ((a.at(0) + b.at(0)) / 2, (a.at(1) + b.at(1)) / 2)
  line(p(mx - ux * s - uy * s * 0.5, my - uy * s + ux * s * 0.5), p(mx + ux * s, my + uy * s),
    p(mx - ux * s + uy * s * 0.5, my - uy * s - ux * s * 0.5), close: true, fill: black, stroke: 0.4pt)
}
// 以 A 为一个顶点的内接菱形（另一顶点 D 在 BC 上）：返回 (F, E, D)，F 在 AB 上，E 在 AC 上
#let rhomb(A, B, C) = {
  let c = calc.sqrt(calc.pow(B.at(0) - A.at(0), 2) + calc.pow(B.at(1) - A.at(1), 2))
  let b = calc.sqrt(calc.pow(C.at(0) - A.at(0), 2) + calc.pow(C.at(1) - A.at(1), 2))
  let s = b * c / (b + c)
  let F = lerp(A, B, s / c)
  let E = lerp(A, C, s / b)
  (F, E, (F.at(0) + E.at(0) - A.at(0), F.at(1) + E.at(1) - A.at(1)))
}
// 两条线（a→b 与 c→d）的交点
#let isect(a, b, c, d) = {
  let (x1, y1) = a
  let (x2, y2) = b
  let (x3, y3) = c
  let (x4, y4) = d
  let den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
  let t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / den
  (x1 + t * (x2 - x1), y1 + t * (y2 - y1))
}
// 圆上的点：圆心 c、半径 r、数学角 deg
#let cpt(c, r, deg) = (c.at(0) + r * calc.cos(deg * 1deg), c.at(1) - r * calc.sin(deg * 1deg))
