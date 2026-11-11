// 总复习题的插图（二）：第 16–21 题（p.299–300）、第 24–25 题（p.301）、第 27–28 题（p.302）、第 29、31、32 题（p.303–304）。页面 200 dpi 坐标。
#import "Q-base.typ": *

// 切点：圆心 c，半径 r，外点 pt；sgn = ±1 选一侧（角度增大或减小的一侧）
#let Q-tp(pt, c, r, sgn) = {
  let (dx, dy) = (pt.at(0) - c.at(0), pt.at(1) - c.at(1))
  let dd = calc.sqrt(dx * dx + dy * dy)
  let base = P-ang(c, pt)
  let al = calc.acos(r / dd) / 1deg
  P-pt(c, r, base + sgn * al)
}

// 第 16 题：两圆 M、N 外切于 C，PC 是内公切线，PS、PR 是切线
#let fig-Q-16(width: 370 * k) = px-canvas(370, 260, origin: (120, 200), width: width, (p, u) => {
  import cetz.draw: *
  let m = (230, 350)
  let n = (397, 350)
  let c = (325, 350)
  let pp = (325, 240)
  P-c(p, m, 95)
  P-c(p, n, 72)
  seg(p, (325, 190), (325, 450))
  let s = Q-tp(pp, m, 95, 1)
  let r = Q-tp(pp, n, 72, -1)
  seg(p, pp, s)
  seg(p, pp, r)
  dseg(p, m, n)
  P-cen(p, m, r: 2.5)
  P-cen(p, n, r: 2.5)
  lbl(p, m, $M$, dir: "nw", d: 11)
  lbl(p, n, $N$, dir: "ne", d: 11)
  lbl(p, c, $C$, dir: "ne", d: 10)
  lbl(p, pp, $P$, dir: "ne", d: 10)
  lbl(p, s, $S$, dir: "nw", d: 10)
  lbl(p, r, $R$, dir: "ne", d: 10)
})

// 第 17 题：两圆 M、N 相交于 P、Q，PR、PS 分别是圆 M、N 的直径
#let fig-Q-17(width: 390 * k) = px-canvas(390, 240, origin: (480, 215), width: width, (p, u) => {
  import cetz.draw: *
  let m = (611, 328)
  let n = (757, 328)
  let pp = (702, 262)
  let q = (702, 394)
  let r = (520, 394)
  let s = (812, 394)
  P-c(p, m, calc.sqrt(91 * 91 + 66 * 66))
  P-c(p, n, calc.sqrt(55 * 55 + 66 * 66))
  dseg(p, pp, q)
  seg(p, pp, r)
  seg(p, pp, s)
  seg(p, m, n)
  seg(p, r, s)
  P-cen(p, m, r: 2.5)
  P-cen(p, n, r: 2.5)
  lbl(p, pp, $P$, dir: "n", d: 10)
  lbl(p, q, $Q$, dir: "s", d: 10)
  lbl(p, r, $R$, dir: "sw", d: 10)
  lbl(p, s, $S$, dir: "se", d: 10)
  lbl(p, m, $M$, dir: "nw", d: 11)
  lbl(p, n, $N$, dir: "ne", d: 11)
})

