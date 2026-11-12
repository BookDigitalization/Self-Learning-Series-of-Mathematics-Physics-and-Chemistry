// 段 N（立体几何第 3 章 圆柱、圆锥和圆台的体积 §3·8–§3·10，p.251–265）插图共用小工具。
// 页面渲染 dpi：200（build/pages/sgN，页面宽约 1000 像素；坐标取自网格图与 crop-view 放大图）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

#let N-dsh = (paint: black, thickness: 0.6pt, dash: "dashed")
#let N-dd = (paint: black, thickness: 0.6pt, dash: "dash-dotted")

#let N-lerp(a, b, t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)
// 直线 ab 与直线 cd 的交点
#let N-isect(a, b, c, d) = {
  let (x1, y1) = a
  let (x2, y2) = b
  let (x3, y3) = c
  let (x4, y4) = d
  let den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
  let t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / den
  (x1 + t * (x2 - x1), y1 + t * (y2 - y1))
}
// 点 q 在直线 ab 上的垂足
#let N-foot(a, b, q) = {
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let t = ((q.at(0) - a.at(0)) * dx + (q.at(1) - a.at(1)) * dy) / (dx * dx + dy * dy)
  (a.at(0) + t * dx, a.at(1) + t * dy)
}
// 椭圆上的点：中心 c、半轴 rx、ry，数学角 t（度，逆时针；页面 y 向下已处理）
#let N-ept(c, rx, ry, t) = (c.at(0) + rx * calc.cos(t * 1deg), c.at(1) - ry * calc.sin(t * 1deg))
// 椭圆弧 a0→a1（度）；st 为线型
#let N-earc(p, c, rx, ry, a0, a1, st: lw, n: 60) = {
  import cetz.draw: *
  let pts = range(n + 1).map(i => p(..N-ept(c, rx, ry, a0 + (a1 - a0) * i / n)))
  line(..pts, stroke: st)
}
// 整个椭圆（实线）
#let N-ell(p, c, rx, ry, st: lw) = N-earc(p, c, rx, ry, 0, 360, st: st)
// 底面椭圆：前半（下半）实线，后半（上半）虚线
#let N-bell(p, c, rx, ry) = {
  N-earc(p, c, rx, ry, 180, 360)
  N-earc(p, c, rx, ry, 0, 180, st: N-dsh)
}
// 加粗线段、点划线段
#let N-tseg(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lb)
}
#let N-ddseg(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: N-dd)
}
// 字母标注：直接放在原图字母的中心位置（页面坐标）
#let N-L(p, x, y, body) = lbl(p, (x, y), body, dir: "c", d: 0)
