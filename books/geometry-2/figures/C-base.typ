// 段 C 图的共用小工具（几何第二册 p.38–52）。所有图文件 import 本文件。
// 页面渲染 dpi：120（坐标取自 crop-view 叠网格图，网格数字为真实像素）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

#let C-sub(a, b) = (a.at(0) - b.at(0), a.at(1) - b.at(1))
#let C-lerp(a, b, t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)
#let C-dist(a, b) = calc.sqrt(calc.pow(a.at(0) - b.at(0), 2) + calc.pow(a.at(1) - b.at(1), 2))
// 直线 ab 与直线 cd 的交点
#let C-isect(a, b, c, d) = {
  let d1 = C-sub(b, a)
  let d2 = C-sub(d, c)
  let ca = C-sub(c, a)
  let t = (ca.at(0) * d2.at(1) - ca.at(1) * d2.at(0)) / (d1.at(0) * d2.at(1) - d1.at(1) * d2.at(0))
  (a.at(0) + d1.at(0) * t, a.at(1) + d1.at(1) * t)
}
// 尺寸线：a→b 两端箭头，两端带垂直短横；lab 放在中点（断开 gapw）；short 为 true 时不画两端短横
#let C-dim(p, a, b, lab, gapw: 22, bar: true) = {
  import cetz.draw: *
  let l = C-dist(a, b)
  let t = gapw / 2 / l
  let m1 = C-lerp(a, b, 0.5 - t)
  let m2 = C-lerp(a, b, 0.5 + t)
  line(p(..a), p(..m1), stroke: lt, mark: (start: "stealth", fill: black, scale: 0.45))
  line(p(..m2), p(..b), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.45))
  if bar {
    tickat(p, a, b, a, s: 5)
    tickat(p, a, b, b, s: 5)
  }
  ctext(p, C-lerp(a, b, 0.5), lab)
}