// 第 18 题：两圆 M、N 内切于 C，CT 是公切线；CB、CE 是大圆的弦，分别交小圆于 A、D
#let fig-Q-18(width: 330 * k) = px-canvas(330, 310, origin: (120, 860), width: width, (p, u) => {
  import cetz.draw: *
  let m = (278, 1022)
  let rm = 134
  let n = (325, 1022)
  let rn = 87
  let c = (412, 1022)
  P-c(p, m, rm)
  P-c(p, n, rn)
  let far(dirpt, o, rr) = {
    let (i1, i2) = P-lc(c, dirpt, o, rr)
    let d1 = calc.abs(i1.at(0) - c.at(0)) + calc.abs(i1.at(1) - c.at(1))
    let d2 = calc.abs(i2.at(0) - c.at(0)) + calc.abs(i2.at(1) - c.at(1))
    if d1 > d2 { i1 } else { i2 }
  }
  let b = far((255, 898), m, rm)
  let e = far((143, 985), m, rm)
  let a = far((255, 898), n, rn)
  let d = far((143, 985), n, rn)
  seg(p, c, b)
  seg(p, c, e)
  seg(p, b, e)
  seg(p, a, d)
  dseg(p, (412, 872), (412, 1162))
  P-cen(p, m, r: 2.5)
  P-cen(p, n, r: 2.5)
  lbl(p, b, $B$, dir: "n", d: 10)
  lbl(p, a, $A$, dir: "ne", d: 10)
  lbl(p, e, $E$, dir: "w", d: 10)
  lbl(p, d, $D$, dir: "nw", d: 10)
  lbl(p, c, $C$, dir: "e", d: 10)
  lbl(p, (412, 872), $T$, dir: "n", d: 9)
  lbl(p, m, $M$, dir: "s", d: 11)
  lbl(p, n, $N$, dir: "s", d: 11)
})

// 第 19 题：A、B 在直线 PQ 异侧，∠AOQ = ∠BOQ，AO > BO；B′ 是 B 关于 PQ 的对称点
#let fig-Q-19(width: 410 * k) = px-canvas(410, 270, origin: (450, 900), width: width, (p, u) => {
  import cetz.draw: *
  let o = (527, 1050)
  let t = 20deg
  let a = (o.at(0) + 265 * calc.cos(t), o.at(1) - 265 * calc.sin(t))
  let b = (o.at(0) + 215 * calc.cos(t), o.at(1) + 215 * calc.sin(t))
  let b1 = (b.at(0), 2 * o.at(1) - b.at(1))
  let c = (770, 1050)
  line(p(470, 1050), p(842, 1050), stroke: lw, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.45))
  seg(p, o, a)
  seg(p, o, b)
  seg(p, a, c)
  seg(p, b, c)
  dseg(p, b1, c)
  anglearc(p, o, (o.at(0) + 100, o.at(1)), a, 42)
  anglearc(p, o, (o.at(0) + 100, o.at(1)), b, 48)
  lbl(p, a, $A$, dir: "ne", d: 10)
  lbl(p, b, $B$, dir: "s", d: 10)
  lbl(p, b1, $B'$, dir: "nw", d: 10)
  lbl(p, c, $C$, dir: "se", d: 10)
  lbl(p, o, $O$, dir: "nw", d: 10)
  lbl(p, (470, 1050), $P$, dir: "w", d: 9)
  lbl(p, (842, 1050), $Q$, dir: "e", d: 9)
})

// 第 20 题：B、C 是 AD 的三等分点，P 在 AD 外；P′B ∥ DP 且 P′B = DP
#let fig-Q-20(width: 390 * k) = px-canvas(390, 290, origin: (135, 700), width: width, (p, u) => {
  import cetz.draw: *
  let a = (160, 950)
  let b = (262, 950)
  let c = (360, 950)
  let d = (463, 950)
  let pp = (490, 730)
  let p1 = (b.at(0) + pp.at(0) - d.at(0), b.at(1) + pp.at(1) - d.at(1))
  seg(p, a, d)
  seg(p, pp, a)
  seg(p, pp, b)
  seg(p, pp, c)
  seg(p, pp, d)
  seg(p, p1, b)
  dseg(p, p1, a)
  ticks(p, p1, b, 1)
  ticks(p, pp, d, 1)
  ticks(p, p1, a, 2)
  ticks(p, pp, c, 2)
  lbl(p, pp, $P$, dir: "ne", d: 10)
  lbl(p, p1, $P'$, dir: "n", d: 10)
  lbl(p, a, $A$, dir: "sw", d: 10)
  lbl(p, b, $B$, dir: "s", d: 10)
  lbl(p, c, $C$, dir: "s", d: 10)
  lbl(p, d, $D$, dir: "se", d: 10)
})

