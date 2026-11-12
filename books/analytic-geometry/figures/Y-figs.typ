// Y 段插图：图 7·13–7·21（原书 p.438–449）；复习题七第 7 题（p.453）、第 8 题与第 11(3) 题（p.454）、
// 第 13(1) 题（p.455）、第 14 题（p.456）的不编号插图。
// 读图：render-pages.py --offset 3 --dpi 200 --grid 100（build/pages-Y/g/），坐标为 200 dpi 页面像素（y 向下）。
// 曲线（圆、蜗线、蚌线、心脏线、对数螺线、圆锥曲线）按原图量出的极点、比例和书中方程算点重画，不照抄手绘偏差。
#import "/common/geo.typ": *
#let k = 0.0145cm

#let Y-t(p, pt, body) = { import cetz.draw: *; content(p(..pt), tt(body)) }
// 白底标注（压在极坐标网上的字母用）
#let Y-tw(p, pt, body) = { import cetz.draw: *; content(p(..pt), box(fill: white, inset: 0.6pt, tt(body))) }
#let Y-ts(p, pt, body) = { import cetz.draw: *; content(p(..pt), tsm(body)) }
#let Y-ln(p, a, b, st: lt, ..style) = { import cetz.draw: *; line(p(..a), p(..b), stroke: st, ..style) }
// 极点 o、极径 r（像素）、极角 th（度）对应的页面点
#let Y-pol(o, r, th) = (o.at(0) + r * calc.cos(th * 1deg), o.at(1) - r * calc.sin(th * 1deg))
// 参数曲线：f(t) 返回页面像素坐标；keep(pt) 为 false 的点丢掉（只用于去掉两端越界的点）
#let Y-curve(p, f, t0, t1, n: 160, st: lw, keep: pt => true) = {
  import cetz.draw: *
  let pts = range(n + 1).map(i => f(t0 + (t1 - t0) * i / n)).filter(keep)
  line(..pts.map(q => p(..q)), stroke: st)
}
// 极坐标曲线 ρ = f(θ)（θ 为度，ρ 为像素，可为负）
#let Y-polar(p, o, f, th0, th1, n: 180, st: lw) = Y-curve(p, th => Y-pol(o, f(th), th), th0, th1, n: n, st: st)
// 坐标轴（极轴）：从 a 到 b 带箭头，b 外侧标 x
#let Y-axis(p, a, b, lab: $x$, dx: 12) = {
  Y-ln(p, a, b, mark: arw)
  Y-t(p, (b.at(0) + dx, b.at(1)), lab)
}

// 极坐标网：极点 o，最外圆半径 R，n 个等距同心圆；射线每 15° 一条，伸出外圆 ext；
// 30° 的倍数处标度数（0° 方向为带箭头的 x 轴；lab90 为 90° 处的标注）。
#let Y-polgrid(p, o, R, n: 12, ext: 36, lab90: $90°$) = {
  import cetz.draw: *
  let gs = 0.4pt
  for i in range(1, n) { circle(p(..o), radius: R * i / n, stroke: gs) }
  circle(p(..o), radius: R, stroke: lw)
  for j in range(1, 24) {
    let th = j * 15
    if th != 180 { line(p(..o), p(..Y-pol(o, R + ext, th)), stroke: gs) }
  }
  // 180° 方向（x 轴负向）与 x 轴正向
  line(p(..Y-pol(o, R + ext, 180)), p(..o), stroke: lt)
  Y-axis(p, o, Y-pol(o, R + ext + 26, 0))
  for th in (30, 60, 120, 150, 180, 210, 240, 270, 300, 330) {
    let d = if th == 180 { 18 } else if calc.rem(th, 90) == 0 { 12 } else { 14 }
    Y-t(p, Y-pol(o, R + ext + d, th), $#th°$)
  }
  Y-t(p, Y-pol(o, R + ext + 12, 90), lab90)
}

