// 图 4·72、图 4·73（原书 p.277）、图 4·74（p.277）、图 4·75、图 4·76（p.278）、图 4·77（p.279）；页面 200 dpi 坐标。
#import "P-base.typ": *

// 图 4·72 用半圆弧吻接两条平行线（跑道形）
#let fig-P-4-72(width: 300 * k) = px-canvas(300, 160, origin: (150, 280), width: width, (p, u) => {
  import cetz.draw: *
  P-stadium(p, (222, 352), (372, 352), 45, st: lb)
  dseg(p, (222, 307), (222, 397))
  dseg(p, (372, 307), (372, 397))
  lbl(p, (220, 297), $D$, dir: "c", d: 0)
  lbl(p, (372, 297), $C$, dir: "c", d: 0)
  lbl(p, (219, 411), $A$, dir: "c", d: 0)
  lbl(p, (370, 411), $B$, dir: "c", d: 0)
})

// 图 4·73 画定半径的弧吻接两条不平行直线：O 为距两直线都等于 R 的点
#let fig-P-4-73(width: 330 * k) = px-canvas(330, 240, origin: (500, 230), width: width, (p, u) => {
  import cetz.draw: *
  let a = (530, 303)
  let b = (793, 246)
  let c = (521, 382)
  let d = (803, 437)
  let r = 70
  let u1 = P-go((0, 0), (b.at(0) - a.at(0), b.at(1) - a.at(1)), 1)
  let n1 = (-u1.at(1), u1.at(0))
  let u2 = P-go((0, 0), (d.at(0) - c.at(0), d.at(1) - c.at(1)), 1)
  let n2 = (u2.at(1), -u2.at(0))
  let a1 = (a.at(0) + r * n1.at(0), a.at(1) + r * n1.at(1))
  let c1 = (c.at(0) + r * n2.at(0), c.at(1) + r * n2.at(1))
  let o = P-meet(a1, (a1.at(0) + u1.at(0), a1.at(1) + u1.at(1)), c1, (c1.at(0) + u2.at(0), c1.at(1) + u2.at(1)))
  let pp = (o.at(0) - r * n1.at(0), o.at(1) - r * n1.at(1))
  let qq = (o.at(0) - r * n2.at(0), o.at(1) - r * n2.at(1))
  seg(p, a, b)
  seg(p, c, d)
  let ap = P-ang(o, pp)
  let aq = P-ang(o, qq)
  parc(p, o, r, ap, if aq < ap { aq + 360 } else { aq }, st: lb)
  seg(p, o, pp)
  seg(p, o, qq)
  // 过 O 的两条虚线：分别平行于 AB、CD
  dseg(p, (o.at(0) - 45 * u1.at(0), o.at(1) - 45 * u1.at(1)), (o.at(0) + 118 * u1.at(0), o.at(1) + 118 * u1.at(1)))
  dseg(p, (o.at(0) - 45 * u2.at(0), o.at(1) - 45 * u2.at(1)), (o.at(0) + 112 * u2.at(0), o.at(1) + 112 * u2.at(1)))
  P-cen(p, o, r: 2.5)
  // R 的尺寸线（垂直于直线）
  let t1 = (738 - a.at(0)) / u1.at(0)
  let s1 = (a.at(0) + u1.at(0) * t1, a.at(1) + u1.at(1) * t1)
  let f1 = (s1.at(0) + r * n1.at(0), s1.at(1) + r * n1.at(1))
  let m1 = ((s1.at(0) + f1.at(0)) / 2, (s1.at(1) + f1.at(1)) / 2)
  line(p(..P-go(m1, s1, 10)), p(..s1), stroke: lt, mark: arw)
  line(p(..P-go(m1, f1, 10)), p(..f1), stroke: lt, mark: arw)
  lbl(p, m1, $R$, dir: "c", d: 0)
  let t2 = (738 - c.at(0)) / u2.at(0)
  let s2 = (c.at(0) + u2.at(0) * t2, c.at(1) + u2.at(1) * t2)
  let f2 = (s2.at(0) + r * n2.at(0), s2.at(1) + r * n2.at(1))
  let m2 = ((s2.at(0) + f2.at(0)) / 2, (s2.at(1) + f2.at(1)) / 2)
  line(p(..P-go(m2, s2, 10)), p(..s2), stroke: lt, mark: arw)
  line(p(..P-go(m2, f2, 10)), p(..f2), stroke: lt, mark: arw)
  lbl(p, m2, $R$, dir: "c", d: 0)
  lbl(p, a, $A$, dir: "w", d: 11)
  lbl(p, b, $B$, dir: "ne", d: 10)
  lbl(p, c, $C$, dir: "w", d: 11)
  lbl(p, d, $D$, dir: "e", d: 11)
  lbl(p, (594, 340), $M$, dir: "c", d: 0)
  lbl(p, o, $O$, dir: "se", d: 10)
  lbl(p, pp, $P$, dir: "n", d: 10)
  lbl(p, qq, $Q$, dir: "s", d: 10)
})

