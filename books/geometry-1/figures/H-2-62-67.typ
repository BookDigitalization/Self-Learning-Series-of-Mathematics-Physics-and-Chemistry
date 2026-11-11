// 图 2·62（原书 p.138）、2·63（p.139）、2·64（p.140）、2·65（p.143）、2·66、2·67（p.144）；页面 200 dpi 坐标。
#import "H-base.typ": *

// 图 2·62：AB>BC，D 在 AB 上且 BD=BC，连 DC
#let fig-H-2-62(width: 330 * k) = px-canvas(330, 280, origin: (540, 985), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((563, 1235), (783, 1008), (835, 1240))
  let D = H-go(B, A, 238)
  poly(p, (A, B, C), close: true)
  dseg(p, D, C)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "n", d: 10)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, D, $D$, dir: "w", d: 10)
  content(p(818, 1219), tsm($1$))
  content(p(642, 1171), tsm($2$))
})

// 图 2·63：∠A>∠B，求证 BC>AC（原图在 C、B 处各画一小弧）
#let fig-H-2-63(width: 400 * k) = px-canvas(400, 290, origin: (480, 570), width: width, (p, u) => {
  import cetz.draw: *
  let (C, A, B) = ((508, 610), (628, 813), (838, 815))
  poly(p, (C, A, B), close: true)
  anglearc(p, C, A, B, 32)
  anglearc(p, B, A, C, 36)
  lbl(p, C, $C$, dir: "nw", d: 11)
  lbl(p, A, $A$, dir: "s", d: 12)
  lbl(p, B, $B$, dir: "e", d: 11)
})

// 图 2·64 例 2：AD⊥BC，BD>DC；△ADC 沿 AD 翻折，C 落在 C'（虚线 AC'）
#let fig-H-2-64(width: 430 * k) = px-canvas(430, 270, origin: (460, 850), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((757, 868), (490, 1090), (850, 1090), (757, 1090))
  let C2 = (664, 1090)
  poly(p, (A, B, C), close: true)
  seg(p, A, D)
  dseg(p, A, C2)
  rtmark(p, D, A, C)
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, D, $D$, dir: "s", d: 13)
  lbl(p, C2, $C'$, dir: "s", d: 13)
  content(p(684, 1077), tsm($1$))
})

// 图 2·65：左 △ABC，右 △A'B'C'（∠A'>∠A），虚线为移图后的 △A'BC'，A'M 平分 ∠B'A'B
// 等长记号：AB、AC、A'B、A'B'、A'C' 各 1 道
#let fig-H-2-65(width: 700 * k) = px-canvas(700, 270, origin: (140, 170), width: width, (p, u) => {
  import cetz.draw: *
  // 左
  let (A, C) = ((178, 405), (443, 405))
  let B = H-pol(A, 256, 32.8)
  poly(p, (A, C, B), close: true)
  ticks(p, A, B, 1)
  ticks(p, A, C, 1)
  anglearc(p, A, C, B, 30)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "se", d: 11)
  lbl(p, B, $B$, dir: "ne", d: 11)
  // 右
  let (A2, C2, B2) = ((520, 405), (785, 405), (670, 198))
  let a1 = H-ang(A2, B2)
  let d1 = calc.sqrt(calc.pow(B2.at(0) - A2.at(0), 2) + calc.pow(B2.at(1) - A2.at(1), 2))
  let B3 = H-pol(A2, d1, 32.8)
  let bis = H-pol(A2, 300, (a1 + 32.8) / 2)
  let M = H-meet(A2, bis, B2, C2)
  poly(p, (B2, A2, C2), close: false)
  seg(p, B2, C2)
  dseg(p, A2, B3)
  dseg(p, A2, M)
  dseg(p, M, B3)
  dseg(p, B3, C2)
  ticks(p, A2, B2, 1)
  ticks(p, A2, B3, 1)
  ticks(p, A2, C2, 1)
  anglearc(p, A2, C2, B3, 30)
  lbl(p, A2, $A'$, dir: "w", d: 11)
  lbl(p, C2, $C'$, dir: "se", d: 11)
  lbl(p, B2, $B'$, dir: "n", d: 11)
  lbl(p, M, $M$, dir: "ne", d: 11)
  lbl(p, B3, $B$, dir: "e", d: 11)
  content(p(..H-pol(A2, 42, 49)), tsm($1$))
  content(p(..H-pol(A2, 85, 38)), tsm($2$))
})

// 图 2·66：AB=A'B'，AC=A'C'，B'C'>BC；AC、A'C' 各 1 道，AB、A'B' 各 2 道
#let fig-H-2-66(width: 640 * k) = px-canvas(640, 250, origin: (170, 370), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((205, 557), (445, 557), (383, 425))
  let (A2, B2, C2) = ((510, 557), (746, 557), (662, 392))
  poly(p, (A, B, C), close: true)
  ticks(p, A, C, 1)
  ticks(p, A, B, 2)
  anglearc(p, A, B, C, 30)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, C, $C$, dir: "n", d: 11)
  poly(p, (A2, B2, C2), close: true)
  ticks(p, A2, C2, 1)
  ticks(p, A2, B2, 2)
  anglearc(p, A2, B2, C2, 26)
  anglearc(p, A2, B2, C2, 33)
  lbl(p, A2, $A'$, dir: "w", d: 12)
  lbl(p, B2, $B'$, dir: "e", d: 12)
  lbl(p, C2, $C'$, dir: "n", d: 11)
})

// 图 2·67 例：圆 O，弦 CD>AB，∠1=∠COD，∠2=∠AOB
#let fig-H-2-67(width: 320 * k) = px-canvas(320, 310, origin: (540, 935), width: width, (p, u) => {
  import cetz.draw: *
  let O = (692, 1087)
  let r = 139
  let A = H-pol(O, r, 152)
  let B = H-pol(O, r, 209)
  let C = H-pol(O, r, 282.6)
  let D = H-pol(O, r, 19.9)
  circ(p, O, r)
  seg(p, O, A)
  seg(p, O, B)
  seg(p, O, C)
  seg(p, O, D)
  seg(p, A, B)
  seg(p, C, D)
  pdot(p, O, r: 2)
  lbl(p, A, $A$, dir: "nw", d: 10)
  lbl(p, B, $B$, dir: "sw", d: 10)
  lbl(p, C, $C$, dir: "s", d: 11)
  lbl(p, D, $D$, dir: "ne", d: 10)
  lbl(p, O, $O$, dir: "n", d: 14)
  content(p(707, 1096), tsm($1$))
  content(p(667, 1085), tsm($2$))
})
