// 图 1·72（原书 p.51）、图 1·73（p.52）、图 1·74（p.53）、图 1·75（p.55）、图 1·76（p.55）；页面 200 dpi 坐标。
// 图 1·72(2) 是 (1) 绕 O 转 180° 的像，按此几何关系计算；图 1·76 的格子按 26.3 像素一格重建。
#import "D-base.typ": *

// ───────── 图 1·72 ─────────
#let fig-D-1-72(width: 700 * k) = px-canvas(700, 530, origin: (140, 135), width: width, (p, u) => {
  import cetz.draw: *
  // (1)
  let O1 = (333.5, 283)
  let (A, B, C, D) = ((218, 222), (462, 226), (206, 339), (462, 343))
  let (E, F) = ((402, 152), (270, 405))
  let M = (364, 224)
  let N = (303, 342)
  D-hatch(p, (A, M, N, C), step: 7)
  seg(p, A, B)
  seg(p, C, D)
  seg(p, E, F)
  ring(p, O1)
  D-arc(p, M, A, N, 16)
  D-arc(p, M, B, N, 16, n: 2)
  D-arc(p, N, D, M, 16)
  D-arc(p, N, C, M, 16, n: 2)
  D-N(p, 346, 237, $1$)
  D-N(p, 385, 244, $3$)
  D-N(p, 329, 326, $2$)
  D-N(p, 289, 319, $4$)
  D-T(p, 207, 218, $A$)
  D-T(p, 470, 226, $B$)
  D-T(p, 204, 337, $C$)
  D-T(p, 470, 344, $D$)
  D-T(p, 403, 142, $E$)
  D-T(p, 272, 408, $F$)
  D-T(p, 358, 209, $M$)
  D-T(p, 314, 358, $N$)
  D-T(p, 349, 285, $O$)
  D-T(p, 352, 408, [(1)])
  // 两侧的弯箭头（表示绕 O 旋转）
  bezier(p(190, 224), p(190, 330), p(165, 250), p(165, 300), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.45))
  bezier(p(485, 332), p(485, 232), p(507, 300), p(507, 262), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.45))
  // (2)：(1) 绕 O 转 180°
  let O2 = (657, 289)
  let f(q) = (O2.at(0) - (q.at(0) - O1.at(0)), O2.at(1) - (q.at(1) - O1.at(1)))
  D-hatch(p, (f(A), f(M), f(N), f(C)), step: 7)
  seg(p, f(A), f(B))
  seg(p, f(C), f(D))
  seg(p, f(E), f(F))
  ring(p, O2)
  D-T(p, 520, 229, $D$)
  D-T(p, 797, 236, $C$)
  D-T(p, 735, 148, $F$)
  D-T(p, 688, 216, $N$)
  D-T(p, 658, 291, $O$)
  D-T(p, 521, 347, $B$)
  D-T(p, 803, 353, $A$)
  D-T(p, 641, 362, $M$)
  D-T(p, 598, 417, $E$)
  D-T(p, 670, 415, [(2)])
  // (3)：旋转后两直线的位置（括号内字母是旋转后的位置）
  let (A3, B3, C3, D3) = ((395, 464), (635, 469), (395, 582), (635, 588))
  let (P1, P2) = ((242, 517), (781, 534))
  let (T1, T2) = ((567, 414), (450, 640))
  let M3 = (540, 467)
  let N3 = (480, 585)
  seg(p, A3, B3)
  seg(p, C3, D3)
  seg(p, T1, T2)
  dseg(p, A3, P1)
  dseg(p, C3, P1)
  dseg(p, B3, P2)
  dseg(p, D3, P2)
  ring(p, (510, 525))
  D-T(p, 232, 517, $P'$)
  D-T(p, 792, 534, $P$)
  D-T(p, 400, 455, $A$)
  D-T(p, 402, 476, $(D)$)
  D-T(p, 631, 457, $B$)
  D-T(p, 630, 482, $(C)$)
  D-T(p, 398, 570, $C$)
  D-T(p, 397, 595, $(B)$)
  D-T(p, 622, 579, $D$)
  D-T(p, 620, 602, $(A)$)
  D-T(p, 531, 438, $(N)$)
  D-T(p, 532, 454, $M$)
  D-T(p, 487, 597, $N$)
  D-T(p, 484, 611, $(M)$)
  D-T(p, 522, 529, $O$)
  D-T(p, 520, 652, [(3)])
})

