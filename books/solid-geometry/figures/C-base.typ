// 段 C 图的共用小工具（立体几何 p.41–58）。所有图文件 import 本文件。
// 页面渲染 dpi：200（坐标取自 crop-view 叠网格图，网格数字为真实页面像素）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

// 粗线段（原图里描粗的线）
#let C-th(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lb)
}
// 粗虚线
#let C-dth(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: (paint: black, thickness: 0.9pt, dash: "dashed"))
}
// 线段 a→b 上点 t（0–1）
#let C-lerp(a, b, t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)
// 小字（下标、角名）
#let C-s(body) = text(font: fonts.song, size: 6.5pt, body)
// 点 pt 在直线 ab 上的垂足
#let C-foot(a, b, pt) = {
  let dx = b.at(0) - a.at(0)
  let dy = b.at(1) - a.at(1)
  let t = ((pt.at(0) - a.at(0)) * dx + (pt.at(1) - a.at(1)) * dy) / (dx * dx + dy * dy)
  (a.at(0) + dx * t, a.at(1) + dy * t)
}
// 三角形 abc 的垂心
#let C-orth(a, b, c) = {
  let f1 = C-foot(b, c, a)
  let f2 = C-foot(a, c, b)
  // 直线 a-f1 与 b-f2 的交点
  let (x1, y1) = a
  let (x2, y2) = f1
  let (x3, y3) = b
  let (x4, y4) = f2
  let d = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
  let t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / d
  (x1 + (x2 - x1) * t, y1 + (y2 - y1) * t)
}
