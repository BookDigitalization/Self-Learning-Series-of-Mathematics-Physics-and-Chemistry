// 图 3·74（原书 p.285）、图 3·75（p.286）、图 3·76（p.287）、习题 3·16 第 6 题图（p.288）；页面 200 dpi 坐标。
#import "P-base.typ": *

// 图 3·74 左列：半圆（竖直直径在左，弧在右）
#let P-semi(p, c, r) = {
  import cetz.draw: *
  line(p(c.at(0), c.at(1) - r), p(c.at(0), c.at(1) + r), stroke: lw)
  P-carc(p, c, r, -90, 90, st: P-thick)
}
// 圆锥侧面的阴影线：从顶点 o 到底面椭圆前半上的若干点
#let P-cone-hatch(p, o, c, rx, ry, angs, t0: 0.12, t1: 0.95) = {
  for a in angs { P-ray(p, o, P-ept(c, rx, ry, a), t0: t0, t1: t1) }
}

#let fig-P-3-74(width: 600 * k) = px-canvas(640, 790, origin: (225, 455), width: width, (p, u) => {
  import cetz.draw: *
  // ── 左列 (1) ──
  let c1 = (272, 584)
  let r1 = 101
  P-semi(p, c1, r1)
  let A = P-cpt(c1, r1, 46)
  let A1 = (272, A.at(1))
  seg(p, c1, A)
  dseg(p, A1, A)
  L(p, 268, 469, $M$)
  L(p, 254, 509, $A_1$)
  L(p, 357, 500, $A$)
  L(p, 261, 588, $O$)
  L(p, 272, 700, $N$)
  // ── 左列 (2) ──
  let c2 = (272, 840)
  let r2 = 100
  P-semi(p, c2, r2)
  let B = P-cpt(c2, r2, 60)
  let A = P-cpt(c2, r2, 38)
  seg(p, c2, B)
  seg(p, c2, A)
  dseg(p, (272, B.at(1)), B)
  dseg(p, (272, A.at(1)), A)
  L(p, 270, 726, $M$)
  L(p, 254, 748, $B_1$)
  L(p, 335, 743, $B$)
  L(p, 254, 776, $A_1$)
  L(p, 366, 772, $A$)
  L(p, 261, 843, $O$)
  L(p, 272, 953, $N$)
  // ── 左列 (3) ──
  let c3 = (272, 1110)
  let r3 = 101
  P-semi(p, c3, r3)
  let A = P-cpt(c3, r3, 28)
  let B = P-cpt(c3, r3, -60)
  seg(p, c3, A)
  seg(p, c3, B)
  dseg(p, (272, A.at(1)), A)
  dseg(p, (272, B.at(1)), B)
  L(p, 270, 995, $M$)
  L(p, 254, 1058, $A_1$)
  L(p, 368, 1050, $A$)
  L(p, 261, 1110, $O$)
  L(p, 254, 1196, $B_1$)
  L(p, 336, 1213, $B$)
  L(p, 272, 1226, $N$)
  // 分图号
  ctext(p, (505, 600), [(1)])
  ctext(p, (505, 856), [(2)])
  ctext(p, (505, 1140), [(3)])

  // ── 右列 (1)：球扇形，底面是球冠 ──
  let o1 = (721, 586)
  let R1 = 103
  circ(p, o1, R1)
  let ca = (721, 517)
  let rxa = P-secrx(R1, 69, 18)
  let Ap = (721 - rxa, 517)
  let Aa = (721 + rxa, 517)
  P-cone-hatch(p, o1, ca, rxa, 18, (200, 208, 216, 224, 316, 324, 332, 340), t0: 0.35, t1: 0.92)
  P-ell(p, ca, rxa, 18, front: P-thick, back: dsh)
  P-tseg(p, o1, Ap)
  P-tseg(p, o1, Aa)
  dseg(p, ca, Aa)
  dseg(p, (721, 483), (721, 689))
  L(p, 721, 470, $M$)
  L(p, 638, 505, $A'$)
  L(p, 707, 524, $A_1$)
  L(p, 806, 503, $A$)
  L(p, 708, 603, $O$)
  L(p, 723, 704, $N$)

  // ── 右列 (2)：球扇形，底面是球带 ──
  let o2 = (721, 851)
  let R2 = 100
  circ(p, o2, R2)
  let rxb = P-secrx(R2, 89, 10)
  let rxa2 = P-secrx(R2, 61, 18)
  let cb = (721, 762)
  let ca2 = (721, 790)
  // 球带上的阴影：上下两圆之间的若干条前半椭圆弧
  for t in (0.2, 0.4, 0.6, 0.8) {
    let cy = 762 + 28 * t
    let rx = rxb + (rxa2 - rxb) * t
    let ry = 10 + 8 * t
    P-earc(p, (721, cy), rx, ry, 185, 355, st: P-hl)
  }
  P-ell(p, cb, rxb, 10, front: lw, back: lw)
  P-cone-hatch(p, o2, ca2, rxa2, 18, (200, 210, 220, 320, 330, 340), t0: 0.35, t1: 0.92)
  P-earc(p, ca2, rxa2, 18, 180, 360, st: P-thick)
  P-tseg(p, o2, (721 - rxa2, 790))
  P-tseg(p, o2, (721 + rxa2, 790))
  dseg(p, cb, (721 + rxb, 762))
  dseg(p, ca2, (721 + rxa2, 790))
  dseg(p, (721, 751), (721, 951))
  L(p, 725, 738, $M$)
  L(p, 670, 750, $B'$)
  L(p, 707, 765, $B_1$)
  L(p, 774, 750, $B$)
  L(p, 632, 783, $A'$)
  L(p, 708, 793, $A_1$)
  L(p, 814, 783, $A$)
  L(p, 712, 862, $O$)
  L(p, 727, 965, $N$)

  // ── 右列 (3)：球扇形，底面是球带（两个圆锥相对） ──
  let o3 = (721, 1117)
  let R3 = 104
  circ(p, o3, R3)
  let rxa3 = P-secrx(R3, 57, 22)
  let rxb3 = P-secrx(R3, 83, 10)
  let ca3 = (721, 1060)
  let cb3 = (721, 1200)
  P-cone-hatch(p, o3, ca3, rxa3, 22, (205, 220, 235, 305, 320, 335), t0: 0.05, t1: 0.45)
  P-cone-hatch(p, o3, cb3, rxb3, 10, range(188, 356, step: 9), t0: 0.25, t1: 0.97)
  P-ell(p, ca3, rxa3, 22, front: P-thick, back: dsh)
  P-ell(p, cb3, rxb3, 10, front: P-thick, back: dsh)
  P-tseg(p, o3, (721 - rxa3, 1060))
  P-tseg(p, o3, (721 + rxa3, 1060))
  P-tdseg(p, o3, (721 - rxb3, 1200))
  P-tdseg(p, o3, (721 + rxb3, 1200))
  dseg(p, ca3, (721 + rxa3, 1060))
  dseg(p, cb3, (721 + rxb3, 1200))
  dseg(p, (721, 1013), (721, 1221))
  L(p, 721, 1000, $M$)
  L(p, 628, 1052, $A'$)
  L(p, 708, 1067, $A_1$)
  L(p, 824, 1052, $A$)
  L(p, 740, 1110, $O$)
  L(p, 652, 1213, $B'$)
  L(p, 708, 1196, $B_1$)
  L(p, 791, 1213, $B$)
  L(p, 721, 1232, $N$)
})

// 图 3·75：球扇形分成许多近似锥体
#let P-qb(a, c, b, n: 16) = range(n + 1).map(i => {
  let t = i / n
  let s = 1 - t
  (s * s * a.at(0) + 2 * s * t * c.at(0) + t * t * b.at(0), s * s * a.at(1) + 2 * s * t * c.at(1) + t * t * b.at(1))
})
#let P-eps(c, rx, ry, a0, a1, n: 16) = range(n + 1).map(i => P-ept(c, rx, ry, a0 + (a1 - a0) * i / n))

#let fig-P-3-75(width: 240 * k) = px-canvas(240, 255, origin: (637, 655), width: width, (p, u) => {
  import cetz.draw: *
  let c = (755, 786)
  let r = 108
  let s0 = calc.asin(34 / r).deg()
  P-carc(p, c, r, s0, 180 - s0, st: P-thick)
  P-carc(p, c, r, 180 - s0, 360 + s0, st: (paint: black, thickness: 1.1pt, dash: "dashed"))
  let T = (762, 712)
  let Lp = P-cpt(c, r, 180 - s0)
  let Rp = P-cpt(c, r, s0)
  let bc = (755, 752)
  let (brx, bry) = (Rp.at(0) - 755, 38)
  let f1 = 254
  let f2 = 298
  let F1 = P-ept(bc, brx, bry, f1)
  let F2 = P-ept(bc, brx, bry, f2)
  let cl = (693, 704)
  let cr = (826, 664)
  let left = P-qb(T, cl, Lp) + P-eps(bc, brx, bry, 180, f1)
  let mid = (T,) + P-eps(bc, brx, bry, f1, f2)
  let right = (T,) + P-eps(bc, brx, bry, f2, 360) + P-qb(Rp, cr, T)
  line(..left.map(q => p(..q)), close: true, fill: P-hatch-b, stroke: none)
  line(..mid.map(q => p(..q)), close: true, fill: P-hatch-b, stroke: none)
  line(..right.map(q => p(..q)), close: true, fill: P-hatch-b, stroke: none)
  line(..P-qb(T, cl, Lp).map(q => p(..q)), stroke: P-thick)
  line(..P-qb(T, cr, Rp).map(q => p(..q)), stroke: P-thick)
  P-earc(p, bc, brx, bry, 180, 360, st: P-thick)
  P-tseg(p, T, F1)
  P-tseg(p, T, F2)
  P-tseg(p, T, P-cpt(c, r, 116))
  let O = (755, 788)
  seg(p, O, T)
  L(p, 757, 665, $S$)
  L(p, 755, 808, $O$)
})

