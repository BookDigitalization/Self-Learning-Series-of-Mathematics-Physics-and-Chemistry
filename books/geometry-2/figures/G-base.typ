// 段 G 图的共用小工具（几何第二册 p.116–135，第 2 章 §2·1–§2·4）。所有图文件 import 本文件。
// 页面渲染 dpi：120（坐标取自 crop-view 叠网格图，网格数字为真实像素）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

#let G-lerp(a, b, t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)
// 点 q 到直线 ab 的垂足
#let G-foot(q, a, b) = {
  let dx = b.at(0) - a.at(0)
  let dy = b.at(1) - a.at(1)
  let t = ((q.at(0) - a.at(0)) * dx + (q.at(1) - a.at(1)) * dy) / (dx * dx + dy * dy)
  (a.at(0) + dx * t, a.at(1) + dy * t)
}
// 粗线（原图里描粗的线）
#let G-bold(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lb)
}
// 以 c 为圆心、r 为半径、位于上方（页面坐标 y 向下，故“上方”即 y 更小）的半圆弧（虚线或实线）
#let G-semi(p, c, r, ..style) = {
  import cetz.draw: *
  arc(p(..c), start: 0deg, stop: 180deg, radius: r, anchor: "origin", ..style)
}
