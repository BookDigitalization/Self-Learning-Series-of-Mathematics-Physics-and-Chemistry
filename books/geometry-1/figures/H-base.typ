// 段 H 图的共用小工具（几何第一册 p.125–146）。所有 H-*.typ 图文件都 import 本文件。
// 页面渲染 dpi：200（坐标取自 build/pages/g1/p*-grid.png 与 crop-view 放大图，网格数字为真实像素）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

// 两直线交点
#let H-meet(a1, a2, b1, b2) = {
  let (x1, y1) = a1
  let (x2, y2) = a2
  let (x3, y3) = b1
  let (x4, y4) = b2
  let d = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
  let t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / d
  (x1 + t * (x2 - x1), y1 + t * (y2 - y1))
}
// 线段上的点 a + t (b - a)
#let H-at(a, b, t) = (a.at(0) + t * (b.at(0) - a.at(0)), a.at(1) + t * (b.at(1) - a.at(1)))
// 点 a 向 b 方向走 d 像素
#let H-go(a, b, d) = {
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let l = calc.sqrt(dx * dx + dy * dy)
  (a.at(0) + dx / l * d, a.at(1) + dy / l * d)
}
// 点 P 到直线 AB 的垂足
#let H-foot(P, A, B) = {
  let (dx, dy) = (B.at(0) - A.at(0), B.at(1) - A.at(1))
  let t = ((P.at(0) - A.at(0)) * dx + (P.at(1) - A.at(1)) * dy) / (dx * dx + dy * dy)
  (A.at(0) + t * dx, A.at(1) + t * dy)
}
// 极坐标点：以 O 为心、半径 r、数学角 a（度，逆时针为正，页面 y 向下）
#let H-pol(O, r, a) = (O.at(0) + r * calc.cos(a * 1deg), O.at(1) - r * calc.sin(a * 1deg))
// 数学角（度）
#let H-ang(O, P) = calc.atan2(P.at(0) - O.at(0), -(P.at(1) - O.at(1))).deg()
// 圆弧：圆心 c，半径 r，起止数学角 a0 → a1（度）；默认实线，st 可传虚线样式
#let H-arc(p, c, r, a0, a1, st: lt) = {
  import cetz.draw: *
  arc(p(..c), start: a0 * 1deg, stop: a1 * 1deg, radius: r, anchor: "origin", stroke: st)
}
// 细线（lt）线段 / 无需 seg 的 stroke 冲突时用
#let H-thin(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lt)
}
// 多边形内的平行斜纹：ang 为纹线数学角（度），step 为间距（像素）
#let H-hatch(p, pts, ang, step, st: 0.5pt) = {
  import cetz.draw: *
  let d = (calc.cos(ang * 1deg), -calc.sin(ang * 1deg))
  let n = (-d.at(1), d.at(0))
  let cs = pts.map(q => n.at(0) * q.at(0) + n.at(1) * q.at(1))
  let lo = calc.min(..cs)
  let hi = calc.max(..cs)
  let c = lo + step / 2
  while c < hi {
    let xs = ()
    for i in range(pts.len()) {
      let a = pts.at(i)
      let b = pts.at(calc.rem(i + 1, pts.len()))
      let sa = n.at(0) * a.at(0) + n.at(1) * a.at(1) - c
      let sb = n.at(0) * b.at(0) + n.at(1) * b.at(1) - c
      if (sa < 0 and sb >= 0) or (sa >= 0 and sb < 0) {
        let t = sa / (sa - sb)
        xs.push((a.at(0) + t * (b.at(0) - a.at(0)), a.at(1) + t * (b.at(1) - a.at(1))))
      }
    }
    xs = xs.sorted(key: q => d.at(0) * q.at(0) + d.at(1) * q.at(1))
    for j in range(0, xs.len() - 1, step: 2) {
      line(p(..xs.at(j)), p(..xs.at(j + 1)), stroke: st)
    }
    c += step
  }
}
