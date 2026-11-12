// 段 N 插图：图 4·19–4·30（原书 p.224–240），读图 150 dpi（页宽 768 像素），坐标为该分辨率下的页面像素。
// 椭圆按原图量出的 a、c（或 a、b）取值，再按 b² = a² − c² 算出另一半轴，点按方程算在曲线上；坐标轴整理为水平、铅直。
#import "/common/geo.typ": *
#let k = 0.019cm
#let N-t(p, pt, body) = { import cetz.draw: *; content(p(..pt), tt(body)) }
// 椭圆：中心 c，半轴 a（水平）、b（铅直）
#let N-ell(p, c, a, b) = { import cetz.draw: *; circle(p(..c), radius: (a, b), stroke: lw) }
// 椭圆上横坐标为 x（相对中心）的点，up: 上半/下半
#let N-pt(c, a, b, x, up: true) = {
  let y = b * calc.sqrt(calc.max(0, 1 - x * x / (a * a)))
  (c.at(0) + x, if up { c.at(1) - y } else { c.at(1) + y })
}
// 坐标轴：x 轴 y=oy 从 xmin 到 xmax，y 轴 x=ox 从 ybot（下）到 ytop（上），均带箭头
#let N-axes(p, ox, oy, xmin, xmax, ybot, ytop, xl: true, yl: true) = {
  import cetz.draw: *
  line(p(xmin, oy), p(xmax, oy), stroke: lt, mark: arw)
  line(p(ox, ybot), p(ox, ytop), stroke: lt, mark: arw)
  if xl { N-t(p, (xmax + 10, oy), $x$) }
  if yl { N-t(p, (ox, ytop - 11), $y$) }
}
// 花括号：a、b 为两端，n 为指向尖端的单位向量（页面坐标），r 为圆角
#let N-brace(p, a, b, n, r: 3) = {
  import cetz.draw: *
  let dx = b.at(0) - a.at(0)
  let dy = b.at(1) - a.at(1)
  let l = calc.sqrt(dx * dx + dy * dy)
  let (ux, uy) = (dx / l, dy / l)
  let q(s, t) = p(a.at(0) + ux * s + n.at(0) * t, a.at(1) + uy * s + n.at(1) * t)
  let m = l / 2
  bezier(q(0, 0), q(r, r), q(0, r), stroke: lt)
  line(q(r, r), q(m - r, r), stroke: lt)
  bezier(q(m - r, r), q(m, 2 * r), q(m, r), stroke: lt)
  bezier(q(m, 2 * r), q(m + r, r), q(m, r), stroke: lt)
  line(q(m + r, r), q(l - r, r), stroke: lt)
  bezier(q(l - r, r), q(l, 0), q(l, r), stroke: lt)
}
// 竖直短刻度
#let N-tk(p, x, y, h: 3) = { import cetz.draw: *; line(p(x, y - h), p(x, y + h), stroke: lt) }
#let N-tkh(p, x, y, h: 3) = { import cetz.draw: *; line(p(x - h, y), p(x + h, y), stroke: lt) }

// ───────── 图 4·19（p.224）：用绳子、钉子画椭圆的实验 ─────────
// 原图是写实插画（手握铅笔）；这里画成示意：平板、纸上的椭圆、两钉、绳圈和铅笔，手未画。
#let fig-N-4-19(width: 245 * k) = px-canvas(245, 200, origin: (95, 235), width: width, (p, u) => {
  import cetz.draw: *
  // 平板（斜放的平行四边形，前沿、左沿画出厚度）
  poly(p, ((104, 312), (318, 317), (334, 412), (138, 414)), close: true)
  poly(p, ((104, 312), (104, 318), (138, 422), (334, 420), (334, 412)))
  seg(p, (138, 414), (138, 422))
  // 平板上的纸（内框）
  poly(p, ((116, 320), (308, 324), (322, 405), (148, 407)), close: true, stroke: lt)
  // 纸上画出的椭圆
  N-ell(p, (210, 356), 78, 34)
  // 两焦点间的直线、钉子
  seg(p, (128, 351), (292, 352), stroke: lt)
  for x in (161, 263) {
    line(p(x, 351), p(x, 337), stroke: lw)
    line(p(x - 4, 337), p(x + 4, 337), stroke: lw)
    pdot(p, (x, 351), r: 1.6)
  }
  // 绳圈：F1—P—F2
  line(p(161, 345), p(220, 322), p(263, 345), stroke: lt)
  // 铅笔
  rect(p(216, 326), p(224, 258), stroke: lw)
  line(p(216, 326), p(220, 334), p(224, 326), stroke: lw)
  N-t(p, (162, 364), $F_1$)
  N-t(p, (265, 364), $F_2$)
  N-t(p, (240, 318), $P$)
})

