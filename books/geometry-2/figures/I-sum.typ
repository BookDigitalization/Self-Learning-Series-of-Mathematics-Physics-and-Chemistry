// 本章提要里的六幅圆与线段图（原书 p.160 上方，无图号，(1)–(6)）；页面 120 dpi 坐标。
#import "I-base.typ": *

#let sw = 330 * k   // 图的显示宽度

// (1) 割线 MAB、MCD
#let fig-I-sum-1(width: sw) = px-canvas(330, 240, origin: (140, 192), width: width, (p, u) => {
  import cetz.draw: *
  let O = (360, 302)
  let r = 102
  let M = (155, 243)
  let (C, D) = line-circ(M, (447, 246), O, r)
  let (A, B) = line-circ(M, (259, 303), O, r)
  circ(p, O, r)
  tseg(p, M, D)
  seg(p, M, B)
  ring(p, O, r: 2.5)
  lbl(p, M, $M$, dir: "w", d: 8)
  lbl(p, C, $C$, dir: "nw", d: 8)
  lbl(p, D, $D$, dir: "e", d: 9)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
  lbl(p, O, $O$, dir: "s", d: 12)
})

// (2) 切线 MC(D)、割线 MAB
#let fig-I-sum-2(width: sw) = px-canvas(330, 240, origin: (530, 192), width: width, (p, u) => {
  import cetz.draw: *
  let O = (718, 313)
  let r = 100
  let M = (551, 231)
  let C = tang-pt(M, O, r)
  let (A, B) = line-circ(M, (762, 402), O, r)
  circ(p, O, r)
  tseg(p, M, C)
  seg(p, M, B)
  ring(p, O, r: 2.5)
  lbl(p, M, $M$, dir: "w", d: 8)
  lbl(p, C, $C(D)$, dir: "n", d: 12)
  lbl(p, A, $A$, dir: "w", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
  lbl(p, O, $O$, dir: "s", d: 12)
})

// (3) 两条切线 MC(D)、MA(B)，虚线 MO、OC
#let fig-I-sum-3(width: sw) = px-canvas(330, 250, origin: (140, 490), width: width, (p, u) => {
  import cetz.draw: *
  let O = (343, 606)
  let r = 100
  let M = (179, 521)
  let C = tang-pt(M, O, r)
  let A = tang-pt(M, O, r, side: -1)
  circ(p, O, r)
  tseg(p, M, C)
  tseg(p, M, A)
  dseg(p, M, O)
  dseg(p, C, O)
  ring(p, O, r: 3)
  lbl(p, M, $M$, dir: "w", d: 8)
  lbl(p, C, $C(D)$, dir: "n", d: 12)
  lbl(p, A, $A(B)$, dir: "sw", d: 14)
  lbl(p, O, $O$, dir: "s", d: 12)
})

// (4) 切线 MC(D)，割线 MAB 过圆心
#let fig-I-sum-4(width: sw) = px-canvas(330, 240, origin: (520, 482), width: width, (p, u) => {
  import cetz.draw: *
  let O = (697, 600)
  let r = 100
  let M = (534, 600)
  let C = tang-pt(M, O, r)
  circ(p, O, r)
  tseg(p, M, (797, 600))
  seg(p, M, C)
  ring(p, O, r: 3)
  lbl(p, M, $M$, dir: "w", d: 8)
  lbl(p, C, $C(D)$, dir: "n", d: 12)
  lbl(p, (598, 600), $A$, dir: "sw", d: 10)
  lbl(p, (797, 600), $B$, dir: "e", d: 9)
  lbl(p, O, $O$, dir: "s", d: 12)
})

// (5) 圆内两弦 AB、CD 相交于 M
#let fig-I-sum-5(width: sw) = px-canvas(330, 240, origin: (150, 785), width: width, (p, u) => {
  import cetz.draw: *
  let O = (300, 896)
  let r = 100
  let A = cpt(O, r, 167.8)
  let B = cpt(O, r, 62.2)
  let C = cpt(O, r, 135.4)
  let D = cpt(O, r, -2.3)
  let M = isect(A, B, C, D)
  circ(p, O, r)
  seg(p, A, B)
  seg(p, C, D)
  ring(p, O, r: 2.5)
  lbl(p, A, $A$, dir: "w", d: 9)
  lbl(p, B, $B$, dir: "ne", d: 9)
  lbl(p, C, $C$, dir: "nw", d: 9)
  lbl(p, D, $D$, dir: "e", d: 9)
  lbl(p, M, $M$, dir: "s", d: 12)
  lbl(p, O, $O$, dir: "s", d: 12)
})

// (6) 直径 AB 与垂直于它的弦 CD 相交于 M
#let fig-I-sum-6(width: sw) = px-canvas(330, 240, origin: (520, 785), width: width, (p, u) => {
  import cetz.draw: *
  let O = (675, 897)
  let r = 101
  let A = (574, 897)
  let B = (776, 897)
  let xm = 637
  let h = calc.sqrt(r * r - (xm - 675) * (xm - 675))
  let C = (xm, 897 - h)
  let D = (xm, 897 + h)
  let M = (xm, 897)
  circ(p, O, r)
  tseg(p, A, B)
  tseg(p, C, D)
  rtmark(p, M, A, C, s: 9)
  ring(p, O, r: 3)
  lbl(p, A, $A$, dir: "w", d: 9)
  lbl(p, B, $B$, dir: "e", d: 9)
  lbl(p, C, $C$, dir: "n", d: 9)
  lbl(p, D, $D$, dir: "s", d: 9)
  lbl(p, M, $M$, dir: "ne", d: 13)
  lbl(p, O, $O$, dir: "s", d: 12)
})
