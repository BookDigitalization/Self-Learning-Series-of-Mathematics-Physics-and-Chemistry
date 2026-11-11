// 图 2·15（原书 p.128）、2·16（p.129）、2·17（p.130）、2·18、2·19（p.131）、2·20（p.132）；页面 120 dpi 坐标。
// 图 2·15：三个三角形 a、b 相同，夹角分别为 90°、钝角、锐角。图 2·18：E 为 A 在直线 BC 上的垂足，按垂直关系重算。
// 图 2·19、2·20：照原图（原图 2·19 的 ∠C 没画直角记号，也不画）。
#import "G-base.typ": *

// 图 2·15
#let fig-G-2-15(width: 720 * k) = px-canvas(720, 180, origin: (130, 565), width: width, (p, u) => {
  import cetz.draw: *
  // △ABC
  let B = (148, 590)
  let C = (148, 716)
  let A = (338, 716)
  poly(p, (B, C, A), close: true)
  lbl(p, B, $B$, dir: "n", d: 10)
  lbl(p, (138, 652), $a$, dir: "c", d: 0)
  lbl(p, C, $C$, dir: "s", d: 12)
  lbl(p, (237, 730), $b$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "e", d: 11)
  lbl(p, (247, 645), $c$, dir: "c", d: 0)
  // △A1B1C1
  let B1 = (345, 610)
  let C1 = (420, 716)
  let A1 = (610, 716)
  poly(p, (B1, C1, A1), close: true)
  lbl(p, B1, $B_1$, dir: "nw", d: 9)
  lbl(p, (378, 677), $a$, dir: "c", d: 0)
  lbl(p, C1, $C_1$, dir: "s", d: 12)
  lbl(p, (512, 730), $b$, dir: "c", d: 0)
  lbl(p, A1, $A_1$, dir: "s", d: 12)
  lbl(p, (488, 655), $c_1$, dir: "c", d: 0)
  // △A2B2C2
  let C2 = (638, 716)
  let A2 = (825, 716)
  let B2 = (737, 635)
  poly(p, (B2, C2, A2), close: true)
  lbl(p, B2, $B_2$, dir: "n", d: 10)
  lbl(p, (680, 664), $a$, dir: "c", d: 0)
  lbl(p, C2, $C_2$, dir: "s", d: 12)
  lbl(p, (733, 730), $b$, dir: "c", d: 0)
  lbl(p, A2, $A_2$, dir: "e", d: 12)
  lbl(p, (788, 662), $c_2$, dir: "c", d: 0)
})

// 图 2·16：锐角 C，BC 在 CA 上的射影 CD（左：D 在线段 CA 内；右：D 在 CA 延长线上）
#let fig-G-2-16(width: 640 * k) = px-canvas(640, 220, origin: (225, 555), width: width, (p, u) => {
  import cetz.draw: *
  // 左
  let C = (248, 760)
  let A = (485, 760)
  let B = (408, 590)
  let D = (408, 760)
  poly(p, (C, B, A), close: true)
  seg(p, C, A)
  dseg(p, B, D)
  lbl(p, B, $B$, dir: "n", d: 10)
  lbl(p, C, $C$, dir: "w", d: 11)
  lbl(p, A, $A$, dir: "e", d: 11)
  lbl(p, D, $D$, dir: "s", d: 11)
  // 右
  let C2 = (550, 757)
  let A2 = (645, 757)
  let B2 = (765, 572)
  let D2 = (765, 757)
  seg(p, C2, B2)
  seg(p, A2, B2)
  seg(p, C2, A2)
  dseg(p, A2, D2)
  dseg(p, B2, D2)
  lbl(p, B2, $B$, dir: "n", d: 10)
  lbl(p, C2, $C$, dir: "w", d: 11)
  lbl(p, A2, $A$, dir: "s", d: 12)
  lbl(p, D2, $D$, dir: "se", d: 11)
})

// 图 2·17：钝角 C，BC 在 AC 上的射影 CD
#let fig-G-2-17(width: 290 * k) = px-canvas(290, 250, origin: (535, 595), width: width, (p, u) => {
  import cetz.draw: *
  let B = (570, 620)
  let D = (570, 825)
  let C = (648, 825)
  let A = (805, 825)
  seg(p, B, C)
  seg(p, B, A)
  seg(p, C, A)
  dseg(p, B, D)
  dseg(p, D, C)
  lbl(p, B, $B$, dir: "n", d: 10)
  lbl(p, D, $D$, dir: "s", d: 12)
  lbl(p, C, $C$, dir: "s", d: 12)
  lbl(p, A, $A$, dir: "e", d: 11)
})

