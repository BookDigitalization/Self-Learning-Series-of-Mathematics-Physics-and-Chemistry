// 图 5·17（原书 p.290）、图 5·18（p.291）、图 5·19（p.292）、图 5·20（p.293）。页面 120 dpi 坐标。
#import "P-base.typ": *

// 图 5·17：扇形 OAmB，弧含 n°
#let fig-P-5-17(width: 240 * k) = px-canvas(240, 260, origin: (602, 690), width: width, (p, u) => {
  import cetz.draw: *
  let O = (722, 812)
  let R = 110
  let A = P-pt(O, R, 230)
  let B = P-pt(O, R, 310)
  circ(p, O, R, stroke: lt)
  seg(p, O, A, stroke: lb)
  seg(p, O, B, stroke: lb)
  P-arc(p, O, R, 230, 310, stroke: lb)
  P-darc(p, O, R + 16, 230, 310, gap: 9, lab: $n°$)
  pdot(p, O, r: 1.6)
  lbl(p, O, $O$, dir: "n", d: 12)
  lbl(p, A, $A$, dir: "w", d: 12)
  lbl(p, B, $B$, dir: "e", d: 12)
  lbl(p, P-lerp(O, B, 0.58), $R$, dir: "ne", d: 8)
  lbl(p, (722, 906), $m$, dir: "c", d: 0)
})

// 图 5·18：人行道转弯处 ABB′A′，O 为圆心，OA = 8 m，AB = 2 m，∠A′OA = 45°
#let fig-P-5-18(width: 300 * k) = px-canvas(300, 250, origin: (560, 960), width: width, (p, u) => {
  import cetz.draw: *
  let O = (592, 1160)
  let RA = 211
  let RB = 265
  let A = (O.at(0) + RA, O.at(1))
  let B = (O.at(0) + RB, O.at(1))
  let A1 = P-pt(O, RA, 45)
  let B1 = P-pt(O, RB, 45)
  seg(p, A1, B1)
  P-arc(p, O, RA, 0, 45)
  P-arc(p, O, RB, 0, 45)
  seg(p, O, A, stroke: dsh)
  seg(p, O, A1, stroke: dsh)
  P-arc(p, O, 42, 0, 45, stroke: lt)
  lbl(p, (639, 1138), $45°$, dir: "c", d: 0)
  // 尺寸线：8 m（O 到 A），2 m（A 到 B）
  seg(p, (O.at(0), 1160), (O.at(0), 1192), stroke: lt)
  seg(p, (A.at(0), 1156), (A.at(0), 1192), stroke: lt)
  seg(p, (B.at(0), 1155), (B.at(0), 1175), stroke: lt)
  dimh(p, O.at(0), A.at(0), 1182, lab: $8 "m"$, gapw: 30)
  dimh(p, A.at(0), B.at(0), 1165, lab: $2 "m"$, gapw: 30)
  lbl(p, O, $O$, dir: "nw", d: 10)
  lbl(p, A, $A$, dir: "s", d: 32)
  lbl(p, B, $B$, dir: "s", d: 32)
  lbl(p, A1, $A'$, dir: "nw", d: 9)
  lbl(p, B1, $B'$, dir: "ne", d: 9)
})

// 图 5·19：正六边形 A₁A₂…A₆，以各顶点为圆心、a/2 为半径作六个圆弧
#let fig-P-5-19(width: 360 * k) = px-canvas(360, 340, origin: (330, 350), width: width, (p, u) => {
  import cetz.draw: *
  let C = (511, 517)
  let R = 160
  let V = range(6).map(i => P-pt(C, R, 240 + 60 * i))
  // 阴影区域：沿 A1→A2→… 逐个顶点的圆弧（半径 R/2）
  let loop = ()
  for i in range(6) {
    let phi = 240 + 60 * i
    loop += P-arcpts(V.at(i), R / 2, phi + 240, phi + 120, n: 30)
  }
  P-hatch(p, (loop,), ang: 0, gap: 5)
  poly(p, V, close: true)
  for i in range(6) {
    let phi = 240 + 60 * i
    P-arc(p, V.at(i), R / 2, phi + 120, phi + 240, stroke: lb)
  }
  let A1 = V.at(0)
  let M = (A1.at(0) + R / 2, A1.at(1))
  let N = P-pt(A1, R / 2, 120)
  P-arc(p, A1, 38, 0, 120, stroke: lt)
  lbl(p, P-pt(A1, 58, 56), $120°$, dir: "c", d: 0)
  lbl(p, V.at(0), $A_1$, dir: "sw", d: 9)
  lbl(p, V.at(1), $A_2$, dir: "se", d: 9)
  lbl(p, V.at(2), $A_3$, dir: "e", d: 11)
  lbl(p, V.at(3), $A_4$, dir: "ne", d: 9)
  lbl(p, V.at(4), $A_5$, dir: "nw", d: 9)
  lbl(p, V.at(5), $A_6$, dir: "w", d: 11)
  lbl(p, M, $M$, dir: "s", d: 9)
  lbl(p, N, $N$, dir: "w", d: 10)
  lbl(p, (A1.at(0) + R / 4, A1.at(1) + 22), $a / 2$, dir: "c", d: 0)
})

// 图 5·20：扇形 OAB，∠AOB = 75°，半径 R，弧长 l
#let fig-P-5-20(width: 290 * k) = px-canvas(290, 280, origin: (580, 370), width: width, (p, u) => {
  import cetz.draw: *
  let O = (607, 628)
  let R = 243
  let A = (O.at(0) + R, O.at(1))
  let B = P-pt(O, R, 75)
  seg(p, O, A)
  seg(p, O, B)
  P-arc(p, O, R, 0, 75)
  P-arc(p, O, 40, 0, 75, stroke: lt)
  lbl(p, P-pt(O, 64, 22), $75°$, dir: "c", d: 0)
  lbl(p, O, $O$, dir: "w", d: 10)
  lbl(p, A, $A$, dir: "se", d: 9)
  lbl(p, B, $B$, dir: "nw", d: 9)
  lbl(p, P-pt(O, R, 33), $l$, dir: "e", d: 12)
  lbl(p, P-lerp(O, B, 0.5), $R$, dir: "w", d: 12)
  lbl(p, P-lerp(O, A, 0.55), $R$, dir: "s", d: 11)
})


