// 图 1·38（原书 p.52）、1·39（p.54）、1·40（p.55）、1·41（p.55）、1·42（p.56）、1·43（p.57）、1·44（p.57）、1·45（p.57）、1·46（p.58）；页面 120 dpi 坐标。
#import "D-base.typ": *

// 图 1·38 预备定理：B'C' ∥ BC，B'D ∥ AC（虚线）
#let fig-D-1-38(width: 300 * k) = px-canvas(300, 230, origin: (560, 1040), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((762, 1062), (580, 1235), (848, 1235))
  let B1 = lerp(A, B, 0.607)
  let C1 = lerp(A, C, 0.607)
  let D = lerp(B1, (B1.at(0) + C.at(0) - A.at(0), B1.at(1) + C.at(1) - A.at(1)), 0.393)
  tri(p, A, B, C)
  seg(p, B1, C1)
  dseg(p, B1, D)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B1, $B'$, dir: "nw", d: 11)
  lbl(p, C1, $C'$, dir: "ne", d: 11)
  lbl(p, B, $B$, dir: "s", d: 11)
  lbl(p, D, $D$, dir: "s", d: 11)
  lbl(p, C, $C$, dir: "s", d: 11)
})

// 图 1·39 两个角对应相等：△ABC 与 △A'B'C'，虚线 B''C'' ∥ BC
#let fig-D-1-39(width: 680 * k) = px-canvas(680, 240, origin: (170, 345), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((437, 372), (188, 535), (540, 535))
  let (A1, B1, C1) = ((750, 442), (603, 537), (808, 537))
  let B2 = lerp(A, B, 0.6)
  let C2 = lerp(A, C, 0.6)
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

// 图 1·40 两个等腰三角形，顶角 A = A'
#let fig-D-1-40(width: 560 * k) = px-canvas(560, 290, origin: (230, 180), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((366, 200), (262, 440), (465, 440))
  let (A1, B1, C1) = ((666, 235), (580, 440), (750, 440))
  tri(p, A, B, C)
  tri(p, A1, B1, C1)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "s", d: 11)
  lbl(p, C, $C$, dir: "s", d: 11)
  lbl(p, A1, $A'$, dir: "n", d: 10)
  lbl(p, B1, $B'$, dir: "s", d: 11)
  lbl(p, C1, $C'$, dir: "s", d: 11)
})

// 图 1·41 圆外一点 A 引两条割线 ABC、ADE；∠EAC 公用，∠ABD、∠AEC 画弧
#let fig-D-1-41(width: 390 * k) = px-canvas(390, 290, origin: (480, 940), width: width, (p, u) => {
  import cetz.draw: *
  let O = (727, 1088)
  let r = 111
  let D = cpt(O, r, 158)
  let E = cpt(O, r, 78)
  let B = cpt(O, r, 192.4)
  let C = cpt(O, r, -12.9)
  let A = isect(D, E, B, C)
  circ(p, O, r)
  seg(p, A, E)
  seg(p, A, C)
  seg(p, B, D)
  seg(p, E, C)
  amk(p, A, E, C, 20)
  amk(p, E, D, C, 14, n: 2)
  amk(p, B, A, D, 14, n: 2)
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, B, $B$, dir: "sw", d: 14)
  lbl(p, C, $C$, dir: "se", d: 11)
  lbl(p, D, $D$, dir: "nw", d: 11)
  lbl(p, E, $E$, dir: "ne", d: 10)
})

// 图 1·42 等腰 △ABC（AB = AC），以 B 为圆心、BC 为半径的圆弧交 AC 于 D，虚线 BD
#let fig-D-1-42(width: 250 * k) = px-canvas(250, 290, origin: (640, 430), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((750, 448), (660, 690), (855, 690))
  let D = lerp(A, C, 0.38)
  tri(p, A, B, C)
  dseg(p, B, D)
  varc(p, B, D, C, 195)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "s", d: 10)
  lbl(p, C, $C$, dir: "se", d: 10)
  lbl(p, D, $D$, dir: "ne", d: 10)
})

