// 习题 2·16 第 10 题(4)（原书 p.156）、本章提要表（p.156）、复习题二各题插图（p.158–161）；页面 200 dpi 坐标。
// 手绘原图关系含糊处按题设算出来画（见 notes/I.md）。
#import "I-base.typ": *

// 习题 2·16 第 10 题(4)：A、B、C、D 是一直线上的点（p.156）
#let fig-I-q10(width: 510 * k) = px-canvas(510, 50, origin: (240, 235), width: width, (p, u) => {
  import cetz.draw: *
  let y = 265
  let xs = (258, 392, 595, 733)
  seg(p, (258, y), (733, y))
  for (x, name) in xs.zip(($A$, $B$, $C$, $D$)) {
    seg(p, (x, y - 6), (x, y + 6))
    lbl(p, (x, y), name, dir: "n", d: 14)
  }
})

// 本章提要里“三角形的分类”表中的小图（p.156）。pts 为页面坐标顶点，d 为直角标记（顶点, 两边上的点）
#let I-tri(pts, apexd: false) = {
  let xs = pts.map(q => q.at(0))
  let ys = pts.map(q => q.at(1))
  let (x0, x1, y0, y1) = (calc.min(..xs) - 8, calc.max(..xs) + 8, calc.min(..ys) - 8, calc.max(..ys) + 8)
  px-canvas(x1 - x0, y1 - y0, origin: (x0, y0), width: (x1 - x0) * k, (p, u) => {
    import cetz.draw: *
    poly(p, pts, close: true)
    if apexd {
      let v = pts.first()
      anglearc(p, v, pts.at(1), pts.at(2), 13)
      lbl(p, (v.at(0), v.at(1) + 25), $d$, dir: "c", d: 0)
    }
  })
}
#let fig-I-tri = (
  I-tri(((298, 955), (430, 955), (390, 882))),
  I-tri(((500, 878), (500, 955), (632, 955))),
  I-tri(((688, 876), (762, 955), (840, 955))),
  I-tri(((363, 1002), (308, 1113), (420, 1113))),
  I-tri(((563, 1033), (498, 1098), (632, 1098)), apexd: true),
  I-tri(((768, 1040), (692, 1095), (842, 1095))),
  I-tri(((365, 1148), (297, 1262), (432, 1262))),
)

// 复习题二 第 2 题：∠A = 27°，∠B = 96°，∠C = 30°，求 ∠x（p.158）
#let fig-I-r2(width: 425 * k) = px-canvas(425, 270, origin: (115, 600), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D, E) = ((130, 825), (298, 620), (520, 757), (298, 848), (298, 748))
  seg(p, A, B)
  seg(p, B, C)
  seg(p, A, E)
  seg(p, E, C)
  seg(p, B, D)
  anglearc(p, E, A, C, 17)
  lbl(p, (322, 780), $x$, dir: "c", d: 0)
  lbl(p, B, $B$, dir: "n", d: 10)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, D, $D$, dir: "s", d: 10)
})

// 复习题二 第 3 题：五角星形（正五角星），阴影为 △PDB（p.158）
#let fig-I-r3(width: 340 * k) = px-canvas(340, 330, origin: (520, 540), width: width, (p, u) => {
  import cetz.draw: *
  let (E, A, D, B, C) = ((690, 555), (535, 668), (845, 668), (594, 850), (786, 850))
  let P = I-meet(A, D, E, B)
  let Q = I-meet(C, A, E, B)
  I-hatch(p, (P, D, B), dir: (1, 1), step: 7)
  poly(p, (A, D, B, E, C), close: true)
  anglearc(p, P, A, Q, 14)
  anglearc(p, Q, A, P, 14)
  lbl(p, E, $E$, dir: "n", d: 10)
  lbl(p, A, $A$, dir: "nw", d: 9)
  lbl(p, D, $D$, dir: "ne", d: 9)
  lbl(p, B, $B$, dir: "sw", d: 9)
  lbl(p, C, $C$, dir: "se", d: 9)
  lbl(p, P, $P$, dir: "nw", d: 11)
  lbl(p, Q, $Q$, dir: "w", d: 16)
})

// 复习题二 第 4 题：∠ABC = 70°，∠BCD = 30°，∠CDE = 40°（p.158）
// 原图右端字母印得像 Q，题文作 C，按 C 画。
#let fig-I-r4(width: 305 * k) = px-canvas(305, 275, origin: (535, 975), width: width, (p, u) => {
  import cetz.draw: *
  let B = (552, 1127)
  let C = (825, 1127)
  let a = 70deg
  let A = (B.at(0) + 125 * calc.cos(a), B.at(1) - 125 * calc.sin(a))
  let D = (C.at(0) - 173, C.at(1) + 100)
  let E = (D.at(0) + 250 * calc.cos(a), D.at(1) - 250 * calc.sin(a))
  let F = I-meet(D, E, B, C)
  seg(p, A, B)
  seg(p, B, C)
  seg(p, C, D)
  seg(p, D, E)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, E, $E$, dir: "ne", d: 10)
  lbl(p, B, $B$, dir: "sw", d: 9)
  lbl(p, F, $F$, dir: "ne", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, D, $D$, dir: "s", d: 10)
})