// ───────── 图 4·20（p.224）：椭圆的标准方程的推导 ─────────
#let fig-N-4-20(width: 345 * k) = px-canvas(345, 235, origin: (338, 815), width: width, (p, u) => {
  import cetz.draw: *
  let (cx, cy) = (488, 947)
  let (a, c) = (113, 95)
  let b = calc.sqrt(a * a - c * c)
  N-axes(p, cx, cy, 345, 662, 1045, 838)
  N-ell(p, (cx, cy), a, b)
  let P = N-pt((cx, cy), a, b, 46)
  let F1 = (cx - c, cy)
  let F2 = (cx + c, cy)
  seg(p, F1, P, stroke: lt); seg(p, P, F2, stroke: lt)
  pdot(p, F1); pdot(p, F2); pdot(p, P)
  N-t(p, (562, 878), $P(x, y)$)
  N-t(p, (432, 963), $F_1(-c, 0)$)
  N-t(p, (558, 963), $F_2(c, 0)$)
  N-t(p, (479, 959), $O$)
})

// ───────── 图 4·21（p.227）：a、b、c 组成的直角三角形 ─────────
#let fig-N-4-21(width: 340 * k) = px-canvas(340, 200, origin: (225, 770), width: width, (p, u) => {
  import cetz.draw: *
  let (cx, cy) = (374, 866)
  let (a, c) = (115, 96)
  let b = calc.sqrt(a * a - c * c)
  let P = (cx, cy - b)
  let F1 = (cx - c, cy)
  let F2 = (cx + c, cy)
  // 阴影：△OPF2 内画斜线（x + y = s，页面坐标）
  let s0 = cx + cy - b
  let s = s0 + 7
  while s < cx + c + cy {
    // 一端在 OP（x = cx）或 OF2（y = cy）上，另一端在 PF2 上：P + λ(F2 − P)
    let q1 = if s - cx <= cy { (cx, s - cx) } else { (s - cy, cy) }
    let lam = (s - (P.at(0) + P.at(1))) / ((F2.at(0) - P.at(0)) + (F2.at(1) - P.at(1)))
    let q2 = (P.at(0) + lam * (F2.at(0) - P.at(0)), P.at(1) + lam * (F2.at(1) - P.at(1)))
    line(p(..q1), p(..q2), stroke: 0.4pt)
    s += 7
  }
  N-axes(p, cx, cy, 235, 548, 960, 782)
  N-ell(p, (cx, cy), a, b)
  seg(p, F1, P, stroke: lt); seg(p, P, F2, stroke: lt)
  pdot(p, F1); pdot(p, F2)
  N-brace(p, (F1.at(0), cy + 2), (cx - 1, cy + 2), (0, 1))
  N-brace(p, (cx + 1, cy + 2), (F2.at(0), cy + 2), (0, 1))
  N-t(p, (384, 794), $P$)
  N-t(p, (324, 826), $a$)
  N-t(p, (430, 828), $a$)
  N-t(p, (366, 839), $b$)
  N-t(p, (365, 857), $O$)
  N-t(p, (284, 880), $F_1$)
  N-t(p, (466, 880), $F_2$)
  N-t(p, (326, 884), $c$)
  N-t(p, (422, 884), $c$)
})

