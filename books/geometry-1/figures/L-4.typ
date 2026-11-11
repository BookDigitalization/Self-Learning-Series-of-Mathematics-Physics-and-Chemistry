// 段 L：第 4 章 圆（p.213–220）图 4·1–图 4·10、习题 4·1 第 5 题（车轮外胎，PNG）。
// 页面渲染 200 dpi，坐标取自 build/pages/g1/p0213–p0220.png 和 crop-view 网格图（y 向下，origin 为图左上角）。
#import "/common/geo.typ": *

#let k = 0.0152cm

// 过点 o、沿方向 d（任意长度的向量）的线，从 o 沿 −d 方向 t1、沿 +d 方向 t2 像素的虚线
#let L-dl(p, o, d, t1, t2) = {
  import cetz.draw: *
  let l = calc.sqrt(d.at(0) * d.at(0) + d.at(1) * d.at(1))
  let (ux, uy) = (d.at(0) / l, d.at(1) / l)
  line(p(o.at(0) - ux * t1, o.at(1) - uy * t1), p(o.at(0) + ux * t2, o.at(1) + uy * t2), stroke: dsh)
}
// 外心（三点）
#let L-cc(a, b, c) = {
  let (ax, ay) = a
  let (bx, by) = b
  let (cx, cy) = c
  let d = 2 * (ax * (by - cy) + bx * (cy - ay) + cx * (ay - by))
  let ux = ((ax * ax + ay * ay) * (by - cy) + (bx * bx + by * by) * (cy - ay) + (cx * cx + cy * cy) * (ay - by)) / d
  let uy = ((ax * ax + ay * ay) * (cx - bx) + (bx * bx + by * by) * (ax - cx) + (cx * cx + cy * cy) * (bx - ax)) / d
  (ux, uy)
}
#let L-dist(a, b) = calc.sqrt(calc.pow(a.at(0) - b.at(0), 2) + calc.pow(a.at(1) - b.at(1), 2))
// 点 pt 到直线 ab 的垂足
#let L-foot(pt, a, b) = {
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let t = ((pt.at(0) - a.at(0)) * dx + (pt.at(1) - a.at(1)) * dy) / (dx * dx + dy * dy)
  (a.at(0) + t * dx, a.at(1) + t * dy)
}
// 两直线 a1a2、b1b2 的交点
#let L-meet(a1, a2, b1, b2) = {
  let (x1, y1) = a1
  let (x2, y2) = a2
  let (x3, y3) = b1
  let (x4, y4) = b2
  let d = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
  let t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / d
  (x1 + t * (x2 - x1), y1 + t * (y2 - y1))
}
#let L-hd = tiling(size: (4.5pt, 9pt), line(start: (0pt, 0pt), end: (4.5pt, 9pt), stroke: 0.45pt))   // 陡斜线 \

// ───────── 图 4·1（p.213）：过点 A 的圆。圆心下标原扫描模糊，按正文顺序（O₁ 画粗半径）判读，见备忘 ─────────
#let fig-L-4-1(width: 415 * k) = px-canvas(415, 390, origin: (440, 870), width: width, (p, u) => {
  import cetz.draw: *
  let A = (625, 1102)
  let cs = (
    ((712, 1008), 130, $O_1$, (736, 1008)),  // O₁（右上，大圆，粗半径）
    ((537, 1080), 90, $O_2$, (556, 1092)),
    ((661, 1159), 68, $O_3$, (661, 1182)),
    ((577, 1013), 102, $O_4$, (568, 1030)),
  )
  for (c, r, name, lp) in cs {
    circ(p, c, r)
    if name == $O_3$ { pdot(p, c, r: 3.5) } else { ring(p, c, r: 3) }
    lbl(p, lp, name, dir: "c", d: 0)
  }
  line(p(..A), p(712, 1008), stroke: lb)
  pdot(p, A, r: 1.8)
  lbl(p, A, $A$, dir: "se", d: 9)
})

