// 第 4 章 §4·1 的插图：图 4·1（原书 p.222）、4·2（p.223）、4·3（p.224）、4·4、4·5（p.226）、4·6（p.227）、
// 4·7（p.228）、4·8（p.229）；习题 4·1 第 4 题（p.229）。页面 120 dpi 坐标。
// 图 4·1：花瓷砖（正六边形铺成，带斜线的为涂色的几块）用 CeTZ 重画；八角亭是写实插画，用扫描裁剪的二值化 PNG（L-pavilion.png，p.222）。
#import "L-base.typ": *

// 多边形对竖直/水平边界的裁剪（Sutherland–Hodgman，一条边界）
#let clip1(pts, ax, bd, ge) = {
  let out = ()
  let n = pts.len()
  for i in range(n) {
    let a = pts.at(i)
    let b = pts.at(calc.rem(i + 1, n))
    let ina = if ge { a.at(ax) >= bd } else { a.at(ax) <= bd }
    let inb = if ge { b.at(ax) >= bd } else { b.at(ax) <= bd }
    if ina { out.push(a) }
    if ina != inb {
      let t = (bd - a.at(ax)) / (b.at(ax) - a.at(ax))
      out.push((a.at(0) + t * (b.at(0) - a.at(0)), a.at(1) + t * (b.at(1) - a.at(1))))
    }
  }
  out
}
#let clip-rect(pts, x0, x1, y0, y1) = {
  let r = clip1(pts, 0, x0, true)
  if r.len() > 0 { r = clip1(r, 0, x1, false) }
  if r.len() > 0 { r = clip1(r, 1, y0, true) }
  if r.len() > 0 { r = clip1(r, 1, y1, false) }
  r
}

#let hatch = tiling(size: (3.2pt, 3.2pt), place(line(start: (0pt, 3.2pt), end: (3.2pt, 0pt), stroke: 0.45pt)))

#let fig-L-4-1(width: 710 * k) = px-canvas(710, 400, origin: (145, 862), width: width, (p, u) => {
  import cetz.draw: *
  let (x0, x1, y0, y1) = (150, 534, 1015, 1184)
  let (R, a, hh) = (29.8, 18.1, 27.7)
  // 涂色的六边形：(列, 中心 y 序号)
  let shaded = ((0, 1), (1, 0), (1, 3), (2, 1), (3, 0), (3, 3), (4, 1), (5, 0), (5, 3), (6, 1), (7, 3))
  for c in range(8) {
    let cx = 180 + 47.9 * c
    let cy0 = if calc.even(c) { 1042.5 } else { 1014.8 }
    for j in range(-1, 5) {
      let cy = cy0 + 55.4 * j
      let hex = ((cx + R, cy), (cx + a, cy + hh), (cx - a, cy + hh), (cx - R, cy), (cx - a, cy - hh), (cx + a, cy - hh))
      let cl = clip-rect(hex, x0, x1, y0, y1)
      if cl.len() >= 3 {
        let sh = shaded.contains((c, j))
        line(..cl.map(q => p(..q)), close: true, stroke: lt, fill: if sh { hatch } else { none })
      }
    }
  }
  line(p(x0, y0), p(x1, y0), p(x1, y1), p(x0, y1), close: true, stroke: lw)
  pimg(p, u, "/books/geometry-2/figures/L-pavilion.png", (560, 865, 850, 1255))
})

// 图 4·2：正三角形、正方形、正五边形、正六边形、正八边形
#let fig-L-4-2(width: 740 * k) = px-canvas(740, 135, origin: (150, 515), width: width, (p, u) => {
  import cetz.draw: *
  poly(p, ((231, 534), (169, 639), (288, 639)), close: true)
  poly(p, ((310, 535), (413, 535), (413, 638), (310, 638)), close: true)
  poly(p, rpoly((512, 582), 60, 5, 90), close: true)
  poly(p, rpoly((661, 580), 58.5, 6, 0), close: true)
  poly(p, rpoly((823, 585), 60.6, 8, 22.5), close: true)
})