// 第 21 题：AB = AC，D 在 AC 延长线上
#let fig-Q-21(width: 300 * k) = px-canvas(300, 290, origin: (565, 700), width: width, (p, u) => {
  import cetz.draw: *
  let a = (690, 725)
  let b = (590, 893)
  let c = (795, 890)
  let d = Q-lerp(a, c, 1.35)
  poly(p, (a, b, c), close: true)
  seg(p, c, d)
  seg(p, b, d)
  lbl(p, a, $A$, dir: "n", d: 10)
  lbl(p, b, $B$, dir: "w", d: 10)
  lbl(p, c, $C$, dir: "ne", d: 10)
  lbl(p, d, $D$, dir: "se", d: 10)
})

// 第 24 题：圆 I 是 △ABC 的旁切圆，切点 P、R、Q
#let fig-Q-24(width: 380 * k) = px-canvas(380, 300, origin: (110, 570), width: width, (p, u) => {
  import cetz.draw: *
  let i = (402, 720)
  let r = 100
  let a = (155, 652)
  P-c(p, i, r)
  let tp = Q-tp(a, i, r, -1)
  let tq = Q-tp(a, i, r, 1)
  let rr = (i.at(0) - r, i.at(1))
  let c = P-meet(a, tp, rr, (rr.at(0), rr.at(1) + 100))
  let b = P-meet(a, tq, rr, (rr.at(0), rr.at(1) + 100))
  seg(p, c, b)
  P-line(p, a, tp, e2: 75)
  P-line(p, a, tq, e2: 75)
  P-cen(p, i, r: 2.5)
  lbl(p, a, $A$, dir: "w", d: 10)
  lbl(p, c, $C$, dir: "n", d: 10)
  lbl(p, tp, $P$, dir: "n", d: 10)
  lbl(p, rr, $R$, dir: "w", d: 10)
  lbl(p, b, $B$, dir: "sw", d: 10)
  lbl(p, tq, $Q$, dir: "s", d: 10)
  lbl(p, i, $I$, dir: "n", d: 11)
})

// 第 25 题：两圆内切于 P，外圆的弦 AB 与内圆交于 C、D，PQ 是外公切线
#let fig-Q-25(width: 330 * k) = px-canvas(330, 320, origin: (535, 560), width: width, (p, u) => {
  import cetz.draw: *
  let o = (672, 716)
  let rr = 136
  let o2 = (713, 716)
  let r2 = 95
  let pp = (808, 716)
  let a = P-pt(o, rr, 115)
  let b = P-pt(o, rr, -76)
  let (c, d) = P-lc(a, b, o2, r2)
  P-c(p, o, rr)
  P-c(p, o2, r2)
  seg(p, a, b)
  seg(p, a, pp)
  seg(p, b, pp)
  seg(p, c, pp)
  seg(p, d, pp)
  dseg(p, (808, 580), (808, 835))
  anglearc(p, pp, a, c, 26)
  anglearc(p, pp, d, b, 26)
  lbl(p, a, $A$, dir: "nw", d: 10)
  lbl(p, c, $C$, dir: "w", d: 10)
  lbl(p, d, $D$, dir: "sw", d: 10)
  lbl(p, b, $B$, dir: "s", d: 10)
  lbl(p, pp, $P$, dir: "e", d: 10)
  lbl(p, (808, 580), $Q$, dir: "n", d: 10)
})

