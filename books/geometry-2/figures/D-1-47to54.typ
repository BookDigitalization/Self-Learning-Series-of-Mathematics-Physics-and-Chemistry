// 图 1·47（原书 p.59）、1·48（p.60）、1·49（p.61）、1·50（p.62）、1·51（p.63）、1·52（p.68）、1·53（p.69）、1·54（p.70）；页面 120 dpi 坐标。
#import "D-base.typ": *

// 图 1·47 线段 AA'、BB' 相交于 O；∠A、∠A' 与对顶角 ∠AOB、∠A'OB' 画弧
#let fig-D-1-47(width: 540 * k) = px-canvas(540, 200, origin: (240, 960), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, A1, B1) = ((368, 982), (262, 1140), (680, 1100), (748, 992))
  let O = isect(A, A1, B, B1)
  seg(p, A, A1)
  seg(p, B, B1)
  seg(p, A, B)
  seg(p, A1, B1)
  amk(p, A, O, B, 20)
  amk(p, A1, O, B1, 20)
  amk(p, O, A, B, 13, n: 2)
  amk(p, O, A1, B1, 13, n: 2)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "sw", d: 10)
  lbl(p, A1, $A'$, dir: "s", d: 11)
  lbl(p, B1, $B'$, dir: "ne", d: 11)
  lbl(p, O, $O$, dir: "n", d: 14)
})

// 图 1·48 三角形 ABC 内取一点 D；在 BC 边上作 △BCE，使 ∠EBC = ∠ABD，∠ECB = ∠DAB；虚线 DE
#let fig-D-1-48(width: 270 * k) = px-canvas(270, 270, origin: (600, 488), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D, E) = ((778, 508), (633, 680), (830, 682), (752, 612), (752, 728))
  seg(p, A, B)
  seg(p, A, C)
  seg(p, B, C)
  seg(p, B, D)
  seg(p, A, D)
  seg(p, B, E)
  seg(p, C, E)
  dseg(p, D, E)
  amk(p, B, A, D, 32)
  amk(p, B, E, C, 32)
  amk(p, A, D, B, 24, n: 2)
  amk(p, C, E, B, 22, n: 2)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, D, $D$, dir: "e", d: 11)
  lbl(p, E, $E$, dir: "s", d: 11)
})

// 图 1·49 OA·OB = OC·OD；虚线 AC、BD
#let fig-D-1-49(width: 490 * k) = px-canvas(490, 240, origin: (285, 415), width: width, (p, u) => {
  import cetz.draw: *
  let O = (305, 629)
  let (A, B, X) = ((418, 629), (655, 629), (748, 629))
  let Y = (569, 431)
  let C = (432, 538)
  let D = (510, 482)
  line(p(..O), p(..X), stroke: lw)
  line(p(..O), p(..Y), stroke: lw)
  dseg(p, A, C)
  dseg(p, B, D)
  amk(p, A, O, C, 16)
  amk(p, D, O, B, 16)
  lbl(p, O, $O$, dir: "w", d: 11)
  lbl(p, A, $A$, dir: "s", d: 11)
  lbl(p, B, $B$, dir: "s", d: 11)
  lbl(p, X, $X$, dir: "e", d: 11)
  lbl(p, Y, $Y$, dir: "ne", d: 10)
  lbl(p, C, $C$, dir: "nw", d: 11)
  lbl(p, D, $D$, dir: "nw", d: 11)
})

