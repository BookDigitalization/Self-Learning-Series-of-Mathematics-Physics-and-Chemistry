// 图 3·77（原书 p.289）、图 3·78（p.291）、图 3·79（p.292）、图 3·80、3·81（p.293）、图 3·82（p.295）；页面 200 dpi 坐标。
#import "P-base.typ": *

// 水平线段 y 上 x0→x1，按 dash 区间（[(a, b), …]）画虚线，其余实线
#let P-hline(p, y, x0, x1, dashed: (), st: lw) = {
  import cetz.draw: *
  let pts = (x0,)
  for (a, b) in dashed { pts.push(a); pts.push(b) }
  pts.push(x1)
  for i in range(pts.len() - 1) {
    let s = if calc.rem(i, 2) == 0 { st } else { dsh }
    line(p(pts.at(i), y), p(pts.at(i + 1), y), stroke: s)
  }
}

// 图 3·77：用祖暅定理证明球的体积公式
#let fig-P-3-77(width: 560 * k) = px-canvas(660, 225, origin: (145, 965), width: width, (p, u) => {
  import cetz.draw: *
  // 平面 Q
  line(p(215, 1072), p(365, 999), stroke: P-thick)
  line(p(705, 1072), p(792, 999), stroke: P-thick)
  P-hline(p, 1072, 215, 705, st: P-thick)
  P-hline(p, 999, 365, 792, dashed: ((375, 700),), st: P-thick)
  // 平面 P
  line(p(150, 1188), p(320, 1100), stroke: P-thick)
  line(p(705, 1188), p(783, 1100), stroke: P-thick)
  P-hline(p, 1188, 150, 705, st: P-thick)
  P-hline(p, 1100, 320, 783, dashed: ((352, 700),), st: P-thick)
  // 球：被平面 Q 遮住的两段轮廓画虚线
  let O = (427, 1062)
  let R = 81
  let a1 = calc.asin(28 / R).deg()
  let a2 = -calc.asin(10 / R).deg()
  P-carc(p, O, R, a1, 180 - a1, st: P-thick)
  P-carc(p, O, R, 180 - a2, 360 + a2, st: P-thick)
  P-carc(p, O, R, a2, a1, st: (paint: black, thickness: 0.9pt, dash: "dashed"))
  P-carc(p, O, R, 180 - a1, 180 - a2, st: (paint: black, thickness: 0.9pt, dash: "dashed"))
  let sc = (427, 1029)
  let srx = P-secrx(R, 33, 18)
  P-ell(p, sc, srx, 18, front: P-thick, back: dsh)
  dseg(p, sc, (427 + srx, 1029))
  dseg(p, (427, 1000), O)
  dseg(p, O, P-ept(sc, srx, 18, 330))
  pdot(p, O, r: 2.5)
  L(p, 322, 1060, $Q$)
  L(p, 294, 1174, $P$)
  L(p, 414, 1036, $d$)
  L(p, 465, 1017, $r$)
  L(p, 412, 1063, $O$)
  L(p, 474, 1063, $R$)
  // 圆柱
  let ax = 620
  let Rc = 80
  let O1 = (ax, 985)
  let O2 = (ax, 1149)
  let A = (ax, 1067)
  // 平面 Q 截剩余部分所得的圆环（阴影）
  let M = (ax, 1032)
  let (orx, ory) = (Rc, 18)
  let (irx, iry) = (33, 7.5)
  for y in range(1016, 1050, step: 3) {
    let dy = y - M.at(1)
    if calc.abs(dy) < ory {
      let xo = orx * calc.sqrt(1 - (dy / ory) * (dy / ory))
      if calc.abs(dy) < iry {
        let xi = irx * calc.sqrt(1 - (dy / iry) * (dy / iry))
        line(p(ax - xo, y), p(ax - xi, y), stroke: P-hl)
        line(p(ax + xi, y), p(ax + xo, y), stroke: P-hl)
      } else {
        line(p(ax - xo, y), p(ax + xo, y), stroke: P-hl)
      }
    }
  }
  P-ell(p, M, orx, ory, front: P-thick, back: lw)
  P-ell(p, M, irx, iry, front: lw, back: lw)
  // 上底（全画实线）、下底（后半虚线）
  P-ell(p, O1, Rc, 17, front: P-thick, back: P-thick)
  P-ell(p, O2, Rc, 20, front: P-thick, back: dsh)
  // 母线：截面圆环到平面 Q 前沿之间被平面 Q 遮住画虚线，其余实线（照原图）
  for x in (ax - Rc, ax + Rc) {
    line(p(x, 985), p(x, 1032), stroke: P-thick)
    P-tdseg(p, (x, 1032), (x, 1072))
    line(p(x, 1072), p(x, 1149), stroke: P-thick)
  }
  // 两个圆锥
  for x in (ax - Rc, ax + Rc) {
    dseg(p, A, (x, 985))
    dseg(p, A, (x, 1149))
  }
  dseg(p, O1, O2)
  dseg(p, O2, (ax - Rc, 1149))
  line(p(..M), p(ax + irx, 1032), stroke: lt, mark: arw)
  pdot(p, O1, r: 2.5)
  pdot(p, O2, r: 2.8)
  pdot(p, A, r: 2)
  L(p, 651, 976, $O_1$)
  L(p, 604, 1026, $M$)
  L(p, 671, 1037, $N$)
  L(p, 638, 1063, $A$)
  L(p, 655, 1152, $O_2$)
  L(p, 590, 1163, $R$)
})