// 第 27 题：梯形 ABCD，AD ∥ BC，AD + BC = AB；M 是 DC 中点，AM 交 BC 延长线于 S
#let fig-Q-27(width: 340 * k) = px-canvas(340, 340, origin: (335, 320), width: width, (p, u) => {
  import cetz.draw: *
  let b = (358, 618)
  let c = (562, 618)
  let a = (447, 348)
  let d = (527, 348)
  let m = Q-mid(d, c)
  let s = (b.at(0) + calc.sqrt(89 * 89 + 270 * 270), 618)
  let s = P-meet(a, m, b, c)
  poly(p, (a, b, c, d), close: true)
  seg(p, a, m)
  dseg(p, m, s)
  dseg(p, c, s)
  dseg(p, b, m)
  anglearc(p, a, b, m, 22)
  anglearc(p, s, c, m, 22)
  lbl(p, a, $A$, dir: "nw", d: 10)
  lbl(p, d, $D$, dir: "ne", d: 10)
  lbl(p, m, $M$, dir: "e", d: 10)
  lbl(p, b, $B$, dir: "sw", d: 10)
  lbl(p, c, $C$, dir: "s", d: 10)
  lbl(p, s, $S$, dir: "se", d: 10)
})

// 第 28 题：△A′B′C′ 已作成（阴影），B′P = B′A′，C′Q = C′A′
#let fig-Q-28(width: 620 * k) = px-canvas(620, 190, origin: (200, 830), width: width, (p, u) => {
  import cetz.draw: *
  let b = (430, 980)
  let c = (627, 980)
  let a = (565, 855)
  let ba = calc.sqrt(135 * 135 + 125 * 125)
  let ca = calc.sqrt(62 * 62 + 125 * 125)
  let pp = (b.at(0) - ba, 980)
  let q = (c.at(0) + ca, 980)
  line(p(..a), p(..b), p(..c), close: true, fill: Q-hatch, stroke: lw)
  seg(p, pp, q)
  dseg(p, a, pp)
  dseg(p, a, q)
  anglearc(p, b, c, a, 24)
  anglearc(p, c, b, a, 24)
  anglearc(p, c, b, a, 29)
  lbl(p, a, $A'$, dir: "n", d: 10)
  lbl(p, pp, $P$, dir: "sw", d: 10)
  lbl(p, b, $B'$, dir: "s", d: 10)
  lbl(p, c, $C'$, dir: "s", d: 10)
  lbl(p, q, $Q$, dir: "se", d: 10)
})

// 第 29 题：梯形 ABCD 的两底 AB、CD 和两对角线 m、n；BD 平移到 AS 的位置
#let fig-Q-29(width: 430 * k) = px-canvas(430, 220, origin: (280, 285), width: width, (p, u) => {
  import cetz.draw: *
  let b = (363, 310)
  let a = (500, 310)
  let c = (300, 472)
  let d = (532, 472)
  let s = (d.at(0) + a.at(0) - b.at(0), 472)
  poly(p, (a, b, c, d), close: true)
  seg(p, a, c)
  seg(p, b, d)
  dseg(p, a, s)
  dseg(p, d, s)
  lbl(p, (366, 388), $m$, dir: "c", d: 0)
  lbl(p, (468, 384), $n$, dir: "c", d: 0)
  lbl(p, (590, 372), $n$, dir: "c", d: 0)
  lbl(p, (416, 461), $c$, dir: "c", d: 0)
  lbl(p, (602, 461), $b$, dir: "c", d: 0)
  lbl(p, b, $B$, dir: "nw", d: 10)
  lbl(p, a, $A$, dir: "ne", d: 10)
  lbl(p, c, $C$, dir: "sw", d: 10)
  lbl(p, d, $D$, dir: "s", d: 10)
  lbl(p, s, $S$, dir: "se", d: 10)
})