// ───────── 图 1·73 ─────────
#let D-fig73-top(p, dx, la, lb, lc, ld) = {
  import cetz.draw: *
  // 两条纸条，右端（涂 B、D 的头）画斜纹
  D-rect(p, 203 + dx, 470 + dx, 636.5, 17)
  D-rect(p, 203 + dx, 470 + dx, 741, 17)
  D-hatch(p, ((435 + dx, 628), (467 + dx, 628), (467 + dx, 645), (435 + dx, 645)), step: 4)
  D-hatch(p, ((435 + dx, 732.5), (467 + dx, 732.5), (467 + dx, 749.5), (435 + dx, 749.5)), step: 4)
  D-strip(p, (398 + dx, 568), (272 + dx, 825), 14)
  let M = (364.7 + dx, 636.5)
  let N = (313 + dx, 741)
  pdot(p, M, r: 1.8)
  pdot(p, N, r: 1.8)
  pdot(p, (339 + dx, 689), r: 1.8)
  anglearc(p, M, (M.at(0) - 50, M.at(1)), N, 18)
  anglearc(p, N, (N.at(0) + 50, N.at(1)), M, 18)
  D-N(p, 327 + dx, 659, $1$)
  D-N(p, 355 + dx, 721, $2$)
  D-T(p, 188 + dx, 637, la)
  D-T(p, 481 + dx, 638, lb)
  D-T(p, 188 + dx, 742, lc)
  D-T(p, 481 + dx, 745, ld)
  D-T(p, 397 + dx, 565, $E$)
  D-T(p, 272 + dx, 826, $F$)
  D-T(p, 350 + dx, 620, $M$)
  D-T(p, 322 + dx, 761, $N$)
  D-T(p, 362 + dx, 692, $O$)
}
#let fig-D-1-73(width: 700 * k) = px-canvas(700, 550, origin: (150, 545), width: width, (p, u) => {
  import cetz.draw: *
  D-fig73-top(p, 0, $A$, $B$, $C$, $D$)
  D-T(p, 328, 808, [(1)下面])
  D-fig73-top(p, 313, $(A)$, $(B)$, $(C)$, $(D)$)
  D-T(p, 650, 808, [(2)上面])
  // (3) 旋转后的情形
  D-rect(p, 308, 626, 900, 17)
  D-rect(p, 308, 626, 1005, 17)
  for yc in (900, 1005) {
    D-hatch(p, ((310, yc - 8.5), (335, yc - 8.5), (335, yc + 8.5), (310, yc + 8.5)), step: 4)
    D-hatch(p, ((597, yc - 8.5), (624, yc - 8.5), (624, yc + 8.5), (597, yc + 8.5)), step: 4)
    for tx in (358, 568) {
      line(p(tx, yc - 8.5), p(tx, yc + 8.5), stroke: lw)
    }
  }
  D-strip(p, (530, 832), (415, 1056), 14)
  let M = (493.5, 900)
  let N = (440, 1005)
  pdot(p, M, r: 1.8)
  pdot(p, N, r: 1.8)
  pdot(p, (467, 953), r: 1.8)
  anglearc(p, M, (M.at(0) - 50, M.at(1)), N, 18)
  anglearc(p, N, (N.at(0) + 50, N.at(1)), M, 18)
  D-N(p, 458, 925, $1$)
  D-N(p, 484, 978, $2$)
  D-T(p, 288, 900, $(D)$)
  D-T(p, 358, 880, $A$)
  D-T(p, 480, 882, $M$)
  D-T(p, 570, 878, $(C)$)
  D-T(p, 636, 900, $B$)
  D-T(p, 288, 1008, $(B)$)
  D-T(p, 358, 985, $C$)
  D-T(p, 462, 1022, $N$)
  D-T(p, 568, 985, $(A)$)
  D-T(p, 636, 1005, $D$)
  D-T(p, 480, 962, $O$)
  D-T(p, 460, 1085, [(3)旋转后的情形])
})

