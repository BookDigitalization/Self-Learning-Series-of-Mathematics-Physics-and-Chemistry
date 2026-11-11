// 复习题四的插图：第 8 题、第 10 题（p.291）、第 14 题、第 15 题、第 20 题(1)（p.292）、第 20 题(2)（p.293）、第 26 题及提示图（p.294）。页面 200 dpi 坐标。
#import "Q-base.typ": *

// 第 8 题：两圆外切于 P，AB 是外公切线，PM 是内公切线（虚线，延长过 M）
#let fig-Q-r8(width: 330 * k) = px-canvas(330, 250, origin: (130, 150), width: width, (p, u) => {
  import cetz.draw: *
  let o1 = (237, 284)
  let r1 = 85
  let o2 = (377, 284)
  let r2 = 56
  let pp = (322, 284)
  P-c(p, o1, r1)
  P-c(p, o2, r2)
  let (ta, tb) = P-tan(o1, r1, o2, r2, "out", -1)
  let m = P-meet(ta, tb, pp, (pp.at(0), pp.at(1) - 100))
  P-line(p, ta, tb, e1: 45, e2: 45)
  seg(p, ta, pp)
  seg(p, tb, pp)
  dseg(p, (pp.at(0), 185), (pp.at(0), 385))
  P-cen(p, o1)
  P-cen(p, o2)
  lbl(p, ta, $A$, dir: "nw", d: 10)
  lbl(p, tb, $B$, dir: "ne", d: 10)
  lbl(p, m, $M$, dir: "ne", d: 11)
  lbl(p, pp, $P$, dir: "sw", d: 10)
  lbl(p, o1, $O_1$, dir: "se", d: 14)
  lbl(p, o2, $O_2$, dir: "se", d: 14)
})

// 第 10 题：两等圆 M、N 相交于 P、Q，S 是 MN 的中点，过 P 作垂直于 SP 的直线交两圆于 A、B
#let fig-Q-r10(width: 380 * k) = px-canvas(380, 230, origin: (495, 165), width: width, (p, u) => {
  import cetz.draw: *
  let r = 105
  let m = (606, 283)
  let n = (766, 283)
  let s = (686, 283)
  let h = calc.sqrt(r * r - 80 * 80)
  let pp = (686, 283 - h)
  let q = (686, 283 + h)
  let x = calc.sqrt(r * r - h * h)
  P-c(p, m, r)
  P-c(p, n, r)
  let a = (606 - calc.sqrt(r * r - h * h), pp.at(1))
  let b = (766 + calc.sqrt(r * r - h * h), pp.at(1))
  seg(p, a, b)
  seg(p, m, n)
  seg(p, pp, q)
  dseg(p, m, (606, pp.at(1)))
  dseg(p, n, (766, pp.at(1)))
  P-cen(p, m)
  P-cen(p, n)
  lbl(p, a, $A$, dir: "nw", d: 9)
  lbl(p, b, $B$, dir: "ne", d: 9)
  lbl(p, (606, pp.at(1)), $C$, dir: "n", d: 10)
  lbl(p, (766, pp.at(1)), $D$, dir: "n", d: 10)
  lbl(p, pp, $P$, dir: "n", d: 10)
  lbl(p, q, $Q$, dir: "s", d: 10)
  lbl(p, m, $M$, dir: "sw", d: 11)
  lbl(p, n, $N$, dir: "se", d: 11)
  lbl(p, s, $S$, dir: "se", d: 10)
})

