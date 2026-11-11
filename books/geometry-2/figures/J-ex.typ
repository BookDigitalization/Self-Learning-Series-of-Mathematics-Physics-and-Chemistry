// 习题 3·3、3·4 里无编号的插图（原书 p.181 第 4、5、6 题；p.189 第 10、12 题；p.190 第 14、15、17 题；p.191 第 20 题）；页面 120 dpi 坐标。
// 第 5、17、20 题按题设关系重建（EF ∥ AD；∠A = 30° 的菱形；AB = 14、BC = 13、CA = 15 的三角形与其切圆）。
#import "J-base.typ": *

// 习题 3·3 第 4 题：□ABCD，E、F 为 C、B 向 AD（及其延长线）所作垂线的垂足，虚线 FA、FB、EC
#let fig-J-ex33-4(width: 305 * k) = px-canvas(305, 175, origin: (585, 692), width: width, (p, u) => {
  import cetz.draw: *
  let (A, D, B, C) = ((657, 532), (855, 532), (597, 672), (795, 672))
  let (F, E) = ((597, 532), (795, 532))
  polyc(p, A, D, C, B)
  seg(p, F, A, stroke: dsh)
  seg(p, F, B, stroke: dsh)
  seg(p, E, C, stroke: dsh)
  rtmark(p, F, A, B, s: 8)
  rtmark(p, E, D, C, s: 8)
  lbl(p, F, $F$, dir: "nw", d: 9)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, E, $E$, dir: "n", d: 10)
  lbl(p, D, $D$, dir: "ne", d: 9)
  lbl(p, B, $B$, dir: "sw", d: 9)
  lbl(p, C, $C$, dir: "s", d: 10)
})

// 习题 3·3 第 5 题：梯形 ABCD，M 为 BC 中点，EF 过 M 且 ∥ AD
#let fig-J-ex33-5(width: 270 * k) = px-canvas(270, 185, origin: (230, 1062), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((252, 1038), (481, 1038), (412, 898), (278, 898))
  let M = lerp(B, C, 0.5)
  let E = (M.at(0) + (A.at(0) - D.at(0)) / 2, 1038)
  let F = (M.at(0) - (A.at(0) - D.at(0)) / 2, 898)
  polyc(p, A, B, C, D)
  seg(p, C, F, stroke: dsh)
  seg(p, E, F, stroke: dsh)
  lbl(p, D, $D$, dir: "n", d: 10)
  lbl(p, C, $C$, dir: "n", d: 10)
  lbl(p, F, $F$, dir: "ne", d: 9)
  lbl(p, M, $M$, dir: "e", d: 11)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, E, $E$, dir: "s", d: 10)
  lbl(p, B, $B$, dir: "se", d: 9)
})

// 习题 3·3 第 6 题：□ABCD，D 到 AB 的高 h₁（虚线）、到 BC 的高 h₂
#let fig-J-ex33-6(width: 305 * k) = px-canvas(305, 185, origin: (545, 1062), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((565, 1038), (752, 1038), (820, 898), (633, 898))
  let D1 = (633, 1038)
  let G = foot(D, B, C)
  polyc(p, A, B, C, D)
  seg(p, D, D1, stroke: dsh)
  seg(p, D, G)
  rtmark(p, D1, D, B, s: 8)
  rtmark(p, G, D, C, s: 8)
  lbl(p, (633, 985), $h_1$, dir: "e", d: 12)
  lbl(p, lerp(D, G, 0.55), $h_2$, dir: "ne", d: 11)
  lbl(p, D, $D$, dir: "n", d: 10)
  lbl(p, C, $C$, dir: "ne", d: 9)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
})

// 习题 3·4 第 10 题：D、E、F 各为 AB、BC、CA 的三分点（BD = 2/3 AB，BE = 1/3 BC，CF = 1/3 CA），虚线 AE
#let fig-J-ex34-10(width: 280 * k) = px-canvas(280, 235, origin: (190, 948), width: width, (p, u) => {
  import cetz.draw: *
  let (B, C, A) = ((213, 928), (452, 928), (385, 727))
  let D = lerp(A, B, 1 / 3)
  let E = lerp(B, C, 1 / 3)
  let F = lerp(C, A, 1 / 3)
  polyc(p, A, B, C)
  polyc(p, D, E, F)
  seg(p, A, E, stroke: dsh)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "sw", d: 9)
  lbl(p, C, $C$, dir: "se", d: 9)
  lbl(p, D, $D$, dir: "nw", d: 9)
  lbl(p, E, $E$, dir: "s", d: 11)
  lbl(p, F, $F$, dir: "e", d: 10)
})