// 复习题二 第 9 题：l1 ∥ l2，线段 AB 的中点为 O（p.159）
#let fig-I-r9(width: 415 * k) = px-canvas(415, 230, origin: (305, 520), width: width, (p, u) => {
  import cetz.draw: *
  let O = (512, 633)
  let (A, P) = ((448, 548), (562, 548))
  let B = (2 * O.at(0) - A.at(0), 2 * O.at(1) - A.at(1))
  let Q = (2 * O.at(0) - P.at(0), 2 * O.at(1) - P.at(1))
  let R2 = (639, 548)
  let R1 = (2 * O.at(0) - R2.at(0), 2 * O.at(1) - R2.at(1))
  seg(p, (335, 547), (705, 547))
  seg(p, (335, 718), (703, 718))
  pdot(p, (708, 547), r: 2.6)
  pdot(p, (706, 718), r: 2.6)
  seg(p, A, B)
  seg(p, P, Q)
  seg(p, R1, R2)
  lbl(p, (322, 547), $l_1$, dir: "c", d: 0)
  lbl(p, (320, 718), $l_2$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "n", d: 12)
  lbl(p, P, $P$, dir: "n", d: 12)
  lbl(p, B, $B$, dir: "s", d: 12)
  lbl(p, Q, $Q$, dir: "s", d: 12)
  lbl(p, O, $O$, dir: "nw", d: 11)
})

// 复习题二 第 15 题：等腰三角形 ABC（AB = AC），延长 DE 和 CA 相交于 F，阴影为 △ABC（p.160）
#let fig-I-r15(width: 320 * k) = px-canvas(320, 275, origin: (130, 135), width: width, (p, u) => {
  import cetz.draw: *
  let (B, C, A) = ((160, 385), (425, 385), (292.5, 258))
  let F = I-add(A, I-mul(I-sub(A, C), 0.75))
  let D = (272, 385)
  let E = I-meet(F, D, A, B)
  I-hatch(p, (A, B, C), dir: (1, -1), step: 7)
  seg(p, F, C)
  seg(p, F, B)
  seg(p, F, D)
  poly(p, (A, B, C), close: true)
  lbl(p, F, $F$, dir: "n", d: 11)
  lbl(p, A, $A$, dir: "ne", d: 11)
  lbl(p, E, $E$, dir: "w", d: 10)
  lbl(p, D, $D$, dir: "s", d: 10)
  lbl(p, B, $B$, dir: "sw", d: 9)
  lbl(p, C, $C$, dir: "se", d: 9)
})

// 复习题二 第 17 题：O 是 △ABC 形内任意一点（p.160）
#let fig-I-r17(width: 335 * k) = px-canvas(335, 220, origin: (495, 185), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, O) = ((738, 205), (510, 385), (805, 385), (690, 310))
  poly(p, (A, B, C), close: true)
  seg(p, B, O)
  seg(p, O, C)
  lbl(p, (731, 228), tsm($1$), dir: "c", d: 0)
  lbl(p, (689, 327), tsm($3$), dir: "c", d: 0)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, O, $O$, dir: "n", d: 11)
})

// 复习题二 第 21 题：三线段 AA'、BB'、CC' 相交于 O，OA = OA'，OB = OB'，OC = OC'（p.160）
#let fig-I-r21(width: 495 * k) = px-canvas(495, 325, origin: (235, 930), width: width, (p, u) => {
  import cetz.draw: *
  let O = (481, 1095)
  let (A, B, C) = ((346, 953), (260, 1095), (346, 1205))
  let refl(q) = (2 * O.at(0) - q.at(0), 2 * O.at(1) - q.at(1))
  let (A2, B2, C2) = (refl(A), refl(B), refl(C))
  poly(p, (A, B, C), close: true)
  poly(p, (A2, B2, C2), close: true)
  seg(p, A, A2)
  seg(p, B, B2)
  seg(p, C, C2)
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "s", d: 11)
  lbl(p, A2, $A'$, dir: "s", d: 11)
  lbl(p, B2, $B'$, dir: "e", d: 12)
  lbl(p, C2, $C'$, dir: "n", d: 11)
  lbl(p, O, $O$, dir: "n", d: 11)
})

// 复习题二 第 25 题：以 AB、AC 为边向外作等边三角形 ABD、ACF（p.161）
#let fig-I-r25(width: 400 * k) = px-canvas(400, 245, origin: (340, 595), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((550, 670), (420, 805), (620, 800))
  let rot(v, t) = (v.at(0) * calc.cos(t) - v.at(1) * calc.sin(t), v.at(0) * calc.sin(t) + v.at(1) * calc.cos(t))
  let D = I-add(A, rot(I-sub(B, A), 60deg))
  let F = I-add(A, rot(I-sub(C, A), -60deg))
  poly(p, (A, B, C), close: true)
  poly(p, (A, D, B), close: true)
  poly(p, (A, C, F), close: true)
  seg(p, D, C)
  seg(p, B, F)
  lbl(p, D, $D$, dir: "nw", d: 10)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, F, $F$, dir: "e", d: 11)
  lbl(p, B, $B$, dir: "s", d: 10)
  lbl(p, C, $C$, dir: "s", d: 10)
})