// 第 14 题：圆 O 的直径 AB，切线 CD 切圆于 E，A、B 到切线的距离为 1 厘米和 3 厘米（AB = 4 厘米，弧 AE = 60°）
#let fig-Q-r14(width: 250 * k) = px-canvas(250, 235, origin: (110, 190), width: width, (p, u) => {
  import cetz.draw: *
  let o = (275, 360)
  let r = 103
  let a = (o.at(0) - r, o.at(1))
  let b = (o.at(0) + r, o.at(1))
  let e = P-pt(o, r, 120)
  let dir = (calc.cos(30deg), -calc.sin(30deg))
  let c = (e.at(0) - 150 * dir.at(0), e.at(1) - 150 * dir.at(1))
  let d = (e.at(0) + 110 * dir.at(0), e.at(1) + 110 * dir.at(1))
  let s = Q-foot(a, c, d)
  let kk = Q-foot(b, c, d)
  P-c(p, o, r)
  seg(p, c, d)
  seg(p, a, b)
  seg(p, o, e)
  seg(p, a, s)
  seg(p, b, kk)
  lbl(p, a, $A$, dir: "sw", d: 10)
  lbl(p, b, $B$, dir: "se", d: 10)
  lbl(p, o, $O$, dir: "s", d: 10)
  lbl(p, e, $E$, dir: "nw", d: 10)
  lbl(p, c, $C$, dir: "w", d: 10)
  lbl(p, d, $D$, dir: "ne", d: 10)
  lbl(p, s, $S$, dir: "nw", d: 10)
  lbl(p, kk, $K$, dir: "nw", d: 10)
  Q-lblr(p, Q-mid(a, s), [1 cm], 60deg)
  Q-lblr(p, Q-mid(b, kk), [3 cm], 60deg)
})

// 第 15 题：已知圆 M 和两平行直线 l1、l2；所求圆心是中线与圆 M 的同心圆（半径 R + d）的交点 P、P'
#let fig-Q-r15(width: 410 * k) = px-canvas(410, 290, origin: (440, 140), width: width, (p, u) => {
  import cetz.draw: *
  let m = (676, 338)
  let r = 86
  let d = 55
  P-c(p, m, r)
  P-c(p, m, r + d)
  seg(p, (465, 163), (825, 163))
  seg(p, (465, 272), (755, 272))
  dseg(p, (465, 218), (825, 218))
  pdot(p, (825, 163), r: 3)
  pdot(p, (825, 218), r: 3)
  line(p(515, 163), p(515, 218), stroke: lt, mark: arw2)
  line(p(515, 218), p(515, 272), stroke: lt, mark: arw2)
  lbl(p, (520, 190), $d$, dir: "e", d: 4)
  lbl(p, (520, 245), $d$, dir: "e", d: 4)
  lbl(p, (455, 163), $l_1$, dir: "c", d: 0)
  lbl(p, (455, 272), $l_2$, dir: "c", d: 0)
  // 圆 M 里的两个尺寸：d（环宽）和 R（半径）
  let ys = 336
  line(p(m.at(0) - r - d, ys + 14), p(m.at(0) - r, ys + 14), stroke: lt, mark: arw2)
  lbl(p, (m.at(0) - r - d / 2, ys + 14), $d$, dir: "n", d: 8)
  seg(p, (m.at(0) - r - d, 352), m)
  line(p(m.at(0) - r, ys), p(m.at(0) - 8, ys), stroke: lt, mark: arw2)
  lbl(p, (m.at(0) - r / 2 - 4, ys), $R$, dir: "n", d: 8)
  P-cen(p, m)
  lbl(p, m, $M$, dir: "e", d: 14)
  let x = calc.sqrt((r + d) * (r + d) - (338 - 218) * (338 - 218))
  let p1 = (m.at(0) - x, 218)
  let p2 = (m.at(0) + x, 218)
  pdot(p, p1)
  pdot(p, p2)
  lbl(p, p1, $P$, dir: "nw", d: 10)
  lbl(p, p2, $P'$, dir: "ne", d: 10)
})