// 图 1·50 三边成比例：△ABC 与 △A'B'C'，虚线 B''C'' ∥ BC
#let fig-D-1-50(width: 590 * k) = px-canvas(590, 250, origin: (180, 340), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((385, 360), (205, 562), (472, 562))
  let (A1, B1, C1) = ((680, 425), (545, 560), (735, 560))
  let B2 = lerp(A, B, 0.718)
  let C2 = lerp(A, C, 0.718)
  tri(p, A, B, C)
  tri(p, A1, B1, C1)
  dseg(p, B2, C2)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "s", d: 11)
  lbl(p, C, $C$, dir: "s", d: 11)
  lbl(p, B2, $B''$, dir: "nw", d: 11)
  lbl(p, C2, $C''$, dir: "ne", d: 11)
  lbl(p, A1, $A'$, dir: "n", d: 10)
  lbl(p, B1, $B'$, dir: "s", d: 11)
  lbl(p, C1, $C'$, dir: "s", d: 11)
})

// 图 1·51 D、E、F 分别是 △ABC 三边 BC、CA、AB 的中点
#let fig-D-1-51(width: 320 * k) = px-canvas(320, 250, origin: (570, 375), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((782, 395), (592, 598), (862, 598))
  let D = lerp(B, C, 0.5)
  let E = lerp(A, C, 0.5)
  let F = lerp(A, B, 0.5)
  tri(p, A, B, C)
  tri(p, D, E, F)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "s", d: 11)
  lbl(p, C, $C$, dir: "s", d: 11)
  lbl(p, D, $D$, dir: "s", d: 11)
  lbl(p, E, $E$, dir: "ne", d: 11)
  lbl(p, F, $F$, dir: "nw", d: 11)
})

// 图 1·52 两个直角三角形（C、C' 为直角），虚线 B''C'' ∥ BC
#let fig-D-1-52(width: 380 * k) = px-canvas(380, 280, origin: (460, 620), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((632, 640), (482, 872), (632, 872))
  let (A1, B1, C1) = ((808, 700), (705, 872), (808, 872))
  let B2 = lerp(A, B, 0.745)
  let C2 = lerp(A, C, 0.745)
  tri(p, A, B, C)
  tri(p, A1, B1, C1)
  dseg(p, B2, C2)
  rtmark(p, C, A, B)
  rtmark(p, C1, A1, B1)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "s", d: 11)
  lbl(p, C, $C$, dir: "s", d: 11)
  lbl(p, B2, $B''$, dir: "nw", d: 11)
  lbl(p, C2, $C''$, dir: "ne", d: 11)
  lbl(p, A1, $A'$, dir: "n", d: 10)
  lbl(p, B1, $B'$, dir: "s", d: 11)
  lbl(p, C1, $C'$, dir: "s", d: 11)
})

// 图 1·53 AD、BE 是 △ABC 的高，H 是 AD、BE 的交点
#let fig-D-1-53(width: 340 * k) = px-canvas(340, 270, origin: (560, 495), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((770, 520), (582, 728), (868, 728))
  let D = (770, 728)
  let E = foot(B, A, C)
  let H = isect(A, D, B, E)
  tri(p, A, B, C)
  seg(p, A, D)
  seg(p, B, E)
  rtmark(p, D, A, C)
  rtmark(p, E, B, A)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "sw", d: 10)
  lbl(p, C, $C$, dir: "se", d: 10)
  lbl(p, D, $D$, dir: "s", d: 11)
  lbl(p, E, $E$, dir: "ne", d: 11)
  lbl(p, H, $H$, dir: "w", d: 11)
})

// 图 1·54 两个直角梯形 ABCD 与 A'B'C'D'（∠D、∠D' 为直角），对角线 AC、A'C'
#let fig-D-1-54(width: 410 * k) = px-canvas(410, 190, origin: (285, 715), width: width, (p, u) => {
  import cetz.draw: *
  let (D, C, B, A) = ((303, 745), (362, 745), (405, 805), (303, 805))
  let (D1, C1, B1, A1) = ((468, 735), (598, 735), (668, 860), (468, 860))
  poly(p, (A, B, C, D), close: true)
  poly(p, (A1, B1, C1, D1), close: true)
  seg(p, A, C)
  seg(p, A1, C1)
  rtmark(p, D, C, A)
  rtmark(p, D1, C1, A1)
  anglearc(p, A, C, B, 14)
  anglearc(p, A1, C1, B1, 14)
  lbl(p, D, $D$, dir: "nw", d: 10)
  lbl(p, C, $C$, dir: "ne", d: 10)
  lbl(p, B, $B$, dir: "se", d: 10)
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, D1, $D'$, dir: "nw", d: 10)
  lbl(p, C1, $C'$, dir: "ne", d: 10)
  lbl(p, B1, $B'$, dir: "se", d: 11)
  lbl(p, A1, $A'$, dir: "sw", d: 11)
})
