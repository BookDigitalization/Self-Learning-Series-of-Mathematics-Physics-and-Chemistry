// 图 2·82（原书 p.208）、2·83、2·84（p.209）、2·85、2·86、2·87（p.210）、2·88、2·89（p.211）、2·90（p.212）、2·91（p.213）；页面 200 dpi 坐标。
// 正二十面体（图 2·82 (3)）、正十二面体（图 2·84）按三维坐标正投影计算，虚实由面的朝向自动判定；其余照原图描。
#import "K-base.typ": *

// 图 2·82 (1) 正四面体
#let fig-K-2-82a(width: 165 * k) = px-canvas(165, 165, origin: (228, 1167), width: width, (p, u) => {
  import cetz.draw: *
  let T = (292, 1174)
  let L0 = (236, 1276)
  let R = (387, 1272)
  let F = (276, 1324)
  tpoly(p, (L0, T, R, F, L0))
  tseg(p, T, F)
  dseg(p, L0, R)
})

// 图 2·82 (2) 正八面体
#let fig-K-2-82b(width: 180 * k) = px-canvas(180, 185, origin: (418, 1170), width: width, (p, u) => {
  import cetz.draw: *
  let T = (504, 1176)
  let Bt = (506, 1348)
  let L0 = (423, 1263)
  let R = (591, 1260)
  let F = (481, 1299)
  let K = (530, 1227)
  tpoly(p, (T, L0, Bt, R, T))
  tseg(p, T, F)
  tseg(p, Bt, F)
  tseg(p, L0, F)
  tseg(p, F, R)
  for q in (T, Bt, L0, R) { dseg(p, K, q) }
})

// 图 2·82 (3) 正二十面体（五重轴竖直，略俯视）
#let fig-K-2-82c(width: 160 * k) = px-canvas(160, 172, origin: (614, 1169), width: width, (p, u) => {
  kpoly3(p, kicosa, (694, 1255), 41.5, a0: 31.717, az: 8, el: 8, th: lb)
})

// 图 2·83 正六面体
#let fig-K-2-83(width: 230 * k) = px-canvas(230, 200, origin: (210, 720), width: width, (p, u) => {
  import cetz.draw: *
  let a = (216, 775)
  let b = (351, 779)
  let c = (350, 916)
  let d = (214, 914)
  let e = (298, 727)
  let f = (435, 730)
  let g = (431, 864)
  let h = (298, 863)
  tpoly(p, (a, b, c, d, a))
  tpoly(p, (a, e, f, b))
  tpoly(p, (f, g, c))
  dseg(p, e, h)
  dseg(p, h, d)
  dseg(p, h, g)
})

// 图 2·84 正十二面体（沿五重轴正视）
#let fig-K-2-84(width: 220 * k) = px-canvas(220, 220, origin: (577, 701), width: width, (p, u) => {
  kpoly3(p, kdodeca, (687, 811), 60, a0: 148.283, spin: 0, th: lb)
})

// 图 2·85 正方体内的正四面体 B1—ACD1
#let fig-K-2-85(width: 225 * k) = px-canvas(225, 225, origin: (190, 770), width: width, (p, u) => {
  import cetz.draw: *
  let D1 = (295, 778)
  let A1 = (200, 824)
  let C1 = (408, 824)
  let B1 = (310, 868)
  let A = (198, 940)
  let C = (405, 940)
  let B = (308, 987)
  let D = (296, 897)
  // 正方体
  pl(p, A1, D1, C1)
  thin(p, A1, B1)
  thin(p, B1, C1)
  pl(p, A1, A, B, C, C1)
  thin(p, B1, B)
  dseg(p, D1, D)
  dseg(p, A, D)
  dseg(p, D, C)
  // 正四面体
  tseg(p, B1, A)
  tseg(p, B1, C)
  tseg(p, B1, D1)
  dseg(p, A, C)
  dseg(p, A, D1)
  dseg(p, C, D1)
  L(p, 297, 765, $D_1$)
  L(p, 186, 824, $A_1$)
  L(p, 424, 826, $C_1$)
  L(p, 330, 873, $B_1$)
  L(p, 296, 911, $D$)
  L(p, 186, 943, $A$)
  L(p, 418, 942, $C$)
  L(p, 307, 1002, $B$)
})

