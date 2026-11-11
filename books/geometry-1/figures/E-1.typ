// 第 1 章 §1·13（图 1·92–1·94，p.69–70）、习题 1·13 第 3 题（p.71）、复习题一各题插图（p.73–76）。页面渲染 200 dpi。
// 图 15 题的灯塔和轮船是写实插画：用原扫描二值化裁剪 E-r15.png，图中文字涂去后用 CeTZ 补。
#import "/books/geometry-1/figures/E-lib.typ": *

// 图 1·92（p.69）
#let fig-E-1-92(width: 340 * k) = px-canvas(340, 265, origin: (520, 385), width: width, (p, u) => {
  import cetz.draw: *
  let P = (545, 545)
  let Q = (622, 622)
  let A = (736, 402)
  let C = (838, 458)
  let I = E-meet(Q, C, P, (822, 545))
  seg(p, P, A)
  seg(p, P, (818, 545))
  seg(p, Q, C)
  seg(p, Q, (818, 622))
  anglearc(p, P, (818, 545), A, 24)
  anglearc(p, Q, (818, 622), C, 24)
  anglearc(p, I, (818, 545), C, 20)
  E-n(p, 760, 533, $1$)
  lbl(p, A, $A$, dir: "ne", d: 8)
  lbl(p, C, $C$, dir: "ne", d: 8)
  lbl(p, (822, 545), $B$, dir: "e", d: 9)
  lbl(p, (822, 622), $D$, dir: "e", d: 9)
  lbl(p, P, $P$, dir: "w", d: 9)
  lbl(p, Q, $Q$, dir: "w", d: 9)
})

// 图 1·93（p.69）
#let fig-E-1-93(width: 340 * k) = px-canvas(340, 360, origin: (530, 840), width: width, (p, u) => {
  import cetz.draw: *
  let P = (610, 988)
  let A = (710, 858)
  let F = (606, 1175)
  let C = (840, 870)
  let Q = E-meet(F, C, (560, 1102), (820, 1102))
  let I = E-meet(F, C, P, (820, 988))
  seg(p, P, A)
  seg(p, P, (818, 988))
  seg(p, Q, C)
  seg(p, Q, (815, 1102))
  seg(p, (565, 1102), Q, stroke: dsh)
  seg(p, Q, F, stroke: dsh)
  anglearc(p, P, (818, 988), A, 26)
  anglearc(p, I, (818, 988), C, 20)
  // ∠CQD 与 ∠EQF（对顶角）各画双弧
  anglearc(p, Q, (815, 1102), C, 19)
  anglearc(p, Q, (815, 1102), C, 25)
  anglearc(p, Q, (565, 1102), F, 19)
  anglearc(p, Q, (565, 1102), F, 25)
  E-n(p, 778, 983, $1$)
  lbl(p, A, $A$, dir: "n", d: 9)
  lbl(p, C, $C$, dir: "ne", d: 8)
  lbl(p, (818, 988), $B$, dir: "e", d: 9)
  lbl(p, (815, 1102), $D$, dir: "e", d: 9)
  lbl(p, (565, 1102), $E$, dir: "w", d: 9)
  lbl(p, F, $F$, dir: "s", d: 9)
  lbl(p, P, $P$, dir: "sw", d: 9)
  E-t(p, (698, 1130), tt($Q$))
})

// 图 1·94（p.70）：PE ∥ AB，PF ∥ CB，PH ⊥ AB
#let fig-E-1-94(width: 350 * k) = px-canvas(350, 245, origin: (320, 840), width: width, (p, u) => {
  import cetz.draw: *
  let B = (345, 1053)
  let A = (645, 1053)
  let C = (537, 865)
  let E = (479, 922)
  let P = (618, 922)
  let H = (618, 1053)
  let F = (484, 1053)
  seg(p, B, A)
  seg(p, B, C)
  seg(p, E, P)
  seg(p, P, H)
  seg(p, P, F)
  rtmark(p, H, P, A)
  anglearc(p, P, F, H, 22)
  anglearc(p, P, F, H, 27)
  lbl(p, C, $C$, dir: "ne", d: 8)
  lbl(p, E, $E$, dir: "nw", d: 9)
  lbl(p, P, $P$, dir: "ne", d: 9)
  lbl(p, B, $B$, dir: "sw", d: 9)
  lbl(p, F, $F$, dir: "s", d: 10)
  lbl(p, H, $H$, dir: "s", d: 10)
  lbl(p, A, $A$, dir: "e", d: 10)
})