// ───────── 图 4·22（p.229）：椭圆的顶点、长轴和短轴 ─────────
#let fig-N-4-22(width: 360 * k) = px-canvas(360, 245, origin: (205, 165), width: width, (p, u) => {
  import cetz.draw: *
  let (cx, cy) = (389, 292)
  let (a, b) = (114, 61)
  let c = calc.sqrt(a * a - b * b)
  N-axes(p, cx, cy, 222, 555, 405, 185)
  N-ell(p, (cx, cy), a, b)
  let B = (cx, cy - b)
  let F1 = (cx - c, cy)
  let F2 = (cx + c, cy)
  seg(p, B, F2, stroke: lt)
  pdot(p, F1); pdot(p, F2)
  N-brace(p, (cx - 2, cy - 1), (cx - 2, cy - b + 1), (-1, 0))
  N-brace(p, (cx - a, cy + 3), (cx - 1, cy + 3), (0, 1))
  N-brace(p, (cx + 1, cy + 3), (F2.at(0), cy + 3), (0, 1))
  N-t(p, (418, 221), $B(0, b)$)
  N-t(p, (448, 258), $a$)
  N-t(p, (375, 262), $b$)
  N-t(p, (400, 281), $O$)
  N-t(p, (297, 280), $F_1$)
  N-t(p, (487, 280), $F_2$)
  N-t(p, (243, 304), $A'(-a, 0)$)
  N-t(p, (537, 304), $A(a, 0)$)
  N-t(p, (332, 312), $a$)
  N-t(p, (436, 312), $c$)
  N-t(p, (420, 364), $B'(0, -b)$)
})

// ───────── 图 4·23（p.230）：椭圆在四条直线所围的矩形内 ─────────
#let fig-N-4-23(width: 300 * k) = px-canvas(300, 215, origin: (228, 740), width: width, (p, u) => {
  import cetz.draw: *
  let (cx, cy) = (357, 860)
  let (a, b) = (97, 55)
  let c = calc.sqrt(a * a - b * b)
  N-axes(p, cx, cy, 235, 505, 948, 762)
  // 四条直线 x = ±a、y = ±b
  for x in (cx - a, cx + a) { line(p(x, 790), p(x, 935), stroke: lt) }
  for y in (cy - b, cy + b) { line(p(245, y), p(470, y), stroke: lt) }
  N-ell(p, (cx, cy), a, b)
  pdot(p, (cx - c, cy)); pdot(p, (cx + c, cy))
  N-t(p, (276, 783), $x = -a$)
  N-t(p, (466, 783), $x = a$)
  N-t(p, (492, 806), $y = b$)
  N-t(p, (495, 916), $y = -b$)
  N-t(p, (366, 797), $B$)
  N-t(p, (367, 926), $B'$)
  N-t(p, (252, 872), $A'$)
  N-t(p, (462, 851), $A$)
  N-t(p, (280, 875), $F_1$)
  N-t(p, (436, 875), $F_2$)
  N-t(p, (349, 873), $O$)
})

// ───────── 图 4·24（p.231）：例 2，椭圆 x²/9 + y²/4 = 1 ─────────
#let fig-N-4-24(width: 310 * k) = px-canvas(310, 250, origin: (368, 445), width: width, (p, u) => {
  import cetz.draw: *
  let (cx, cy) = (508, 587)
  let un = 36
  N-axes(p, cx, cy, 372, 660, 690, 462)
  for i in (-2, -1, 1, 2) { N-tk(p, cx + i * un, cy) }
  for i in (-1, 1) { N-tkh(p, cx, cy + i * un) }
  N-ell(p, (cx, cy), 3 * un, 2 * un)
  for x in (0, 1, 1.5, 2, 2.5, 3) { pdot(p, N-pt((cx, cy), 3 * un, 2 * un, x * un)) }
  N-t(p, (499, 600), $O$)
})