// 图 2·86 正方体各面中心为顶点的正八面体
#let fig-K-2-86(width: 260 * k) = px-canvas(260, 255, origin: (565, 750), width: width, (p, u) => {
  import cetz.draw: *
  let a = (572, 820)
  let b = (748, 823)
  let c = (743, 1001)
  let d = (570, 997)
  let e = (644, 756)
  let f = (818, 760)
  let g = (812, 944)
  let h = (638, 938)
  tpoly(p, (a, b, c, d, a))
  tpoly(p, (a, e, f, b))
  tpoly(p, (f, g, c))
  dseg(p, e, h)
  dseg(p, h, d)
  dseg(p, h, g)
  // 各面中心
  let fr = kcen((a, b, c, d))
  let bk = kcen((e, f, g, h))
  let tp = kcen((a, b, f, e))
  let bt = kcen((d, c, g, h))
  let lf = kcen((a, d, h, e))
  let rg = kcen((b, c, g, f))
  for q in (fr, bk, lf, rg) {
    dseg(p, tp, q)
    dseg(p, bt, q)
  }
  dseg(p, lf, fr)
  dseg(p, fr, rg)
  dseg(p, rg, bk)
  dseg(p, bk, lf)
})

// 图 2·87 五种正多面体的展开图（实线剪开，虚线折起，窄梯形是粘贴边）
#let fig-K-2-87(width: 520 * k) = px-canvas(520, 300, origin: (240, 1075), width: width, (p, u) => {
  import cetz.draw: *
  // 正四面体：大三角形分成四个
  let t1 = (255, 1178)
  let t2 = (309, 1083)
  let t3 = (362, 1178)
  let m12 = lerp(t1, t2, 0.5)
  let m23 = lerp(t2, t3, 0.5)
  let m13 = lerp(t1, t3, 0.5)
  pl(p, t1, t2, t3, t1)
  dseg(p, m12, m23)
  dseg(p, m23, m13)
  dseg(p, m13, m12)
  ktab(p, m12, t2, m23)
  ktab(p, t2, m23, m12)
  ktab(p, t1, m13, m12)
  // 正六面体：十字形
  let s = 40.5
  let (x0, y0) = (387, 1124)
  for i in range(4) { pl(p, (x0 + i * s, y0), (x0 + (i + 1) * s, y0)) ; pl(p, (x0 + i * s, y0 + s), (x0 + (i + 1) * s, y0 + s)) }
  pl(p, (x0, y0), (x0, y0 + s))
  pl(p, (x0 + 4 * s, y0), (x0 + 4 * s, y0 + s))
  for i in (1, 2, 3) { dseg(p, (x0 + i * s, y0), (x0 + i * s, y0 + s)) }
  // 第三格上下各接一格
  let (xa, xb) = (x0 + 2 * s, x0 + 3 * s)
  pl(p, (xa, y0), (xa, y0 - s), (xb, y0 - s), (xb, y0))
  pl(p, (xa, y0 + s), (xa, y0 + 2 * s), (xb, y0 + 2 * s), (xb, y0 + s))
  dseg(p, (xa, y0), (xb, y0))
  dseg(p, (xa, y0 + s), (xb, y0 + s))
  let cu = ((xa + xb) / 2, y0 - s / 2)
  let cd = ((xa + xb) / 2, y0 + 1.5 * s)
  let cr = (x0 + 3.5 * s, y0 + s / 2)
  ktab(p, (xa, y0), (xa, y0 - s), cu)
  ktab(p, (xa, y0 - s), (xb, y0 - s), cu)
  ktab(p, (xb, y0 - s), (xb, y0), cu)
  ktab(p, (xa, y0 + s), (xa, y0 + 2 * s), cd)
  ktab(p, (xa, y0 + 2 * s), (xb, y0 + 2 * s), cd)
  ktab(p, (xb, y0 + 2 * s), (xb, y0 + s), cd)
  ktab(p, (xb, y0), (x0 + 4 * s, y0), cr)
  ktab(p, (x0 + 4 * s, y0), (x0 + 4 * s, y0 + s), cr)
  ktab(p, (x0 + 4 * s, y0 + s), (xb, y0 + s), cr)
  // 正八面体：一条六个三角形的带子，上下各接一个
  let e8 = 41.5
  let h8 = e8 * calc.sqrt(3) / 2
  let tt8 = range(4).map(i => (603 + i * e8, 1129))
  let bb8 = range(4).map(i => (603 - e8 / 2 + i * e8, 1129 + h8))
  let ap8 = (tt8.at(2).at(0) + e8 / 2, 1129 - h8)
  let lo8 = (bb8.at(0).at(0) + e8 / 2, 1129 + 2 * h8)
  pl(p, bb8.at(0), tt8.at(0), tt8.at(1), tt8.at(2), ap8, tt8.at(3), bb8.at(3), bb8.at(2), bb8.at(1), lo8, bb8.at(0))
  dseg(p, bb8.at(0), bb8.at(1))
  dseg(p, tt8.at(2), tt8.at(3))
  for i in range(3) {
    dseg(p, tt8.at(i), bb8.at(i + 1))
    dseg(p, bb8.at(i + 1), tt8.at(i + 1))
  }
  ktab(p, tt8.at(2), ap8, tt8.at(3))
  ktab(p, ap8, tt8.at(3), tt8.at(2))
  ktab(p, tt8.at(3), bb8.at(3), tt8.at(2))
  ktab(p, bb8.at(3), bb8.at(2), tt8.at(2))
  ktab(p, bb8.at(2), bb8.at(1), tt8.at(1))
  // 正十二面体：两朵“花”，每朵是一个正五边形周围接五个
  let e12 = 29
  let r12 = e12 / (2 * calc.sin(36deg))
  let c1 = (311, 1300)
  let core1 = kngon(c1, r12, 5, 270)   // 下面一个顶点朝下（上边水平）
  let flower(core, ctr) = {
    let out = ()
    for i in range(5) {
      let a = core.at(i)
      let b = core.at(calc.rem(i + 1, 5))
      let m = lerp(a, b, 0.5)
      // 外接五边形的中心：沿边中点向外 2 倍内切圆半径
      let rin = r12 * calc.cos(36deg)
      let (dx, dy) = (m.at(0) - ctr.at(0), m.at(1) - ctr.at(1))
      let l = calc.sqrt(dx * dx + dy * dy)
      let c = (m.at(0) + dx / l * rin, m.at(1) + dy / l * rin)
      let ang = calc.atan2(a.at(0) - c.at(0), -(a.at(1) - c.at(1))).deg()
      out.push(kngon(c, r12, 5, ang))
    }
    out
  }
  let outer1 = flower(core1, c1)
  // 第二朵：把第一朵绕某条外边的中点转 180°，取中点最接近原图接缝处 (368, 1295) 的那条外边
  let best = none
  let bestab = none
  let bx = -1e9
  for pg in outer1 {
    for i in range(5) {
      let a = pg.at(i)
      let b = pg.at(calc.rem(i + 1, 5))
      let m = lerp(a, b, 0.5)
      let onc = core1.any(q => calc.abs(q.at(0) - a.at(0)) + calc.abs(q.at(1) - a.at(1)) < 0.5) and core1.any(q => calc.abs(q.at(0) - b.at(0)) + calc.abs(q.at(1) - b.at(1)) < 0.5)
      let sc = -calc.sqrt(calc.pow(m.at(0) - 368, 2) + calc.pow(m.at(1) - 1295, 2))
      if not onc and sc > bx { bx = sc; best = m; bestab = (a, b) }
    }
  }
  let refl(q) = (2 * best.at(0) - q.at(0), 2 * best.at(1) - q.at(1))
  let core2 = core1.map(refl)
  let outer2 = outer1.map(pg => pg.map(refl))
  // 折线（虚线）：两朵花心五边形的各边、两朵之间的接缝；其余外边实线
  let near(a, b) = calc.abs(a.at(0) - b.at(0)) + calc.abs(a.at(1) - b.at(1)) < 0.5
  let folds = (best,)
  for core in (core1, core2) {
    for i in range(5) { folds.push(lerp(core.at(i), core.at(calc.rem(i + 1, 5)), 0.5)) }
  }
  for core in (core1, core2) {
    for i in range(5) { dseg(p, core.at(i), core.at(calc.rem(i + 1, 5))) }
  }
  dseg(p, ..bestab)
  for pg in outer1 + outer2 {
    for i in range(5) {
      let (a, b) = (pg.at(i), pg.at(calc.rem(i + 1, 5)))
      if not folds.any(m => near(lerp(a, b, 0.5), m)) { seg(p, a, b) }
    }
  }
  // 粘贴边：第一朵每个外五边形取一条外边
  for pg in outer1 {
    let cc = kcen(pg)
    ktab(p, pg.at(2), pg.at(3), cc)
  }
  for pg in outer2.slice(0, 2) {
    let cc = kcen(pg)
    ktab(p, pg.at(2), pg.at(3), cc)
  }
  // 正二十面体：十个三角形的斜带子，上下各接五个
  let e20 = 41
  let h20 = e20 * calc.sqrt(3) / 2
  let bt20 = range(6).map(i => (503 + i * e20, 1318))
  let tp20 = range(6).map(i => (503 + e20 / 2 + i * e20, 1318 - h20))
  let up20 = range(5).map(i => (503 + e20 + i * e20, 1318 - 2 * h20))
  let dn20 = range(5).map(i => (503 + e20 / 2 + i * e20, 1318 + h20))
  pl(p, bt20.at(0), tp20.at(0))
  pl(p, bt20.at(5), tp20.at(5))
  for i in range(5) {
    pl(p, tp20.at(i), up20.at(i), tp20.at(i + 1))
    pl(p, bt20.at(i), dn20.at(i), bt20.at(i + 1))
    dseg(p, tp20.at(i), tp20.at(i + 1))
    dseg(p, bt20.at(i), bt20.at(i + 1))
    dseg(p, bt20.at(i + 1), tp20.at(i))
    if i > 0 { dseg(p, bt20.at(i), tp20.at(i)) }
    ktab(p, tp20.at(i), up20.at(i), tp20.at(i + 1))
    ktab(p, bt20.at(i), dn20.at(i), bt20.at(i + 1))
  }
  dseg(p, bt20.at(5), tp20.at(4))
  ktab(p, bt20.at(0), tp20.at(0), bt20.at(1))
})

