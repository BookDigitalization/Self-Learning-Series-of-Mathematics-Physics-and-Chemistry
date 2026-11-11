// 段 O 图的共用小工具（几何第二册 p.272–290，第 5 章 §5·2–§5·4）。页面渲染 dpi：120。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

// 以 c 为圆心、半径 r、数学角 deg（逆时针，度）处的点（页面坐标，y 向下）
#let O-pt(c, r, deg) = (c.at(0) + r * calc.cos(deg * 1deg), c.at(1) - r * calc.sin(deg * 1deg))
// 圆弧：数学角 a0 → a1（逆时针，度）；st 为线型
#let O-arc(p, c, r, a0, a1, st: lw, ..m) = {
  import cetz.draw: *
  arc(p(..c), start: a0 * 1deg, stop: a1 * 1deg, radius: r, anchor: "origin", stroke: st, ..m)
}
#let O-circ(p, c, r, st: lw) = {
  import cetz.draw: *
  circle(p(..c), radius: r, stroke: st)
}
#let O-ln(p, a, b, st: lw, ..m) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: st, ..m)
}
// 折线 / 多边形：O-poly(p, (a, b, c), st: lb, close: true)
#let O-poly(p, pts, st: lw, close: false) = {
  import cetz.draw: *
  line(..pts.map(t => p(..t)), stroke: st, close: close)
}
// 点 pt 在以 c 为圆心、r 为半径的圆内？
#let O-inc(c, pt, r) = calc.pow(pt.at(0) - c.at(0), 2) + calc.pow(pt.at(1) - c.at(1), 2) < r * r

// 阴影线：在 box = (x0, y0, x1, y1) 内，方向角 ang（度，逆时针，页面上向右上为正）、间距 sp 的平行线，
// 只画 inside(x, y) 为真的部分。
#let O-hatch(p, inside, box, ang, sp, st: 0.45pt) = {
  import cetz.draw: *
  let (x0, y0, x1, y1) = box
  let a = ang * 1deg
  let (dx, dy) = (calc.cos(a), -calc.sin(a))
  let (nx, ny) = (-dy, dx)
  let (cx, cy) = ((x0 + x1) / 2, (y0 + y1) / 2)
  let hl = calc.sqrt(calc.pow(x1 - x0, 2) + calc.pow(y1 - y0, 2)) / 2
  let ns = int(hl / sp) + 1
  let n = int(2 * hl / 1.5) + 1
  for i in range(-ns, ns + 1) {
    let s = i * sp
    let run = none
    let last = none
    for j in range(n + 1) {
      let t = -hl + j * 1.5
      let x = cx + s * nx + t * dx
      let y = cy + s * ny + t * dy
      let ins = inside(x, y)
      if ins and run == none { run = (x, y) }
      if not ins and run != none {
        line(p(..run), p(..last), stroke: st)
        run = none
      }
      if ins { last = (x, y) }
    }
    if run != none { line(p(..run), p(..last), stroke: st) }
  }
}