// 图 3·78：漏斗里的球
#let fig-P-3-78a(width: 220 * k) = px-canvas(220, 235, origin: (270, 520), width: width, (p, u) => {
  import cetz.draw: *
  let A = (285, 551)
  let B = (477, 551)
  let V = (381, 739)
  let O = (381, 613)
  P-ell(p, (381, 551), 96, 30, front: P-thick, back: P-thick)
  line(p(..A), p(..V), p(..B), stroke: P-thick)
  circle(p(..O), radius: 61, stroke: dsh)
  // 球与漏斗相切的圆
  let ty = 641
  let tx = 96 * (739 - ty) / (739 - 551)
  P-ell(p, (381, ty), tx, 15, front: lw, back: dsh)
  dseg(p, (381, 552), V)
  pdot(p, O, r: 2.5)
  L(p, 270, 557, $A$)
  L(p, 491, 557, $B$)
  L(p, 382, 541, $M$)
  L(p, 395, 612, $O$)
  L(p, 381, 754, $V$)
})
#let fig-P-3-78b(width: 220 * k) = px-canvas(220, 235, origin: (543, 520), width: width, (p, u) => {
  import cetz.draw: *
  let A = (555, 551)
  let B = (749, 551)
  let M = (652, 551)
  let V = (652, 736)
  let O = (652, 611)
  line(p(..A), p(..B), p(..V), close: true, stroke: P-thick)
  circle(p(..O), radius: 60, stroke: P-thick)
  seg(p, M, V)
  let C = P-foot(O, A, V)
  seg(p, O, C)
  L(p, 543, 555, $A$)
  L(p, 762, 555, $B$)
  L(p, 652, 539, $M$)
  L(p, 667, 607, $O$)
  L(p, 587, 646, $C$)
  L(p, 650, 751, $V$)
})

// 图 3·79：球缺和球台
#let fig-P-3-79(width: 230 * k) = px-canvas(230, 240, origin: (628, 935), width: width, (p, u) => {
  import cetz.draw: *
  let O = (740, 1058)
  let R = 98
  circle(p(..O), radius: R, stroke: P-thick)
  let A = (740, 1009)
  let C = (740, 1111)
  let ra = P-secrx(R, 49, 28)
  let rc = P-secrx(R, 53, 27)
  P-ell(p, A, ra, 28, front: P-thick, back: P-thick)
  P-ell(p, C, rc, 27, front: P-thick, back: P-thick)
  dseg(p, (740, 960), (740, 1156))
  dseg(p, (740 - ra, 1009), A)
  dseg(p, (740 - rc, 1111), C)
  for q in (A, O, C) { pdot(p, q, r: 2.3) }
  L(p, 741, 947, $N$)
  L(p, 643, 1010, $B$)
  L(p, 754, 1012, $A$)
  L(p, 838, 1007, $E$)
  L(p, 796, 1041, $G$)
  L(p, 754, 1059, $O$)
  L(p, 648, 1121, $D$)
  L(p, 754, 1112, $C$)
  L(p, 791, 1114, $K$)
  L(p, 836, 1121, $F$)
  L(p, 741, 1170, $S$)
})