// 图 2·88 正二十面体相邻的两个面 APB、ABQ
#let fig-K-2-88(width: 400 * k) = px-canvas(400, 205, origin: (485, 385), width: width, (p, u) => {
  import cetz.draw: *
  let A = (681, 402)
  let P = (499, 531)
  let Q = (865, 529)
  let B = (695, 577)
  let D = (614, 472)
  let C = (742, 472)
  let M = lerp(A, B, 0.5)
  let H = isect(P, Q, M, (M.at(0) + 0.1, M.at(1) + 10))
  tpoly(p, (B, P, A, Q, B))
  tseg(p, A, B)
  tseg(p, P, M)
  tseg(p, M, Q)
  dseg(p, A, D)
  dseg(p, A, C)
  dseg(p, P, D)
  dseg(p, D, C)
  dseg(p, C, Q)
  dseg(p, P, Q)
  dseg(p, M, H)
  anglearc(p, M, H, Q, 12)
  L(p, 681, 389, $A$)
  L(p, 486, 531, $P$)
  L(p, 880, 531, $Q$)
  L(p, 611, 489, $D$)
  L(p, 746, 487, $C$)
  L(p, 674, 494, $M$)
  L(p, 676, 545, $H$)
  L(p, 703, 513, $φ$)
  L(p, 695, 593, $B$)
})

