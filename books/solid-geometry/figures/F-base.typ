// 段 F（立体几何第 1 章 §1·26–§1·29、本章提要、复习题一，p.99–121）插图共用小工具。
// 页面渲染 dpi：200（build/pages/sg-F，页面宽约 1000 像素；坐标取自网格图与 crop-view 放大图）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

#let lerp(a, b, t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)
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
// 加粗线段 / 加粗折线 / 加粗虚线
#let tseg(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lb)
}
#let tpoly(p, pts) = {
  import cetz.draw: *
  line(..pts.map(t => p(..t)), stroke: lb)
}
#let tdseg(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: (paint: black, thickness: 1.1pt, dash: "dashed"))
}
// 字母标注：直接放在原图字母的中心位置（页面坐标）
#let L(p, x, y, body) = lbl(p, (x, y), body, dir: "c", d: 0)
// 一串点的折线（细 / 粗）
#let pl(p, ..pts) = poly(p, pts.pos())
