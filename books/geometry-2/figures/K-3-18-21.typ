// 图 3·18、3·19（原书 p.193）、图 3·20（p.193）、图 3·21（p.194）；页面 120 dpi 坐标。
#import "K-base.typ": *

// 图 3·18 梯形面积公式：对角线 AC，高 DD'、CC'、AA'（A'D 为虚线）
#let fig-K-3-18(width: 290 * k) = px-canvas(290, 175, origin: (195, 285), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((207, 440), (473, 440), (382, 308), (255, 308))
  let (A1, D1, C1) = ((207, 308), (255, 440), (382, 440))
  poly(p, (A, B, C, D), close: true)
  seg(p, D, D1)
  seg(p, A, C, stroke: dsh)
  seg(p, A1, A, stroke: dsh)
  seg(p, A1, D, stroke: dsh)
  seg(p, C, C1, stroke: dsh)
  lbl(p, A1, $A'$, dir: "nw", d: 10)
  lbl(p, D, $D$, dir: "n")
  lbl(p, C, $C$, dir: "n")
  lbl(p, A, $A$, dir: "sw")
  lbl(p, D1, $D'$, dir: "s", d: 11)
  lbl(p, C1, $C'$, dir: "s", d: 11)
  lbl(p, B, $B$, dir: "se")
})

// 图 3·19 梯形的中位线 MN，高 CC'
#let fig-K-3-19(width: 350 * k) = px-canvas(350, 235, origin: (525, 218), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((545, 442), (873, 442), (806, 240), (678, 240))
  let N = K-lerp(A, D, 0.5)
  let M = K-lerp(B, C, 0.5)
  poly(p, (A, B, C, D), close: true)
  seg(p, N, M)
  seg(p, C, (806, 442))
  lbl(p, D, $D$, dir: "n")
  lbl(p, C, $C$, dir: "n")
  lbl(p, N, $N$, dir: "w")
  lbl(p, M, $M$, dir: "e")
  lbl(p, A, $A$, dir: "sw")
  lbl(p, (806, 442), $C'$, dir: "s", d: 11)
  lbl(p, B, $B$, dir: "se")
})

// 图 3·20 例 1：等腰梯形，高 DD'、CC' 为虚线
#let fig-K-3-20(width: 260 * k) = px-canvas(260, 175, origin: (630, 1090), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((650, 1242), (872, 1242), (846, 1107), (676, 1107))
  poly(p, (A, B, C, D), close: true)
  seg(p, D, (676, 1242), stroke: dsh)
  seg(p, C, (846, 1242), stroke: dsh)
  lbl(p, D, $D$, dir: "n")
  lbl(p, C, $C$, dir: "n")
  lbl(p, A, $A$, dir: "sw")
  lbl(p, (676, 1242), $D'$, dir: "s", d: 11)
  lbl(p, (846, 1242), $C'$, dir: "s", d: 11)
  lbl(p, B, $B$, dir: "se")
})

// 图 3·21 例 2：直角梯形，∠A = 30°，高 DD'
#let fig-K-3-21(width: 340 * k) = px-canvas(340, 150, origin: (300, 935), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D, D1) = ((318, 1066), (627, 1066), (627, 953), (527, 953), (527, 1066))
  poly(p, (A, B, C, D), close: true)
  seg(p, D, D1, stroke: dsh)
  rtmark(p, D1, D, A, s: 9)
  rtmark(p, B, C, A, s: 9)
  anglearc(p, A, B, D, 40)
  content(p(369, 1055), tsm($30°$))
  lbl(p, D, $D$, dir: "n")
  lbl(p, C, $C$, dir: "ne", d: 10)
  lbl(p, A, $A$, dir: "sw")
  lbl(p, D1, $D'$, dir: "se", d: 11)
  lbl(p, B, $B$, dir: "se")
})