// ───────── 图 4·2（p.214）：过 A、B 的圆，圆心在 PQ 上 ─────────
#let fig-L-4-2(width: 290 * k) = px-canvas(255, 485, origin: (625, 718), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B) = ((672, 950), (818, 950))
  let cx = 745
  let ys = (862, 912, 988, 1033)
  let names = ($O_1$, $O_2$, $O_4$, $O_3$)
  for (i, y) in ys.enumerate() {
    let r = calc.sqrt(73 * 73 + (y - 950) * (y - 950))
    circ(p, (cx, y), r)
  }
  line(p(cx, 738), p(cx, 1185), stroke: lw)
  seg(p, A, B)
  for (i, y) in ys.enumerate() {
    ring(p, (cx, y), r: 3)
    lbl(p, (cx + 15, y + 2), names.at(i), dir: "c", d: 0)
  }
  ring(p, A, r: 3)
  ring(p, B, r: 3)
  lbl(p, (cx, 724), $P$, dir: "c", d: 0)
  lbl(p, (cx, 1198), $Q$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "w", d: 17)
  lbl(p, B, $B$, dir: "e", d: 17)
})

// ───────── 图 4·3（p.215）：(1) 共线三点；(2) 不共线三点的外接圆 ─────────
#let fig-L-4-3(width: 720 * k) = px-canvas(720, 330, origin: (125, 530), width: width, (p, u) => {
  import cetz.draw: *
  // (1)
  let (A1, B1, C1) = ((152, 668), (330, 668), (467, 668))
  seg(p, A1, C1)
  line(p(240, 552), p(240, 805), stroke: dsh)
  line(p(395, 552), p(395, 805), stroke: dsh)
  for pt in (A1, B1, C1) { ring(p, pt, r: 3) }
  lbl(p, A1, $A$, dir: "w", d: 12)
  lbl(p, B1, $B$, dir: "s", d: 12)
  lbl(p, C1, $C$, dir: "e", d: 12)
  lbl(p, (240, 543), $P$, dir: "c", d: 0)
  lbl(p, (240, 813), $Q$, dir: "c", d: 0)
  lbl(p, (395, 543), $R$, dir: "c", d: 0)
  lbl(p, (395, 813), $S$, dir: "c", d: 0)
  lbl(p, (290, 838), tt[(1)], dir: "c", d: 0)
  // (2)
  let (A, B, C) = ((593, 710), (760, 708), (731, 583))
  let O = L-cc(A, B, C)
  let r = L-dist(O, A)
  circ(p, O, r)
  poly(p, (A, B, C), close: true)
  line(p(..O), p(..A), stroke: dotted)
  line(p(..O), p(..B), stroke: dotted)
  line(p(..O), p(..C), stroke: dotted)
  // 各边的垂直平分线（过外心）
  L-dl(p, O, (0, 1), 56, 132)
  L-dl(p, O, (C.at(1) - A.at(1), A.at(0) - C.at(0)), 78, 48)
  L-dl(p, O, (C.at(1) - B.at(1), B.at(0) - C.at(0)), 40, 128)
  ring(p, O, r: 3)
  lbl(p, (667, 683), $O$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "w", d: 12)
  lbl(p, B, $B$, dir: "se", d: 12)
  lbl(p, C, $C$, dir: "ne", d: 11)
  lbl(p, (680, 838), tt[(2)], dir: "c", d: 0)
})

// ───────── 图 4·4（p.216）：直角三角形的外接圆 ─────────
#let fig-L-4-4(width: 260 * k) = px-canvas(260, 255, origin: (200, 755), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((250, 800), (250, 940), (422, 942))
  let O = ((A.at(0) + C.at(0)) / 2, (A.at(1) + C.at(1)) / 2)
  circ(p, O, L-dist(O, A))
  poly(p, (A, B, C, A), close: true)
  rtmark(p, B, A, C, s: 9)
  L-dl(p, O, (0, 1), 46, 141)
  L-dl(p, O, (1, 0), 146, 64)
  L-dl(p, O, (A.at(1) - C.at(1), C.at(0) - A.at(0)), 44, 52)
  ring(p, O, r: 3)
  lbl(p, O, $O$, dir: "se", d: 12)
})