// 图 4·74 弧和弧的吻接实例（左：七个圆，粗线为外轮廓；右：大圆内三个小圆）
#let fig-P-4-74(width: 650 * k) = px-canvas(650, 310, origin: (170, 860), width: width, (p, u) => {
  import cetz.draw: *
  // 左图
  circ(p, (287, 942), 55)
  circ(p, (439, 938), 55)
  circ(p, (285, 1089), 54)
  circ(p, (442, 1093), 55)
  P-c(p, (365, 1017), 54, st: lb)
  P-c(p, (229, 1014), 39, st: lb)
  P-c(p, (490, 1016), 38, st: lb)
  // 右图
  let o = (688, 1046)
  circ(p, o, 101)
  circ(p, o, 34)
  P-c(p, (642, 1094), 34, st: lb)
  P-c(p, (735, 1094), 34, st: lb)
  parc(p, o, 101, -134, -46, st: lb)
})

// 图 4·75 已知弧 AB，在点 B 吻接半径为 R 的弧：(1) 外切（同侧），(2) 内切（异侧）
#let fig-P-4-75(width: 740 * k) = px-canvas(740, 275, origin: (130, 320), width: width, (p, u) => {
  import cetz.draw: *
  // 已知长 R
  pseg(p, (390, 343), (470, 343))
  lbl(p, (428, 332), $R$, dir: "c", d: 0)
  // (1)
  let m1 = (228, 490)
  let b1 = (313, 397)
  let rm1 = calc.sqrt(calc.pow(b1.at(0) - m1.at(0), 2) + calc.pow(b1.at(1) - m1.at(1), 2))
  let n1 = P-go(b1, m1, 78)
  parc(p, m1, rm1, 125, P-ang(m1, b1), st: lb)
  parc(p, n1, 78, P-ang(n1, b1), -38, st: lb)
  dseg(p, m1, P-go(m1, b1, rm1 + 62))
  P-cen(p, m1, r: 2.5)
  P-cen(p, n1, r: 2.5)
  lbl(p, P-pt(m1, rm1, 125), $A$, dir: "nw", d: 10)
  lbl(p, b1, $B$, dir: "nw", d: 12)
  lbl(p, P-pt(n1, 78, -38), $C$, dir: "s", d: 10)
  lbl(p, m1, $M$, dir: "s", d: 11)
  lbl(p, n1, $N$, dir: "se", d: 11)
  lbl(p, (271, 437), $R$, dir: "c", d: 0)
  ctext(p, (282, 565), $(1)$)
  // (2)
  let m2 = (619, 515)
  let b2 = (711, 427)
  let rm2 = calc.sqrt(calc.pow(b2.at(0) - m2.at(0), 2) + calc.pow(b2.at(1) - m2.at(1), 2))
  let n2 = P-go(b2, (2 * b2.at(0) - m2.at(0), 2 * b2.at(1) - m2.at(1)), 81)
  parc(p, m2, rm2, 123, P-ang(m2, b2), st: lb)
  parc(p, n2, 81, P-ang(n2, b2) + 360, 320, st: lb)
  dseg(p, m2, n2)
  P-cen(p, m2, r: 2.5)
  P-cen(p, n2, r: 2.5)
  lbl(p, P-pt(m2, rm2, 123), $A$, dir: "w", d: 10)
  lbl(p, b2, $B$, dir: "se", d: 12)
  lbl(p, P-pt(n2, 81, 320), $C$, dir: "e", d: 10)
  lbl(p, m2, $M$, dir: "se", d: 12)
  lbl(p, n2, $N$, dir: "e", d: 12)
  lbl(p, (734, 393), $R$, dir: "c", d: 0)
  ctext(p, (662, 563), $(2)$)
})

