// 段 I 图的共用小工具（几何第二册 p.151–176）。所有 I-*.typ 都 import 本文件。
// 页面渲染 dpi：120（坐标取自 build/pages/g2 的页面图与 crop-view 放大图）。
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
#let dist(a, b) = calc.sqrt(calc.pow(a.at(0) - b.at(0), 2) + calc.pow(a.at(1) - b.at(1), 2))
// 加粗线段（原图里描粗的线）：tseg(p, a, b)
#let tseg(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lb)
}
// 加粗虚线
#let tdseg(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: (paint: black, thickness: 1.1pt, dash: "dashed"))
}
// 虚线圆 / 虚线圆弧：darc(p, 圆心, 半径, 起角°, 止角°)（数学角，逆时针）
#let darc(p, c, r, a0, a1) = {
  import cetz.draw: *
  arc(p(..c), start: a0 * 1deg, stop: a1 * 1deg, radius: r, anchor: "origin", stroke: dsh)
}
#let carc(p, c, r, a0, a1) = {
  import cetz.draw: *
  arc(p(..c), start: a0 * 1deg, stop: a1 * 1deg, radius: r, anchor: "origin", stroke: lw)
}
// 带箭头的细线（尺寸线，一端或两端）
#let adim(p, a, b, ..style) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lt, mark: arw2, ..style)
}
// 斜向文字（沿线段方向）：rlbl(p, 位置, 角度(数学角 deg), body)
#let rlbl(p, pt, ang, body) = {
  import cetz.draw: *
  content(p(..pt), tt(body), angle: ang * 1deg)
}
// 斜线阴影（截面图用）
#let hatch = tiling(size: (3.2pt, 3.2pt))[
  #place(line(start: (0%, 100%), end: (100%, 0%), stroke: 0.4pt))
]

// 直线（过 M 与 Q）与圆（圆心 O、半径 r）的两个交点，按离 M 由近到远
#let line-circ(M, Q, O, r) = {
  let (dx, dy) = (Q.at(0) - M.at(0), Q.at(1) - M.at(1))
  let (fx, fy) = (M.at(0) - O.at(0), M.at(1) - O.at(1))
  let a = dx * dx + dy * dy
  let b = 2 * (fx * dx + fy * dy)
  let c = fx * fx + fy * fy - r * r
  let disc = calc.sqrt(b * b - 4 * a * c)
  let t1 = (-b - disc) / (2 * a)
  let t2 = (-b + disc) / (2 * a)
  ((M.at(0) + t1 * dx, M.at(1) + t1 * dy), (M.at(0) + t2 * dx, M.at(1) + t2 * dy))
}
// 由外点 M 向圆作切线，切点（side: 1 取靠上一侧，-1 取靠下一侧）
#let tang-pt(M, O, r, side: 1) = {
  let d = dist(M, O)
  let phi = calc.asin(r / d)
  let ang = dirang(O.at(0) - M.at(0), O.at(1) - M.at(1)) + side * phi
  let l = calc.sqrt(d * d - r * r)
  (M.at(0) + l * calc.cos(ang), M.at(1) - l * calc.sin(ang))
}
