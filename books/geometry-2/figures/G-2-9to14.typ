// 图 2·9（原书 p.122）、2·10、2·11（p.123）、2·12、2·13（p.124）、2·14（p.125）；页面 120 dpi 坐标。
// 图 2·10：菱形按 AC : BD = 22 : 10 重算；图 2·11：按等边三角形重算；图 2·12：按 CD=4、AB=10、BC=5（1 cm = 31 像素）重算。
// 图 2·13：图里第二条线段（原扫描印得像 d）按题设为 b。
#import "G-base.typ": *

// 图 2·9
#let fig-G-2-9(width: 355 * k) = px-canvas(355, 190, origin: (505, 770), width: width, (p, u) => {
  import cetz.draw: *
  let A = (530, 935)
  let B = (835, 935)
  let C = (738, 795)
  let D = (738, 935)
  seg(p, A, B)
  seg(p, A, C)
  seg(p, C, B)
  dseg(p, C, D)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, C, $C$, dir: "n", d: 10)
  lbl(p, D, $D$, dir: "s", d: 11)
})

// 图 2·10：菱形 ABCD
#let fig-G-2-10(width: 200 * k) = px-canvas(200, 335, origin: (680, 495), width: width, (p, u) => {
  import cetz.draw: *
  let C = (771, 513)
  let A = (771, 803)
  let D = (705, 658)
  let B = (837, 658)
  poly(p, (C, B, A, D), close: true)
  seg(p, A, C)
  seg(p, D, B)
  lbl(p, C, $C$, dir: "n", d: 10)
  lbl(p, A, $A$, dir: "s", d: 10)
  lbl(p, D, $D$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, (765, 668), $O$, dir: "c", d: 0)
})

// 图 2·11：等边三角形 ABC，AD ⊥ BC
#let fig-G-2-11(width: 265 * k) = px-canvas(265, 235, origin: (625, 1030), width: width, (p, u) => {
  import cetz.draw: *
  let B = (645, 1238)
  let C = (861, 1238)
  let A = (753, 1051)
  let D = (753, 1238)
  poly(p, (A, B, C), close: true)
  seg(p, A, D)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "w", d: 10)
  lbl(p, C, $C$, dir: "e", d: 10)
  lbl(p, D, $D$, dir: "s", d: 11)
})

// 图 2·12：等腰梯形 ABCD，CE ⊥ AB，CF ∥ AD
#let fig-G-2-12(width: 360 * k) = px-canvas(360, 195, origin: (500, 375), width: width, (p, u) => {
  import cetz.draw: *
  let A = (522, 545)
  let B = (832, 545)
  let D = (615, 421)
  let C = (739, 421)
  let E = (739, 545)
  let F = (646, 545)
  poly(p, (A, B, C, D), close: true)
  seg(p, A, C)
  dseg(p, C, F)
  seg(p, C, E)
  rtmark(p, E, C, B, s: 9)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "e", d: 10)
  lbl(p, C, $C$, dir: "ne", d: 9)
  lbl(p, D, $D$, dir: "nw", d: 9)
  lbl(p, E, $E$, dir: "s", d: 12)
  lbl(p, F, $F$, dir: "s", d: 12)
})

// 图 2·13：已知线段 a、b，作 x = √(a² + b²)
#let fig-G-2-13(width: 375 * k) = px-canvas(375, 260, origin: (495, 1005), width: width, (p, u) => {
  import cetz.draw: *
  pseg(p, (510, 1022), (645, 1022))
  pseg(p, (512, 1075), (748, 1075))
  lbl(p, (578, 1012), $a$, dir: "c", d: 0)
  lbl(p, (630, 1065), $b$, dir: "c", d: 0)
  let D = (610, 1245)
  let C = (838, 1245)
  let A = (838, 1095)
  poly(p, (A, D, C), close: true)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, D, $D$, dir: "w", d: 10)
  lbl(p, C, $C$, dir: "se", d: 9)
  lbl(p, (852, 1170), $a$, dir: "c", d: 0)
  lbl(p, (727, 1158), $x$, dir: "c", d: 0)
  lbl(p, (742, 1233), $b$, dir: "c", d: 0)
})

// 图 2·14：已知线段 a > b，作 x = √(a² − b²)
#let fig-G-2-14(width: 410 * k) = px-canvas(410, 195, origin: (470, 395), width: width, (p, u) => {
  import cetz.draw: *
  pseg(p, (487, 425), (755, 425))
  pseg(p, (487, 460), (622, 460))
  lbl(p, (620, 414), $a$, dir: "c", d: 0)
  lbl(p, (555, 449), $b$, dir: "c", d: 0)
  let B = (630, 562)
  let C = (858, 562)
  let A = (858, 425)
  poly(p, (A, B, C), close: true)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "w", d: 10)
  lbl(p, C, $C$, dir: "se", d: 9)
  lbl(p, (740, 482), $a$, dir: "c", d: 0)
  lbl(p, (868, 493), $b$, dir: "c", d: 0)
  lbl(p, (755, 549), $x$, dir: "c", d: 0)
})
