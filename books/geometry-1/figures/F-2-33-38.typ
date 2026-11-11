// 图 2·33、2·34（原书 p.102）、图 2·35（p.103）、图 2·36（p.104）、图 2·37（p.105）、图 2·38（p.106）；页面 200 dpi 坐标。
#import "F-base.typ": *

// 图 2·33：∠B=∠C，AM⊥BC（原图 AB、AC 画得略不对称，按等腰重建）
#let fig-F-2-33(width: 270 * k) = px-canvas(270, 275, origin: (605, 398), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, M) = ((739, 432), (638, 640), (840, 640), (739, 640))
  poly(p, (A, B, C), close: true)
  seg(p, A, M)
  anglearc(p, B, C, A, 22)
  anglearc(p, C, B, A, 22)
  anglearc(p, A, B, M, 24)
  anglearc(p, A, M, C, 24)
  lbl(p, A, $A$, dir: "ne", d: 11)
  lbl(p, B, $B$, dir: "sw", d: 11)
  lbl(p, C, $C$, dir: "se", d: 11)
  lbl(p, M, $M$, dir: "s", d: 12)
})

// 图 2·34 例 1：AB=AC，∠A=60°，AB、AC 各 2 道短横
#let fig-F-2-34(width: 310 * k) = px-canvas(310, 265, origin: (568, 990), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((716, 1005), (580, 1237), (862, 1237))
  poly(p, (A, B, C), close: true)
  ticks(p, A, B, 2)
  ticks(p, A, C, 2)
  anglearc(p, A, B, C, 26)
  lbl(p, (716, 1043), $60°$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "sw", d: 11)
  lbl(p, C, $C$, dir: "se", d: 11)
})

// 图 2·35 例 2：直角三角形 ABC，∠A=30°，延长 BC 到 B′ 使 CB′=BC
#let fig-F-2-35(width: 330 * k) = px-canvas(330, 290, origin: (505, 945), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, B2) = ((665, 972), (528, 1203), (665, 1203), (803, 1203))
  poly(p, (A, B, C), close: true)
  seg(p, A, C)
  dseg(p, A, B2)
  dseg(p, C, B2)
  rtmark(p, C, A, B, s: 8)
  anglearc(p, A, B, C, 32)
  lbl(p, (648, 1042), $30°$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "s", d: 12)
  lbl(p, B2, $B'$, dir: "e", d: 12)
})

// 图 2·36 例 3：直角三角形 ABC，∠C=90°，∠B=60°，CD⊥AB
#let fig-F-2-36(width: 450 * k) = px-canvas(450, 240, origin: (315, 925), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((342, 1122), (730, 1122), (633, 955))
  let D = (633, 1122)
  poly(p, (A, B, C), close: true)
  seg(p, C, D)
  rtmark(p, D, A, C, s: 8)
  anglearc(p, B, A, C, 20)
  lbl(p, (692, 1105), $60°$, dir: "c", d: 0)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, D, $D$, dir: "s", d: 12)
})

// 图 2·37 例 4：CF 平分 ∠BCA，AD∥FC，D 在 BC 的延长线上
#let fig-F-2-37(width: 545 * k) = px-canvas(545, 215, origin: (220, 590), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((465, 617), (262, 773), (545, 773))
  let F = (388, 680)
  let t = (773 - 617) / (773 - 680)
  let D = (465 + t * (545 - 388), 773)
  seg(p, B, A)
  seg(p, A, C)
  seg(p, B, C)
  seg(p, F, C)
  seg(p, A, D)
  dseg(p, C, D)
  anglearc(p, C, A, F, 22)
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, F, $F$, dir: "nw", d: 11)
  lbl(p, B, $B$, dir: "sw", d: 11)
  lbl(p, C, $C$, dir: "s", d: 12)
  lbl(p, D, $D$, dir: "se", d: 11)
})

// 图 2·38 例 5：船从 A 向北航行到 B，从 A、B 望灯塔 C；N 在 AB 的延长线上
#let fig-F-2-38(width: 285 * k) = px-canvas(285, 350, origin: (580, 238), width: width, (p, u) => {
  import cetz.draw: *
  let (N, B, A, C) = ((835, 262), (835, 337), (835, 570), (597, 312))
  seg(p, N, A)
  seg(p, C, B)
  seg(p, C, A)
  anglearc(p, B, N, C, 24)
  anglearc(p, A, B, C, 34)
  lbl(p, (807, 312), $84°$, dir: "c", d: 0)
  lbl(p, (816, 518), $42°$, dir: "c", d: 0)
  lbl(p, N, $N$, dir: "ne", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, A, $A$, dir: "se", d: 11)
  lbl(p, C, $C$, dir: "nw", d: 11)
})