// ───────── 图 4·5（p.216）：钝角三角形的外接圆 ─────────
#let fig-L-4-5(width: 260 * k) = px-canvas(260, 255, origin: (555, 755), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((577, 877), (788, 877), (665, 789))
  let O = L-cc(A, B, C)
  circ(p, O, L-dist(O, A))
  poly(p, (A, C, B), close: false)
  seg(p, A, B)
  anglearc(p, C, A, B, 20)
  L-dl(p, O, (0, 1), 68, 54)
  L-dl(p, O, (C.at(1) - A.at(1), A.at(0) - C.at(0)), 150, 36)
  L-dl(p, O, (C.at(1) - B.at(1), B.at(0) - C.at(0)), 40, 145)
  ring(p, O, r: 3)
  lbl(p, O, $O$, dir: "e", d: 12)
})

// ───────── 图 4·6（p.217）：三条高交于一点 ─────────
#let fig-L-4-6(width: 460 * k) = px-canvas(460, 360, origin: (390, 165), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((610, 190), (492, 336), (692, 336))
  let sub(a, b) = (a.at(0) - b.at(0), a.at(1) - b.at(1))
  let add(a, b) = (a.at(0) + b.at(0), a.at(1) + b.at(1))
  let P = add(A, sub(B, C))
  let S = add(A, sub(C, B))
  let Q = sub(add(B, C), A)
  let D = L-foot(A, B, C)
  let E = L-foot(B, A, C)
  let F = L-foot(C, A, B)
  let H = L-meet(A, D, B, E)
  poly(p, (A, B, C), close: true)
  dseg(p, P, S)
  dseg(p, P, Q)
  dseg(p, Q, S)
  seg(p, A, D)
  seg(p, B, E)
  seg(p, C, F)
  lbl(p, P, $P$, dir: "nw", d: 9)
  lbl(p, S, $S$, dir: "ne", d: 9)
  lbl(p, Q, $Q$, dir: "s", d: 11)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "sw", d: 10)
  lbl(p, C, $C$, dir: "se", d: 10)
  lbl(p, D, $D$, dir: "s", d: 11)
  lbl(p, E, $E$, dir: "ne", d: 10)
  lbl(p, F, $F$, dir: "nw", d: 10)
  lbl(p, (H.at(0) - 9, H.at(1) + 20), $H$, dir: "c", d: 0)
})

// ───────── 图 4·7（p.218）：(1) 直角三角形的垂心；(2) 钝角三角形的垂心（原图 d 标注各处距离/直角，照录）─────────
#let fig-L-4-7(width: 720 * k) = px-canvas(720, 300, origin: (160, 405), width: width, (p, u) => {
  import cetz.draw: *
  // (1)
  let (C1, B1, A1) = ((192, 424), (194, 592), (472, 592))
  let F1 = L-foot(B1, C1, A1)
  poly(p, (C1, B1, A1), close: true)
  seg(p, B1, F1)
  arc(p(..B1), start: 0deg, stop: 90deg, radius: 20, anchor: "origin", stroke: lt)
  // 垂足处的小弧（FB 与 FA 之间）
  let ta = dirang(B1.at(0) - F1.at(0), B1.at(1) - F1.at(1))
  let tb = dirang(A1.at(0) - F1.at(0), A1.at(1) - F1.at(1))
  arc(p(..F1), start: tb, stop: ta, radius: 18, anchor: "origin", stroke: lt)
  lbl(p, (222, 578), $d$, dir: "c", d: 0)
  lbl(p, (279, 493), $d$, dir: "c", d: 0)
  lbl(p, C1, $C$, dir: "nw", d: 10)
  lbl(p, B1, $B$, dir: "sw", d: 10)
  lbl(p, A1, $A$, dir: "se", d: 10)
  lbl(p, (330, 680), tt[(1)], dir: "c", d: 0)
  // (2)
  let (C, B, A, H) = ((543, 442), (832, 437), (655, 547), (655, 634))
  let T = L-foot(A, C, B)
  let FL = L-foot(A, C, H)
  let FR = L-foot(A, B, H)
  poly(p, (C, A, B), close: true, fill: L-hd)
  seg(p, C, B)
  seg(p, C, H)
  seg(p, B, H)
  seg(p, T, H)
  dseg(p, A, FL)
  dseg(p, A, FR)
  lbl(p, (666, 458), $d$, dir: "c", d: 0)
  lbl(p, (621, 556), $d$, dir: "c", d: 0)
  lbl(p, (699, 573), $d$, dir: "c", d: 0)
  lbl(p, C, $C$, dir: "nw", d: 10)
  lbl(p, B, $B$, dir: "ne", d: 10)
  lbl(p, A, $A$, dir: "se", d: 11)
  lbl(p, H, $H$, dir: "s", d: 11)
  lbl(p, (698, 680), tt[(2)], dir: "c", d: 0)
})