// 图 7·13（p.438）：极坐标网与直角坐标。极点 O(522, 749)，外圆半径 172；P 取在外圆 45° 处。
#let fig-Y-7-13(width: 500 * k) = px-canvas(500, 470, origin: (285, 515), width: width, (p, u) => {
  import cetz.draw: *
  let o = (522, 749)
  Y-polgrid(p, o, 172, lab90: $y$)
  let P = Y-pol(o, 172, 45)
  let M = (P.at(0), o.at(1))
  Y-ln(p, o, P, st: lw)
  Y-ln(p, P, M, st: dsh)
  pdot(p, P); pdot(p, M, r: 1.6)
  anglearc(p, o, (600, 749), P, 20)
  Y-tw(p, (P.at(0) + 12, P.at(1) - 10), $P$)
  Y-tw(p, (M.at(0) + 10, M.at(1) + 13), $M$)
  Y-tw(p, (o.at(0) - 10, o.at(1) + 12), $O$)
  Y-tw(p, (570, 677), $ρ$)
  Y-tw(p, (P.at(0) + 10, 700), $y$)
  Y-tw(p, (585, 762), $x$)
  Y-tw(p, (556, 738), $θ$)
})

// 图 7·14（p.443）：ρ = 2r cos θ。极点 O(532, 430)，网外圆半径 172；圆心 C(616, 430)，r = 84，D(700, 430)；P 取 θ = 30°。
#let fig-Y-7-14(width: 500 * k) = px-canvas(500, 470, origin: (295, 196), width: width, (p, u) => {
  import cetz.draw: *
  let o = (532, 430)
  Y-polgrid(p, o, 172)
  let C = (616, 430)
  let D = (700, 430)
  circle(p(..C), radius: 84, stroke: lb)
  let P = Y-pol(o, 168 * calc.cos(30deg), 30)
  Y-ln(p, o, P, st: dsh)
  Y-ln(p, P, D, st: dsh)
  pdot(p, P); pdot(p, C, r: 1.8)
  Y-tw(p, (P.at(0) + 34, P.at(1) - 6), $P(ρ, θ)$)
  Y-tw(p, (C.at(0) - 2, C.at(1) + 14), $C$)
  Y-tw(p, (D.at(0) + 12, D.at(1) + 13), $D$)
  Y-tw(p, (o.at(0) - 10, o.at(1) + 12), $O$)
})

// 图 7·15（p.444）：蜗线 ρ = 10 cos θ + 5。极点 O(522, 450)，网外圆半径 172，1 单位 = 13.3 像素；
// 圆 OA（直径 10）；Q、P 取 θ = 45°。
#let fig-Y-7-15(width: 520 * k) = px-canvas(520, 480, origin: (285, 215), width: width, (p, u) => {
  import cetz.draw: *
  let o = (522, 450)
  let s = 13.3
  Y-polgrid(p, o, 172)
  circle(p(o.at(0) + 5 * s, o.at(1)), radius: 5 * s, stroke: lw)
  Y-polar(p, o, th => (10 * calc.cos(th * 1deg) + 5) * s, 0, 360, n: 240, st: lb)
  let A = (o.at(0) + 10 * s, o.at(1))
  let Q = Y-pol(o, 10 * calc.cos(45deg) * s, 45)
  let P = Y-pol(o, (10 * calc.cos(45deg) + 5) * s, 45)
  Y-ln(p, o, P)
  Y-ln(p, Q, A, st: dsh)
  pdot(p, P, r: 1.8); pdot(p, Q, r: 1.8); pdot(p, A, r: 1.8)
  Y-tw(p, (P.at(0) + 18, P.at(1) - 14), $P(ρ, θ)$)
  Y-tw(p, (Q.at(0) - 12, Q.at(1) - 9), $Q$)
  Y-tw(p, (A.at(0) + 10, A.at(1) + 13), $A$)
  Y-tw(p, (o.at(0) - 10, o.at(1) + 12), $O$)
})

// 蚌线 ρ = a sec θ + b 的两支（极点 o，定直线 x = a；a、b 为像素）：
// 定直线上的点 Q = (a, t)，L = |OQ|；右支 Q + b·OQ/L，左支 Q − b·OQ/L。只画 |y| ≤ h 的部分。
#let Y-conchoid(p, o, a, b, h, st: lw) = {
  let pt(t, sg) = {
    let L = calc.sqrt(a * a + t * t)
    (o.at(0) + a + sg * b * a / L, o.at(1) - (t + sg * b * t / L))
  }
  let keep = q => calc.abs(q.at(1) - o.at(1)) <= h
  Y-curve(p, t => pt(t, 1), -h, h, n: 120, st: st, keep: keep)
  Y-curve(p, t => pt(t, -1), -(h + b + 40), h + b + 40, n: 400, st: st, keep: keep)
}