// 图 1·43 把图 1·42 的 △ABC 与 △BDC 分成两个图（弧、短横照对应关系重建）
#let fig-D-1-43(width: 480 * k) = px-canvas(480, 270, origin: (270, 180), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((385, 197), (288, 417), (473, 417))
  let (D, B1, C1) = ((668, 283), (540, 418), (724, 418))
  tri(p, A, B, C)
  tri(p, D, B1, C1)
  amk(p, A, B, C, 11, n: 3)
  amk(p, B, A, C, 17, n: 2)
  amk(p, C, A, B, 17)
  amk(p, B1, D, C1, 17, n: 3)
  amk(p, D, B1, C1, 14, n: 2)
  amk(p, C1, D, B1, 17)
  ticks(p, A, B, 1)
  ticks(p, A, C, 2)
  ticks(p, B, C, 3)
  ticks(p, B1, D, 1)
  ticks(p, B1, C1, 2)
  ticks(p, D, C1, 3)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "sw", d: 10)
  lbl(p, C, $C$, dir: "se", d: 10)
  lbl(p, D, $D$, dir: "n", d: 10)
  lbl(p, B1, $B$, dir: "sw", d: 10)
  lbl(p, C1, $C$, dir: "se", d: 10)
})

// 图 1·44 △ABC 的内角平分线 AD 延长后交外接圆于 E；虚线 BE；∠BAD、∠DAC 标 1、2
#let fig-D-1-44(width: 270 * k) = px-canvas(270, 265, origin: (190, 1005), width: width, (p, u) => {
  import cetz.draw: *
  let O = (325, 1135)
  let r = 114
  let A = cpt(O, r, 76)
  let B = cpt(O, r, 190)
  let C = cpt(O, r, -8)
  let E = cpt(O, r, 271)
  let D = isect(A, E, B, C)
  circ(p, O, r)
  seg(p, A, B)
  seg(p, A, C)
  seg(p, B, C)
  seg(p, A, E)
  dseg(p, B, E)
  amk(p, E, B, A, 14)
  amk(p, C, D, A, 16)
  anglearc(p, A, B, D, 20)
  anglearc(p, A, D, C, 20)
  lbl(p, (A.at(0) - 6, A.at(1) + 28), $1$, dir: "c", d: 0)
  lbl(p, (A.at(0) + 10, A.at(1) + 28), $2$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "w", d: 10)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, D, $D$, dir: "se", d: 9)
  lbl(p, E, $E$, dir: "s", d: 10)
})

// 图 1·45 把图 1·44 的 △ABE 与 △ADC 分成两个图（弧、短横照原图）
#let fig-D-1-45(width: 330 * k) = px-canvas(330, 260, origin: (500, 1015), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, E) = ((638, 1035), (528, 1178), (638, 1253))
  let (A1, D, C) = ((718, 1025), (712, 1160), (806, 1150))
  seg(p, A, B)
  seg(p, A, E)
  dseg(p, B, E)
  seg(p, A1, D)
  seg(p, A1, C)
  seg(p, D, C)
  amk(p, A, B, E, 20, n: 2)
  amk(p, B, A, E, 17, n: 3, gap: 3)
  amk(p, E, A, B, 17)
  amk(p, A1, D, C, 20, n: 2)
  amk(p, D, A1, C, 17, n: 3, gap: 3)
  amk(p, C, A1, D, 17)
  ticks(p, A, B, 1)
  ticks(p, B, E, 2)
  ticks(p, A, E, 3)
  ticks(p, A1, D, 1)
  ticks(p, D, C, 2)
  ticks(p, A1, C, 3)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, E, $E$, dir: "s", d: 10)
  lbl(p, A1, $A$, dir: "n", d: 10)
  lbl(p, D, $D$, dir: "s", d: 11)
  lbl(p, C, $C$, dir: "se", d: 10)
})

// 图 1·46 两边成比例、夹角相等：△ABC 与 △A'B'C'，虚线 B''C'' ∥ BC
#let fig-D-1-46(width: 620 * k) = px-canvas(620, 310, origin: (200, 740), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((445, 762), (222, 1025), (528, 1025))
  let (A1, B1, C1) = ((742, 870), (603, 1025), (782, 1025))
  let B2 = lerp(A, B, 0.623)
  let C2 = lerp(A, C, 0.623)
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