// ───────── 图 1·74 ─────────
#let fig-D-1-74(width: 340 * k) = px-canvas(340, 300, origin: (535, 915), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((545, 1005), (848, 1005), (547, 1125), (848, 1125))
  let (E, F) = ((757, 932), (622, 1195))
  seg(p, A, B)
  seg(p, C, D)
  seg(p, E, F)
  D-T(p, 760, 924, $E$)
  D-T(p, 622, 1203, $F$)
  D-T(p, 536, 1005, $A$)
  D-T(p, 858, 1006, $B$)
  D-T(p, 537, 1125, $C$)
  D-T(p, 858, 1125, $D$)
  D-T(p, 714, 991, $M$)
  D-T(p, 673, 1141, $N$)
  D-N(p, 742, 993, $1$)
  D-N(p, 702, 1019, $8$)
  D-N(p, 677, 1111, $5$)
})

// ───────── 图 1·75（用两脚规量线段 a、b；右侧是一个平行四边形里的 a、b）─────────
#let fig-D-1-75(width: 700 * k) = px-canvas(700, 220, origin: (150, 150), width: width, (p, u) => {
  import cetz.draw: *
  // 两脚规的两个脚尖之间的距离 a
  line(p(195, 219), p(428, 219), stroke: lw)
  line(p(160, 203), p(195, 219), p(160, 236), stroke: lb)
  line(p(461, 203), p(428, 219), p(461, 236), stroke: lb)
  D-T(p, 315, 207, $a$)
  // 线段 b（两端带箭头）
  line(p(190, 298), p(435, 298), stroke: lw, mark: (start: ">", end: ">", scale: 1.2, fill: none))
  D-T(p, 315, 288, $b$)
  // 平行四边形
  let (P1, P2, P3, P4) = ((553, 157), (838, 160), (785, 350), (497, 352))
  let T = (640, 160)
  poly(p, (P1, P2, P3, P4), close: true)
  seg(p, T, P4)
  seg(p, T, P3)
  seg(p, T, (588, 350))
  pdot(p, P1, r: 2.5)
  pdot(p, P4, r: 2.5)
  D-T(p, 562, 245, $b$)
  D-T(p, 725, 248, $a$)
})