// 习题 1·13 第 3 题（p.71）
#let fig-E-ex1-13-3(width: 315 * k) = px-canvas(315, 205, origin: (495, 1010), width: width, (p, u) => {
  import cetz.draw: *
  let O = (535, 1195)
  seg(p, O, (780, 1195))
  seg(p, O, (752, 1040))
  pdot(p, (608, 1028), r: 2.6)
  lbl(p, (608, 1028), $P$, dir: "e", d: 12)
  lbl(p, (752, 1040), $B$, dir: "ne", d: 9)
  lbl(p, O, $O$, dir: "sw", d: 9)
  lbl(p, (780, 1195), $A$, dir: "e", d: 10)
})

// 复习题一 第 13 题（p.73）：OB ⊥ OD，∠1 = ∠2，∠3 = ∠4
#let fig-E-r13(width: 350 * k) = px-canvas(350, 215, origin: (330, 975), width: width, (p, u) => {
  import cetz.draw: *
  let O = (478, 1160)
  let pol(deg, r) = (O.at(0) + r * calc.cos(deg * 1deg), O.at(1) - r * calc.sin(deg * 1deg))
  let B = pol(32, 185)
  let C = pol(64, 195)
  let D = pol(122, 190)
  seg(p, (350, 1160), (655, 1160))
  seg(p, O, B)
  seg(p, O, C)
  seg(p, O, D)
  anglearc(p, O, (655, 1160), B, 30)
  anglearc(p, O, B, C, 30)
  anglearc(p, O, C, D, 20)
  anglearc(p, O, C, D, 25)
  anglearc(p, O, D, (350, 1160), 20)
  anglearc(p, O, D, (350, 1160), 25)
  E-n(p, 518, 1149, $1$)
  E-n(p, 506, 1130, $2$)
  E-n(p, 475, 1117, $3$)
  E-n(p, 441, 1138, $4$)
  lbl(p, D, $D$, dir: "nw", d: 9)
  lbl(p, C, $C$, dir: "ne", d: 8)
  lbl(p, B, $B$, dir: "ne", d: 9)
  lbl(p, (655, 1160), $A$, dir: "e", d: 10)
  lbl(p, (350, 1160), $E$, dir: "w", d: 10)
  lbl(p, O, $O$, dir: "s", d: 10)
})

// 复习题一 第 15 题（p.74）：灯塔和轮船（写实插画，二值化裁剪；文字另补）
#let fig-E-r15(width: 365 * k) = px-canvas(365, 270, origin: (125, 275), width: width, (p, u) => {
  import cetz.draw: *
  E-img(p, u, "E-r15.png", (125, 275, 490, 545))
  E-t(p, (160, 322), tt[灯塔])
  E-t(p, (382, 293), tt[北])
  E-t(p, (367, 467), tsm[48°])
  E-t(p, (451, 501), tt[船])
})

// 复习题一 第 16 题（p.74）：斜垫铁断面，AB ∥ DC，∠A = 45°，∠B = 90°
#let fig-E-r16(width: 360 * k) = px-canvas(360, 195, origin: (500, 350), width: width, (p, u) => {
  import cetz.draw: *
  poly(p, ((525, 522), (838, 522), (838, 372), (672, 372)), close: true)
  lbl(p, (672, 372), $D$, dir: "nw", d: 9)
  lbl(p, (838, 372), $C$, dir: "ne", d: 9)
  lbl(p, (525, 522), $A$, dir: "sw", d: 9)
  lbl(p, (838, 522), $B$, dir: "se", d: 9)
})