// ───────── 图 4·8（p.219）：垂直于弦的直径 ─────────
#let fig-L-4-8(width: 245 * k) = px-canvas(245, 255, origin: (600, 535), width: width, (p, u) => {
  import cetz.draw: *
  let O = (723, 664)
  let r = 111
  let (A, B) = ((723, 553), (723, 775))
  let E = (723, 729)
  let dx = calc.sqrt(r * r - 65 * 65)
  let C = (723 - dx, 729)
  let D = (723 + dx, 729)
  circ(p, O, r)
  seg(p, A, B)
  seg(p, C, D)
  dseg(p, O, C)
  dseg(p, O, D)
  ring(p, O, r: 3)
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "s", d: 12)
  lbl(p, O, $O$, dir: "ne", d: 11)
  lbl(p, C, $C$, dir: "w", d: 12)
  lbl(p, D, $D$, dir: "se", d: 12)
  lbl(p, E, $E$, dir: "se", d: 11)
})

// ───────── 图 4·9（p.220）：平分一条弧 ─────────
#let fig-L-4-9(width: 260 * k) = px-canvas(260, 290, origin: (190, 380), width: width, (p, u) => {
  import cetz.draw: *
  let (P, S) = ((215, 512), (415, 512))
  let r = 108
  let c = (315, 553)
  let xm = 313
  arc(p(..c), start: calc.asin(41 / r), stop: 180deg - calc.asin(41 / r), radius: r, anchor: "origin", stroke: lw)
  dseg(p, P, S)
  line(p(xm, 400), p(xm, 655), stroke: dsh)
  for yy in (420, 597) {
    line(p(xm - 8, yy - 8), p(xm + 8, yy + 8), stroke: lw)
    line(p(xm - 8, yy + 8), p(xm + 8, yy - 8), stroke: lw)
  }
  lbl(p, (xm, 390), $A$, dir: "c", d: 0)
  lbl(p, (xm, 668), $B$, dir: "c", d: 0)
  lbl(p, (xm + 17, 435), $M$, dir: "c", d: 0)
  lbl(p, P, $P$, dir: "w", d: 11)
  lbl(p, S, $S$, dir: "e", d: 12)
})

// ───────── 图 4·10（p.220）：平行弦所夹的弧 ─────────
#let fig-L-4-10(width: 255 * k) = px-canvas(255, 260, origin: (550, 395), width: width, (p, u) => {
  import cetz.draw: *
  let O = (670, 521)
  let r = 112
  let xs = 668
  let (E, F) = ((xs, 410), (xs, 633))
  let hc = calc.sqrt(r * r - 78 * 78)
  let ha = calc.sqrt(r * r - 58 * 58)
  let (C, D) = ((670 - hc, 443), (670 + hc, 443))
  let (A, B) = ((670 - ha, 579), (670 + ha, 579))
  let M = (xs, 443)
  let N = (xs, 579)
  circ(p, O, r)
  seg(p, E, F)
  seg(p, C, D)
  seg(p, A, B)
  ring(p, O, r: 3)
  lbl(p, E, $E$, dir: "n", d: 11)
  lbl(p, F, $F$, dir: "s", d: 12)
  lbl(p, O, $O$, dir: "e", d: 12)
  lbl(p, C, $C$, dir: "nw", d: 11)
  lbl(p, D, $D$, dir: "ne", d: 11)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, M, $M$, dir: "ne", d: 12)
  lbl(p, N, $N$, dir: "ne", d: 12)
})

// 习题 4·1 第 5 题：车轮外胎（写实插画，原扫描 p.218 二值化裁剪）
#let fig-L-p218-q5(width: 380 * k) = image("L-p218-q5.png", width: width)