// 图 7·16（p.445）：蚌线 ρ = a sec θ + b（a < b）。极点 O(148, 708)，a = 92（D 在 240），b = 130；θ 取 25°。
#let fig-Y-7-16(width: 330 * k) = px-canvas(330, 370, origin: (95, 520), width: width, (p, u) => {
  import cetz.draw: *
  let o = (148, 708)
  let a = 92
  let b = 130
  Y-conchoid(p, o, a, b, 170)
  let D = (o.at(0) + a, o.at(1))
  Y-ln(p, (D.at(0), 528), (D.at(0), 885))
  Y-axis(p, o, (405, 708))
  let th = 25
  let Q = (D.at(0), o.at(1) - a * calc.tan(th * 1deg))
  let P = Y-pol(o, a / calc.cos(th * 1deg) + b, th)
  Y-ln(p, o, P)
  pdot(p, Q); pdot(p, D); pdot(p, P); pdot(p, o, r: 1.8)
  anglearc(p, o, (200, 708), P, 24)
  Y-t(p, (D.at(0) + 12, 536), $H$)
  Y-t(p, (D.at(0) + 12, 876), $K$)
  Y-t(p, (Q.at(0) - 12, Q.at(1) - 10), $Q$)
  Y-t(p, (D.at(0) + 12, D.at(1) + 13), $D$)
  Y-t(p, (P.at(0) + 32, P.at(1) - 2), $P(ρ, θ)$)
  Y-t(p, ((Q.at(0) + P.at(0)) / 2 + 2, (Q.at(1) + P.at(1)) / 2 - 12), $b$)
  Y-t(p, ((o.at(0) + D.at(0)) / 2, o.at(1) + 12), $a$)
  Y-t(p, (o.at(0) + 32, o.at(1) - 9), $θ$)
  Y-t(p, (o.at(0) - 4, o.at(1) - 14), $O$)
})

// 图 7·17（p.445）：用蚌线三等分 ∠xOC。极点 O(505, 708)，a = OG = 75，∠xOC 取 36°，b = 2(OA)；
// B 在 ∠xOB = 12° 的射线上（与 A 同高），E = OB 与 HK 的交点，F 为 EB 的中点，OD 为另一条三等分线（24°）。
#let fig-Y-7-17(width: 420 * k) = px-canvas(420, 500, origin: (480, 468), width: width, (p, u) => {
  import cetz.draw: *
  let o = (505, 708)
  let a = 75
  let b = 2 * a / calc.cos(36deg)
  Y-curve(p, t => {
    let L = calc.sqrt(a * a + t * t)
    (o.at(0) + a + b * a / L, o.at(1) - (t + b * t / L))
  }, -140, 140, n: 120, keep: q => calc.abs(q.at(1) - o.at(1)) <= 240)
  let G = (o.at(0) + a, o.at(1))
  let A = (G.at(0), o.at(1) - a * calc.tan(36deg))
  let E = (G.at(0), o.at(1) - a * calc.tan(12deg))
  let B = Y-pol(o, a / calc.cos(12deg) + b, 12)
  let F = ((E.at(0) + B.at(0)) / 2, (E.at(1) + B.at(1)) / 2)
  Y-ln(p, (G.at(0), 475), (G.at(0), 960))
  Y-axis(p, o, (875, 708))
  let C = Y-pol(o, 365, 36)
  let Dd = Y-pol(o, 360, 24)
  Y-ln(p, o, C)
  Y-ln(p, o, Dd, st: dsh)
  Y-ln(p, o, Y-pol(o, 380, 12))
  Y-ln(p, A, B, st: dsh)
  Y-ln(p, A, F)
  for q in (o, A, E, F, G) { pdot(p, q) }
  anglearc(p, o, Y-pol(o, 50, 12), C, 26)
  anglearc(p, o, G, Y-pol(o, 50, 12), 36)
  anglearc(p, A, B, F, 18)
  anglearc(p, B, A, o, 18)
  Y-t(p, (G.at(0) + 12, 480), $H$)
  Y-t(p, (G.at(0) + 12, 952), $K$)
  Y-t(p, (C.at(0) + 8, C.at(1) - 8), $C$)
  Y-t(p, (Dd.at(0) + 10, Dd.at(1) - 6), $D$)
  Y-t(p, (A.at(0) - 14, A.at(1) - 4), $A$)
  Y-t(p, (B.at(0) + 12, B.at(1) - 12), $B$)
  Y-t(p, (E.at(0) + 10, E.at(1) - 12), $E$)
  Y-t(p, (F.at(0) + 10, F.at(1) + 13), $F$)
  Y-t(p, (G.at(0) + 12, G.at(1) + 13), $G$)
  Y-t(p, ((o.at(0) + G.at(0)) / 2, o.at(1) + 13), $a$)
  Y-t(p, (o.at(0) - 14, o.at(1) + 2), $O$)
})