// 复习题一 第 17 题（p.74）：CD ∥ BA，BCE 是直线
#let fig-E-r17(width: 370 * k) = px-canvas(370, 230, origin: (140, 800), width: width, (p, u) => {
  import cetz.draw: *
  let B = (165, 992)
  let C = (303, 992)
  let E = (480, 992)
  let A = (232, 832)
  let D = (375, 832)
  seg(p, B, A)
  seg(p, A, C)
  seg(p, C, D)
  seg(p, B, E)
  anglearc(p, A, B, C, 22)
  anglearc(p, B, E, A, 13)
  anglearc(p, B, E, A, 17)
  E-n(p, 232, 864, $1$)
  E-n(p, 190, 976, $2$)
  E-n(p, 306, 963, $3$)
  E-n(p, 326, 976, $4$)
  E-n(p, 283, 978, $5$)
  lbl(p, A, $A$, dir: "n", d: 9)
  lbl(p, D, $D$, dir: "ne", d: 8)
  lbl(p, B, $B$, dir: "sw", d: 9)
  lbl(p, C, $C$, dir: "s", d: 10)
  lbl(p, E, $E$, dir: "e", d: 10)
})

// 复习题一 第 18、19 题（p.74）：∠BED = ∠1 + ∠2，AB ∥ CD，补助线 EP（虚线）
#let fig-E-r18(width: 360 * k) = px-canvas(360, 190, origin: (520, 835), width: width, (p, u) => {
  import cetz.draw: *
  let A = (545, 858)
  let B = (750, 858)
  let E = (650, 905)
  let C = (558, 995)
  let D = (752, 995)
  seg(p, A, B)
  seg(p, E, B)
  seg(p, E, D)
  seg(p, C, D)
  seg(p, E, (840, 905), stroke: dsh)
  anglearc(p, B, A, E, 22)
  anglearc(p, D, C, E, 20)
  anglearc(p, D, C, E, 25)
  E-n(p, 693, 873, $1$)
  E-n(p, 706, 980, $2$)
  lbl(p, A, $A$, dir: "w", d: 10)
  lbl(p, B, $B$, dir: "e", d: 10)
  lbl(p, E, $E$, dir: "w", d: 10)
  lbl(p, (840, 905), $P$, dir: "e", d: 10)
  lbl(p, C, $C$, dir: "w", d: 10)
  lbl(p, D, $D$, dir: "se", d: 9)
})

// 复习题一 第 20、21 题（p.75）：∠ABE + ∠BED + ∠EDC = 360°，补助线 EP
#let fig-E-r20(width: 355 * k) = px-canvas(355, 170, origin: (125, 215), width: width, (p, u) => {
  import cetz.draw: *
  let E = (155, 293)
  let B = (262, 245)
  let D = (285, 362)
  seg(p, E, B)
  seg(p, B, (452, 245))
  seg(p, E, D)
  seg(p, D, (455, 362))
  seg(p, E, (460, 293), stroke: dsh)
  lbl(p, B, $B$, dir: "n", d: 10)
  lbl(p, (452, 245), $A$, dir: "e", d: 10)
  lbl(p, E, $E$, dir: "w", d: 10)
  lbl(p, (460, 293), $P$, dir: "e", d: 10)
  lbl(p, D, $D$, dir: "s", d: 10)
  lbl(p, (455, 362), $C$, dir: "e", d: 10)
})

// 复习题一 第 23 题（p.75）
#let fig-E-r23(width: 410 * k) = px-canvas(410, 250, origin: (480, 140), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (535, 212), (815, 212))
  seg(p, (510, 322), (860, 322))
  seg(p, (625, 165), (558, 365))
  seg(p, (712, 168), (850, 370))
  lbl(p, (625, 165), $E$, dir: "n", d: 9)
  lbl(p, (712, 168), $G$, dir: "n", d: 9)
  lbl(p, (535, 212), $A$, dir: "w", d: 10)
  lbl(p, (815, 212), $B$, dir: "e", d: 10)
  lbl(p, (510, 322), $C$, dir: "w", d: 10)
  lbl(p, (860, 322), $D$, dir: "e", d: 10)
  lbl(p, (558, 365), $F$, dir: "s", d: 9)
  lbl(p, (850, 370), $H$, dir: "s", d: 9)
  E-t(p, (592, 226), tt($M$))
  E-t(p, (554, 336), tt($R$))
  E-t(p, (772, 226), tt($N$))
  E-t(p, (811, 336), tt($S$))
})

