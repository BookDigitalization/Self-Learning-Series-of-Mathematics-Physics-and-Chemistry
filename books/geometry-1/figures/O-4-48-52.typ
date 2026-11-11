// 图 4·48（原书 p.253）、4·49（p.254）、4·50（p.255）、4·51（p.256）、4·52（p.257）；页面 200 dpi 坐标。
// 内切圆、旁切圆的圆心和半径由三角形顶点算出（切点取圆心在各边上的垂足），保证严格相切。
#import "O-base.typ": *

// 图 4·48 左：三角形 ABC 的内切圆；右：四边形 ABCD 的内切圆。圆心处小圆点，下方 M；各切点处有短横
#let fig-O-4-48(width: 740 * k) = px-canvas(740, 275, origin: (150, 505), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((292, 529), (169, 747), (566, 744))
  let (M, r) = O-incircle(A, B, C)
  poly(p, (A, B, C), close: true)
  circ(p, M, r)
  let D = O-foot(M, B, C)
  let E = O-foot(M, C, A)
  let F = O-foot(M, A, B)
  for q in (D, E, F) { O-rtick(p, M, q) }
  O-ring(p, M)
  lbl(p, M, $M$, dir: "s", d: 11)
  lbl(p, A, $A$, dir: "n", d: 9)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, D, $D$, dir: "s", d: 11)
  lbl(p, E, $E$, dir: "ne", d: 12)
  lbl(p, F, $F$, dir: "nw", d: 13)
  // 右：圆心 (732.5, 661)，半径 87.5；切点方向角 E 270°、F 5°、G 85°、K 155°
  let (M2, r2) = ((732.5, 661), 87.5)
  let (aE, aF, aG, aK) = (270, 5, 85, 155)
  let A2 = O-tv(M2, r2, aE, aK)
  let B2 = O-tv(M2, r2, aE, aF)
  let C2 = O-tv(M2, r2, aF, aG)
  let D2 = O-tv(M2, r2, aG, aK)
  poly(p, (A2, B2, C2, D2), close: true)
  circ(p, M2, r2)
  for a in (aE, aF, aG, aK) { O-rtick(p, M2, O-pa(M2, r2, a)) }
  O-ring(p, M2)
  lbl(p, M2, $M$, dir: "s", d: 11)
  lbl(p, A2, $A$, dir: "w", d: 11)
  lbl(p, B2, $B$, dir: "e", d: 11)
  lbl(p, C2, $C$, dir: "ne", d: 10)
  lbl(p, D2, $D$, dir: "nw", d: 10)
  lbl(p, O-pa(M2, r2, aE), $E$, dir: "s", d: 12)
  lbl(p, O-pa(M2, r2, aF), $F$, dir: "e", d: 12)
  lbl(p, O-pa(M2, r2, aG), $G$, dir: "n", d: 12)
  lbl(p, O-pa(M2, r2, aK), $K$, dir: "w", d: 12)
})

// 图 4·49 作三角形的内切圆：虚线 AM、BM（角平分线），实线 MD、ME、MF（半径）
#let fig-O-4-49(width: 480 * k) = px-canvas(480, 345, origin: (245, 170), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((269, 488), (702, 488), (452, 189))
  let (M, r) = O-incircle(A, B, C)
  poly(p, (A, B, C), close: true)
  circ(p, M, r)
  let D = O-foot(M, B, C)
  let E = O-foot(M, C, A)
  let F = O-foot(M, A, B)
  seg(p, A, M, stroke: dsh)
  seg(p, B, M, stroke: dsh)
  seg(p, M, D)
  seg(p, M, E)
  seg(p, M, F)
  O-ring(p, M)
  lbl(p, M, $M$, dir: "n", d: 11)
  lbl(p, C, $C$, dir: "n", d: 9)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, D, $D$, dir: "ne", d: 12)
  lbl(p, E, $E$, dir: "nw", d: 13)
  lbl(p, F, $F$, dir: "s", d: 11)
})

// 图 4·50 旁切圆：I 为 ∠SCB、∠KBC 的平分线交点；虚线 IE、ID、IF（到各边的垂线）
#let fig-O-4-50(width: 470 * k) = px-canvas(470, 310, origin: (245, 470), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((266, 613), (466, 696), (461, 545))
  let (I, r) = O-excircle(A, B, C)
  let S = (A.at(0) + 1.96 * (C.at(0) - A.at(0)), A.at(1) + 1.96 * (C.at(1) - A.at(1)))
  let K = (A.at(0) + 1.93 * (B.at(0) - A.at(0)), A.at(1) + 1.93 * (B.at(1) - A.at(1)))
  let D = O-foot(I, B, C)
  let E = O-foot(I, A, S)
  let F = O-foot(I, A, K)
  seg(p, A, S)
  seg(p, A, K)
  seg(p, B, C)
  circ(p, I, r)
  seg(p, C, I)
  seg(p, B, I)
  seg(p, I, D, stroke: dsh)
  seg(p, I, E, stroke: dsh)
  seg(p, I, F, stroke: dsh)
  // C、B 处各两道角弧（外角被平分）
  anglearc(p, C, S, I, 17)
  anglearc(p, C, I, B, 12)
  anglearc(p, B, K, I, 17)
  anglearc(p, B, I, C, 12)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "s", d: 11)
  lbl(p, C, $C$, dir: "nw", d: 11)
  lbl(p, D, $D$, dir: "w", d: 11)
  lbl(p, E, $E$, dir: "n", d: 11)
  lbl(p, F, $F$, dir: "s", d: 11)
  lbl(p, I, $I$, dir: "e", d: 11)
  lbl(p, S, $S$, dir: "e", d: 11)
  lbl(p, K, $K$, dir: "e", d: 11)
})

// 图 4·51 例 1：O 是 △ABC 的内心，OA、OB 为角平分线（∠A = 45°，∠B = 80°）
#let fig-O-4-51(width: 300 * k) = px-canvas(300, 245, origin: (550, 625), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((576, 837), (808, 837), (768, 639))
  let (O, r) = O-incircle(A, B, C)
  poly(p, (A, B, C), close: true)
  circ(p, O, r)
  seg(p, A, O)
  seg(p, B, O)
  O-ring(p, O)
  lbl(p, O, $O$, dir: "n", d: 11)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, C, $C$, dir: "n", d: 10)
})

// 图 4·52 例 2：圆 M 内切于 △ABC，D、E、F 为切点（D 在 BC、E 在 CA、F 在 AB）
#let fig-O-4-52(width: 310 * k) = px-canvas(310, 270, origin: (570, 220), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((783, 240), (597, 465), (832, 461))
  let (M, r) = O-incircle(A, B, C)
  poly(p, (A, B, C), close: true)
  circ(p, M, r)
  let D = O-foot(M, B, C)
  let E = O-foot(M, C, A)
  let F = O-foot(M, A, B)
  for q in (D, E, F) { O-rtick(p, M, q) }
  O-ring(p, M)
  lbl(p, M, $M$, dir: "e", d: 11)
  lbl(p, A, $A$, dir: "n", d: 9)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, D, $D$, dir: "s", d: 11)
  lbl(p, E, $E$, dir: "e", d: 12)
  lbl(p, F, $F$, dir: "nw", d: 12)
})