// 图 7·18（p.446）：直线的极坐标方程。极点 O(300, 1190)，OD = p = 201，ω = 39.6°；P 取 θ = 15.7°。
#let fig-Y-7-18(width: 420 * k) = px-canvas(420, 260, origin: (270, 1000), width: width, (p, u) => {
  import cetz.draw: *
  let o = (300, 1190)
  let pp = 201
  let w = 39.6
  let D = Y-pol(o, pp, w)
  let A = (o.at(0) + pp / calc.cos(w * 1deg), o.at(1))
  let ud = (calc.sin(w * 1deg), calc.cos(w * 1deg))
  let th = 15.7
  let P = Y-pol(o, pp / calc.cos((w - th) * 1deg), th)
  Y-ln(p, (D.at(0) - 50 * ud.at(0), D.at(1) - 50 * ud.at(1)), (A.at(0) + 62 * ud.at(0), A.at(1) + 62 * ud.at(1)), st: lb)
  Y-axis(p, o, (680, 1190))
  Y-ln(p, o, D)
  Y-ln(p, o, P)
  pdot(p, o); pdot(p, P)
  rtmark(p, D, o, A, s: 9)
  anglearc(p, o, A, D, 38)
  anglearc(p, o, A, P, 22)
  anglearc(p, A, (620, 1190), D, 17, mark: arw)
  Y-t(p, (D.at(0) + 2, D.at(1) - 13), $D$)
  Y-t(p, (P.at(0) + 32, P.at(1) - 4), $P(ρ, θ)$)
  Y-t(p, (A.at(0) - 6, A.at(1) + 14), $A$)
  Y-t(p, (o.at(0) - 13, o.at(1)), $O$)
  Y-t(p, (365, 1110), $p$)
  Y-t(p, (410, 1146), $ρ$)
  Y-t(p, (430, 1203), $a$)
  Y-t(p, Y-pol(o, 48, 30), $ω$)
  Y-t(p, Y-pol(o, 31, 7), $θ$)
  Y-t(p, (A.at(0) + 20, A.at(1) - 22), $α$)
  Y-t(p, (A.at(0) + 66 * ud.at(0) + 8, A.at(1) + 66 * ud.at(1) + 4), $l$)
})

// 图 7·19（p.447）：平行于极轴的直线 ρ sin θ = p。O(610, 1333)，D(610, 1160)，P(770, 1160)。
#let fig-Y-7-19(width: 360 * k) = px-canvas(360, 215, origin: (520, 1135), width: width, (p, u) => {
  import cetz.draw: *
  let o = (610, 1333)
  let D = (610, 1160)
  let P = (770, 1160)
  Y-ln(p, (525, 1160), (850, 1160), st: lw)
  Y-ln(p, o, D, st: dsh)
  Y-ln(p, o, P)
  Y-axis(p, o, (860, 1333))
  pdot(p, o); pdot(p, P, r: 1.8)
  anglearc(p, o, (700, 1333), P, 24)
  Y-t(p, (D.at(0), D.at(1) - 13), $D$)
  Y-t(p, (P.at(0) + 26, P.at(1) - 14), $P(ρ, θ)$)
  Y-t(p, (598, 1248), $p$)
  Y-t(p, (683, 1238), $ρ$)
  Y-t(p, (646, 1318), $θ$)
  Y-t(p, (o.at(0) - 13, o.at(1) + 4), $O$)
})

