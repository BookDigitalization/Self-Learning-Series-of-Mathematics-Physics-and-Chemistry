// 段 G（立体几何第 2 章 §2·1–§2·4，p.122–143）插图共用小工具。
// 页面渲染 dpi：200（build/pages/sgG200，页面宽约 1000 像素；坐标取自网格图与 crop-view 放大图）。
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
// 加粗线段 / 加粗折线 / 加粗虚线
#let tseg(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lb)
}
#let tpoly(p, pts) = {
  import cetz.draw: *
  line(..pts.map(t => p(..t)), stroke: lb)
}
#let tdseg(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: (paint: black, thickness: 1.1pt, dash: "dashed"))
}
// 字母标注：直接放在原图字母的中心位置（页面坐标）
#let L(p, x, y, body) = lbl(p, (x, y), body, dir: "c", d: 0)
// 一串点的折线（细 / 粗）
#let pl(p, ..pts) = poly(p, pts.pos())
// 闭合多边形（细线 / 粗线）
#let gpoly(p, ..pts) = poly(p, pts.pos(), close: true)
// 一组平行斜线阴影：在多边形 pts 内画间距 gap 的平行线（方向角 deg，页面坐标）
#let ghatch(p, pts, gap: 8, deg: 45, th: 0.4pt) = {
  import cetz.draw: *
  let c = calc.cos(deg * 1deg)
  let s = -calc.sin(deg * 1deg)
  // 法向投影范围
  let proj = pts.map(q => -s * q.at(0) + c * q.at(1))
  let lo = calc.min(..proj)
  let hi = calc.max(..proj)
  let n = pts.len()
  let v = lo + gap / 2
  while v < hi {
    // 与各边求交
    let xs = ()
    for i in range(n) {
      let a = pts.at(i)
      let b = pts.at(calc.rem(i + 1, n))
      let pa = -s * a.at(0) + c * a.at(1)
      let pb = -s * b.at(0) + c * b.at(1)
      if (pa - v) * (pb - v) < 0 or (pa == v and pb != v) {
        let t = (v - pa) / (pb - pa)
        xs.push(lerp(a, b, t))
      }
    }
    if xs.len() >= 2 {
      let ts = xs.map(q => c * q.at(0) + s * q.at(1))
      let i0 = ts.position(t => t == calc.min(..ts))
      let i1 = ts.position(t => t == calc.max(..ts))
      line(p(..xs.at(i0)), p(..xs.at(i1)), stroke: th)
    }
    v += gap
  }
}
