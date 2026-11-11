// 段 Q：总复习题（原书 p.304–308）里的无编号插图。页面渲染 dpi：120。
// 第 6、10、11、13、19（两幅）、23、24、29、30、33 题。
#import "/common/geo.typ": *

#let Qk = 0.0152cm   // 1 像素 ≈ 0.0152 cm

// 圆上的点（数学角，度，逆时针为正；页面 y 向下）
#let Q-pc(c, r, a) = (c.at(0) + r * calc.cos(a * 1deg), c.at(1) - r * calc.sin(a * 1deg))
#let Q-lerp(a, b, t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)
// 直线 a b 与直线 c d 的交点
#let Q-isect(a, b, c, d) = {
  let (x1, y1, x2, y2) = (a.at(0), a.at(1), b.at(0), b.at(1))
  let (x3, y3, x4, y4) = (c.at(0), c.at(1), d.at(0), d.at(1))
  let den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
  let t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / den
  (x1 + t * (x2 - x1), y1 + t * (y2 - y1))
}
// 过圆上一点 a、起点 s 的直线，与圆的另一个交点
#let Q-second(s, a, o, r) = {
  let v = (a.at(0) - s.at(0), a.at(1) - s.at(1))
  let w = (s.at(0) - o.at(0), s.at(1) - o.at(1))
  let vv = v.at(0) * v.at(0) + v.at(1) * v.at(1)
  let c = w.at(0) * w.at(0) + w.at(1) * w.at(1) - r * r
  let t = c / vv
  (s.at(0) + t * v.at(0), s.at(1) + t * v.at(1))
}
// 从外点 s 向圆 (o, r) 作切线，side = -1 取偏上（页面角更小）的一条，+1 取偏下的一条；返回切点
#let Q-tangent(s, o, r, side) = {
  let dx = o.at(0) - s.at(0)
  let dy = o.at(1) - s.at(1)
  let d = calc.sqrt(dx * dx + dy * dy)
  let th = calc.atan2(dx, dy) + side * calc.asin(r / d)
  let l = calc.sqrt(d * d - r * r)
  (s.at(0) + l * calc.cos(th), s.at(1) + l * calc.sin(th))
}
// 圆与从 s 出发方向 u 的射线的交点（取较远的一个：far = true）
#let Q-ray(s, u, o, r, far: true) = {
  let l = calc.sqrt(u.at(0) * u.at(0) + u.at(1) * u.at(1))
  let (ux, uy) = (u.at(0) / l, u.at(1) / l)
  let w = (s.at(0) - o.at(0), s.at(1) - o.at(1))
  let b = ux * w.at(0) + uy * w.at(1)
  let c = w.at(0) * w.at(0) + w.at(1) * w.at(1) - r * r
  let disc = calc.sqrt(b * b - c)
  let t = if far { -b + disc } else { -b - disc }
  (s.at(0) + t * ux, s.at(1) + t * uy)
}

// ───────── 第 6 题（p.304）─────────
#let fig-Q-6(width: 330 * Qk) = px-canvas(330, 195, origin: (130, 1090), width: width, (p, u) => {
  import cetz.draw: *
  let O = (316, 1055)
  let r = 109
  let P = (145, 1055)
  let A = (207, 1055)
  let B = (425, 1055)
  let D = (246.5, 1055)
  let C = (246.5, 1055 - calc.sqrt(r * r - 69.5 * 69.5))
  let T = (C.at(0) + 77, C.at(1) - 64)
  circ(p, O, r, stroke: lb)
  seg(p, P, B, stroke: lb)
  seg(p, P, T)
  seg(p, C, A)
  seg(p, C, D)
  seg(p, C, B)
  rtmark(p, D, O, C, s: 8)
  anglearc(p, C, P, A, 16)
  anglearc(p, C, A, D, 20)
  ring(p, O, r: 3)
  lbl(p, C, $C$, dir: "nw", d: 11)
  lbl(p, P, $P$, dir: "s", d: 12)
  lbl(p, A, $A$, dir: "s", d: 12)
  lbl(p, D, $D$, dir: "s", d: 12)
  lbl(p, O, $O$, dir: "s", d: 12)
  lbl(p, B, $B$, dir: "ne", d: 10)
})