// 复习题一 第 24 题（p.75）：以半圆为基础画出的三个图。（1）三个同样的单元；（2）圆内两条“S 形”曲线；（3）直径之比 1 : 2 : 4 的半圆连成
// 原图（3）的大半圆下标的是“8”（直径之比应为 1 : 2 : 4），照原图标。
#let fig-E-r24(width: 490 * k) = px-canvas(490, 550, origin: (270, 710), width: width, (p, u) => {
  import cetz.draw: *
  // (1)
  seg(p, (295, 812), (676, 812), stroke: dsh)
  for x0 in (295, 421, 547) {
    E-arcb(p, (x0 + 63, 812), 63, 0, 180)
    E-arcb(p, (x0 + 31.5, 812), 31.5, 0, 180)
    E-arcb(p, (x0 + 94.5, 812), 31.5, 180, 360)
  }
  E-t(p, (297, 727), tt[(1)])
  // (2)
  seg(p, (292.5, 970), (487.5, 970), stroke: dsh)
  E-arcb(p, (390, 970), 97.5, 0, 360)
  E-arcb(p, (357.5, 970), 65, 0, 180)
  E-arcb(p, (455, 970), 32.5, 180, 360)
  E-arcb(p, (325, 970), 32.5, 0, 180)
  E-arcb(p, (422.5, 970), 65, 180, 360)
  E-t(p, (297, 880), tt[(2)])
  // (3)
  seg(p, (293, 1182), (738, 1182), stroke: dsh)
  E-arcb(p, (325.5, 1182), 32.5, 0, 180)
  E-arcb(p, (420.5, 1182), 62.5, 180, 360)
  E-arcb(p, (610.5, 1182), 127.5, 0, 180)
  E-t(p, (297, 1097), tt[(3)])
  E-t(p, (325, 1195), tt[1])
  E-t(p, (420, 1172), tt[2])
  E-t(p, (610, 1193), tt[8])
})

// 复习题一 第 25 题（p.76）：正方形内的圆弧（虚线为正方形和辅助线）
#let fig-E-r25(width: 460 * k) = px-canvas(460, 450, origin: (260, 220), width: width, (p, u) => {
  import cetz.draw: *
  let sq(x0, y0, x1, y1) = {
    seg(p, (x0, y0), (x1, y0), stroke: dsh)
    seg(p, (x1, y0), (x1, y1), stroke: dsh)
    seg(p, (x1, y1), (x0, y1), stroke: dsh)
    seg(p, (x0, y1), (x0, y0), stroke: dsh)
  }
  // (1) 以四个顶点为圆心、边长为半径
  sq(290, 232, 470, 412)
  E-arcb(p, (470, 232), 180, 180, 270)
  E-arcb(p, (290, 412), 180, 0, 90)
  E-arcb(p, (290, 232), 180, 270, 360)
  E-arcb(p, (470, 412), 180, 90, 180)
  E-t(p, (273, 236), tt[(1)])
  // (2) 以四个顶点为圆心、半边长为半径
  sq(528, 232, 709, 412)
  E-arcb(p, (528, 232), 90.5, 270, 360)
  E-arcb(p, (709, 232), 90.5, 180, 270)
  E-arcb(p, (528, 412), 90.5, 0, 90)
  E-arcb(p, (709, 412), 90.5, 90, 180)
  E-t(p, (512, 236), tt[(2)])
  // (3) 以四个顶点为圆心、半对角线为半径，另有两条对角线（虚线）
  sq(290, 472, 470, 652)
  seg(p, (290, 472), (470, 652), stroke: dsh)
  seg(p, (470, 472), (290, 652), stroke: dsh)
  E-arcb(p, (470, 472), 127.3, 180, 270)
  E-arcb(p, (290, 472), 127.3, 270, 360)
  E-arcb(p, (290, 652), 127.3, 0, 90)
  E-arcb(p, (470, 652), 127.3, 90, 180)
  E-t(p, (273, 474), tt[(3)])
  // (4) 四瓣：以各边中点为圆心、半边长为半径
  sq(528, 472, 709, 653)
  E-arcb(p, (618.5, 472), 90.5, 180, 270)
  E-arcb(p, (528, 562.5), 90.5, 0, 90)
  E-arcb(p, (618.5, 472), 90.5, 270, 360)
  E-arcb(p, (709, 562.5), 90.5, 90, 180)
  E-arcb(p, (528, 562.5), 90.5, 270, 360)
  E-arcb(p, (618.5, 653), 90.5, 90, 180)
  E-arcb(p, (709, 562.5), 90.5, 180, 270)
  E-arcb(p, (618.5, 653), 90.5, 0, 90)
  E-t(p, (512, 474), tt[(4)])
})
