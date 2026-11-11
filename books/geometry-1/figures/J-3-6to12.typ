// 图 3·6（原书 p.168）、3·7（p.169，写实花纹保留二值化 PNG，来源 p.169 区域 125,262,865,415）、
// 3·8（p.169）、3·9、3·10（p.170）、3·11（p.171）、3·12（p.172）；页面 200 dpi 坐标。
#import "J-base.typ": *

// 图 3·6：两组平行线相交成平行四边形（左 ABCD，右 HGFE，右图字母 H、G、E、F）
#let fig-J-3-6(width: 680 * k) = px-canvas(680, 275, origin: (160, 1000), width: width, (p, u) => {
  import cetz.draw: *
  // 左图
  seg(p, (183, 1070), (513, 1070))
  seg(p, (175, 1191), (472, 1191))
  seg(p, (183, 1243), (333, 1022))
  seg(p, (316, 1260), (485, 1010))
  lbl(p, (300, 1070), $A$, dir: "nw", d: 11)
  lbl(p, (444, 1070), $D$, dir: "ne", d: 11)
  lbl(p, (218, 1191), $B$, dir: "sw", d: 11)
  lbl(p, (363, 1191), $C$, dir: "se", d: 11)
  // 右图
  seg(p, (597, 1029), (828, 1078))
  seg(p, (568, 1177), (822, 1231))
  seg(p, (619, 1262), (655, 1005))
  seg(p, (741, 1262), (776, 1014))
  lbl(p, (650, 1040), $H$, dir: "nw", d: 11)
  lbl(p, (769, 1065), $G$, dir: "ne", d: 11)
  lbl(p, (629, 1190), $E$, dir: "sw", d: 11)
  lbl(p, (746, 1228), $F$, dir: "se", d: 11)
})

// 图 3·7：竹篱的格子、建筑上用的花边（写实，PNG）
#let fig-J-3-7(width: 760 * k) = px-canvas(760, 200, origin: (115, 255), width: width, (p, u) => {
  import cetz.draw: *
  content(p(125, 262), image("J-3-7.png", width: 740 * u), anchor: "north-west")
  content(p(275, 437), text(font: fonts.kai, size: 8pt, [竹篱的格子]))
  content(p(640, 437), text(font: fonts.kai, size: 8pt, [建筑上用的花边]))
})

// 图 3·8：平行四边形 ABCD，对角线 AC，∠1、∠2、∠3、∠4
#let fig-J-3-8(width: 370 * k) = px-canvas(370, 230, origin: (510, 700), width: width, (p, u) => {
  import cetz.draw: *
  let (D, A, B, C) = ((528, 868), (775, 868), (850, 732), (603, 732))
  poly(p, (A, B, C, D), close: true)
  seg(p, C, A)
  lbl(p, C, $C$, dir: "nw", d: 11)
  lbl(p, B, $B$, dir: "ne", d: 11)
  lbl(p, A, $A$, dir: "se", d: 11)
  lbl(p, D, $D$, dir: "sw", d: 11)
  J-num(p, (643, 745), $1$)
  J-num(p, (613, 752), $4$)
  J-num(p, (771, 850), $3$)
  J-num(p, (741, 857), $2$)
})

// 图 3·9：平行四边形 ABCD 的对角线交于 O；∠1、∠2、∠3、∠4
#let fig-J-3-9(width: 370 * k) = px-canvas(370, 220, origin: (520, 370), width: width, (p, u) => {
  import cetz.draw: *
  let (D, C, B, A) = ((536, 389), (778, 389), (848, 525), (606, 525))
  let O = (692, 457)
  poly(p, (A, B, C, D), close: true)
  seg(p, A, C)
  seg(p, B, D)
  lbl(p, D, $D$, dir: "nw", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 11)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, O, $O$, dir: "n", d: 11)
  J-num(p, (603, 402), $3$)
  J-num(p, (744, 404), $1$)
  J-num(p, (642, 513), $2$)
  J-num(p, (785, 514), $4$)
})