// 图 3·80：球缺 = 球扇形 − 圆锥
#let fig-P-3-80(width: 220 * k) = px-canvas(220, 230, origin: (243, 410), width: width, (p, u) => {
  import cetz.draw: *
  let O = (353, 525)
  let R = 97
  circle(p(..O), radius: R, stroke: P-thick)
  let A = (353, 480)
  let ra = P-secrx(R, 45, 26)
  let B = (353 - ra, 480)
  let E = (353 + ra, 480)
  P-ell(p, A, ra, 26, front: P-thick, back: P-thick)
  dseg(p, B, E)
  dseg(p, B, O)
  dseg(p, E, O)
  dseg(p, (353, 428), (353, 622))
  L(p, 353, 418, $N$)
  L(p, 348, 444, $h$)
  L(p, 362, 472, $A$)
  L(p, 398, 474, $r$)
  L(p, 256, 485, $B$)
  L(p, 449, 486, $E$)
  L(p, 300, 523, $G$)
  L(p, 393, 522, $R$)
  L(p, 368, 538, $O$)
  L(p, 355, 634, $S$)
})

// 图 3·81：用 R、h 表示 r
#let fig-P-3-81(width: 220 * k) = px-canvas(220, 230, origin: (578, 410), width: width, (p, u) => {
  import cetz.draw: *
  let O = (687, 525)
  let R = 97
  circle(p(..O), radius: R, stroke: P-thick)
  let N = (687, 428)
  let S = (687, 622)
  let ra = calc.sqrt(R * R - 42 * 42)
  let A = (687, 483)
  let E = (687 + ra, 483)
  dseg(p, (687 - ra, 483), E)
  dseg(p, N, S)
  dseg(p, N, E)
  dseg(p, E, S)
  pdot(p, O, r: 2.5)
  L(p, 687, 418, $N$)
  L(p, 675, 463, $h$)
  L(p, 680, 499, $A$)
  L(p, 731, 475, $r$)
  L(p, 785, 487, $E$)
  L(p, 704, 530, $O$)
  L(p, 687, 634, $S$)
})

// 图 3·82：球台 = 两个球缺之差
#let fig-P-3-82(width: 200 * k) = px-canvas(200, 225, origin: (703, 322), width: width, (p, u) => {
  import cetz.draw: *
  let O = (802, 433)
  let R = 92
  circle(p(..O), radius: R, stroke: P-thick)
  let c1 = (802, 368)
  let r1 = P-secrx(R, 65, 20)
  let c2 = (802, 487)
  let r2 = P-secrx(R, 54, 28)
  P-ell(p, c1, r1, 20, front: P-thick, back: dsh)
  P-ell(p, c2, r2, 28, front: P-thick, back: dsh)
  dseg(p, (802, 341), (802, 525))
  ring(p, O, r: 2.6)
  for (q, d) in ((c1, 114), (c1, 232), (c1, 301), (c2, 115), (c2, 248), (c2, 307)) {
    ring(p, P-ept(q, if q == c1 { r1 } else { r2 }, if q == c1 { 20 } else { 28 }, d), r: 2.3)
  }
  L(p, 800, 330, $A$)
  L(p, 787, 372, $C_1$)
  L(p, 762, 401, $D_1$)
  L(p, 845, 403, $E_1$)
  L(p, 819, 431, $O$)
  L(p, 772, 445, $C$)
  L(p, 778, 491, $D$)
  L(p, 845, 489, $E$)
  L(p, 802, 539, $B$)
})