// 图 4·3：圆 O 的内接正五边形 ABCDE 与外切正五边形 PQRST
#let fig-L-4-3(width: 340 * k) = px-canvas(340, 330, origin: (505, 285), width: width, (p, u) => {
  import cetz.draw: *
  let O = (682, 427)
  let R = 124
  let pts = rpoly(O, R, 5, 234)   // A B C D E：234°、306°、18°、90°、162°
  let (A, B, C, D, E) = pts
  let out = rpoly(O, R / calc.cos(36deg), 5, 270)   // P Q R S T：270°、342°、54°、126°、198°
  let (P, Q, Rr, S, T) = (out.at(0), out.at(1), out.at(2), out.at(3), out.at(4))
  circ(p, O, R)
  poly(p, pts, close: true)
  poly(p, out, close: true)
  ring(p, (683, 424), r: 2.5)
  lbl(p, (685, 439), $O$, dir: "c", d: 0)
  lbl(p, S, $S$, dir: "nw", d: 9)
  lbl(p, D, $D$, dir: "n", d: 9)
  lbl(p, Rr, $R$, dir: "ne", d: 9)
  lbl(p, E, $E$, dir: "nw", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 11)
  lbl(p, T, $T$, dir: "w", d: 9)
  lbl(p, Q, $Q$, dir: "e", d: 9)
  lbl(p, B, $B$, dir: "se", d: 10)
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, P, $P$, dir: "s", d: 10)
})

// 图 4·4：圆 O 的内接五边形 ABCDE，AB = BC = CD = DE = EA
#let fig-L-4-4(width: 270 * k) = px-canvas(270, 270, origin: (565, 205), width: width, (p, u) => {
  import cetz.draw: *
  let O = (697, 338)
  let pts = rpoly(O, 125, 5, 234)
  let (A, B, C, D, E) = pts
  circ(p, O, 125)
  poly(p, pts, close: true)
  ring(p, (698, 336), r: 2.5)
  lbl(p, (698, 350), $O$, dir: "c", d: 0)
  lbl(p, D, $D$, dir: "n", d: 9)
  lbl(p, C, $C$, dir: "e", d: 10)
  lbl(p, E, $E$, dir: "w", d: 10)
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, B, $B$, dir: "se", d: 10)
})

// 图 4·5：五边形 PQRST 外切于圆 O，A、B、C、D、E 为切点
#let fig-L-4-5(width: 330 * k) = px-canvas(330, 330, origin: (510, 780), width: width, (p, u) => {
  import cetz.draw: *
  let O = (672, 948)
  let R = 125
  let out = rpoly(O, R / calc.cos(36deg), 5, 234)   // P Q R S T：234°、306°、18°、90°、162°
  let (P, Q, Rr, S, T) = out
  let A = cpt(O, R, 270)
  let B = cpt(O, R, 342)
  let C = cpt(O, R, 54)
  let D = cpt(O, R, 126)
  let E = cpt(O, R, 198)
  circ(p, O, R)
  poly(p, out, close: true)
  dseg(p, E, A)
  dseg(p, A, B)
  ring(p, (671, 946), r: 2.5)
  lbl(p, (671, 959), $O$, dir: "c", d: 0)
  lbl(p, S, $S$, dir: "n", d: 9)
  lbl(p, Rr, $R$, dir: "ne", d: 9)
  lbl(p, T, $T$, dir: "w", d: 10)
  lbl(p, Q, $Q$, dir: "se", d: 10)
  lbl(p, P, $P$, dir: "sw", d: 10)
  lbl(p, A, $A$, dir: "s", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 11)
  lbl(p, D, $D$, dir: "nw", d: 11)
  lbl(p, E, $E$, dir: "sw", d: 11)
})

