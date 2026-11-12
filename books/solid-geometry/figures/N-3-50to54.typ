// 图 3·50（原书 p.258）、3·51（p.259）、3·52（p.260）、3·53（p.261）、3·54（p.262）；页面 200 dpi 坐标。
#import "N-base.typ": *

// 图 3·50：圆台
#let fig-N-3-50(width: 220 * k) = px-canvas(220, 245, origin: (645, 1040), width: width, (p, u) => {
  import cetz.draw: *
  let (ct, cb) = ((755, 1080), (752, 1222))
  N-ell(p, ct, 55, 31)
  N-bell(p, cb, 95, 50)
  seg(p, (700, 1080), (657, 1222))
  seg(p, (810, 1080), (847, 1222))
  seg(p, (700, 1080), ct)
  dseg(p, ct, cb)
  dseg(p, (657, 1222), cb)
  N-L(p, 729, 1066, $r_1$)
  N-L(p, 788, 1081, $S_1$)
  N-L(p, 763, 1150, $h$)
  N-L(p, 714, 1212, $r$)
  N-L(p, 795, 1222, $S$)
})

// 图 3·51：把截去的圆锥补上，得圆锥 P—S
#let fig-N-3-51(width: 220 * k) = px-canvas(220, 340, origin: (680, 330), width: width, (p, u) => {
  import cetz.draw: *
  let P = (787, 352)
  let (c1, c) = ((788, 490), (790, 612))
  N-ell(p, c1, 48, 28)
  N-bell(p, c, 93, 47)
  dseg(p, P, (740, 490))
  dseg(p, P, (836, 490))
  seg(p, (740, 490), (697, 612))
  seg(p, (836, 490), (883, 612))
  dseg(p, (740, 490), c1)
  dseg(p, (697, 612), c)
  dseg(p, P, c)
  N-L(p, 787, 340, $P$)
  N-L(p, 802, 440, $x$)
  N-L(p, 821, 491, $S_1$)
  N-L(p, 797, 540, $h$)
  N-L(p, 815, 614, $S$)
})

// 图 3·52：圆锥的轴截面
#let fig-N-3-52(width: 200 * k) = px-canvas(200, 235, origin: (650, 580), width: width, (p, u) => {
  import cetz.draw: *
  let (P, L, R, O) = ((748, 600), (663, 790), (833, 790), (748, 790))
  poly(p, (P, L, R), close: true)
  seg(p, (713, 678), (781, 678))
  seg(p, P, O)
  N-L(p, 748, 588, $P$)
  N-L(p, 757, 656, $x$)
  N-L(p, 763, 692, $O_1$)
  N-L(p, 757, 733, $h$)
  N-L(p, 748, 804, $O$)
})

// 图 3·53：圆台的轴截面（对角线互相垂直）
#let fig-N-3-53(width: 250 * k) = px-canvas(250, 185, origin: (640, 248), width: width, (p, u) => {
  import cetz.draw: *
  let (A, O, B) = ((725, 274), (755, 274), (785, 274))
  let (A1, K, O1, B1) = ((657, 410), (725, 410), (755, 410), (853, 410))
  let H = N-isect(A, B1, A1, B)
  poly(p, (A, B, B1, A1), close: true)
  seg(p, A, B1)
  seg(p, A1, B)
  dseg(p, A, K)
  N-ddseg(p, O, O1)
  rtmark(p, H, A, A1, s: 6)
  anglearc(p, A1, B1, A, 22)
  content(p(684, 343), tt[12 cm], angle: 63.4deg)
  N-L(p, 721, 261, $A$)
  N-L(p, 753, 261, $O$)
  N-L(p, 788, 261, $B$)
  N-L(p, 771, 303, $H$)
  N-L(p, 650, 419, $A_1$)
  N-L(p, 724, 424, $K$)
  N-L(p, 754, 424, $O_1$)
  N-L(p, 870, 415, $B_1$)
})

// 图 3·54 (1)：正六边形 ABCDEF 以边 AF 为轴（边长 a = 93 像素，按正六边形重算顶点）
#let fig-N-3-54a(width: 230 * k) = px-canvas(230, 270, origin: (185, 305), width: width, (p, u) => {
  import cetz.draw: *
  let a = 93
  let h = a * calc.sqrt(3) / 2
  let (F, A) = ((220, 394), (220, 487))
  let E = (220 + h, 394 - a / 2)
  let D = (220 + 2 * h, 394)
  let C = (220 + 2 * h, 487)
  let B = (220 + h, 487 + a / 2)
  let G = (220, E.at(1))
  let H = (220, B.at(1))
  line(p(220, 315), p(220, 572), stroke: lb)
  poly(p, (A, B, C, D, E, F))
  dseg(p, G, E)
  dseg(p, F, D)
  dseg(p, A, C)
  dseg(p, H, B)
  N-L(p, 207, 346, $G$)
  N-L(p, 305, 334, $E$)
  N-L(p, 204, 392, $F$)
  N-L(p, 395, 401, $D$)
  N-L(p, 204, 486, $A$)
  N-L(p, 394, 494, $C$)
  N-L(p, 198, 535, $H$)
  N-L(p, 302, 551, $B$)
})

// 图 3·54 (2)：所得的旋转体（上下各有一个圆锥形凹坑；母线用细线表示）
#let fig-N-3-54b(width: 345 * k) = px-canvas(345, 250, origin: (500, 315), width: width, (p, u) => {
  import cetz.draw: *
  let (r1, c1) = ((672, 350), (672, 545))     // 上、下口
  let (ct, cb) = ((671, 405), (671, 500))     // 圆柱的上、下缘
  let (rr, rr2, rc) = (78, 22, 164)
  let thin = 0.4pt
  // 上部圆台面的母线：前半一圈，后半只画落在上口椭圆以外（看得见）的部分
  for i in range(48) {
    let t = i * 7.5
    let q = N-ept(ct, rc, 30, t)
    let inside = calc.pow((q.at(0) - r1.at(0)) / rr, 2) + calc.pow((q.at(1) - r1.at(1)) / rr2, 2) < 1
    if t >= 180 or t == 0 or not inside {
      line(p(..N-ept(r1, rr, rr2, t)), p(..q), stroke: thin)
    }
  }
  // 上口内的凹坑（只见后壁）
  let apex = (672, 385)
  for i in range(1, 24) {
    let q = N-ept(r1, rr, rr2, i * 7.5)
    line(p(..q), p(..N-lerp(q, apex, 0.3)), stroke: thin)
  }
  // 圆柱面
  for i in range(1, 24) {
    let t = 180 + i * 7.5
    line(p(..N-ept(ct, rc, 30, t)), p(..N-ept(cb, rc, 32, t)), stroke: thin)
  }
  // 下部圆台面
  for i in range(1, 24) {
    let t = 180 + i * 7.5
    line(p(..N-ept(cb, rc, 32, t)), p(..N-ept(c1, rr, rr2, t)), stroke: thin)
  }
  // 轮廓
  N-earc(p, r1, rr, rr2, 0, 360, st: lb)
  N-earc(p, ct, rc, 30, 180, 360, st: lb)
  N-earc(p, cb, rc, 32, 180, 360, st: lb)
  N-earc(p, c1, rr, rr2, 180, 360, st: lb)
  for s in (-1, 1) {
    line(p(672 + s * rr, 350), p(671 + s * rc, 405), stroke: lb)
    line(p(671 + s * rc, 405), p(671 + s * rc, 500), stroke: lb)
    line(p(671 + s * rc, 500), p(672 + s * rr, 545), stroke: lb)
  }
})
