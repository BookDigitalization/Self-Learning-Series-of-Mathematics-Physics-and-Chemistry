// 图 2·21（p.136）、2·22（p.137）、2·23（p.138）、2·24（p.139）；页面渲染 dpi 120。
#import "H-base.typ": *

// 图 2·21：△ABC，中线 AM，延长 AM 到 E 使 ME = AM，平行四边形 ABEC
#let fig-H-2-21(width: 320 * k) = px-canvas(300, 330, origin: (580, 825), width: width, (p, u) => {
  import cetz.draw: *
  let A = (767, 838)
  let B = (610, 977)
  let C = (830, 974)
  let M = lerp(B, C, 0.5)
  let E = (B.at(0) + C.at(0) - A.at(0), B.at(1) + C.at(1) - A.at(1))
  poly(p, (A, B, C), close: true)
  seg(p, A, M)
  dseg(p, M, E)
  dseg(p, B, E)
  dseg(p, C, E)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, M, $M$, dir: "se", d: 12)
  lbl(p, E, $E$, dir: "sw", d: 11)
  lbl(p, (758, 922), $m_a$, dir: "c", d: 0)
})

// 图 2·22：两幅，AH = h_a 为 BC 上的高（左：垂足在 BC 上；右：垂足在 BC 延长线上）
#let fig-H-2-22(width: 580 * k) = px-canvas(570, 250, origin: (240, 290), width: width, (p, u) => {
  import cetz.draw: *
  let (A1, B1, C1, H1) = ((437, 316), (267, 511), (498, 509), (437, 511))
  poly(p, (A1, B1, C1), close: true)
  seg(p, A1, H1)
  lbl(p, A1, $A$, dir: "n", d: 10)
  lbl(p, B1, $B$, dir: "w", d: 11)
  lbl(p, C1, $C$, dir: "e", d: 11)
  lbl(p, H1, $H$, dir: "s", d: 11)
  lbl(p, (422, 426), $h_a$, dir: "c", d: 0)
  let (A2, B2, C2, H2) = ((764, 311), (562, 509), (686, 506), (771, 506))
  poly(p, (A2, B2, C2), close: true)
  seg(p, A2, H2)
  dseg(p, C2, H2)
  lbl(p, A2, $A$, dir: "n", d: 10)
  lbl(p, B2, $B$, dir: "w", d: 11)
  lbl(p, C2, $C$, dir: "s", d: 11)
  lbl(p, H2, $H$, dir: "s", d: 11)
  lbl(p, (782, 418), $h_a$, dir: "c", d: 0)
})

// 图 2·23：△ABC 的外接圆 O，直径 AD，高 AH
#let fig-H-2-23(width: 290 * k) = px-canvas(290, 270, origin: (535, 682), width: width, (p, u) => {
  import cetz.draw: *
  let O = (681, 814)
  let r = 123
  let A = cpt(O, r, 65.5)
  let D = cpt(O, r, 245.5)
  let dx = calc.sqrt(r * r - 34 * 34)
  let B = (O.at(0) - dx, 848)
  let C = (O.at(0) + dx, 848)
  let H = (A.at(0), 848)
  circ(p, O, r)
  seg(p, A, B)
  seg(p, A, C)
  seg(p, B, C)
  seg(p, A, D)
  dseg(p, A, H)
  dseg(p, C, D)
  anglearc(p, B, A, C, 28)
  anglearc(p, D, A, C, 22)
  rtmark(p, H, A, C, s: 7)
  rtmark(p, C, A, D, s: 8)
  ring(p, O)
  lbl(p, A, $A$, dir: "ne", d: 9)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, D, $D$, dir: "s", d: 11)
  lbl(p, H, $H$, dir: "s", d: 11)
  lbl(p, O, $O$, dir: "w", d: 11)
  lbl(p, (711, 778), $R$, dir: "c", d: 0)
})

// 图 2·24：△ABC，内角平分线 AD，DA' 为 AD 在 BC 上的射影
#let fig-H-2-24(width: 350 * k) = px-canvas(350, 230, origin: (540, 262), width: width, (p, u) => {
  import cetz.draw: *
  let A = (779, 276)
  let B = (558, 454)
  let C = (862, 454)
  let D = (737, 454)
  let A1 = (779, 454)
  poly(p, (A, B, C), close: true)
  seg(p, A, D)
  dseg(p, A, A1)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, D, $D$, dir: "s", d: 11)
  lbl(p, A1, $A'$, dir: "s", d: 11)
  lbl(p, (663, 356), $c$, dir: "c", d: 0)
  lbl(p, (835, 367), $b$, dir: "c", d: 0)
  lbl(p, (700, 466), $a$, dir: "c", d: 0)
})