// ───────── 图 1·76 ─────────
// 在凸多边形 pts 内画网格线：竖线 x = gx + i·c，横线 y = gy + j·c
#let D-grid(p, pts, gx, gy, c: 26.3) = {
  import cetz.draw: *
  let xs = pts.map(v => v.at(0))
  let ys = pts.map(v => v.at(1))
  let (xa, xb, ya, yb) = (calc.min(..xs), calc.max(..xs), calc.min(..ys), calc.max(..ys))
  // 用 D-hatch 的剪裁：竖线 = 方向 (0,1) 不适用（dx = 0），故自己按边界求交
  let n = pts.len()
  let clip(horiz, v) = {
    // 求直线（horiz: y = v；否则 x = v）与凸多边形的交点区间
    let hits = ()
    for i in range(n) {
      let a = pts.at(i)
      let b = pts.at(calc.rem(i + 1, n))
      if horiz {
        let (lo, hi) = (calc.min(a.at(1), b.at(1)), calc.max(a.at(1), b.at(1)))
        if v >= lo - 1e-6 and v <= hi + 1e-6 and calc.abs(b.at(1) - a.at(1)) > 1e-9 {
          hits.push(a.at(0) + (b.at(0) - a.at(0)) * (v - a.at(1)) / (b.at(1) - a.at(1)))
        }
      } else {
        let (lo, hi) = (calc.min(a.at(0), b.at(0)), calc.max(a.at(0), b.at(0)))
        if v >= lo - 1e-6 and v <= hi + 1e-6 and calc.abs(b.at(0) - a.at(0)) > 1e-9 {
          hits.push(a.at(1) + (b.at(1) - a.at(1)) * (v - a.at(0)) / (b.at(0) - a.at(0)))
        }
      }
    }
    if hits.len() < 2 { none } else { (calc.min(..hits), calc.max(..hits)) }
  }
  let i0 = calc.ceil((xa - gx) / c + 1e-6)
  let i1 = calc.floor((xb - gx) / c - 1e-6)
  for i in range(i0, i1 + 1) {
    let x = gx + i * c
    let r = clip(false, x)
    if r != none { line(p(x, r.at(0)), p(x, r.at(1)), stroke: lt) }
  }
  let j0 = calc.ceil((ya - gy) / c + 1e-6)
  let j1 = calc.floor((yb - gy) / c - 1e-6)
  for j in range(j0, j1 + 1) {
    let y = gy + j * c
    let r = clip(true, y)
    if r != none { line(p(r.at(0), y), p(r.at(1), y), stroke: lt) }
  }
}

#let fig-D-1-76(width: 700 * k) = px-canvas(700, 480, origin: (150, 600), width: width, (p, u) => {
  import cetz.draw: *
  let c = 26.3
  // (1) 8×8 的正方形，分成 I、II、III、IV 四块
  let (x0, y0, x1, y1) = (177, 614, 387, 824)
  let xm = 308
  D-grid(p, ((x0, y0), (x1, y0), (x1, y1), (x0, y1)), x0, y0)
  poly(p, ((x0, y0), (x1, y0), (x1, y1), (x0, y1)), close: true, stroke: lb)
  seg(p, (xm, y0), (xm, y1), stroke: lb)
  seg(p, (x0, 694), (xm, 744), stroke: lb)
  seg(p, (x1, y0), (xm + 2, y1), stroke: lb)
  D-W(p, 243, 680, [II])
  D-W(p, 334, 680, [IV])
  D-W(p, 241, 784, [I])
  D-W(p, 348, 781, [III])
  D-T(p, 290, 854, [(1)])
  // (2) 梯形 I 与三角形 III、梯形 II 与三角形 IV 拼成的图形
  let top = ((486, 614), (831, 614), (831, 749))
  D-grid(p, top, 486, 614)
  poly(p, top, close: true, stroke: lb)
  seg(p, (698.5, 614), (698.5, 697), stroke: lb)
  let bot = ((489, 692), (834, 827), (489, 823))
  D-grid(p, bot, 489, 823 - 6 * c)
  poly(p, bot, close: true, stroke: lb)
  seg(p, (621, 823), (621, 747), stroke: lb)
  D-W(p, 633, 641, [IV])
  D-W(p, 762, 645, [II])
  D-W(p, 552, 786, [I])
  D-W(p, 685, 789, [III])
  D-T(p, 670, 855, [(2)])
  // (3) 13×6 的“长方形”，对角线从左上到右下
  let (x2, y2, x3, y3) = (326, 892, 668, 1050)
  D-grid(p, ((x2, y2), (x3, y2), (x3, y3), (x2, y3)), x2, y2)
  poly(p, ((x2, y2), (x3, y2), (x3, y3), (x2, y3)), close: true, stroke: lb)
  seg(p, (x2, y2), (x3, y3), stroke: lb)
  seg(p, (457, y2), (457, y3), stroke: lb)
  seg(p, (536, y2), (536, y3), stroke: lb)
  D-W(p, 472, 919, [IV])
  D-W(p, 602, 921, [II])
  D-W(p, 393, 1011, [I])
  D-W(p, 522, 1012, [III])
  D-T(p, 500, 1075, [(3)])
})