// ───────── 第 10 题（p.304）─────────
#let fig-Q-10(width: 245 * Qk) = px-canvas(245, 225, origin: (520, 1160), width: width, (p, u) => {
  import cetz.draw: *
  let A = (584, 946)
  let B = (552, 1031)
  let C = (718, 1025)
  let D = (750, 940)
  let P = Q-lerp(D, C, 2.376)
  let N = Q-isect(A, P, B, C)
  let M = Q-isect(A, P, B, D)
  poly(p, (A, B, C, D), close: true, stroke: lb)
  seg(p, A, C, stroke: lt)
  seg(p, B, D, stroke: lt)
  seg(p, A, P, stroke: lt)
  line(p(..C), p(..P), stroke: (paint: black, thickness: 1pt, dash: "dashed"))
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "sw", d: 10)
  lbl(p, C, $C$, dir: "se", d: 10)
  lbl(p, D, $D$, dir: "ne", d: 10)
  lbl(p, M, $M$, dir: "w", d: 14)
  lbl(p, N, $N$, dir: "s", d: 11)
  lbl(p, P, $P$, dir: "s", d: 10)
})

// ───────── 第 11 题（p.305）─────────
#let fig-Q-11(width: 300 * Qk) = px-canvas(300, 260, origin: (190, 845), width: width, (p, u) => {
  import cetz.draw: *
  let A = (294, 614)
  let B = (216, 816)
  let C = (480, 815)
  let D = Q-lerp(A, B, 1 / 3)
  let F = Q-lerp(A, B, 2 / 3)
  let E = Q-lerp(A, C, 1 / 3)
  let G = Q-lerp(A, C, 2 / 3)
  poly(p, (A, B, C), close: true, stroke: lb)
  seg(p, D, E, stroke: lb)
  seg(p, F, G, stroke: lb)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "sw", d: 10)
  lbl(p, C, $C$, dir: "se", d: 10)
  lbl(p, D, $D$, dir: "w", d: 10)
  lbl(p, E, $E$, dir: "e", d: 10)
  lbl(p, F, $F$, dir: "w", d: 10)
  lbl(p, G, $G$, dir: "e", d: 10)
})

// ───────── 第 13 题（p.305）─────────
#let fig-Q-13(width: 370 * Qk) = px-canvas(370, 275, origin: (500, 845), width: width, (p, u) => {
  import cetz.draw: *
  let O = (733, 708)
  let A = (524, 702)
  let R = 130
  let r = 78
  let B = Q-tangent(A, O, R, -1)
  let Tin = Q-tangent(A, O, r, 1)
  let dir = (Tin.at(0) - A.at(0), Tin.at(1) - A.at(1))
  let C = Q-ray(A, dir, O, R, far: false)
  let D = Q-ray(A, dir, O, R, far: true)
  circ(p, O, R, stroke: lb)
  circ(p, O, r, stroke: lb)
  seg(p, A, B, stroke: lb)
  seg(p, A, D, stroke: lb)
  seg(p, A, O, stroke: lb)
  ring(p, O, r: 3)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, O, $O$, dir: "e", d: 11)
  lbl(p, B, $B$, dir: "nw", d: 10)
  lbl(p, C, $C$, dir: "sw", d: 11)
  lbl(p, D, $D$, dir: "se", d: 11)
})

// ───────── 第 19 题（p.306）两幅 ─────────
#let fig-Q-19a(width: 290 * Qk) = px-canvas(290, 170, origin: (150, 700), width: width, (p, u) => {
  import cetz.draw: *
  let A = (162, 667)
  let B = (432, 667)
  let C = (232, 538)
  let D = (242, 667)
  poly(p, (A, B, C), close: true, stroke: lb)
  seg(p, C, D, stroke: lb)
  anglearc(p, C, A, D, 16)
  anglearc(p, C, A, D, 20)
  anglearc(p, B, A, C, 22)
  anglearc(p, B, A, C, 26)
  dimh(p, 162, 432, 679, lab: $a$)
  lbl(p, C, $C$, dir: "n", d: 10)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, (254, 657), $D$, dir: "c", d: 0)
  lbl(p, (440, 657), $B$, dir: "c", d: 0)
  lbl(p, (194, 659), $x$, dir: "c", d: 0)
  lbl(p, (187, 598), $b$, dir: "c", d: 0)
})
#let fig-Q-19b(width: 300 * Qk) = px-canvas(300, 170, origin: (505, 700), width: width, (p, u) => {
  import cetz.draw: *
  let A = (520, 665)
  let B = (747, 665)
  let C = (725, 531)
  let D = (790, 665)
  poly(p, (A, D, C), close: true, stroke: lb)
  seg(p, C, B, stroke: lb)
  anglearc(p, C, A, D, 16)
  anglearc(p, C, A, D, 20)
  anglearc(p, B, A, C, 24)
  dimh(p, 520, 790, 678, lab: $x$)
  lbl(p, C, $C$, dir: "n", d: 10)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, (760, 653), $B$, dir: "c", d: 0)
  lbl(p, D, $D$, dir: "e", d: 11)
  lbl(p, (670, 654), $a$, dir: "c", d: 0)
  lbl(p, (622, 587), $b$, dir: "c", d: 0)
})