// 图 2·89 正十二面体相邻的两个面 P、ABCDE
#let fig-K-2-89(width: 290 * k) = px-canvas(290, 215, origin: (585, 1045), width: width, (p, u) => {
  import cetz.draw: *
  let A = (757, 1088)
  let B = (720, 1158)
  let C = (793, 1200)
  let D = (853, 1184)
  let E = (850, 1110)
  let P1 = (597, 1106)
  let P2 = (675, 1054)
  let P5 = (649, 1172)
  let M = (673, 1117)
  let M1 = (803, 1143)
  let H = (745, 1111)
  let O = (706, 1235)
  tpoly(p, (B, P5, P1, P2, A))
  tpoly(p, (A, E, D, C, B, A))
  thin(p, M, H)
  thin(p, H, M1)
  dseg(p, M, O)
  dseg(p, H, O)
  dseg(p, M1, O)
  L(p, 612, 1107, $P$)
  L(p, 660, 1117, $M$)
  L(p, 738, 1101, $H$)
  L(p, 768, 1076, $A$)
  L(p, 866, 1106, $E$)
  L(p, 822, 1145, $M_1$)
  L(p, 717, 1175, $B$)
  L(p, 867, 1190, $D$)
  L(p, 790, 1215, $C$)
  L(p, 707, 1252, $O$)
})