// 图 4·76 两圆的两条外公切线交于 P（例 1）
#let fig-P-4-76(width: 440 * k) = px-canvas(440, 240, origin: (440, 960), width: width, (p, u) => {
  import cetz.draw: *
  let m = (634, 1078)
  let n = (767, 1077)
  circ(p, m, 47.5)
  circ(p, n, 84.5)
  let (b, a) = P-tan(m, 47.5, n, 84.5, "out", -1)
  let (b2, a2) = P-tan(m, 47.5, n, 84.5, "out", 1)
  let pp = P-meet(a, b, a2, b2)
  P-line(p, b, a, e2: 82)
  P-line(p, b2, a2, e2: 98)
  dseg(p, pp, b)
  dseg(p, pp, b2)
  P-cen(p, m, r: 2.5)
  P-cen(p, n, r: 2.5)
  lbl(p, a, $A$, dir: "nw", d: 10)
  lbl(p, b, $B$, dir: "nw", d: 10)
  lbl(p, b2, $B'$, dir: "sw", d: 10)
  lbl(p, a2, $A'$, dir: "sw", d: 10)
  lbl(p, m, $M$, dir: "s", d: 12)
  lbl(p, n, $N$, dir: "s", d: 12)
  lbl(p, pp, $P$, dir: "w", d: 10)
})

// 图 4·77 长方形铁板四角截成半径 5 厘米的弧（按 1:5 比例尺画出）
#let fig-P-4-77(width: 560 * k) = px-canvas(560, 340, origin: (200, 745), width: width, (p, u) => {
  import cetz.draw: *
  let (x0, y0, x1, y1) = (241, 795, 692, 1018)
  let r = 75
  poly(p, ((x0, y0), (x1, y0), (x1, y1), (x0, y1)), close: true)
  parc(p, (x0 + r, y0 + r), r, 180, 90, st: lb)
  parc(p, (x1 - r, y0 + r), r, 90, 0, st: lb)
  parc(p, (x1 - r, y1 - r), r, 0, -90, st: lb)
  parc(p, (x0 + r, y1 - r), r, -90, -180, st: lb)
  // 尺寸线
  dimh(p, x0, x1, 773, lab: [30cm], labx: 466, gapw: 52)
  line(p(x0, 765), p(x0, 792), stroke: lt)
  line(p(x1, 765), p(x1, 792), stroke: lt)
  line(p(716, 880), p(716, 797), stroke: lt, mark: arw)
  line(p(716, 935), p(716, 1017), stroke: lt, mark: arw)
  content(p(716, 908), std.rotate(90deg, tt[15cm]))
  line(p(710, y0), p(724, y0), stroke: lt)
  line(p(710, y1), p(724, y1), stroke: lt)
  // R = 5 厘米的引线
  lbl(p, (352, 938), [R=5cm], dir: "c", d: 0)
  line(p(312, 948), p(272, 990), stroke: lt, mark: arw)
  lbl(p, (484, 1055), [按 1:5 比例尺], dir: "c", d: 0)
})
