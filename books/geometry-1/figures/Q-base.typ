// 段 Q 图的共用小工具（几何第一册 p.289–312），内容取自 P-base.typ，另加 Q- 前缀的补充工具。
// 页面渲染 dpi：200（坐标取自 build/pages/g1P/p*-grid.png，网格数字为真实像素）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

// 圆上一点：圆心 c、半径 r、数学角 a（度，逆时针为正；页面 y 向下）
#let P-pt(c, r, a) = (c.at(0) + r * calc.cos(a * 1deg), c.at(1) - r * calc.sin(a * 1deg))
// 点 q 相对圆心 c 的数学角（度）
#let P-ang(c, q) = calc.atan2(q.at(0) - c.at(0), -(q.at(1) - c.at(1))).deg()
// 点 a 向 b 方向走 d 像素
#let P-go(a, b, d) = {
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let l = calc.sqrt(dx * dx + dy * dy)
  (a.at(0) + dx / l * d, a.at(1) + dy / l * d)
}
// 两直线交点
#let P-meet(a1, a2, b1, b2) = {
  let (x1, y1) = a1
  let (x2, y2) = a2
  let (x3, y3) = b1
  let (x4, y4) = b2
  let d = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
  let t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / d
  (x1 + t * (x2 - x1), y1 + t * (y2 - y1))
}
// 直线 a→b 与圆 (c, r) 的两个交点
#let P-lc(a, b, c, r) = {
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let (fx, fy) = (a.at(0) - c.at(0), a.at(1) - c.at(1))
  let qa = dx * dx + dy * dy
  let qb = 2 * (fx * dx + fy * dy)
  let qc = fx * fx + fy * fy - r * r
  let disc = calc.sqrt(calc.max(0, qb * qb - 4 * qa * qc))
  let t1 = (-qb - disc) / (2 * qa)
  let t2 = (-qb + disc) / (2 * qa)
  ((a.at(0) + t1 * dx, a.at(1) + t1 * dy), (a.at(0) + t2 * dx, a.at(1) + t2 * dy))
}
// 过三点的圆：返回 (圆心, 半径)
#let P-circ3(a, b, c) = {
  let (ax, ay) = a
  let (bx, by) = b
  let (cx, cy) = c
  let d = 2 * (ax * (by - cy) + bx * (cy - ay) + cx * (ay - by))
  let sa = ax * ax + ay * ay
  let sb = bx * bx + by * by
  let sc = cx * cx + cy * cy
  let ux = (sa * (by - cy) + sb * (cy - ay) + sc * (ay - by)) / d
  let uy = (sa * (cx - bx) + sb * (ax - cx) + sc * (bx - ax)) / d
  (( ux, uy), calc.sqrt((ax - ux) * (ax - ux) + (ay - uy) * (ay - uy)))
}
// 圆弧（折线逼近）：a0 → a1（度，可递减），st 为线条样式
#let parc(p, c, r, a0, a1, st: lw, n: 60) = {
  import cetz.draw: *
  let pts = range(n + 1).map(i => p(..P-pt(c, r, a0 + (a1 - a0) * i / n)))
  line(..pts, stroke: st)
}
// 过三点 a、b、c 的弧：从 a 经 b 到 c
#let P-arc3(p, a, b, c, st: lw) = {
  let (o, r) = P-circ3(a, b, c)
  let a0 = P-ang(o, a)
  let am = P-ang(o, b)
  let a1 = P-ang(o, c)
  let ccw(x, y) = calc.rem(calc.rem(y - x, 360) + 360, 360)
  if ccw(a0, am) < ccw(a0, a1) {
    parc(p, o, r, a0, a0 + ccw(a0, a1), st: st)
  } else {
    parc(p, o, r, a0, a0 - ccw(a1, a0), st: st)
  }
}
// 两圆公切线的切点 (t1, t2)：kind 为 "out"（外公切线）或 "in"（内公切线）；
// s = -1 取页面上较靠上（法向朝上）的一条，s = 1 取另一条
#let P-tan(c1, r1, c2, r2, kind, s) = {
  let (dx, dy) = (c2.at(0) - c1.at(0), c2.at(1) - c1.at(1))
  let l = calc.sqrt(dx * dx + dy * dy)
  let (ux, uy) = (dx / l, dy / l)
  let cs = if kind == "out" { (r1 - r2) / l } else { (r1 + r2) / l }
  let sn = s * calc.sqrt(1 - cs * cs)
  let n = (ux * cs - uy * sn, uy * cs + ux * sn)
  let t1 = (c1.at(0) + r1 * n.at(0), c1.at(1) + r1 * n.at(1))
  let t2 = if kind == "out" {
    (c2.at(0) + r2 * n.at(0), c2.at(1) + r2 * n.at(1))
  } else {
    (c2.at(0) - r2 * n.at(0), c2.at(1) - r2 * n.at(1))
  }
  (t1, t2)
}
// 在线段 a→b 上两端各延长 e1、e2 像素后画线
#let P-line(p, a, b, e1: 0, e2: 0, ..style) = {
  import cetz.draw: *
  line(p(..P-go(a, b, -e1)), p(..P-go(b, a, -e2)), stroke: lw, ..style)
}
// 带“圆心”小圆圈的点
#let P-cen(p, c, r: 3) = {
  import cetz.draw: *
  circle(p(..c), radius: r, fill: white, stroke: lt)
}
// 用于“已知线段”：两端带短横并标字母/长度
#let P-given(p, a, b, lab, ldir: (0, -11)) = {
  pseg(p, a, b)
  lbl(p, ((a.at(0) + b.at(0)) / 2 + ldir.at(0), (a.at(1) + b.at(1)) / 2 + ldir.at(1)), lab, dir: "c", d: 0)
}
// 已知角：顶点 v，两边端点 a、b，弧半径 r，标注 lab 放在 labpt
#let P-angle(p, v, a, b, r, lab, labpt) = {
  import cetz.draw: *
  line(p(..v), p(..a), stroke: lw)
  line(p(..v), p(..b), stroke: lw)
  anglearc(p, v, a, b, r)
  lbl(p, labpt, lab, dir: "c", d: 0)
}
// 跑道形（两个半圆加两条直边）：圆心 c1（左）、c2（右），半径 r
#let P-stadium(p, c1, c2, r, st: lw) = {
  import cetz.draw: *
  line(p(c1.at(0), c1.at(1) - r), p(c2.at(0), c2.at(1) - r), stroke: st)
  line(p(c1.at(0), c1.at(1) + r), p(c2.at(0), c2.at(1) + r), stroke: st)
  parc(p, c2, r, 90, -90, st: st)
  parc(p, c1, r, 90, 270, st: st)
}
// 带箭头的短线（传动带上的方向箭头等）
#let P-arrow(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lt, mark: arw)
}
#let P-dashdot = (paint: black, thickness: 0.5pt, dash: "dash-dotted")
// 圆（可指定线型；circ 已带 stroke，不能再传 stroke）
#let P-c(p, c, r, st: lw) = {
  import cetz.draw: *
  circle(p(..c), radius: r, stroke: st)
}