// ───────── 第 23 题（p.307）─────────
#let fig-Q-23(width: 290 * Qk) = px-canvas(290, 205, origin: (250, 440), width: width, (p, u) => {
  import cetz.draw: *
  let O = (414.5, 337.5)
  let r = 82
  let M = (265, 290)
  let P = (320, 412.5)
  let A = Q-pc(O, r, 197)
  let Q = Q-tangent(M, O, r, -1)
  let B = Q-second(M, A, O, r)
  let C = Q-second(P, A, O, r)
  let D = Q-second(P, B, O, r)
  circ(p, O, r, stroke: lb)
  seg(p, M, Q, stroke: lb)
  seg(p, M, P, stroke: lb)
  seg(p, M, B)
  seg(p, P, C)
  seg(p, P, D, stroke: lb)
  seg(p, C, D)
  lbl(p, M, $M$, dir: "w", d: 11)
  lbl(p, Q, $Q$, dir: "n", d: 10)
  lbl(p, C, $C$, dir: "se", d: 9)
  lbl(p, A, $A$, dir: "w", d: 10)
  lbl(p, P, $P$, dir: "sw", d: 10)
  lbl(p, B, $B$, dir: "s", d: 11)
  lbl(p, D, $D$, dir: "s", d: 11)
})

// ───────── 第 24 题（p.307）─────────
#let fig-Q-24(width: 300 * Qk) = px-canvas(300, 160, origin: (550, 435), width: width, (p, u) => {
  import cetz.draw: *
  let A = (570, 404)
  let D = (763.5, 404)
  let B = (570 + 129 * calc.cos(60deg), 404 - 129 * calc.sin(60deg))
  let C = (B.at(0) + 193.5, B.at(1))
  poly(p, (A, D, C, B), close: true, stroke: lb)
  seg(p, B, D, stroke: lb)
  seg(p, C, Q-lerp(C, A, 0.82), stroke: lb)
  anglearc(p, A, D, B, 26)
  lbl(p, (606, 386), $60°$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, B, $B$, dir: "n", d: 10)
  lbl(p, C, $C$, dir: "ne", d: 10)
  lbl(p, D, $D$, dir: "se", d: 10)
  lbl(p, (667, 415), $a$, dir: "c", d: 0)
  lbl(p, (592, 341), $b$, dir: "c", d: 0)
})

// ───────── 第 29 题（p.307）─────────
#let fig-Q-29(width: 190 * Qk) = px-canvas(190, 215, origin: (695, 895), width: width, (p, u) => {
  import cetz.draw: *
  let A = (822.5, 692.5)
  let B = (705, 872.5)
  let C = (872, 872)
  let M = Q-lerp(A, B, 0.75)
  let N = Q-lerp(A, C, 0.692)
  poly(p, (A, B, C), close: true, stroke: lb)
  let e0 = Q-lerp(N, M, 1.19)
  let e1 = Q-lerp(M, N, 1.2)
  seg(p, e0, e1, stroke: lb)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "sw", d: 10)
  lbl(p, C, $C$, dir: "se", d: 10)
  lbl(p, M, $M$, dir: "nw", d: 11)
  lbl(p, N, $N$, dir: "ne", d: 11)
})

// ───────── 第 30 题（p.307）─────────
#let fig-Q-30(width: 190 * Qk) = px-canvas(190, 200, origin: (693, 1176), width: width, (p, u) => {
  import cetz.draw: *
  let O = (787.5, 1075.5)
  let d = 76
  circ(p, O, 91.7, stroke: 1.8pt)
  for (sx, sy) in ((-1, -1), (1, -1), (-1, 1), (1, 1)) {
    circ(p, (O.at(0) + sx * d / 2, O.at(1) + sy * d / 2), d / 2, stroke: 1.1pt)
  }
  dimh(p, 787.5, 863.5, 1037.5, lab: $d$)
})

// ───────── 第 33 题（p.308）─────────
#let fig-Q-33(width: 230 * Qk) = px-canvas(230, 235, origin: (590, 580), width: width, (p, u) => {
  import cetz.draw: *
  let O = (701, 469)
  let R = 101
  let A = Q-pc(O, R, 234)
  let B = Q-pc(O, R, 306)
  let C = Q-pc(O, R, 18)
  let D = Q-pc(O, R, 90)
  let E = Q-pc(O, R, 162)
  circ(p, O, R, stroke: lb)
  poly(p, (A, B, C, D, E), close: true, stroke: lb)
  let H = ((A.at(0) + B.at(0)) / 2, A.at(1))
  dseg(p, O, A)
  dseg(p, O, H)
  ring(p, O, r: 3)
  lbl(p, O, $O$, dir: "n", d: 12)
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, B, $B$, dir: "se", d: 10)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, D, $D$, dir: "n", d: 10)
  lbl(p, E, $E$, dir: "w", d: 11)
})
