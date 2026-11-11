// 习题 1·3 的插图（原书 p.29–31）：第 2 题提示图、第 2 题图、第 4 题图（p.29）、第 12 题图（p.30）、第 13 题图（p.31）；页面 120 dpi 坐标。
// p.29 第 2 题提示图 F 点旁、D 点旁的手写涂画不属于原图，未画。
#import "B-base.typ": *

// 第 2 题提示图：过 E 作 EF ∥ AB（虚线）
#let fig-B-q2h(width: 270 * k) = px-canvas(270, 185, origin: (545, 437), width: width, (p, u) => {
  import cetz.draw: *
  let A = (560, 595)
  let C = (741, 445)
  let B = (797, 595)
  let D = (700, 595)
  let E = B-lerp(A, C, 0.59)
  let F = B-lerp(B, C, (595 - E.at(1)) / 150)
  poly(p, (A, C, B), close: true)
  seg(p, E, D)
  dseg(p, E, F)
  anglearc(p, A, C, B, 24)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, D, $D$, dir: "s", d: 12)
  lbl(p, E, $E$, dir: "nw", d: 11)
  lbl(p, F, $F$, dir: "ne", d: 11)
})

// 第 2 题图：DB 与 CE 交于 A，DE、BC 两线段
#let fig-B-q2(width: 420 * k) = px-canvas(420, 270, origin: (470, 640), width: width, (p, u) => {
  import cetz.draw: *
  let A = (625, 799)
  let D = (484, 799)
  let B = (865, 799)
  let C = (807, 648)
  let E = (517, 890)
  seg(p, D, B)
  seg(p, C, E)
  seg(p, B, C)
  seg(p, D, E)
  anglearc(p, A, C, B, 24)
  lbl(p, D, $D$, dir: "w", d: 11)
  lbl(p, A, $A$, dir: "nw", d: 10)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, E, $E$, dir: "s", d: 12)
})

// 第 4 题图
#let fig-B-q4(width: 215 * k) = px-canvas(215, 165, origin: (680, 1105), width: width, (p, u) => {
  import cetz.draw: *
  let A = (690, 1251)
  let B = (878, 1247)
  let C = (851, 1137)
  let D = (719, 1114)
  let G = B-lerp(D, B, 0.571)
  let E = B-lerp(B, A, 0.429)
  let F = B-lerp(B, C, 0.429)
  poly(p, (A, B, C, D), close: true)
  seg(p, B, D)
  seg(p, A, C)
  seg(p, G, E)
  seg(p, G, F)
  seg(p, E, F)
  lbl(p, D, $D$, dir: "n", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 11)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, E, $E$, dir: "s", d: 12)
  lbl(p, F, $F$, dir: "e", d: 11)
  lbl(p, G, $G$, dir: "ne", d: 11)
})

// 第 12 题图（p.30）：梯形 ABCD，EF 过对角线交点 O 且平行于底
#let fig-B-q12(width: 260 * k) = px-canvas(260, 175, origin: (590, 1100), width: width, (p, u) => {
  import cetz.draw: *
  let A = (600, 1246)
  let B = (837, 1246)
  let D = (617, 1112)
  let C = (794, 1112)
  let O = B-lerp(D, B, 177 / 414)
  let E = B-lerp(A, D, 0.572)
  let F = B-lerp(B, C, 0.572)
  poly(p, (A, B, C, D), close: true)
  seg(p, A, C)
  seg(p, B, D)
  seg(p, E, F)
  lbl(p, D, $D$, dir: "nw", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 11)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, E, $E$, dir: "w", d: 11)
  lbl(p, F, $F$, dir: "e", d: 11)
  lbl(p, O, $O$, dir: "s", d: 13)
})

// 第 13 题图（p.31）：隔湖测距，B、A 隔湖，CA、CB 虚线穿过湖面（湖面画斜纹）
#let fig-B-q13(width: 290 * k) = px-canvas(290, 250, origin: (590, 725), width: width, (p, u) => {
  import cetz.draw: *
  let lake = ((627, 825), (642, 812), (667, 811), (691, 819), (710, 812), (730, 820), (757, 837),
    (775, 860), (782, 885), (777, 912), (755, 935), (727, 951), (695, 965), (677, 962), (665, 945),
    (655, 920), (650, 885), (645, 870), (632, 845))
  B-hatch(p, lake, 826, 962, 8)
  catmull(..lake.map(t => p(..t)), close: true, stroke: lw, tension: 0.5)
  let C = (781, 740)
  let A = (859, 922)
  let B = (597, 924)
  let D = B-lerp(C, A, 0.368)
  let E = B-lerp(C, B, 0.368)
  dseg(p, C, B)
  dseg(p, B, A)
  seg(p, C, A)
  seg(p, E, D)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, D, $D$, dir: "ne", d: 11)
  lbl(p, E, $E$, dir: "nw", d: 11)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, A, $A$, dir: "se", d: 11)
  rect(p(711, 877), p(733, 894), fill: white, stroke: none)
  lbl(p, (722, 885), $O$, dir: "c", d: 0)
})