// ───────── 图 4·25（p.232）：b/a 不同的三个椭圆 ─────────
#let fig-N-4-25(width: 600 * k) = px-canvas(600, 205, origin: (75, 540), width: width, (p, u) => {
  import cetz.draw: *
  let panel(cx, a, ratio, xmin, xmax, ybot, ytop, n, nx, ny, lab) = {
    let cy = 651
    let b = a * ratio
    let un = a / n
    N-axes(p, cx, cy, xmin, xmax, ybot, ytop)
    for i in range(1, nx + 1) { N-tk(p, cx + i * un, cy); N-tk(p, cx - i * un, cy) }
    for i in ny { N-tkh(p, cx, cy + i * un); N-tkh(p, cx, cy - i * un) }
    N-ell(p, (cx, cy), a, b)
    N-t(p, (cx - 10, cy + 12), $O$)
    N-t(p, (cx, 733), lab)
  }
  panel(176, 59, 1 / 4, 87, 248, 700, 575, 4, 3, (2,), [(_a_)])
  panel(352, 58, 1 / 2, 263, 420, 705, 575, 2, 1, (), [(_b_)])
  panel(556, 73, 4 / 5, 465, 650, 715, 548, 5, 4, (1, 2, 3), [(_c_)])
})

// ───────── 图 4·26（p.235）：例 5，地球绕太阳运行的轨道 ─────────
#let fig-N-4-26(width: 350 * k) = px-canvas(350, 255, origin: (210, 160), width: width, (p, u) => {
  import cetz.draw: *
  let (cx, cy) = (377, 299)
  N-axes(p, cx, cy, 215, 555, 410, 178)
  N-ell(p, (cx, cy), 104, 73.5)
  pdot(p, (353, cy))
  ring(p, (400, cy))
  ring(p, (273, cy))
  pdot(p, (481, cy), r: 2.8)
  N-t(p, (266, 285), $A'$)
  N-t(p, (353, 284), $F_1$)
  N-t(p, (366, 312), $O$)
  N-t(p, (418, 284), [$F_2$（太阳）])
  N-t(p, (486, 285), $A$)
  N-t(p, (240, 314), [（远日点）])
  N-t(p, (516, 314), [（近日点）])
})

