// 段 P（立体几何第 3 章 §3·15–§3·18、本章提要、复习题三，p.284–301）插图共用小工具。
// 页面渲染 dpi：200（build/pages/sgP/g200，页面宽约 1000 像素；坐标取自网格图与 crop-view 放大图）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

#let P-lerp(a, b, t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)
// 椭圆上的点：中心 c、半轴 rx、ry，数学角 deg（逆时针；deg 在 180–360 之间为前半，即页面上的下半）
#let P-ept(c, rx, ry, deg) = (c.at(0) + rx * calc.cos(deg * 1deg), c.at(1) - ry * calc.sin(deg * 1deg))
// 圆上的点
#let P-cpt(c, r, deg) = P-ept(c, r, r, deg)
// 点 q 在直线 ab 上的垂足
#let P-foot(q, a, b) = {
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let t = ((q.at(0) - a.at(0)) * dx + (q.at(1) - a.at(1)) * dy) / (dx * dx + dy * dy)
  (a.at(0) + t * dx, a.at(1) + t * dy)
}
// 椭圆弧（页面坐标中心 c，数学角 a0→a1）；st 为线型
#let P-earc(p, c, rx, ry, a0, a1, st: lw) = {
  import cetz.draw: *
  arc(p(..c), start: a0 * 1deg, stop: a1 * 1deg, radius: (rx, ry), anchor: "origin", stroke: st)
}
// 水平放置的圆（透视成椭圆）：前半（页面下半）用 front 线型，后半用 back 线型；back 为 none 时不画
#let P-ell(p, c, rx, ry, front: lw, back: dsh) = {
  P-earc(p, c, rx, ry, 180, 360, st: front)
  if back != none { P-earc(p, c, rx, ry, 0, 180, st: back) }
}
// 圆弧（页面坐标中心 c，数学角 a0→a1）
#let P-carc(p, c, r, a0, a1, st: lw) = P-earc(p, c, r, r, a0, a1, st: st)
// 粗线
#let P-thick = (paint: black, thickness: 1.3pt)
#let P-tseg(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: P-thick)
}
#let P-tdseg(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: (paint: black, thickness: 1.1pt, dash: "dashed"))
}
// 细线（阴影线）
#let P-hl = (paint: black, thickness: 0.45pt)
// 从 o 到 q 的阴影线，只画 t0–t1 一段
#let P-ray(p, o, q, t0: 0.1, t1: 0.95) = {
  import cetz.draw: *
  line(p(..P-lerp(o, q, t0)), p(..P-lerp(o, q, t1)), stroke: P-hl)
}
// 字母标注：直接放在原图字母的中心位置（页面坐标）
#let L(p, x, y, body) = lbl(p, (x, y), body, dir: "c", d: 0)
// 斜线阴影（tiling 填充）：/ 方向与 \ 方向
#let P-hatch-a = tiling(size: (3.4pt, 3.4pt), place(line(start: (0%, 100%), end: (100%, 0%), stroke: 0.4pt)))
#let P-hatch-b = tiling(size: (3.4pt, 3.4pt), place(line(start: (0%, 0%), end: (100%, 100%), stroke: 0.4pt)))
// 两端箭头 / 单端箭头的细线
#let P-arr2(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lt, mark: arw2)
}
#let P-arr(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lt, mark: arw)
}
// 球的截面圆透视成椭圆时与球的轮廓相切：给定截面椭圆中心到球心的竖直距离 dy、椭圆短半轴 ry，
// 求长半轴 rx（正投影：截面所在纬度 s 满足 dy = s·cosθ，rx = √(R² − s²)，sinθ = ry / rx）
#let P-secrx(R, dy, ry) = {
  let s = calc.abs(dy)
  let rx = calc.sqrt(R * R - s * s)
  for i in range(30) {
    rx = calc.sqrt(R * R - s * s)
    let c = calc.sqrt(1 - (ry / rx) * (ry / rx))
    s = calc.abs(dy) / c
  }
  calc.sqrt(R * R - s * s)
}