// 图 2·18：三种情形，E 为 A 在直线 BC 上的垂足
#let fig-G-2-18(width: 760 * k) = px-canvas(760, 270, origin: (130, 185), width: width, (p, u) => {
  import cetz.draw: *
  // 左：锐角三角形 CBA，A 在 BC 上的射影 E 在线段 CB 内
  let C = (170, 368)
  let A = (362, 368)
  let B = (328, 218)
  let D = (328, 368)
  let E = G-foot(A, C, B)
  poly(p, (C, B, A), close: true)
  seg(p, C, A)
  dseg(p, B, D)
  dseg(p, E, A)
  lbl(p, B, $B$, dir: "n", d: 10)
  lbl(p, C, $C$, dir: "w", d: 11)
  lbl(p, A, $A$, dir: "e", d: 11)
  lbl(p, D, $D$, dir: "s", d: 12)
  lbl(p, E, $E$, dir: "nw", d: 9)
  // 中：D 在 CA 延长线上（CA 在 BC 上的射影仍在线段 CB 内）
  let C2 = (410, 368)
  let A2 = (498, 368)
  let B2 = (590, 225)
  let D2 = (590, 368)
  let E2 = G-foot(A2, C2, B2)
  seg(p, C2, B2)
  seg(p, A2, B2)
  seg(p, C2, A2)
  dseg(p, A2, D2)
  dseg(p, B2, D2)
  dseg(p, E2, A2)
  lbl(p, (588, 205), $B$, dir: "c", d: 0)
  lbl(p, C2, $C$, dir: "w", d: 11)
  lbl(p, A2, $A$, dir: "s", d: 12)
  lbl(p, D2, $D$, dir: "se", d: 11)
  lbl(p, E2, $E$, dir: "nw", d: 9)
  // 右：钝角，E 在 BC 的延长线上
  let B3 = (618, 215)
  let D3 = (618, 360)
  let C3 = (700, 360)
  let A3 = (860, 358)
  let E3 = G-foot(A3, B3, C3)
  seg(p, B3, C3)
  seg(p, B3, A3)
  seg(p, C3, A3)
  dseg(p, B3, D3)
  dseg(p, D3, C3)
  dseg(p, C3, E3)
  dseg(p, E3, A3)
  lbl(p, (618, 205), $B$, dir: "c", d: 0)
  lbl(p, D3, $D$, dir: "s", d: 12)
  lbl(p, C3, $C$, dir: "ne", d: 11)
  lbl(p, A3, $A$, dir: "e", d: 11)
  lbl(p, E3, $E$, dir: "s", d: 12)
})

// 图 2·19：△ABC，BC² + CA² = AB²
#let fig-G-2-19(width: 210 * k) = px-canvas(210, 285, origin: (665, 785), width: width, (p, u) => {
  import cetz.draw: *
  let B = (688, 808)
  let C = (688, 1058)
  let A = (860, 1058)
  poly(p, (B, C, A), close: true)
  lbl(p, B, $B$, dir: "n", d: 10)
  lbl(p, C, $C$, dir: "sw", d: 10)
  lbl(p, A, $A$, dir: "e", d: 11)
})

// 图 2·20：平行四边形 ABCD，DF ⊥ AB，CE ⊥ AB（E 在 AB 延长线上）
#let fig-G-2-20(width: 370 * k) = px-canvas(370, 175, origin: (485, 880), width: width, (p, u) => {
  import cetz.draw: *
  let A = (500, 1040)
  let B = (730, 1040)
  let C = (830, 903)
  let D = (600, 903)
  let E = (830, 1040)
  let F = (600, 1040)
  poly(p, (A, B, C, D), close: true)
  seg(p, A, C)
  seg(p, B, D)
  dseg(p, B, E)
  dseg(p, D, F)
  dseg(p, C, E)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "s", d: 12)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, D, $D$, dir: "n", d: 10)
  lbl(p, E, $E$, dir: "se", d: 11)
  lbl(p, F, $F$, dir: "s", d: 12)
})