// ───────── 图 4·27（p.236）：(a) 焦点在 x 轴上，(b) 焦点在 y 轴上 ─────────
#let fig-N-4-27(width: 600 * k) = px-canvas(600, 300, origin: (70, 592), width: width, (p, u) => {
  import cetz.draw: *
  // (a)
  let (cx, cy) = (250, 741)
  let (a, b) = (87, 47)
  let c = calc.sqrt(a * a - b * b)
  N-axes(p, cx, cy, 92, 392, 830, 635)
  N-ell(p, (cx, cy), a, b)
  let B = (cx, cy - b)
  let F1 = (cx - c, cy)
  let F2 = (cx + c, cy)
  seg(p, F1, B, stroke: lt); seg(p, B, F2, stroke: lt)
  ring(p, F1, r: 2.4); pdot(p, F2)
  N-brace(p, (cx - a, cy + 2), (cx - 1, cy + 2), (0, 1))
  N-t(p, (290, 683), $B(0, b)$)
  N-t(p, (258, 718), $b$)
  N-t(p, (292, 707), $a$)
  N-t(p, (285, 731), $c$)
  N-t(p, (261, 753), $O$)
  N-t(p, (171, 722), $F_1$)
  N-t(p, (326, 756), $F_2$)
  N-t(p, (362, 756), $A(a, 0)$)
  N-t(p, (127, 752), $A'(-a, 0)$)
  N-t(p, (218, 756), $a$)
  N-t(p, (293, 794), $B'(0, -b)$)
  N-t(p, (250, 848), [(_a_)])
  // (b)
  let (cx, cy) = (543, 741)
  let (a, b) = (88, 43)
  let c = calc.sqrt(a * a - b * b)
  N-axes(p, cx, cy, 425, 650, 870, 608)
  N-ell(p, (cx, cy), b, a)
  let A = (cx + b, cy)
  let F2 = (cx, cy - c)
  let F1 = (cx, cy + c)
  seg(p, F2, A, stroke: lt); seg(p, A, F1, stroke: lt)
  pdot(p, F1); pdot(p, F2)
  N-brace(p, (cx - 2, cy + 1), (cx - 2, cy + a - 1), (-1, 0))
  N-t(p, (579, 652), $B(0, a)$)
  N-t(p, (531, 668), $F_2$)
  N-t(p, (533, 705), $c$)
  N-t(p, (568, 700), $a$)
  N-t(p, (533, 731), $O$)
  N-t(p, (563, 751), $b$)
  N-t(p, (617, 752), $A(b, 0)$)
  N-t(p, (470, 752), $A'(-b, 0)$)
  N-t(p, (527, 786), $a$)
  N-t(p, (557, 812), $F_1$)
  N-t(p, (583, 838), $B'(0, -a)$)
  N-t(p, (543, 880), [(_b_)])
})

// ───────── 图 4·28（p.239）：例 6，椭圆 x²/4 + y²/16 = 1 ─────────
#let fig-N-4-28(width: 285 * k) = px-canvas(285, 380, origin: (412, 165), width: width, (p, u) => {
  import cetz.draw: *
  let (cx, cy) = (544, 370)
  let un = 36
  N-axes(p, cx, cy, 415, 688, 548, 190)
  for i in (-1, 1) { N-tk(p, cx + i * un, cy) }
  for i in (-2, -1, 1, 2) { N-tkh(p, cx, cy + i * un) }
  N-ell(p, (cx, cy), 2 * un, 4 * un)
  let c = 2 * calc.sqrt(3) * un
  pdot(p, (cx, cy - c)); pdot(p, (cx, cy + c))
  // 表中的点 (1, 3.5)、(1.5, 2.6)、(1.8, 1.7)：按 x 算在椭圆上
  for x in (1, 1.5, 1.8) {
    let y = 4 * un * calc.sqrt(1 - x * x / 4)
    pdot(p, (cx + x * un, cy - y))
  }
  N-t(p, (535, 383), $O$)
  N-t(p, (511, 262), $F_2 (0, 2 sqrt(3))$)
  N-t(p, (513, 478), $F_1 (0, -2 sqrt(3))$)
})