// 图 4·6：圆 O 的内接正六边形 ABCDEF、外切正六边形 A'B'C'D'E'F'（M′…S′ 为半径的外端）
#let fig-L-4-6(width: 330 * k) = px-canvas(330, 300, origin: (570, 795), width: width, (p, u) => {
  import cetz.draw: *
  let O = (721, 938)
  let R = 123
  let pts = rpoly(O, R, 6, 240)   // A B C D E F：240°、300°、0°、60°、120°、180°
  let (A, B, C, D, E, F) = pts
  let out = rpoly(O, R / calc.cos(30deg), 6, 240)
  let (A1, B1, C1, D1, E1, F1) = out
  let M1 = cpt(O, R, 270)
  let N1 = cpt(O, R, 330)
  let P1 = cpt(O, R, 30)
  let Q1 = cpt(O, R, 90)
  let R1 = cpt(O, R, 150)
  let S1 = cpt(O, R, 210)
  circ(p, O, R)
  poly(p, pts, close: true)
  poly(p, out, close: true)
  for q in (M1, N1, P1, Q1, R1, S1, B) { seg(p, O, q) }
  lbl(p, (737, 938), $O$, dir: "c", d: 0)
  // 外切六边形顶点与半径外端
  lbl(p, E1, $E'$, dir: "nw", d: 10)
  lbl(p, Q1, $Q'$, dir: "n", d: 9)
  lbl(p, D1, $D'$, dir: "ne", d: 10)
  lbl(p, P1, $P'$, dir: "ne", d: 10)
  lbl(p, R1, $R'$, dir: "nw", d: 10)
  lbl(p, F1, $F'$, dir: "w", d: 10)
  lbl(p, C1, $C'$, dir: "e", d: 10)
  lbl(p, S1, $S'$, dir: "sw", d: 10)
  lbl(p, N1, $N'$, dir: "se", d: 10)
  lbl(p, A1, $A'$, dir: "sw", d: 10)
  lbl(p, M1, $M'$, dir: "s", d: 14)
  lbl(p, B1, $B'$, dir: "se", d: 10)
  // 内接六边形顶点与垂足
  lbl(p, E, $E$, dir: "se", d: 12)
  lbl(p, D, $D$, dir: "sw", d: 12)
  lbl(p, F, $F$, dir: "e", d: 12)
  lbl(p, C, $C$, dir: "w", d: 12)
  lbl(p, A, $A$, dir: "ne", d: 12)
  lbl(p, B, $B$, dir: "n", d: 12)
  lbl(p, lerp(A, B, 0.5), $M$, dir: "ne", d: 12)
  lbl(p, lerp(B, C, 0.5), $N$, dir: "n", d: 12)
  lbl(p, lerp(C, D, 0.5), $P$, dir: "w", d: 12)
  lbl(p, lerp(D, E, 0.5), $Q$, dir: "sw", d: 12)
  lbl(p, lerp(E, F, 0.5), $R$, dir: "se", d: 12)
  lbl(p, lerp(F, A, 0.5), $S$, dir: "e", d: 12)
})

// 图 4·7：圆 O 的内接五边形 A₁A₂A₃A₄A₅（等角）
#let fig-L-4-7(width: 280 * k) = px-canvas(280, 285, origin: (565, 745), width: width, (p, u) => {
  import cetz.draw: *
  let O = (701, 886)
  let pts = rpoly(O, 125, 5, 234)   // A₁ A₂ A₃ A₄ A₅：234°、306°、18°、90°、162°
  let (A1, A2, A3, A4, A5) = pts
  circ(p, O, 125)
  poly(p, pts, close: true)
  ring(p, (701, 884), r: 2.5)
  lbl(p, (701, 899), $O$, dir: "c", d: 0)
  lbl(p, A4, $A_4$, dir: "n", d: 10)
  lbl(p, A3, $A_3$, dir: "e", d: 11)
  lbl(p, A5, $A_5$, dir: "w", d: 11)
  lbl(p, A1, $A_1$, dir: "sw", d: 11)
  lbl(p, A2, $A_2$, dir: "se", d: 11)
})

// 图 4·8：圆 O 的内接等角六边形（不等边）：弧 A₁A₂ = A₃A₄ = A₅A₆ = 40°，其余三段各 80°
#let fig-L-4-8(width: 310 * k) = px-canvas(310, 310, origin: (535, 405), width: width, (p, u) => {
  import cetz.draw: *
  let O = (690, 552)
  let R = 138
  let A1 = cpt(O, R, 250)
  let A2 = cpt(O, R, 290)
  let A3 = cpt(O, R, 10)
  let A4 = cpt(O, R, 50)
  let A5 = cpt(O, R, 130)
  let A6 = cpt(O, R, 170)
  circ(p, O, R)
  poly(p, (A1, A2, A3, A4, A5, A6), close: true)
  ring(p, (690, 549), r: 2.5)
  lbl(p, (690, 562), $O$, dir: "c", d: 0)
  lbl(p, A1, $A_1$, dir: "sw", d: 11)
  lbl(p, A2, $A_2$, dir: "se", d: 11)
  lbl(p, A3, $A_3$, dir: "e", d: 12)
  lbl(p, A4, $A_4$, dir: "ne", d: 11)
  lbl(p, A5, $A_5$, dir: "nw", d: 11)
  lbl(p, A6, $A_6$, dir: "w", d: 12)
})

// 习题 4·1 第 4 题（p.229）：正五边形 ABCDE，对角线 AC、BE 相交于 M
#let fig-L-ex4-1-q4(width: 260 * k) = px-canvas(260, 240, origin: (610, 1015), width: width, (p, u) => {
  import cetz.draw: *
  let O = (734, 1141)
  let pts = rpoly(O, 116, 5, 234)
  let (A, B, C, D, E) = pts
  let M = isect(A, C, B, E)
  poly(p, pts, close: true)
  seg(p, A, C)
  seg(p, B, E)
  lbl(p, D, $D$, dir: "n", d: 9)
  lbl(p, C, $C$, dir: "e", d: 10)
  lbl(p, E, $E$, dir: "w", d: 10)
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, B, $B$, dir: "se", d: 10)
  lbl(p, M, $M$, dir: "n", d: 10)
})
