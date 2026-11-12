// 段 H（立体几何第 2 章 §2·5–§2·6，p.144–159）插图共用小工具。
// 页面渲染 dpi：200（build/pages/sgH200 网格图、crop-view 放大图；页面宽约 1000 像素）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

// 字母标注：直接放在原图字母的中心位置（页面坐标）
#let HL(p, x, y, body) = lbl(p, (x, y), body, dir: "c", d: 0)
// 粗线段 / 粗折线
#let Hb(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lb)
}
#let Hbp(p, pts, close: false) = {
  import cetz.draw: *
  line(..pts.map(t => p(..t)), close: close, stroke: lb)
}
// 细实线
#let Ht(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lt)
}
// 粗虚线（原图里较粗的虚线棱）
#let Hd(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: (paint: black, thickness: 0.8pt, dash: "dashed"))
}
// 带箭头的坐标轴
#let Hax(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lw, mark: arw)
}
// 向量运算
#let Hadd(a, b) = (a.at(0) + b.at(0), a.at(1) + b.at(1))
#let Hmul(a, t) = (a.at(0) * t, a.at(1) * t)
// 位似：从 v 出发按比例 t 缩放到 q
#let Hlerp(v, q, t) = (v.at(0) + (q.at(0) - v.at(0)) * t, v.at(1) + (q.at(1) - v.at(1)) * t)
// 轴上的短刻度（水平小横线）
#let Htick(p, c, s: 5) = {
  import cetz.draw: *
  line(p(c.at(0) - s, c.at(1)), p(c.at(0) + s, c.at(1)), stroke: lt)
}
// 小黑点
#let Hdot(p, c) = pdot(p, c, r: 2.2)