// ───────── 图 4·29（p.240）：根据定义用圆规画椭圆上的点 ─────────
#let fig-N-4-29(width: 255 * k) = px-canvas(255, 285, origin: (95, 318), width: width, (p, u) => {
  import cetz.draw: *
  let (cx, cy) = (220, 413)
  let (a, c) = (101, 74)
  let b = calc.sqrt(a * a - c * c)
  let e = c / a
  line(p(100, cy), p(340, cy), stroke: lt)
  N-tk(p, cx, cy)
  N-ell(p, (cx, cy), a, b)
  let F1 = (cx - c, cy)
  let F2 = (cx + c, cy)
  let P1 = N-pt((cx, cy), a, b, -50)
  let P2 = N-pt((cx, cy), a, b, 2)
  let P1d = N-pt((cx, cy), a, b, -50, up: false)
  let P2d = N-pt((cx, cy), a, b, 2, up: false)
  for P in (P1, P2, P1d, P2d) {
    seg(p, F1, P, stroke: lt); seg(p, P, F2, stroke: lt)
    pdot(p, P)
  }
  for q in ((cx - a, cy), F1, F2, (cx + a, cy)) { pdot(p, q) }
  N-t(p, (176, 330), $P_1$)
  N-t(p, (223, 326), $P_2$)
  N-t(p, (167, 497), $P'_1$)
  N-t(p, (224, 503), $P'_2$)
  N-t(p, (145, 428), $F_1$)
  N-t(p, (300, 428), $F_2$)
  N-t(p, (220, 429), $O$)
  N-t(p, (173, 379), $t$)
  N-t(p, (243, 379), $2a - t$)
  // 下方的线段：A′A = 2a，A′M = NA = a − c，A′Q = t
  let xa = cx - a
  let xb = cx + a
  let t = a + e * (P1.at(0) - cx)
  let xq = xa + t
  let xm = xa + (a - c)
  let xn = xb - (a - c)
  line(p(xa, 508), p(xa, 572), stroke: lt)
  line(p(xb, 500), p(xb, 575), stroke: lt)
  dimh(p, xa, xq, 517, lab: $t$, gapw: 12)
  dimh(p, xq, xb, 517, lab: $2a - t$, gapw: 36)
  line(p(xa, 540), p(xb, 540), stroke: lt)
  line(p(xq, 512), p(xq, 540), stroke: lt)
  for x in (xm, cx, xn) { N-tk(p, x, 540) }
  dimh(p, xa, xb, 566, lab: $2a$, gapw: 18)
  dimh(p, xm, xn, 591, lab: $2c$, gapw: 18)
  line(p(xm, 581), p(xm, 601), stroke: lt)
  line(p(xn, 581), p(xn, 601), stroke: lt)
  N-t(p, (109, 537), $A'$)
  N-t(p, (332, 537), $A$)
  N-t(p, (xm, 553), $M$)
  N-t(p, (xq, 553), $Q$)
  N-t(p, (xn, 553), $N$)
})

// ───────── 图 4·30（p.240）：用两个辅助圆画椭圆上的点 ─────────
// 左侧两点原图两个标注都像 P₂；按正文“P₂, P₃, ……”把下面一个标作 P₃（黄底待核）。
#let fig-N-4-30(width: 330 * k) = px-canvas(330, 330, origin: (345, 728), width: width, (p, u) => {
  import cetz.draw: *
  let O = (470, 912)
  let (a, b) = (97, 50)
  N-axes(p, O.at(0), O.at(1), 350, 655, 1050, 752)
  circ(p, O, a)
  circ(p, O, b, stroke: lt)
  N-ell(p, O, a, b)
  // 由离心角 θ 作点：N 在大圆上，M 在小圆上，P = (a cos θ, b sin θ)
  let mk(th) = {
    let N = (O.at(0) + a * calc.cos(th), O.at(1) - a * calc.sin(th))
    let M = (O.at(0) + b * calc.cos(th), O.at(1) - b * calc.sin(th))
    let P = (N.at(0), M.at(1))
    (N, M, P)
  }
  let (N, M, P1) = mk(44deg)
  seg(p, O, N, stroke: lt)
  seg(p, N, P1, stroke: lt)
  line(p(..M), p(..P1), stroke: dsh)
  line(p(..M), p(M.at(0), O.at(1)), stroke: dsh)
  N-tk(p, N.at(0), O.at(1), h: 4)
  pdot(p, N); pdot(p, P1)
  anglearc(p, O, (O.at(0) + 30, O.at(1)), N, 16)
  for th in (104.6deg, 137.5deg) {
    let (Nn, Mm, Pp) = mk(th)
    seg(p, O, Nn, stroke: lt)
    seg(p, Nn, Pp, stroke: lt)
    line(p(..Mm), p(..Pp), stroke: dsh)
    pdot(p, Nn); pdot(p, Pp)
  }
  line(p(..P1), p(566, 868), stroke: lt)
  N-t(p, (552, 838), $N$)
  N-t(p, (602, 866), $P_1(x, y)$)
  N-t(p, (518, 893), $M$)
  N-t(p, (506, 927), $D$)
  N-t(p, (541, 927), $N'$)
  N-t(p, (461, 927), $O$)
  N-t(p, (491, 899), $θ$)
  N-t(p, (429, 851), $P_2$)
  // 扫描不清（像 P₂，与上面一点重名），按正文“P₂，P₃，……”及作图顺序（逆时针依次取点）判读为 P₃
  content(p(398, 898), tt[$P_3$])
})
