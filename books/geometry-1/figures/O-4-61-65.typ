// 图 4·61（原书 p.266）、4·62（p.267）、4·63（p.268）、4·64（p.269）、4·65（p.270）；页面 200 dpi 坐标。
#import "O-base.typ": *

// 图 4·61 两圆 A、B 交于 P、Q：虚线 AP、AQ、BP、BQ，实线 AB 与 PQ 相交于 M
#let fig-O-4-61(width: 335 * k) = px-canvas(335, 215, origin: (540, 828), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B) = ((629, 932), (756, 932))
  circ(p, A, 77)
  circ(p, B, 99)
  let (P, Q) = O-cc(A, 77, B, 99)
  let M = (P.at(0), 932)
  seg(p, A, B)
  seg(p, P, Q)
  seg(p, A, P, stroke: dsh)
  seg(p, A, Q, stroke: dsh)
  seg(p, B, P, stroke: dsh)
  seg(p, B, Q, stroke: dsh)
  O-ring(p, A)
  O-ring(p, B)
  lbl(p, A, $A$, dir: "w", d: 12)
  lbl(p, B, $B$, dir: "e", d: 12)
  lbl(p, P, $P$, dir: "n", d: 10)
  lbl(p, Q, $Q$, dir: "s", d: 10)
  lbl(p, M, $M$, dir: "ne", d: 9)
})

// 图 4·62 相切两圆的连心线：(1) 外切、(2) 内切。C 为切点
#let fig-O-4-62(width: 640 * k) = px-canvas(640, 270, origin: (190, 598), width: width, (p, u) => {
  import cetz.draw: *
  // (1) 外切
  let M = (311, 707)
  let e = (0.9995, 0.03)
  let N = (M.at(0) + 157 * e.at(0), M.at(1) + 157 * e.at(1))
  let C = (M.at(0) + 100 * e.at(0), M.at(1) + 100 * e.at(1))
  circ(p, M, 100)
  circ(p, N, 57)
  seg(p, M, N)
  O-ring(p, M)
  O-ring(p, N)
  lbl(p, M, $M$, dir: "w", d: 12)
  lbl(p, N, $N$, dir: "e", d: 12)
  lbl(p, C, $C$, dir: "n", d: 11)
  O-cap(p, (348, 856), [(1)])
  // (2) 内切：M 为大圆圆心，N 为小圆圆心
  let (M2, N2) = ((708, 716), (658, 716))
  circ(p, M2, 109)
  circ(p, N2, 59)
  seg(p, (599, 716), M2)
  O-ring(p, M2)
  O-ring(p, N2)
  lbl(p, M2, $M$, dir: "n", d: 11)
  lbl(p, N2, $N$, dir: "n", d: 11)
  lbl(p, (599, 716), $C$, dir: "w", d: 11)
  O-cap(p, (705, 858), [(2)])
})

// 图 4·63 例 1：已知圆 M，R 是圆上一定点；圆 P、圆 P′ 都在 R 处与圆 M 相切，圆心都在直线 MR 上
#let fig-O-4-63(width: 490 * k) = px-canvas(490, 230, origin: (235, 260), width: width, (p, u) => {
  import cetz.draw: *
  let (P, M, P2) = ((414, 378), (450, 378), (590, 378))
  seg(p, (238, 378), (718, 378), stroke: lb)
  circ(p, P, 111)
  circ(p, M, 75)
  circ(p, P2, 65)
  O-ring(p, P)
  O-ring(p, M)
  O-ring(p, P2)
  lbl(p, P, $P$, dir: "s", d: 13)
  lbl(p, M, $M$, dir: "s", d: 13)
  lbl(p, P2, $P'$, dir: "s", d: 13)
  lbl(p, (525, 378), $R$, dir: "ne", d: 10)
})