// 图 2·90 例 1：正四面体 ABCD 与高 AO
#let fig-K-2-90(width: 230 * k) = px-canvas(230, 255, origin: (655, 845), width: width, (p, u) => {
  import cetz.draw: *
  let A = (749, 872)
  let B = (867, 1016)
  let C = (728, 1092)
  let D = (668, 1017)
  let O = kcen((B, C, D))
  let N = lerp(D, C, 0.5)
  tpoly(p, (D, A, B, C, D))
  tseg(p, A, C)
  dseg(p, D, B)
  dseg(p, A, O)
  dseg(p, B, N)
  L(p, 749, 857, $A$)
  L(p, 654, 1017, $D$)
  L(p, 883, 1017, $B$)
  L(p, 748, 1057, $O$)
  L(p, 728, 1107, $C$)
})

// 图 2·91 例 2：正八面体 ABCDEF，相对的两个面 ACD、BEF
#let fig-K-2-91(width: 250 * k) = px-canvas(250, 260, origin: (638, 243), width: width, (p, u) => {
  import cetz.draw: *
  let A = (768, 268)
  let F = (766, 481)
  let C = (657, 373)
  let E = (872, 372)
  let D = (727, 410)
  let B = (808, 333)
  let O = (766, 373)
  let M = kfoot(C, D, O)
  let P = kfoot(A, M, O)
  tpoly(p, (C, A, E, F, C))
  tseg(p, A, D)
  tseg(p, F, D)
  tseg(p, C, D)
  tseg(p, D, E)
  thin(p, A, M)
  for q in (A, C, E, F) { dseg(p, B, q) }
  dseg(p, A, F)
  dseg(p, C, E)
  dseg(p, D, B)
  dseg(p, O, M)
  dseg(p, O, P)
  L(p, 768, 254, $A$)
  L(p, 646, 374, $C$)
  L(p, 887, 374, $E$)
  L(p, 812, 349, $B$)
  L(p, 712, 337, $P$)
  L(p, 690, 381, $M$)
  L(p, 772, 386, $O$)
  L(p, 718, 423, $D$)
  L(p, 766, 497, $F$)
})