// 习题 3·4 第 12 题：□ABCD（DA 为下边，CB 为上边），E 在 AB 上，CE 延长交 DA 的延长线于 F，虚线 CA
#let fig-J-ex34-12(width: 240 * k) = px-canvas(240, 165, origin: (595, 928), width: width, (p, u) => {
  import cetz.draw: *
  let (C, B, D, A) = ((640, 775), (765, 775), (612, 912), (737, 912))
  let E = lerp(A, B, 50 / 137)
  let F = isect(C, E, D, A)
  seg(p, D, F)
  seg(p, D, C)
  seg(p, C, B)
  seg(p, A, B)
  seg(p, C, F)
  seg(p, B, F)
  seg(p, D, E)
  seg(p, C, A, stroke: dsh)
  lbl(p, C, $C$, dir: "nw", d: 9)
  lbl(p, B, $B$, dir: "ne", d: 9)
  lbl(p, D, $D$, dir: "sw", d: 9)
  lbl(p, A, $A$, dir: "s", d: 11)
  lbl(p, F, $F$, dir: "se", d: 9)
  lbl(p, E, $E$, dir: "e", d: 10)
})

// 习题 3·4 第 14 题：AE ∥ BC，D 在 AE 上；连 AB、AC、BD、BE、CD、CE
#let fig-J-ex34-14(width: 300 * k) = px-canvas(300, 160, origin: (135, 592), width: width, (p, u) => {
  import cetz.draw: *
  let (A, D, E, B, C) = ((152, 442), (288, 442), (420, 442), (225, 578), (350, 578))
  seg(p, A, E)
  seg(p, B, C)
  for (a, b) in ((A, B), (A, C), (B, D), (B, E), (C, D), (C, E)) { seg(p, a, b) }
  lbl(p, A, $A$, dir: "nw", d: 9)
  lbl(p, D, $D$, dir: "n", d: 10)
  lbl(p, E, $E$, dir: "ne", d: 9)
  lbl(p, B, $B$, dir: "sw", d: 9)
  lbl(p, C, $C$, dir: "se", d: 9)
})

// 习题 3·4 第 15 题：□ABCD，E 在 AB 上，F 在 BC 上，EF ∥ AC；虚线 AF、EC
#let fig-J-ex34-15(width: 360 * k) = px-canvas(360, 205, origin: (480, 612), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((492, 595), (762, 595), (825, 424), (555, 424))
  let E = (642, 595)
  let F = isect(E, (E.at(0) + (C.at(0) - A.at(0)), E.at(1) + (C.at(1) - A.at(1))), B, C)
  polyc(p, A, B, C, D)
  seg(p, A, C)
  seg(p, D, E)
  seg(p, D, F)
  seg(p, E, F)
  seg(p, A, F, stroke: dsh)
  seg(p, E, C, stroke: dsh)
  lbl(p, D, $D$, dir: "nw", d: 9)
  lbl(p, C, $C$, dir: "ne", d: 9)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, E, $E$, dir: "s", d: 11)
  lbl(p, B, $B$, dir: "se", d: 9)
  lbl(p, F, $F$, dir: "e", d: 10)
})

// 习题 3·4 第 17 题：∠A = 30° 的菱形 ABCD，DE ⊥ AB（虚线）
#let fig-J-ex34-17(width: 380 * k) = px-canvas(380, 130, origin: (290, 1142), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, D, C) = ((307, 1123), (492, 1123), (467, 1030), (652, 1030))
  let E = (467, 1123)
  polyc(p, A, B, C, D)
  seg(p, A, C)
  seg(p, B, D)
  seg(p, D, E, stroke: dsh)
  rtmark(p, E, D, B, s: 8)
  lbl(p, D, $D$, dir: "n", d: 10)
  lbl(p, C, $C$, dir: "ne", d: 9)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, E, $E$, dir: "s", d: 10)
  lbl(p, B, $B$, dir: "se", d: 9)
})

// 习题 3·4 第 20 题：△ABC（AB = 14，BC = 13，CA = 15），圆心 O 在 AB 上的圆切 AC、BC 于 D、E；虚线 CO
#let fig-J-ex34-20(width: 270 * k) = px-canvas(270, 285, origin: (615, 962), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((640, 866), (850, 866), (775, 686))
  let O = (752.5, 866)
  let D = foot(O, A, C)
  let E = foot(O, B, C)
  polyc(p, A, B, C)
  circ(p, O, 90)
  seg(p, O, D)
  seg(p, O, E)
  seg(p, C, O, stroke: dsh)
  rtmark(p, D, O, C, s: 8)
  rtmark(p, E, O, C, s: 8)
  lbl(p, C, $C$, dir: "n", d: 10)
  lbl(p, A, $A$, dir: "w", d: 10)
  lbl(p, B, $B$, dir: "se", d: 9)
  lbl(p, O, $O$, dir: "s", d: 11)
  lbl(p, D, $D$, dir: "nw", d: 10)
  lbl(p, E, $E$, dir: "ne", d: 10)
})
