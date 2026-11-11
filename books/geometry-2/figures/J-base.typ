// 段 J 图的共用小工具（几何第二册 p.176–192）。所有 J-*.typ 都 import 本文件。
// 页面渲染 dpi：120（坐标取自 build/pages/g2 的页面图与 crop-view 放大图）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

// 线性插值：lerp(a, b, t) = a + t (b − a)
#let lerp(a, b, t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)
// 点 pt 在直线 ab 上的垂足
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
// 多边形（闭合折线）
#let polyc(p, ..pts) = poly(p, pts.pos(), close: true)
// 沿线段 a→b 平移 off 像素（法向）后画带箭头的尺寸线，中间断开放文字 lab；两端带短横
#let dimlineJ(p, a, b, off, lab, gapw: 16) = {
  import cetz.draw: *
  let n = nrm(a, b)
  let a2 = (a.at(0) + n.at(0) * off, a.at(1) + n.at(1) * off)
  let b2 = (b.at(0) + n.at(0) * off, b.at(1) + n.at(1) * off)
  let dx = b2.at(0) - a2.at(0)
  let dy = b2.at(1) - a2.at(1)
  let l = calc.sqrt(dx * dx + dy * dy)
  let (ux, uy) = (dx / l, dy / l)
  let m = ((a2.at(0) + b2.at(0)) / 2, (a2.at(1) + b2.at(1)) / 2)
  line(p(..a2), p(m.at(0) - ux * gapw / 2, m.at(1) - uy * gapw / 2), stroke: lt,
    mark: (start: "stealth", fill: black, scale: 0.45))
  line(p(m.at(0) + ux * gapw / 2, m.at(1) + uy * gapw / 2), p(..b2), stroke: lt,
    mark: (end: "stealth", fill: black, scale: 0.45))
  tickat(p, a2, b2, a2, s: 6)
  tickat(p, a2, b2, b2, s: 6)
  lbl(p, m, lab, dir: "c", d: 0)
}