// 第 31 题：圆 M 内的弦 BD = l，小同心圆与 l 相切；过 P 作小圆的切线 PB、PD
#let fig-Q-31(width: 430 * k) = px-canvas(430, 260, origin: (270, 850), width: width, (p, u) => {
  import cetz.draw: *
  let m = (557, 962)
  let rb = 110
  let rs = 68
  let h = calc.sqrt(rb * rb - rs * rs)
  let b = (m.at(0) + rs, m.at(1) - h)
  let d = (m.at(0) + rs, m.at(1) + h)
  // 过 B 的另一条切线：切点是 (m.x + rs, m.y) 关于 MB 的对称点
  let ang = P-ang(m, b)
  let t2 = P-pt(m, rs, 2 * ang)
  let pp = P-meet(b, t2, m, (m.at(0) + 50, m.at(1)))
  let (b0, a) = P-lc(b, pp, m, rb)
  let dpt = (b.at(0), 2 * m.at(1) - b.at(1))
  let cpt = (a.at(0), 2 * m.at(1) - a.at(1))
  P-c(p, m, rb)
  P-c(p, m, rs)
  seg(p, pp, b)
  seg(p, pp, d)
  seg(p, b, d)
  P-cen(p, m, r: 2.5)
  lbl(p, b, $B$, dir: "ne", d: 10)
  lbl(p, d, $D$, dir: "se", d: 10)
  lbl(p, a, $A$, dir: "nw", d: 10)
  lbl(p, cpt, $C$, dir: "sw", d: 10)
  lbl(p, pp, $P$, dir: "w", d: 10)
  lbl(p, m, $M$, dir: "s", d: 11)
  lbl(p, (m.at(0) + rs + 11, m.at(1)), $l$, dir: "c", d: 0)
})

// 第 32 题：已知圆 M、直线 l 和点 P
#let fig-Q-32a(width: 470 * k) = px-canvas(470, 270, origin: (270, 150), width: width, (p, u) => {
  import cetz.draw: *
  P-c(p, (420, 255), 95)
  circle(p(420, 255), radius: 3, fill: black, stroke: none)
  lbl(p, (420, 255), $M$, dir: "n", d: 14)
  pdot(p, (535, 332), r: 3)
  lbl(p, (535, 332), $P$, dir: "e", d: 12)
  seg(p, (305, 390), (715, 390))
  pdot(p, (715, 390), r: 3)
  lbl(p, (290, 388), $l$, dir: "c", d: 0)
})

// 第 32 题提示图：过 P 作 RS ⊥ l，PR = PS；过 R 作 l′ ∥ l 交圆 M 于 A、A′；APB、A′PB′ 即所求
#let fig-Q-32b(width: 600 * k) = px-canvas(600, 290, origin: (210, 445), width: width, (p, u) => {
  import cetz.draw: *
  let m = (397, 565)
  let pp = (516, 648)
  let ly = 698
  let l1y = 598
  let dx = calc.sqrt(97 * 97 - (l1y - 565) * (l1y - 565))
  let a1 = (397 - dx, l1y)
  let a = (397 + dx, l1y)
  let b = (2 * pp.at(0) - a.at(0), 2 * pp.at(1) - a.at(1))
  let b1 = (2 * pp.at(0) - a1.at(0), 2 * pp.at(1) - a1.at(1))
  P-c(p, m, 97)
  seg(p, (250, l1y), (655, l1y))
  seg(p, (250, ly), (790, ly))
  pdot(p, (790, ly), r: 3)
  dseg(p, (516, l1y), (516, ly))
  seg(p, a, b)
  seg(p, a1, b1)
  P-cen(p, m, r: 2.5)
  P-cen(p, pp, r: 2.5)
  lbl(p, m, $M$, dir: "n", d: 14)
  lbl(p, (516, l1y), $R$, dir: "n", d: 10)
  lbl(p, (516, ly), $S$, dir: "s", d: 10)
  lbl(p, pp, $P$, dir: "e", d: 11)
  lbl(p, a1, $A'$, dir: "nw", d: 10)
  lbl(p, a, $A$, dir: "ne", d: 10)
  lbl(p, b, $B$, dir: "s", d: 10)
  lbl(p, b1, $B'$, dir: "s", d: 10)
  lbl(p, (232, l1y), $l'$, dir: "c", d: 0)
  lbl(p, (232, ly), $l$, dir: "c", d: 0)
})