// 图 7·20（p.448）：圆的极坐标方程。(a) O(357, 812)，圆心 c 取 θ₁ = 41°、ρ₁ = 217，r = 104，P 在圆心正上方；
// (b) 圆经过极点、圆心在极轴上：O(197, 1005)，圆心 (309, 1005)，r = 112；(c) 圆心在极点：O(679, 1007)，r = 112。
// 圆心字母照原图作小写 c（正文作 C）。
#let fig-Y-7-20(width: 640 * k) = px-canvas(740, 650, origin: (165, 530), width: width, (p, u) => {
  import cetz.draw: *
  // (a)
  let o = (357, 812)
  let C = Y-pol(o, 217, 41)
  let P = (C.at(0), C.at(1) - 104)
  circ(p, C, 104)
  Y-ln(p, o, P)
  Y-ln(p, o, C, st: dsh)
  Y-ln(p, C, P, st: dsh)
  Y-axis(p, o, (709, 812))
  pdot(p, o, r: 1.8); circle(p(..C), radius: 2.6, stroke: lt, fill: white); circle(p(..P), radius: 2.6, stroke: lt, fill: white)
  anglearc(p, o, (450, 812), C, 22)
  anglearc(p, o, (450, 812), P, 50)
  Y-t(p, (P.at(0), P.at(1) - 13), $P(ρ, θ)$)
  Y-t(p, (C.at(0) + 58, C.at(1) + 4), $c(ρ_1, θ_1)$)
  Y-t(p, (C.at(0) - 9, (C.at(1) + P.at(1)) / 2), $r$)
  Y-t(p, Y-pol(o, 34, 17), $θ_1$)
  Y-t(p, Y-pol(o, 61, 50), $θ$)
  Y-t(p, (o.at(0) - 12, o.at(1) + 4), $O$)
  Y-t(p, (450, 852), [(_a_)])
  // (b)
  let o2 = (197, 1005)
  let c2 = (309, 1005)
  let P2 = Y-pol(c2, 112, 54.5)
  let E2 = (421, 1005)
  circ(p, c2, 112)
  Y-ln(p, o2, P2)
  Y-ln(p, P2, E2, st: dsh)
  Y-axis(p, o2, (505, 1005))
  pdot(p, o2, r: 1.8); pdot(p, P2, r: 1.8)
  Y-ln(p, (309, 1001), (309, 1009))
  Y-t(p, (309, 1019), $c$)
  Y-t(p, (P2.at(0) + 9, P2.at(1) - 10), $P$)
  Y-t(p, (o2.at(0) - 13, o2.at(1) + 4), $O$)
  Y-t(p, (309, 1160), [(_b_)])
  // (c)
  let o3 = (679, 1007)
  let P3 = Y-pol(o3, 112, 47)
  circ(p, o3, 112)
  Y-ln(p, o3, P3, st: dsh)
  Y-axis(p, o3, (877, 1007))
  pdot(p, o3, r: 1.8); pdot(p, P3, r: 1.8)
  Y-t(p, (P3.at(0) + 10, P3.at(1) - 10), $P$)
  Y-t(p, (716, 952), $r$)
  Y-t(p, (o3.at(0) - 12, o3.at(1) + 4), $O$)
  Y-t(p, (679, 1160), [(_c_)])
})

