// 习题 4·17 的插图：第 3 题（原书 p.286）、第 6、8、10、11 题（p.287）、第 12、13、14 题（p.288）；页面 200 dpi 坐标。
#import "P-base.typ": *

// 第 3 题：已知角 a 和线段 AB，在直线 l 上求点 P、P'，使 ∠APB = ∠AP'B = ∠a
#let fig-P-r3(width: 580 * k) = px-canvas(580, 215, origin: (200, 960), width: width, (p, u) => {
  import cetz.draw: *
  P-angle(p, (212, 1140), (372, 1140), (277, 1010), 28, $a$, (240, 1125))
  let a = (540, 1138)
  let b = (741, 1138)
  let ang = calc.atan2(65, 130)
  let r = 201 / (2 * calc.sin(ang))
  let dd = calc.sqrt(r * r - 100.5 * 100.5)
  let o = (640.5, 1138 - dd)
  parc(p, o, r, P-ang(o, a) + 360, P-ang(o, b), st: lb)
  seg(p, a, b)
  let l1 = (486, 1039)
  let l2 = (770, 995)
  seg(p, l1, l2)
  let (pp, p2) = P-lc(l1, l2, o, r)
  seg(p, pp, a)
  seg(p, pp, b)
  seg(p, p2, a)
  seg(p, p2, b)
  anglearc(p, pp, a, b, 26)
  anglearc(p, p2, a, b, 26)
  lbl(p, (476, 1036), $l$, dir: "c", d: 0)
  lbl(p, pp, $P$, dir: "nw", d: 10)
  lbl(p, p2, $P'$, dir: "ne", d: 11)
  lbl(p, a, $A$, dir: "sw", d: 10)
  lbl(p, b, $B$, dir: "se", d: 10)
})

// 第 6 题：已知两对角线和一内角，求作平行四边形（半圆弧 DAB 和线段 AO 的延长线为解题辅助线）
#let fig-P-r6(width: 270 * k) = px-canvas(270, 230, origin: (225, 380), width: width, (p, u) => {
  import cetz.draw: *
  let a = (249, 495)
  let b = (459, 498)
  let d = (270, 411)
  let o = (366, 455)
  let e = (470, 422)
  P-arc3(p, d, a, b)
  seg(p, a, b)
  seg(p, a, d)
  seg(p, d, b)
  seg(p, a, e)
  tickat(p, a, e, e, s: 5)
  anglearc(p, a, b, d, 22)
  lbl(p, d, $D$, dir: "n", d: 10)
  lbl(p, o, $O$, dir: "n", d: 11)
  lbl(p, a, $A$, dir: "w", d: 11)
  lbl(p, b, $B$, dir: "e", d: 11)
})

// 第 8 题：半圆（直径 BC）交 AB、AC 于 F、E，BE 和 CF 交于 H
#let fig-P-r8(width: 280 * k) = px-canvas(280, 250, origin: (550, 360), width: width, (p, u) => {
  import cetz.draw: *
  let a = (705, 389)
  let b = (568, 576)
  let c = (795, 576)
  let mc = (681.5, 576)
  let r = 113.5
  let dist(s, t) = calc.sqrt(calc.pow(s.at(0) - t.at(0), 2) + calc.pow(s.at(1) - t.at(1), 2))
  let (f1, f2) = P-lc(a, b, mc, r)
  let f = if dist(f1, b) > dist(f2, b) { f1 } else { f2 }
  let (e1, e2) = P-lc(a, c, mc, r)
  let e = if dist(e1, c) > dist(e2, c) { e1 } else { e2 }
  let h = P-meet(b, e, c, f)
  parc(p, mc, r, 180, 0)
  poly(p, (a, b, c), close: true)
  seg(p, b, e)
  seg(p, c, f)
  lbl(p, a, $A$, dir: "n", d: 10)
  lbl(p, b, $B$, dir: "sw", d: 10)
  lbl(p, c, $C$, dir: "se", d: 10)
  lbl(p, f, $F$, dir: "nw", d: 10)
  lbl(p, e, $E$, dir: "ne", d: 10)
  lbl(p, h, $H$, dir: "s", d: 11)
})

// 第 10 题：∠AOB 和线段 EF（原图把 A 印成 A'，按正文读作 A）
#let fig-P-r10(width: 330 * k) = px-canvas(330, 300, origin: (190, 950), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (222, 968), (470, 968))
  seg(p, (222, 968), (285, 1152))
  pseg(p, (228, 1212), (456, 1212))
  lbl(p, (222, 968), $O$, dir: "w", d: 11)
  lbl(p, (470, 968), $A$, dir: "e", d: 11)
  lbl(p, (285, 1152), $B$, dir: "s", d: 11)
  lbl(p, (228, 1212), $E$, dir: "sw", d: 10)
  lbl(p, (456, 1212), $F$, dir: "se", d: 10)
})

// 第 11 题：线段 AB 和线段 EF
#let fig-P-r11(width: 320 * k) = px-canvas(320, 300, origin: (545, 960), width: width, (p, u) => {
  import cetz.draw: *
  pseg(p, (580, 1070), (792, 992))
  pseg(p, (574, 1213), (820, 1215))
  lbl(p, (580, 1070), $A$, dir: "sw", d: 10)
  lbl(p, (792, 992), $B$, dir: "ne", d: 10)
  lbl(p, (574, 1213), $E$, dir: "w", d: 11)
  lbl(p, (820, 1215), $F$, dir: "e", d: 11)
})

// 第 12 题：线段 l、点 Q、线段 AB
#let fig-P-r12(width: 330 * k) = px-canvas(330, 330, origin: (140, 395), width: width, (p, u) => {
  import cetz.draw: *
  pseg(p, (160, 425), (302, 425))
  lbl(p, (228, 413), $l$, dir: "c", d: 0)
  pdot(p, (197, 492))
  lbl(p, (213, 492), $Q$, dir: "c", d: 0)
  pseg(p, (150, 653), (437, 654))
  lbl(p, (150, 653), $A$, dir: "w", d: 11)
  lbl(p, (437, 654), $B$, dir: "e", d: 11)
})

// 第 13 题：两条平行线 l1、l2 和线段 AB
#let fig-P-r13(width: 330 * k) = px-canvas(330, 270, origin: (485, 400), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (523, 433), (738, 520))
  seg(p, (498, 490), (727, 551))
  lbl(p, (516, 421), $l_1$, dir: "c", d: 0)
  lbl(p, (494, 478), $l_2$, dir: "c", d: 0)
  pseg(p, (497, 652), (780, 651))
  lbl(p, (497, 652), $A$, dir: "w", d: 11)
  lbl(p, (780, 651), $B$, dir: "e", d: 11)
})

// 第 14 题：线段 d、直线 l 和线段 BC
#let fig-P-r14(width: 330 * k) = px-canvas(330, 300, origin: (330, 940), width: width, (p, u) => {
  import cetz.draw: *
  pseg(p, (352, 974), (486, 978))
  lbl(p, (410, 962), $d$, dir: "c", d: 0)
  seg(p, (360, 1020), (553, 1110))
  lbl(p, (352, 1005), $l$, dir: "c", d: 0)
  pseg(p, (350, 1212), (625, 1215))
  lbl(p, (350, 1212), $B$, dir: "w", d: 11)
  lbl(p, (625, 1215), $C$, dir: "e", d: 11)
})
