// 段 E 图的共用小工具（立体几何 p.79–98）。页面渲染 dpi：200（页宽约 1003 像素；坐标取自 crop-view 叠网格图，网格数字为真实像素）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

// 折线（可由 poly 画，这里给出带粗线的版本）：bold(p, pts)
#let E-bold(p, ..a, close: false) = {
  import cetz.draw: *
  let a = a.pos()
  let pts = if a.len() == 1 { a.at(0) } else { a }
  line(..pts.map(t => p(..t)), close: close, stroke: lb)
}
// 虚线折线
#let E-dpoly(p, pts, close: false) = {
  import cetz.draw: *
  line(..pts.map(t => p(..t)), close: close, stroke: dsh)
}
// 平行四边形上的线段 a→b 方向的平行细线（用来画画影线的平面）：从 a→d 边分 n 份
// 参数：四个顶点 a b c d（顺序 a→b→c→d），画 n 条平行于 a→b 的线
#let E-hatch(p, a, b, c, d, n) = {
  import cetz.draw: *
  for i in range(1, n) {
    let t = i / n
    let q1 = (a.at(0) + (d.at(0) - a.at(0)) * t, a.at(1) + (d.at(1) - a.at(1)) * t)
    let q2 = (b.at(0) + (c.at(0) - b.at(0)) * t, b.at(1) + (c.at(1) - b.at(1)) * t)
    line(p(..q1), p(..q2), stroke: 0.4pt)
  }
}
// 点 a→b 上按比例 t 取点
#let E-lerp(a, b, t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)
// 小写字母标注（斜体，较小）
#let E-sub(p, pt, body) = lbl(p, pt, body, dir: "c", d: 0)