// 第 20 题(1)：圆 M，直线 l，圆 M 上的点 A；所求圆 P、P' 切圆 M 于 A 并与 l 相切
#let fig-Q-r20a(width: 450 * k) = px-canvas(450, 310, origin: (260, 940), width: width, (p, u) => {
  import cetz.draw: *
  let ay = 1080
  let a = (537, ay)
  let pc = (595, ay)
  let pc2 = (407, ay)
  let m = (450, ay)
  P-c(p, m, 87, st: lt)
  P-c(p, pc, 58, st: lb)
  P-c(p, pc2, 130, st: lb)
  let (t1, t2) = P-tan(pc2, 130, pc, 58, "out", 1)
  let o = P-meet(t1, t2, a, (a.at(0), a.at(1) + 50))
  seg(p, (310, ay), (695, ay))
  P-line(p, t1, t2, e1: 75, e2: 65)
  dseg(p, (537, 960), (537, 1222))
  dseg(p, pc, o)
  dseg(p, pc2, o)
  P-cen(p, m)
  P-cen(p, pc)
  P-cen(p, pc2)
  lbl(p, a, $A$, dir: "ne", d: 10)
  lbl(p, m, $M$, dir: "n", d: 11)
  lbl(p, pc, $P$, dir: "n", d: 11)
  lbl(p, pc2, $P'$, dir: "n", d: 11)
  lbl(p, o, $O$, dir: "se", d: 11)
  lbl(p, P-go(t2, t1, 245), $l$, dir: "sw", d: 10)
})

// 第 20 题(2)：圆 M（半径 r），直线 l 与 l 上的定点 A；K、K' 在过 A 的垂线上，AK = AK' = r；
// MK、MK' 的垂直平分线（虚线）与垂线交于 P、P'
#let fig-Q-r20b(width: 480 * k) = px-canvas(480, 440, origin: (250, 480), width: width, (p, u) => {
  import cetz.draw: *
  let m = (358, 644)
  let r = 71
  let ay = 815
  let ax = 522
  let kk = (ax, ay + r)
  let kq = (ax, ay - r)
  // 垂直平分线与竖线 x = ax 的交点
  let hit(t) = {
    let (mx, my) = ((m.at(0) + t.at(0)) / 2, (m.at(1) + t.at(1)) / 2)
    let (dx, dy) = (t.at(0) - m.at(0), t.at(1) - m.at(1))
    (ax, my - (ax - mx) * dx / dy)
  }
  let pp = hit(kk)
  let pq = hit(kq)
  let rp = ay - pp.at(1)
  P-c(p, m, r, st: lt)
  P-c(p, pp, rp, st: lb)
  // 轨迹曲线（示意，经过 A，与 l 相切）
  catmull(p(269, 590), p(306, 690), p(375, 759), p(456, 802), p(519, 815), p(575, 812), p(637, 790), p(687, 746), p(731, 712), stroke: lb, tension: 0.5)
  seg(p, (315, ay), (712, ay))
  seg(p, (ax, 502), (ax, 899))
  seg(p, m, kk)
  seg(p, m, kq)
  seg(p, m, (m.at(0) + r * calc.cos(35deg), m.at(1) - r * calc.sin(35deg)))
  dseg(p, m, pp)
  // 垂直平分线：从 c0 沿 -u 方向 eup，沿 +u 方向 edown
  let bis(t, c0, eup, edown) = {
    let (dx, dy) = (t.at(0) - m.at(0), t.at(1) - m.at(1))
    let l = calc.sqrt(dx * dx + dy * dy)
    let (ux, uy) = (-dy / l, dx / l)
    dseg(p, (c0.at(0) - ux * eup, c0.at(1) - uy * eup), (c0.at(0) + ux * edown, c0.at(1) + uy * edown))
  }
  bis(kk, pp, 57, 128)
  bis(kq, pq, 60, 192)
  P-cen(p, m)
  P-cen(p, pp, r: 2.5)
  P-cen(p, pq, r: 2.5)
  lbl(p, m, $M$, dir: "w", d: 12)
  lbl(p, (m.at(0) + 28, m.at(1) - 48), $r$, dir: "c", d: 0)
  lbl(p, pq, $P'$, dir: "e", d: 11)
  lbl(p, pp, $P$, dir: "e", d: 11)
  lbl(p, kq, $K'$, dir: "e", d: 11)
  lbl(p, (ax, ay), $A$, dir: "se", d: 11)
  lbl(p, kk, $K$, dir: "e", d: 11)
  lbl(p, (ax, (ay + kq.at(1)) / 2 + 10), $r$, dir: "e", d: 6)
  lbl(p, (ax, ay + r / 2), $r$, dir: "e", d: 6)
  lbl(p, (305, ay), $l$, dir: "w", d: 8)
})
// 第 26 题：已知线段 a、定点 P、直线 l
#let fig-Q-r26a(width: 450 * k) = px-canvas(450, 240, origin: (260, 420), width: width, (p, u) => {
  import cetz.draw: *
  pseg(p, (290, 455), (440, 455))
  lbl(p, (365, 441), $a$, dir: "c", d: 0)
  pdot(p, (460, 487), r: 3)
  lbl(p, (460, 487), $P$, dir: "ne", d: 12)
  seg(p, (320, 633), (668, 633))
  pdot(p, (668, 633), r: 3)
  lbl(p, (310, 631), $l$, dir: "c", d: 0)
})