// 图 3·10：AB ∥ CD，l₁ ∥ l₂ ∥ l₃ ∥ l₄；上排 R、P、E、G，下排 S、Q、F、H
#let fig-J-3-10(width: 540 * k) = px-canvas(540, 300, origin: (230, 960), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (268, 1064), (727, 1064))
  seg(p, (262, 1198), (718, 1198))
  seg(p, (313, 1240), (418, 990))
  seg(p, (385, 1243), (488, 992))
  seg(p, (435, 1243), (541, 990))
  seg(p, (565, 1243), (660, 987))
  lbl(p, (258, 1064), $A$, dir: "w", d: 9)
  lbl(p, (737, 1064), $B$, dir: "e", d: 9)
  lbl(p, (250, 1198), $C$, dir: "w", d: 9)
  lbl(p, (729, 1198), $D$, dir: "e", d: 9)
  lbl(p, (424, 978), $l_1$, dir: "c", d: 0)
  lbl(p, (488, 976), $l_2$, dir: "c", d: 0)
  lbl(p, (543, 975), $l_3$, dir: "c", d: 0)
  lbl(p, (660, 980), $l_4$, dir: "c", d: 0)
  lbl(p, (386, 1064), $R$, dir: "nw", d: 11)
  lbl(p, (458, 1064), $P$, dir: "nw", d: 11)
  lbl(p, (510, 1064), $E$, dir: "nw", d: 11)
  lbl(p, (631, 1064), $G$, dir: "nw", d: 11)
  lbl(p, (331, 1198), $S$, dir: "nw", d: 11)
  lbl(p, (403, 1198), $Q$, dir: "nw", d: 11)
  lbl(p, (454, 1198), $F$, dir: "nw", d: 11)
  lbl(p, (582, 1198), $H$, dir: "nw", d: 11)
})

// 图 3·11：AB ∥ CD，EF、GH、RS、PQ 都垂直于 AB 和 CD（原图只在 AB 上画直角记号）
#let fig-J-3-11(width: 470 * k) = px-canvas(470, 240, origin: (270, 570), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (290, 620), (697, 620))
  seg(p, (290, 755), (697, 755))
  for x in (373, 458, 551, 631) {
    seg(p, (x, 576), (x, 795))
  }
  for x in (373, 458, 551, 631) {
    rtmark(p, (x, 620), (x + 10, 620), (x, 630), s: 9)
  }
  lbl(p, (290, 620), $A$, dir: "w", d: 9)
  lbl(p, (697, 620), $B$, dir: "e", d: 11)
  lbl(p, (290, 755), $C$, dir: "w", d: 9)
  lbl(p, (697, 755), $D$, dir: "e", d: 11)
  lbl(p, (373, 620), $E$, dir: "nw", d: 11)
  lbl(p, (458, 620), $G$, dir: "nw", d: 11)
  lbl(p, (551, 620), $R$, dir: "nw", d: 11)
  lbl(p, (631, 620), $P$, dir: "nw", d: 11)
  lbl(p, (373, 755), $F$, dir: "sw", d: 11)
  lbl(p, (458, 755), $H$, dir: "sw", d: 11)
  lbl(p, (551, 755), $S$, dir: "sw", d: 11)
  lbl(p, (631, 755), $Q$, dir: "sw", d: 11)
})

// 图 3·12：平行四边形 ABCD，过对角线交点 O 的直线交 AB、DC 于 E、F；∠1–∠4
#let fig-J-3-12(width: 370 * k) = px-canvas(370, 195, origin: (520, 335), width: width, (p, u) => {
  import cetz.draw: *
  let (D, C, B, A) = ((605, 362), (850, 362), (790, 500), (545, 500))
  let O = (697.5, 431)
  let F = (683, 362)
  let E = (712, 500)
  poly(p, (A, B, C, D), close: true)
  seg(p, A, C)
  seg(p, B, D)
  seg(p, F, E)
  anglearc(p, F, C, O, 14)
  anglearc(p, E, A, O, 14)
  anglearc(p, C, D, O, 20)
  anglearc(p, A, B, O, 20)
  lbl(p, D, $D$, dir: "nw", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 11)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, O, $O$, dir: "n", d: 11)
  lbl(p, F, $F$, dir: "n", d: 11)
  lbl(p, E, $E$, dir: "s", d: 11)
  J-num(p, (803, 375), $1$)
  J-num(p, (601, 487), $2$)
  J-num(p, (703, 382), $3$)
  J-num(p, (688, 484), $4$)
})