// 图 7·21（p.449）：圆锥曲线的统一定义。H(530, 795)，O(625, 795)（HO = p），P(752, 655)，Q(752, 795)，D(530, 655)。
#let fig-Y-7-21(width: 360 * k) = px-canvas(390, 340, origin: (505, 595), width: width, (p, u) => {
  import cetz.draw: *
  let H = (530, 795)
  let o = (625, 795)
  let P = (752, 655)
  let Q = (752, 795)
  let D = (530, 655)
  Y-ln(p, (530, 600), (530, 925), st: lw)
  Y-ln(p, H, o, st: dsh)
  Y-ln(p, D, P, st: dsh)
  Y-ln(p, P, Q, st: dsh)
  Y-ln(p, o, P)
  Y-axis(p, o, (885, 795))
  pdot(p, o); pdot(p, P)
  anglearc(p, o, Q, P, 26)
  cetz.decorations.brace(p(o.at(0) - 3, 805), p(H.at(0) + 3, 805), amplitude: 6, stroke: lt)
  Y-t(p, (P.at(0) + 14, P.at(1) - 4), $P$)
  Y-t(p, (Q.at(0), Q.at(1) + 14), $Q$)
  Y-t(p, (o.at(0) + 4, o.at(1) + 15), $O$)
  Y-t(p, (H.at(0) - 13, H.at(1) + 2), $H$)
  Y-t(p, (D.at(0) - 13, D.at(1) + 2), $D$)
  Y-t(p, (H.at(0) - 15, 910), $D'$)
  Y-t(p, (577, 830), $p$)
  Y-t(p, (683, 715), $ρ$)
  Y-t(p, (660, 782), $θ$)
})

// 复习题七第 7 题（p.453）：ρ = a cos θ + b 的三种情形（a 为圆 OA 的直径）。
//   a > b：O(422, 398)，a = 128，b = 85；a = b：O(225, 752)，a = b = 86；a < b：O(620, 755)，a = 75，b = 90。
#let Y-limacon-pts(o, a, b, th) = (
  P: Y-pol(o, a * calc.cos(th * 1deg) + b, th),
  D: Y-pol(o, a * calc.cos(th * 1deg), th),
  Q: Y-pol(o, a * calc.cos((th + 180) * 1deg) + b, th + 180),
  A: (o.at(0) + a, o.at(1)),
)
#let Y-limacon(p, o, a, b) = {
  Y-polar(p, o, t => a * calc.cos(t * 1deg) + b, 0, 360, n: 240)
  circ(p, (o.at(0) + a / 2, o.at(1)), a / 2)
}
#let fig-Y-r7(width: 660 * k) = px-canvas(700, 720, origin: (170, 195), width: width, (p, u) => {
  import cetz.draw: *
  // a > b
  let o = (422, 398)
  let a = 128
  let b = 85
  let r = Y-limacon-pts(o, a, b, 15)
  Y-limacon(p, o, a, b)
  let t0 = calc.acos(-b / a).deg()
  for t in (t0, -t0) { Y-ln(p, Y-pol(o, 150, t), Y-pol(o, 150, t + 180), st: dsh) }
  Y-ln(p, (350, 398), o, st: dsh)
  Y-axis(p, o, (720, 398))
  Y-ln(p, o, Y-pol(o, 228, 15))
  pdot(p, o, r: 1.8)
  anglearc(p, o, (520, 398), r.P, 70)
  Y-t(p, (r.P.at(0) + 4, r.P.at(1) - 14), $P$)
  Y-t(p, (r.D.at(0) + 4, r.D.at(1) - 13), $D$)
  Y-t(p, (r.Q.at(0) - 4, r.Q.at(1) - 13), $Q$)
  Y-t(p, (r.A.at(0) + 10, r.A.at(1) + 13), $A$)
  Y-t(p, (500, 389), $θ$)
  Y-t(p, (o.at(0) - 12, o.at(1) + 6), $O$)
  Y-t(p, (480, 562), $a>b$)
  // a = b
  let o = (225, 752)
  let r = Y-limacon-pts(o, 86, 86, 65)
  Y-limacon(p, o, 86, 86)
  Y-axis(p, o, (400, 752))
  Y-ln(p, r.Q, r.P)
  pdot(p, o, r: 1.8)
  anglearc(p, o, (300, 752), r.P, 14)
  Y-t(p, (r.P.at(0) + 2, r.P.at(1) - 13), $P$)
  Y-t(p, (r.D.at(0) - 11, r.D.at(1) - 6), $D$)
  Y-t(p, (r.Q.at(0) - 12, r.Q.at(1) + 2), $Q$)
  Y-t(p, (r.A.at(0) + 10, r.A.at(1) + 13), $A$)
  Y-t(p, (o.at(0) + 17, o.at(1) - 12), $θ$)
  Y-t(p, (o.at(0) - 12, o.at(1) + 4), $O$)
  Y-t(p, (255, 900), $a=b$)
  // a < b
  let o = (620, 755)
  let r = Y-limacon-pts(o, 75, 90, 56)
  Y-limacon(p, o, 75, 90)
  Y-ln(p, (585, 755), o, st: dsh)
  Y-axis(p, o, (790, 755))
  Y-ln(p, r.Q, r.P)
  pdot(p, o, r: 1.8)
  anglearc(p, o, (700, 755), r.P, 14)
  Y-t(p, (r.P.at(0) + 4, r.P.at(1) - 13), $P$)
  Y-t(p, (r.D.at(0) - 11, r.D.at(1) - 6), $D$)
  Y-t(p, (r.Q.at(0) - 12, r.Q.at(1) + 2), $Q$)
  Y-t(p, (r.A.at(0) + 10, r.A.at(1) + 13), $A$)
  Y-t(p, (o.at(0) + 17, o.at(1) - 12), $θ$)
  Y-t(p, (o.at(0) + 4, o.at(1) + 14), $O$)
  Y-t(p, (640, 905), $a<b$)
})