// 第 26 题提示图
#let fig-Q-r26b(width: 780 * k) = px-canvas(780, 240, origin: (100, 840), width: width, (p, u) => {
  import cetz.draw: *
  let ly = 1040
  let py = 902
  let a1 = (612, ly)
  let b1 = (762, ly)
  let o = (687, ly - 75)
  let r = 150 / calc.sqrt(2)
  let dx = calc.sqrt(r * r - (o.at(1) - py) * (o.at(1) - py))
  let q1 = (o.at(0) - dx, py)
  let q2 = (o.at(0) + dx, py)
  let pp = (316, py)
  // 左：定点 P 和两组直线
  pseg(p, (158, 868), (308, 868))
  lbl(p, (233, 856), $a$, dir: "c", d: 0)
  let sa1 = (a1.at(0) + pp.at(0) - q1.at(0), ly)
  let sb2 = (b1.at(0) + pp.at(0) - q1.at(0), ly)
  let sb1 = (a1.at(0) + pp.at(0) - q2.at(0), ly)
  let sa2 = (b1.at(0) + pp.at(0) - q2.at(0), ly)
  dseg(p, (120, py), (848, py))
  seg(p, (118, ly), (845, ly))
  seg(p, pp, sb1)
  seg(p, pp, sa2)
  seg(p, pp, sa1)
  seg(p, pp, sb2)
  anglearc(p, pp, sb1, sa1, 26)
  lbl(p, pp, $P$, dir: "n", d: 11)
  lbl(p, sb1, $B_1$, dir: "s", d: 10)
  lbl(p, sa2, $A_2$, dir: "s", d: 10)
  lbl(p, sa1, $A_1$, dir: "s", d: 10)
  lbl(p, sb2, $B_2$, dir: "s", d: 10)
  // 右：以 A'B' 为弦含 45° 圆周角的弧
  parc(p, o, r, 225, -45, st: lw, n: 120)
  seg(p, q1, a1)
  seg(p, q2, b1)
  seg(p, q1, b1)
  seg(p, q2, a1)
  anglearc(p, q2, a1, b1, 28)
  lbl(p, (q2.at(0) - 24, q2.at(1) + 38), $45°$, dir: "c", d: 0)
  anglearc(p, q1, a1, b1, 28)
  lbl(p, q1, $P_1$, dir: "nw", d: 10)
  lbl(p, q2, $P_2$, dir: "ne", d: 10)
  lbl(p, a1, $A'$, dir: "s", d: 10)
  lbl(p, b1, $B'$, dir: "s", d: 10)
  lbl(p, (687, ly + 9), $a$, dir: "c", d: 0)
  lbl(p, (848, py), $Q$, dir: "e", d: 9)
  lbl(p, (112, ly), $l$, dir: "c", d: 0)
})
