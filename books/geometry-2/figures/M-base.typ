// 段 M 图的共用小工具（几何第二册 §4·2–§4·4，p.230–258）。所有 M-*.typ 图文件都 import 本文件。
// 页面渲染 dpi：120（坐标取自 build/pages/g2/p*-grid.png，网格数字为真实像素）。
// 约定：px-canvas 的 origin 是图区左上角的页面坐标；点用页面坐标 (x, y)，y 向下。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

// 圆周上的点：圆心 c，半径 r，数学角 a（度，逆时针为正，页面 y 向下已换算）
#let M-pt(c, r, a) = (c.at(0) + r * calc.cos(a * 1deg), c.at(1) - r * calc.sin(a * 1deg))
// 圆内接正 n 边形的顶点（从数学角 a0 起逆时针）
#let M-ngon(c, r, n, a0) = range(n).map(i => M-pt(c, r, a0 + 360 / n * i))
// 线段上的点 a + t (b - a)
#let M-at(a, b, t) = (a.at(0) + t * (b.at(0) - a.at(0)), a.at(1) + t * (b.at(1) - a.at(1)))
// 两点中点
#let M-mid(a, b) = M-at(a, b, 0.5)
// 两点距离
#let M-dist(a, b) = calc.sqrt(calc.pow(a.at(0) - b.at(0), 2) + calc.pow(a.at(1) - b.at(1), 2))
// 以 c 为圆心、从 a 到 b 的圆弧（取小于 180° 的一侧；a、b 到 c 等距）
#let M-arc(p, c, a, b, ..style) = {
  import cetz.draw: *
  let r = M-dist(a, c)
  let t1 = dirang(a.at(0) - c.at(0), a.at(1) - c.at(1))
  let t2 = dirang(b.at(0) - c.at(0), b.at(1) - c.at(1))
  let d = calc.rem(calc.rem((t2 - t1).deg(), 360) + 360, 360) * 1deg
  let (s, e) = if d <= 180deg { (t1, t1 + d) } else { (t2, t2 + (360deg - d)) }
  arc(p(..c), start: s, stop: e, radius: r, anchor: "origin", ..style)
}
// 带样式的线段（实线粗细可调）
#let M-line(p, a, b, st) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: st)
}
#let dashdot = (paint: black, thickness: 0.6pt, dash: "dash-dotted")
#let dashb = (paint: black, thickness: 1.1pt, dash: "dashed")
// 斜线、网格底纹（原图里的阴影）
#let M-hatch = tiling(size: (2.4pt, 2.4pt), {
  place(line(start: (0pt, 2.4pt), end: (2.4pt, 0pt), stroke: 0.5pt))
})
#let M-grid = tiling(size: (2.6pt, 2.6pt), {
  place(line(start: (0pt, 1.3pt), end: (2.6pt, 1.3pt), stroke: 0.7pt))
  place(line(start: (1.3pt, 0pt), end: (1.3pt, 2.6pt), stroke: 0.7pt))
})
// 白底的文字标注（压在线上时用）
#let M-wlbl(p, pt, body) = {
  import cetz.draw: *
  content(p(..pt), tt(body), fill: white, frame: "rect", stroke: none, padding: 1pt)
}
// 径向短横记号：在圆周点 pt 处画一小段垂直于圆周的短线（圆心 c）
#let M-radtick(p, c, pt, s: 6) = {
  import cetz.draw: *
  let l = M-dist(pt, c)
  let (ux, uy) = ((pt.at(0) - c.at(0)) / l, (pt.at(1) - c.at(1)) / l)
  line(p(pt.at(0) - ux * s, pt.at(1) - uy * s), p(pt.at(0) + ux * s, pt.at(1) + uy * s), stroke: lw)
}