// 复习题七第 8 题（p.454）：ρ = a sec θ + b 的三种情形。定直线 CB 为 x = a。
//   a > b：O(130, 475)，a = 90，b = 80，θ = 42°；a = b：O(618, 475)，a = b = 90，θ = 40°；
//   a < b：O(268, 750)，a = 82，b = 135，θ = 21°。
#let Y-conch-panel(p, o, a, b, th, h, xe, rl) = {
  import cetz.draw: *
  Y-conchoid(p, o, a, b, h)
  let A = (o.at(0) + a, o.at(1))
  Y-ln(p, (A.at(0), o.at(1) - h - 10), (A.at(0), o.at(1) + h + 8))
  Y-axis(p, o, (xe, o.at(1)))
  let D = (A.at(0), o.at(1) - a * calc.tan(th * 1deg))
  let od = a / calc.cos(th * 1deg)
  let P = Y-pol(o, od + b, th)
  let Q = Y-pol(o, od - b, th)
  let R = Y-pol(o, rl, th)
  Y-ln(p, if od - b < 0 { Q } else { o }, R)
  pdot(p, o, r: 1.8)
  anglearc(p, o, (o.at(0) + 40, o.at(1)), P, 16)
  Y-t(p, (A.at(0) + 10, o.at(1) - h), $C$)
  Y-t(p, (A.at(0) + 10, o.at(1) + h), $B$)
  Y-t(p, (A.at(0) + 9, A.at(1) + 13), $A$)
  Y-t(p, (D.at(0) + 10, D.at(1) + 4), $D$)
  Y-t(p, (P.at(0) - 10, P.at(1) - 8), $P$)
  Y-t(p, (R.at(0) + 10, R.at(1)), $R$)
  Y-t(p, (o.at(0) + 26, o.at(1) - 8), $θ$)
}
#let Y-conch-Q(o, a, b, th) = Y-pol(o, a / calc.cos(th * 1deg) - b, th)
#let fig-Y-r8(width: 680 * k) = px-canvas(780, 720, origin: (95, 265), width: width, (p, u) => {
  import cetz.draw: *
  // a > b
  let o = (130, 475)
  Y-conch-panel(p, o, 90, 80, 42, 180, 335, 255)
  let r = (Q: Y-conch-Q(o, 90, 80, 42))
  Y-t(p, (r.Q.at(0) - 12, r.Q.at(1) - 6), $Q$)
  Y-t(p, (o.at(0) - 12, o.at(1)), $O$)
  Y-t(p, (180, 685), $a>b$)
  // a = b
  let o = (618, 475)
  Y-conch-panel(p, o, 90, 90, 40, 180, 768, 260)
  let r = (Q: Y-conch-Q(o, 90, 90, 40))
  Y-t(p, (r.Q.at(0) - 12, r.Q.at(1) - 6), $Q$)
  Y-t(p, (o.at(0) - 12, o.at(1)), $O$)
  Y-t(p, (700, 685), $a=b$)
  // a < b
  let o = (268, 750)
  Y-ln(p, (205, 750), o, st: dsh)
  Y-conch-panel(p, o, 82, 135, 21, 170, 545, 270)
  let r = (Q: Y-conch-Q(o, 82, 135, 21))
  Y-t(p, (r.Q.at(0) - 6, r.Q.at(1) + 13), $Q$)
  Y-t(p, (o.at(0) + 2, o.at(1) + 14), $O$)
  Y-t(p, (350, 960), $a<b$)
})