// ───────── 段 Q 补充 ─────────
// 点 q 到直线 a→b 的垂足
#let Q-foot(q, a, b) = {
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let t = ((q.at(0) - a.at(0)) * dx + (q.at(1) - a.at(1)) * dy) / (dx * dx + dy * dy)
  (a.at(0) + t * dx, a.at(1) + t * dy)
}
// 线段 x→y 上的等边三角形顶点，s = 1 取 x→y 方向左侧（页面上，y 向下时在视觉左手边），s = -1 取另一侧
#let Q-apex(x, y, s) = {
  let (dx, dy) = (y.at(0) - x.at(0), y.at(1) - x.at(1))
  let h = calc.sqrt(3) / 2
  ((x.at(0) + y.at(0)) / 2 + s * dy * h, (x.at(1) + y.at(1)) / 2 - s * dx * h)
}
// 中点
#let Q-mid(a, b) = ((a.at(0) + b.at(0)) / 2, (a.at(1) + b.at(1)) / 2)
// 点 a + t (b - a)
#let Q-lerp(a, b, t) = (a.at(0) + t * (b.at(0) - a.at(0)), a.at(1) + t * (b.at(1) - a.at(1)))
// 带角度的文字标注（angle：逆时针为正）
#let Q-lblr(p, pt, body, ang) = {
  import cetz.draw: *
  content(p(..pt), tt(body), angle: ang)
}
// 圆心小圆圈 + 字母
#let Q-lw = lw

// 阴影线（斜线填充）
#let Q-hatch = tiling(size: (3.2pt, 3.2pt), place(line(start: (0%, 100%), end: (100%, 0%), stroke: 0.35pt)))
