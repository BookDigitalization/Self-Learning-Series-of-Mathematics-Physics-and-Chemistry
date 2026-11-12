// 段 J（立体几何第 2 章 §2·10–§2·14，p.176–198）插图共用小工具。
// 页面渲染 dpi：200（build/pages/sgJ，页面宽约 1003 像素；坐标取自网格图与 crop-view 放大图）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

#let Jlerp(a, b, t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)
// 实线折线 / 虚线折线（点用页面坐标）
#let JS(p, ..pts) = {
  import cetz.draw: *
  line(..pts.pos().map(t => p(..t)), stroke: lw)
}
#let JD(p, ..pts) = {
  import cetz.draw: *
  line(..pts.pos().map(t => p(..t)), stroke: dsh)
}
// 线段 a→b：前 t 段实线、其余虚线（被遮住的一段）
#let JSD(p, a, b, t) = {
  JS(p, a, Jlerp(a, b, t))
  JD(p, Jlerp(a, b, t), b)
}
// 细实线
#let JT(p, ..pts) = {
  import cetz.draw: *
  line(..pts.pos().map(t => p(..t)), stroke: lt)
}
// 阴影：在边 a→b 与 a→c 之间画 n 条平行于 bc 的细线
#let Jhatch(p, a, b, c, n: 8) = {
  import cetz.draw: *
  for i in range(1, n + 1) {
    let t = i / (n + 1)
    line(p(..Jlerp(a, b, t)), p(..Jlerp(a, c, t)), stroke: 0.45pt)
  }
}
// 字母标注：放在原图字母中心的位置（页面坐标）
#let L(p, x, y, body) = lbl(p, (x, y), body, dir: "c", d: 0)