// 复习题七第 11(3) 题（p.454）：对数螺线 ρ = e^(aθ)。O(455, 1290)，按原图取 ρ = 40 e^(0.214θ)（像素），
// θ ≥ 0 实线，θ < 0 的部分（绕向极点）画虚线。
#let fig-Y-r11(width: 340 * k) = px-canvas(340, 360, origin: (370, 1060), width: width, (p, u) => {
  import cetz.draw: *
  let o = (455, 1290)
  let f(th) = Y-pol(o, 40 * calc.exp(0.214 * th), th / calc.pi * 180)
  Y-curve(p, f, 0, 8.11, n: 240, st: lb)
  Y-curve(p, f, -4 * calc.pi, 0, n: 160, st: dsh)
  Y-axis(p, o, (690, 1290))
  Y-t(p, (o.at(0) - 7, o.at(1) - 1), $O$)
})

// 复习题七第 13(1) 题（p.455）：心脏线 ρ = 2 + 2 cos θ 与抛物线 ρ = 1/(1 − cos θ)。O(435, 868)，1 单位 = 44 像素。
#let fig-Y-r13(width: 420 * k) = px-canvas(330, 300, origin: (370, 718), width: width, (p, u) => {
  import cetz.draw: *
  let o = (435, 868)
  let s = 44
  let m(x, y) = (o.at(0) + s * x, o.at(1) - s * y)
  Y-polar(p, o, th => (2 + 2 * calc.cos(th * 1deg)) * s, 0, 360, n: 240)
  Y-curve(p, y => m((y * y - 1) / 2, y), -2.95, 2.95, n: 120)
  for t in (45, -45) {
    Y-ln(p, Y-pol(o, 1.65 * s, t + 180), Y-pol(o, 4.3 * s, t))
  }
  Y-axis(p, o, (680, 868))
  pdot(p, o, r: 1.6)
  anglearc(p, o, (500, 868), Y-pol(o, 30, 45), 13)
  anglearc(p, o, (500, 868), Y-pol(o, 30, -45), 13)
  arc(p(..o), start: 0deg, stop: 135deg, radius: 22, anchor: "origin", stroke: lt)
  arc(p(..o), start: 0deg, stop: -135deg, radius: 22, anchor: "origin", stroke: lt)
  Y-ts(p, (452, 838), $135°$)
  Y-ts(p, (466, 856), $45°$)
  Y-ts(p, (472, 881), $-45°$)
  Y-ts(p, (462, 900), $-135°$)
  Y-tw(p, (o.at(0) - 9, o.at(1) - 2), $O$)
  Y-t(p, (480, 738), [(1)])
  Y-t(p, (620, 728), [(2)])
})

// 复习题七第 14 题（p.456）：经过焦点 O 的弦 PQ。按原图取 ρ = 70/(1 − 0.75 cos θ)（像素），θ 从 39° 到 321°；
// O(485, 625)，P 取 θ = 48.5°，Q 在 θ + 180°。
#let fig-Y-r14(width: 380 * k) = px-canvas(380, 250, origin: (330, 500), width: width, (p, u) => {
  import cetz.draw: *
  let o = (485, 625)
  let f(th) = 70 / (1 - 0.75 * calc.cos(th * 1deg))
  Y-polar(p, o, f, 39, 321, n: 200)
  let P = Y-pol(o, f(48.5), 48.5)
  let Q = Y-pol(o, f(228.5), 228.5)
  Y-ln(p, (340, 625), o, st: dsh)
  Y-axis(p, o, (690, 625))
  Y-ln(p, Q, P)
  pdot(p, o); pdot(p, P); pdot(p, Q)
  pdot(p, Y-pol(o, f(39), 39)); pdot(p, Y-pol(o, f(321), 321))
  Y-t(p, (P.at(0) - 4, P.at(1) - 14), $P$)
  Y-t(p, (Q.at(0) - 13, Q.at(1) + 2), $Q$)
  Y-t(p, (o.at(0) + 6, o.at(1) + 14), $O$)
})