// 图 3·76：例题图
#let fig-P-3-76(width: 270 * k) = px-canvas(270, 300, origin: (643, 485), width: width, (p, u) => {
  import cetz.draw: *
  let c = (778, 629)
  let r = 122.5
  circle(p(..c), radius: r, stroke: P-thick)
  let A = (778, 522)
  let rx = P-secrx(r, 107, 14)
  let E = (778 - rx, 522)
  let D = (778 + rx, 522)
  P-ell(p, A, rx, 14, front: lw, back: dsh)
  dseg(p, A, D)
  dseg(p, (778, 506.5), (778, 751.5))
  dseg(p, c, E)
  dseg(p, c, D)
  ring(p, P-ept(A, rx, 14, 282), r: 2.5)
  L(p, 780, 494, $B$)
  L(p, 707, 511, $E$)
  L(p, 853, 512, $D$)
  L(p, 765, 532, $A$)
  L(p, 800, 557, $F$)
  L(p, 765, 641, $O$)
  L(p, 776, 772, $C$)
})

// 习题 3·16 第 6 题图
#let fig-P-ex16-6(width: 170 * k) = px-canvas(170, 250, origin: (690, 810), width: width, (p, u) => {
  import cetz.draw: *
  let O = (727, 932)
  let r = 102
  let A = (727, 830)
  let B = (727, 1034)
  let C = P-cpt(O, r, 45)
  let D = P-cpt(O, r, -45)
  let F = (727 + r, 932)
  let E = (C.at(0), 932)
  let C1 = (727, C.at(1))
  let D1 = (727, D.at(1))
  P-carc(p, O, r, -90, 90, st: lw)
  P-carc(p, O, r, -45, 45, st: P-thick)
  seg(p, A, B)
  seg(p, C1, C)
  seg(p, D1, D)
  seg(p, C, D)
  dseg(p, O, C)
  dseg(p, O, D)
  dseg(p, O, F)
  L(p, 724, 818, $A$)
  L(p, 812, 852, $C$)
  L(p, 706, 860, $C_1$)
  L(p, 712, 935, $O$)
  L(p, 808, 944, $E$)
  L(p, 843, 932, $F$)
  L(p, 706, 1008, $D_1$)
  L(p, 812, 1014, $D$)
  L(p, 722, 1046, $B$)
})