// 图 4·64 例 2：定圆 M（半径 R）、线段 r。以 M 为圆心，(R + r)、(R - r) 为半径的两圆是圆心的轨迹；
// 圆 P 与圆 M 外切，圆 P′ 与圆 M 内切，半径都是 r。左上角的线段是 r
#let fig-O-4-64(width: 500 * k) = px-canvas(500, 440, origin: (245, 168), width: width, (p, u) => {
  import cetz.draw: *
  let M = (455, 399)
  let (P2, P) = ((499, 399), (656, 399))
  circ(p, M, 201)
  circ(p, M, 122.5)
  circ(p, M, 44)
  circ(p, P2, 78.5)
  circ(p, P, 78.5)
  seg(p, M, P)
  // R：半径，带箭头
  let tip = O-pa(M, 122.5, 69.3)
  line(p(..M), p(..tip), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.45))
  O-lblw(p, O-pa(M, 62, 69.3), $R$)
  O-ring(p, M)
  O-ring(p, P2)
  O-ring(p, P)
  lbl(p, M, $M$, dir: "w", d: 11)
  lbl(p, P2, $P'$, dir: "ne", d: 11)
  lbl(p, P, $P$, dir: "e", d: 11)
  // 线段 r
  pseg(p, (279, 184), (348, 184), s: 4, stroke: lb)
  lbl(p, (313, 184), $r$, dir: "n", d: 10)
})

// 图 4·65 例 3：已知圆 M（半径 k）、直线 l、线段 R（左上角）。l′ 平行于 l，相距 R；圆 M 的同心圆半径 k + R；
// 交点 O₁、O₂ 为所求圆的圆心。原图中 l 与 l′ 不严格平行，这里按作法画成平行
#let fig-O-4-65(width: 520 * k) = px-canvas(520, 500, origin: (240, 497), width: width, (p, u) => {
  import cetz.draw: *
  let M = (433, 760)
  let (kk, RR) = (102.5, 86.5)
  let L1 = (658, 570)
  let L2 = (572, 982)
  let (O1, O2) = O-lc(L1, L2, M, kk + RR)
  circ(p, M, kk)
  circ(p, M, kk + RR)
  circ(p, O1, RR)
  circ(p, O2, RR)
  // l'（过 O1、O2）和 l（在右侧，相距 R）
  let d = O-u(L1, L2)
  let n = (-d.at(1), d.at(0))
  let n = if n.at(0) < 0 { (-n.at(0), -n.at(1)) } else { n }
  seg(p, L1, L2)
  let l1 = (L1.at(0) + RR * n.at(0), L1.at(1) + RR * n.at(1))
  let l2 = (L2.at(0) + RR * n.at(0), L2.at(1) + RR * n.at(1))
  seg(p, l1, l2)
  lbl(p, L1, $l'$, dir: "n", d: 10)
  lbl(p, l1, $l$, dir: "n", d: 10)
  // 尺寸线 R（l′ 与 l 之间）
  let q1 = (644, 637)
  O-dim(p, q1, (q1.at(0) + RR * n.at(0), q1.at(1) + RR * n.at(1)), lab: $R$)
  // M 处半径线与 k、R 两段尺寸线
  let e = O-u(M, (505, 593.5))
  let S2 = (M.at(0) + (kk + RR) * e.at(0), M.at(1) + (kk + RR) * e.at(1))
  seg(p, M, S2)
  let off = 11
  let S0 =(M.at(0) + off * (-0.918), M.at(1) + off * (-0.397))
  let S1 = (S0.at(0) + kk * e.at(0), S0.at(1) + kk * e.at(1))
  let S3 = (S0.at(0) + (kk + RR) * e.at(0), S0.at(1) + (kk + RR) * e.at(1))
  pseg(p, S0, S1, s: 4)
  pseg(p, S1, S3, s: 4)
  O-lblw(p, ((S0.at(0) + S1.at(0)) / 2, (S0.at(1) + S1.at(1)) / 2), $k$)
  O-lblw(p, ((S1.at(0) + S3.at(0)) / 2, (S1.at(1) + S3.at(1)) / 2), $R$)
  O-ring(p, M)
  O-ring(p, O1)
  O-ring(p, O2)
  lbl(p, M, $M$, dir: "s", d: 13)
  lbl(p, O1, $O_1$, dir: "e", d: 14)
  lbl(p, O2, $O_2$, dir: "e", d: 14)
  // 左上角线段 R
  pseg(p, (306, 512), (398, 512), s: 5, stroke: lb)
  lbl(p, (352, 512), $R$, dir: "n", d: 10)
})
