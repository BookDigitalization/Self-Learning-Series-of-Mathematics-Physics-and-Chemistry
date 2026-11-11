// 图 3·6（原书 p.177）、3·7（p.177）、3·8（p.178）、3·9（p.179）、3·10（p.179）、3·11（p.180）；页面 120 dpi 坐标。
#import "J-base.typ": *

// 图 3·6 平行四边形的高（左：垂足在底边上；右：垂足在底边延长线上）
#let fig-J-3-6(width: 470 * k) = px-canvas(470, 245, origin: (318, 548), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D, D1) = ((325, 452), (490, 452), (520, 322), (358, 322), (359, 452))
  polyc(p, A, B, C, D)
  seg(p, D, D1)
  lbl(p, D, $D$, dir: "n", d: 10)
  lbl(p, C, $C$, dir: "n", d: 10)
  lbl(p, A, $A$, dir: "w", d: 10)
  lbl(p, D1, $D'$, dir: "s", d: 10)
  lbl(p, B, $B$, dir: "s", d: 10)
  let (A2, B2, C2, D2, D3) = ((485, 520), (612, 520), (770, 322), (643, 322), (643, 520))
  polyc(p, A2, B2, C2, D2)
  seg(p, D2, D3, stroke: dsh)
  seg(p, B2, (725, 520), stroke: dsh)
  lbl(p, D2, $D$, dir: "n", d: 10)
  lbl(p, C2, $C$, dir: "n", d: 10)
  lbl(p, A2, $A$, dir: "sw", d: 10)
  lbl(p, D3, $D'$, dir: "s", d: 11)
  lbl(p, B2, $B$, dir: "s", d: 10)
})

// 图 3·7 平行四边形面积定理（垂足 D' 在 AB 上）；A、B 处各画一道角弧（∠A = ∠CBE'）
#let fig-J-3-7(width: 330 * k) = px-canvas(330, 200, origin: (555, 1062), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D, D1, E1) = ((590, 1024), (785, 1024), (845, 888), (648, 888), (648, 1024), (845, 1024))
  seg(p, A, D)
  seg(p, D, C)
  seg(p, B, C)
  seg(p, A, B)
  seg(p, B, E1, stroke: dsh)
  seg(p, E1, (876, 1024), stroke: dsh)
  seg(p, D, D1, stroke: dsh)
  seg(p, C, E1, stroke: dsh)
  anglearc(p, A, B, D, 28)
  anglearc(p, B, E1, C, 28)
  lbl(p, D, $D$, dir: "n", d: 10)
  lbl(p, C, $C$, dir: "n", d: 10)
  lbl(p, A, $A$, dir: "w", d: 10)
  lbl(p, D1, $D'$, dir: "s", d: 11)
  lbl(p, B, $B$, dir: "s", d: 11)
  lbl(p, E1, $E'$, dir: "s", d: 11)
})

// 图 3·8 垂足 D' 在 AB 的延长线上；DD' 交 BC 于 E，CC' 垂直于 AB 的延长线
#let fig-J-3-8(width: 380 * k) = px-canvas(380, 255, origin: (285, 1062), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D, D1, C1) = ((312, 1037), (437, 1037), (635, 832), (503, 832), (503, 1037), (633, 1037))
  let E = isect(D, D1, B, C)
  seg(p, A, B)
  seg(p, A, D)
  seg(p, D, C)
  seg(p, B, C)
  seg(p, D, D1)
  seg(p, B, C1, stroke: dsh)
  seg(p, C, C1, stroke: dsh)
  lbl(p, D, $D$, dir: "n", d: 10)
  lbl(p, C, $C$, dir: "ne", d: 9)
  lbl(p, A, $A$, dir: "w", d: 10)
  lbl(p, B, $B$, dir: "s", d: 11)
  lbl(p, D1, $D'$, dir: "s", d: 11)
  lbl(p, C1, $C'$, dir: "s", d: 11)
  lbl(p, E, $E$, dir: "e", d: 10)
})

// 图 3·9 例 1：AB = 5 cm，AD = 4 cm，∠DAB = 60°
#let fig-J-3-9(width: 310 * k) = px-canvas(310, 182, origin: (580, 414), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D, D1) = ((603, 388), (805, 388), (870, 250), (670, 250), (670, 388))
  polyc(p, A, B, C, D)
  seg(p, D, D1)
  anglearc(p, A, B, D, 30)
  anglearc(p, D, A, D1, 24)
  anglearc(p, D, A, D1, 28)
  lbl(p, (643, 371), $60°$, dir: "c", d: 0)
  // AD 旁的尺寸线 4 cm（沿 AD 方向，偏左上）
  let n = nrm(A, D)
  let a2 = (A.at(0) - n.at(0) * 14, A.at(1) - n.at(1) * 14)
  let d2 = (D.at(0) - n.at(0) * 14, D.at(1) - n.at(1) * 14)
  line(p(..a2), p(..d2), stroke: lt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.45))
  let m = lerp(a2, d2, 0.5)
  content(p(..m), angle: dirang(D.at(0) - A.at(0), D.at(1) - A.at(1)), frame: "rect", fill: white, stroke: none,
    padding: 1.5, tt($4 "cm"$))
  dimh(p, 603, 805, 402, lab: $5 "cm"$)
  lbl(p, D, $D$, dir: "ne", d: 9)
  lbl(p, C, $C$, dir: "e", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
  lbl(p, D1, $D'$, dir: "ne", d: 11)
  lbl(p, A, $A$, dir: "sw", d: 10)
})

// 图 3·10 例 2：P 在对角线 AC 上，EF ∥ BC，GH ∥ AB
#let fig-J-3-10(width: 305 * k) = px-canvas(305, 190, origin: (585, 1182), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((600, 1173), (805, 1173), (870, 1022), (660, 1022))
  let t = 0.68
  let P = lerp(A, C, t)
  let E = (A.at(0) + (B.at(0) - A.at(0)) * t, 1173)
  let F = (D.at(0) + (C.at(0) - D.at(0)) * t, 1022)
  let G = lerp(A, D, t)
  let H = lerp(B, C, t)
  polyc(p, A, B, C, D)
  seg(p, A, C)
  seg(p, E, F)
  seg(p, G, H)
  lbl(p, D, $D$, dir: "n", d: 10)
  lbl(p, C, $C$, dir: "ne", d: 10)
  lbl(p, F, $F$, dir: "n", d: 10)
  lbl(p, G, $G$, dir: "w", d: 10)
  lbl(p, H, $H$, dir: "se", d: 10)
  lbl(p, P, $P$, dir: "se", d: 9)
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, E, $E$, dir: "s", d: 10)
  lbl(p, B, $B$, dir: "se", d: 10)
})

// 图 3·11 例 3：正方形（边 a）与菱形（边 a，高 h）
#let fig-J-3-11(width: 485 * k) = px-canvas(485, 215, origin: (235, 935), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((255, 913), (425, 913), (425, 743), (255, 743))
  polyc(p, A, B, C, D)
  lbl(p, (340, 743), $a$, dir: "n", d: 9)
  lbl(p, (340, 913), $a$, dir: "s", d: 9)
  lbl(p, (255, 828), $a$, dir: "w", d: 9)
  lbl(p, (425, 828), $a$, dir: "e", d: 9)
  lbl(p, D, $D$, dir: "nw", d: 9)
  lbl(p, C, $C$, dir: "ne", d: 9)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
  let (A1, B1, C1, D1, E1) = ((463, 903), (623, 903), (688, 757), (528, 757), (528, 903))
  polyc(p, A1, B1, C1, D1)
  seg(p, D1, E1, stroke: dsh)
  lbl(p, (575, 757), $a$, dir: "n", d: 9)
  lbl(p, (575, 903), $a$, dir: "n", d: 11)
  lbl(p, lerp(A1, D1, 0.5), $a$, dir: "w", d: 9)
  lbl(p, lerp(B1, C1, 0.5), $a$, dir: "e", d: 9)
  lbl(p, (528, 830), $h$, dir: "e", d: 10)
  lbl(p, D1, $D'$, dir: "nw", d: 9)
  lbl(p, C1, $C'$, dir: "ne", d: 9)
  lbl(p, A1, $A'$, dir: "sw", d: 10)
  lbl(p, B1, $B'$, dir: "se", d: 9)
  lbl(p, E1, $E'$, dir: "s", d: 11)
})
