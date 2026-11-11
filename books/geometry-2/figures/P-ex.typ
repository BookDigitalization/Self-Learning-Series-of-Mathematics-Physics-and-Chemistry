// 习题 5·5、5·6 和复习题五里的无编号插图（原书 p.294–295、299–301、301–303）。页面 120 dpi 坐标。
#import "P-base.typ": *

// 带箭头的线（箭头在终点）
#let P-arr(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.45))
}
// 竖直尺寸线：x 处从 y0 到 y1，两端箭头，中间文字（竖排旋转）留缺口
#let P-dimv(p, x, y0, y1, lab, gapw: 30, ang: 90deg) = {
  import cetz.draw: *
  let m = (y0 + y1) / 2
  line(p(x, y0), p(x, m - gapw / 2), stroke: lt, mark: (start: "stealth", fill: black, scale: 0.45))
  line(p(x, m + gapw / 2), p(x, y1), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.45))
  content(p(x, m), tt(lab), angle: ang)
}

// ───────── 习题 5·5 ─────────
// 第 4 题 (1)：正方形里以右下角为圆心、边长为半径作四分之一圆，阴影在圆外
#let fig-P-q55-4a(width: 320 * k) = px-canvas(320, 275, origin: (135, 385), width: width, (p, u) => {
  import cetz.draw: *
  let (x0, x1, y0, y1) = (183, 428, 396, 641)
  let s = 245
  let C = (x1, y1)
  let loop = ((x0, y0), (x1, y0)) + P-arcpts(C, s, 90, 180, n: 60)
  P-hatch(p, (loop,), ang: 90, gap: 4.5)
  poly(p, ((x0, y0), (x1, y0), (x1, y1), (x0, y1)), close: true, stroke: lb)
  P-arc(p, C, s, 90, 180, stroke: lb)
  let T = P-pt(C, s, 135)
  P-arr(p, C, T)
  P-lbw(p, P-lerp(C, T, 0.5), $r$)
  lbl(p, (150, 410), $(1)$, dir: "c", d: 0)
})
// 第 4 题 (2)：正方形四角各作半径为 r/2 的四分之一圆，阴影为中间的星形
#let fig-P-q55-4b(width: 320 * k) = px-canvas(320, 275, origin: (530, 380), width: width, (p, u) => {
  import cetz.draw: *
  let (x0, x1, y0, y1) = (577, 822, 387, 632)
  let r2 = 122.5
  let BL = (x0, y1)
  let TL = (x0, y0)
  let TR = (x1, y0)
  let BR = (x1, y1)
  let loop = P-arcpts(BL, r2, 0, 90, n: 30) + P-arcpts(TL, r2, 270, 360, n: 30) + P-arcpts(TR, r2, 180, 270, n: 30) + P-arcpts(BR, r2, 90, 180, n: 30)
  P-hatch(p, (loop,), ang: 90, gap: 4.5)
  poly(p, (TL, TR, BR, BL), close: true, stroke: lb)
  P-arc(p, BL, r2, 0, 90, stroke: lb)
  P-arc(p, TL, r2, 270, 360, stroke: lb)
  P-arc(p, TR, r2, 180, 270, stroke: lb)
  P-arc(p, BR, r2, 90, 180, stroke: lb)
  let T = P-pt(BR, r2, 135)
  P-arr(p, BR, T)
  P-lbw(p, P-lerp(BR, T, 0.5), $r / 2$)
  lbl(p, (552, 400), $(2)$, dir: "c", d: 0)
})
// 第 5 题：三个等圆两两外切，阴影为三个切点间的弧所围成的图形
#let fig-P-q55-5(width: 330 * k) = px-canvas(330, 290, origin: (530, 710), width: width, (p, u) => {
  import cetz.draw: *
  let R = 70
  let (O1, O2, O3) = ((685, 790), (615, 911), (755, 911))
  let loop = P-arcpts(O1, R, 240, 300, n: 20) + P-arcpts(O3, R, 120, 180, n: 20) + P-arcpts(O2, R, 0, 60, n: 20)
  P-hatch(p, (loop,), ang: 0, gap: 3.5)
  circ(p, O1, R, stroke: lb)
  circ(p, O2, R, stroke: lb)
  circ(p, O3, R, stroke: lb)
  poly(p, (O1, O2, O3), close: true)
  lbl(p, O1, $O_1$, dir: "n", d: 12)
  lbl(p, O2, $O_2$, dir: "w", d: 13)
  lbl(p, O3, $O_3$, dir: "e", d: 13)
  lbl(p, P-lerp(O1, O2, 0.5), $C$, dir: "w", d: 14)
  lbl(p, P-lerp(O1, O3, 0.5), $B$, dir: "ne", d: 12)
  lbl(p, P-lerp(O2, O3, 0.5), $A$, dir: "sw", d: 11)
})
// 第 6 题：窗框，上边为 60° 的弧，窗高 2.4 m、窗宽 1.6 m
#let fig-P-q55-6(width: 230 * k) = px-canvas(230, 325, origin: (200, 225), width: width, (p, u) => {
  import cetz.draw: *
  let O = (313, 418)
  let R = 173
  let (x0, x1, yb) = (227, 399, 503)
  let L = P-pt(O, R, 120)
  let Rr = P-pt(O, R, 60)
  seg(p, (x0, L.at(1)), (x0, yb), stroke: lb)
  seg(p, (x1, L.at(1)), (x1, yb), stroke: lb)
  seg(p, (x0, yb), (x1, yb), stroke: lb)
  P-arc(p, O, R, 60, 120, stroke: lb)
  seg(p, O, L)
  seg(p, O, Rr)
  P-arc(p, O, 28, 60, 120, stroke: lt)
  lbl(p, (313, 378), $60°$, dir: "c", d: 0)
  // 窗高 2.4 m：从弧的中点到底
  let top = (313, O.at(1) - R)
  line(p(..top), p(313, 430), stroke: lt, mark: (start: "stealth", fill: black, scale: 0.45))
  line(p(313, 470), p(313, yb), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.45))
  lbl(p, (313, 450), $2.4 "m"$, dir: "c", d: 0)
  // 窗宽 1.6 m
  seg(p, (x0, 508), (x0, 536), stroke: lt)
  seg(p, (x1, 508), (x1, 536), stroke: lt)
  dimh(p, x0, x1, 523, lab: $1.6 "m"$, gapw: 50)
})
// 第 7 题：钢材横断面（L 形，内角为 90° 的圆角），尺寸单位 mm
#let fig-P-q55-7(width: 390 * k) = px-canvas(390, 285, origin: (460, 245), width: width, (p, u) => {
  import cetz.draw: *
  let (xl, xr, yt, yb) = (490, 800, 273, 505)
  let (xs, ybar) = (738, 343)
  let C = (673, 408)
  let rc = 65
  let loop = ((xl, yt), (xr, yt), (xr, yb), (xs, yb), (xs, C.at(1))) + P-arcpts(C, rc, 0, 90, n: 20) + ((xl, ybar),)
  P-hatch(p, (loop,), ang: -45, gap: 6)
  poly(p, ((xl, yt), (xr, yt), (xr, yb), (xs, yb), (xs, C.at(1))), stroke: lb)
  P-arc(p, C, rc, 0, 90, stroke: lb)
  poly(p, ((C.at(0), ybar), (xl, ybar), (xl, yt)), stroke: lb)
  seg(p, C, (C.at(0), ybar), stroke: dsh)
  seg(p, C, (xs, C.at(1)), stroke: dsh)
  line(p(..C), p(..P-pt(C, rc, 45)), stroke: lt, mark: (start: "stealth", fill: black, scale: 0.45))
  lbl(p, (705, 388), $90°$, dir: "c", d: 0)
  // 尺寸
  seg(p, (xl, 252), (xl, 270), stroke: lt)
  seg(p, (xr, 252), (xr, 270), stroke: lt)
  dimh(p, xl, xr, 262, lab: $460$, gapw: 36)
  seg(p, (470, yt), (487, yt), stroke: lt)
  seg(p, (470, ybar), (487, ybar), stroke: lt)
  P-dimv(p, 478, yt, ybar, $100$, gapw: 32)
  seg(p, (803, yt), (822, yt), stroke: lt)
  seg(p, (803, yb), (822, yb), stroke: lt)
  P-dimv(p, 812, yt, yb, $320$, gapw: 32, ang: -90deg)
  seg(p, (xs, 508), (xs, 524), stroke: lt)
  seg(p, (xr, 508), (xr, 524), stroke: lt)
  dimh(p, xs, xr, 516, lab: $100$, gapw: 28)
})
// 第 8 题：正三角形，过每两个顶点和中心作弧，阴影为三个叶片
#let fig-P-q55-8(width: 260 * k) = px-canvas(260, 235, origin: (200, 735), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((330, 758), (222, 945), (438, 945))
  let R = 124.7
  let Cab = (222, 820.4)
  let Cbc = (330, 1007.3)
  let Cca = (438, 820.4)
  let l1 = P-arcpts(Cab, R, 30, -30, n: 30) + P-arcpts(Cca, R, 210, 150, n: 30)
  let l2 = P-arcpts(Cab, R, 270, 330, n: 30) + P-arcpts(Cbc, R, 90, 150, n: 30)
  let l3 = P-arcpts(Cbc, R, 30, 90, n: 30) + P-arcpts(Cca, R, 210, 270, n: 30)
  for l in (l1, l2, l3) { P-hatch(p, (l,), ang: 0, gap: 5) }
  poly(p, (A, B, C), close: true, stroke: lb)
  P-arc(p, Cab, R, 270, 390, stroke: lb)
  P-arc(p, Cbc, R, 30, 150, stroke: lb)
  P-arc(p, Cca, R, 150, 270, stroke: lb)
  lbl(p, (252, 834), $a$, dir: "c", d: 0)
  lbl(p, (410, 840), $a$, dir: "c", d: 0)
  lbl(p, (330, 933), $a$, dir: "c", d: 0)
})
// 第 9 题：正三角形与圆（圆在各边上截得的弦对 90° 圆心角），阴影为公共部分
#let fig-P-q55-9(width: 260 * k) = px-canvas(260, 240, origin: (570, 725), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((700, 736), (585, 935), (815, 935))
  let G = (700, 868.6)
  let r = 93.9
  let loop = (P-pt(G, r, 225), P-pt(G, r, 315)) + P-arcpts(G, r, 315, 345, n: 12) + (P-pt(G, r, 345), P-pt(G, r, 75)) + P-arcpts(G, r, 75, 105, n: 12) + (P-pt(G, r, 105), P-pt(G, r, 195)) + P-arcpts(G, r, 195, 225, n: 12)
  P-hatch(p, (loop,), ang: 45, gap: 5)
  poly(p, (A, B, C), close: true, stroke: lb)
  circ(p, G, r, stroke: lb)
})

// ───────── 习题 5·6 ─────────
// 第 2 题：水平放着的圆形排水管，水深 6 cm（= R/2）
#let fig-P-q56-2(width: 210 * k) = px-canvas(210, 195, origin: (240, 420), width: width, (p, u) => {
  import cetz.draw: *
  let O = (342, 513)
  let r = 78
  let yw = 552
  let hx = calc.sqrt(r * r - (yw - O.at(1)) * (yw - O.at(1)))
  let A = (O.at(0) - hx, yw)
  let B = (O.at(0) + hx, yw)
  let loop = P-arcpts(O, r, 210, 330, n: 40)
  P-hatch(p, (loop,), ang: 0, gap: 6, sw: (thickness: 0.5pt, dash: "dashed"))
  circ(p, O, r, stroke: lb)
  seg(p, A, B)
  seg(p, O, A, stroke: dsh)
  seg(p, O, B, stroke: dsh)
  ring(p, O, r: 2.5)
  let bot = (O.at(0), O.at(1) + r)
  line(p(O.at(0), yw), p(O.at(0), 560), stroke: lt, mark: (start: "stealth", fill: black, scale: 0.45))
  line(p(O.at(0), 568), p(..bot), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.45))
  P-lbw(p, (O.at(0) + 2, 564), $6 "cm"$)
  lbl(p, O, $O$, dir: "n", d: 13)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, P-lerp(O, B, 0.55), $R$, dir: "ne", d: 8)
})
// 第 3 题：AC 为直径，弧 AB = 90°（弧 AC = 2 弧 AB），阴影为弓形 AB
#let fig-P-q56-3(width: 200 * k) = px-canvas(200, 195, origin: (585, 420), width: width, (p, u) => {
  import cetz.draw: *
  let O = (686, 514)
  let r = 87
  let A = P-pt(O, r, 225)
  let B = P-pt(O, r, 315)
  let C = P-pt(O, r, 45)
  let loop = P-arcpts(O, r, 225, 315, n: 30)
  P-hatch(p, (loop,), ang: 45, gap: 4)
  P-hatch(p, (loop,), ang: -45, gap: 4)
  circ(p, O, r, stroke: lb)
  seg(p, A, C)
  seg(p, A, B, stroke: lb)
  ring(p, O, r: 2.5)
  lbl(p, O, $O$, dir: "w", d: 12)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
  lbl(p, C, $C$, dir: "ne", d: 9)
})
// 第 5 题：圆 O 的弦 AB，以 OA 为直径作圆 O′
#let fig-P-q56-5(width: 215 * k) = px-canvas(215, 205, origin: (235, 1000), width: width, (p, u) => {
  import cetz.draw: *
  let O = (337, 1099)
  let r = 90
  let yc = 1140
  let hx = calc.sqrt(r * r - (yc - O.at(1)) * (yc - O.at(1)))
  let A = (O.at(0) + hx, yc)
  let B = (O.at(0) - hx, yc)
  let O1 = P-lerp(O, A, 0.5)
  circ(p, O, r, stroke: lb)
  circ(p, O1, calc.sqrt(hx * hx + (yc - O.at(1)) * (yc - O.at(1))) / 2)
  seg(p, A, B, stroke: lb)
  seg(p, O, A)
  ring(p, O, r: 2.5)
  ring(p, O1, r: 2.5)
  lbl(p, O, $O$, dir: "w", d: 12)
  lbl(p, O1, $O'$, dir: "ne", d: 12)
  lbl(p, A, $A$, dir: "se", d: 9)
  lbl(p, B, $B$, dir: "w", d: 10)
})
// 第 6 题：圆内接正方形，以各边为直径向形外作半圆，阴影为四个新月形
#let fig-P-q56-6(width: 260 * k) = px-canvas(260, 260, origin: (560, 960), width: width, (p, u) => {
  import cetz.draw: *
  let C0 = (689, 1089)
  let R = 83.5
  let h = 59
  let loops = ()
  for i in range(4) {
    let phi = 90 + 90 * i
    let sc = P-pt(C0, h, phi)
    sc = (C0.at(0) + h * calc.cos(phi * 1deg), C0.at(1) - h * calc.sin(phi * 1deg))
    loops.push(P-arcpts(sc, h, phi - 90, phi + 90, n: 30) + P-arcpts(C0, R, phi + 45, phi - 45, n: 30))
  }
  for l in loops { P-hatch(p, (l,), ang: 45, gap: 5) }
  let V = range(4).map(i => P-pt(C0, R, 45 + 90 * i))
  for i in range(4) {
    let phi = 90 + 90 * i
    let sc = (C0.at(0) + h * calc.cos(phi * 1deg), C0.at(1) - h * calc.sin(phi * 1deg))
    circ(p, sc, h)
    P-arc(p, sc, h, phi - 90, phi + 90, stroke: lb)
  }
  circ(p, C0, R, stroke: lb)
  poly(p, V, close: true, stroke: lb)
})
// 第 7 题：半圆 AB，AC = CD = DB（各 60°），阴影为曲线形 BCD
#let fig-P-q56-7(width: 270 * k) = px-canvas(270, 160, origin: (180, 430), width: width, (p, u) => {
  import cetz.draw: *
  let O = (308, 553)
  let r = 108
  let A = (O.at(0) - r, O.at(1))
  let B = (O.at(0) + r, O.at(1))
  let C = P-pt(O, r, 120)
  let D = P-pt(O, r, 60)
  let loop = P-arcpts(O, r, 120, 0, n: 40)
  P-hatch(p, (loop,), ang: 0, gap: 5)
  P-arc(p, O, r, 0, 180, stroke: lb)
  seg(p, A, B, stroke: lb)
  seg(p, C, B, stroke: lb)
  seg(p, O, C)
  seg(p, O, D)
  ring(p, O, r: 2.5)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
  lbl(p, O, $O$, dir: "s", d: 11)
  lbl(p, C, $C$, dir: "nw", d: 9)
  lbl(p, D, $D$, dir: "ne", d: 9)
})
// 第 8 题：弓形，弦 AB = a，所张的角 120°，阴影为弓形
#let fig-P-q56-8(width: 280 * k) = px-canvas(280, 170, origin: (520, 420), width: width, (p, u) => {
  import cetz.draw: *
  let O = (654, 559)
  let r = 120
  let A = P-pt(O, r, 150)
  let B = P-pt(O, r, 30)
  let D = (654, A.at(1))
  let T = (654, O.at(1) - r)
  let loop = P-arcpts(O, r, 150, 30, n: 40)
  P-hatch(p, (loop,), ang: -45, gap: 6)
  P-arc(p, O, r, 165, 15, stroke: lb)
  seg(p, A, B, stroke: lb)
  seg(p, O, A)
  seg(p, O, B)
  seg(p, O, T, stroke: lb)
  ring(p, O, r: 2.5)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, O, $O$, dir: "s", d: 11)
  lbl(p, D, $D$, dir: "se", d: 11)
  lbl(p, T, $l$, dir: "n", d: 9)
})
// 第 9 题：圆 O 的两条平行弦 AB（60°）、CD（120°），阴影为两弦所夹部分
#let fig-P-q56-9(width: 240 * k) = px-canvas(240, 220, origin: (230, 205), width: width, (p, u) => {
  import cetz.draw: *
  let O = (345, 314)
  let r = 94
  let A = P-pt(O, r, 120)
  let B = P-pt(O, r, 60)
  let C = P-pt(O, r, 150)
  let D = P-pt(O, r, 30)
  let loop = P-arcpts(O, r, 60, 30, n: 20) + P-arcpts(O, r, 150, 120, n: 20)
  P-hatch(p, (loop,), ang: -45, gap: 6)
  circ(p, O, r, stroke: lb)
  seg(p, C, D, stroke: lb)
  seg(p, A, B, stroke: lb)
  seg(p, O, A, stroke: lb)
  seg(p, O, B, stroke: lb)
  seg(p, O, C, stroke: dsh)
  seg(p, O, D, stroke: dsh)
  lbl(p, O, $O$, dir: "s", d: 11)
  lbl(p, A, $A$, dir: "nw", d: 9)
  lbl(p, B, $B$, dir: "ne", d: 9)
  lbl(p, C, $C$, dir: "w", d: 11)
  lbl(p, D, $D$, dir: "e", d: 11)
})
// 第 10 题：同心圆，小圆面积是大圆的一半；AB、CD 为小圆的两条平行切线，阴影为环形夹在两切线间的部分
#let fig-P-q56-10(width: 230 * k) = px-canvas(230, 225, origin: (595, 195), width: width, (p, u) => {
  import cetz.draw: *
  let O = (706, 306)
  let r1 = 76
  let R = r1 * calc.sqrt(2)
  let (yc, ya) = (306 - r1, 306 + r1)
  let hx = r1
  let C = (O.at(0) - hx, yc)
  let D = (O.at(0) + hx, yc)
  let A = (O.at(0) - hx, ya)
  let B = (O.at(0) + hx, ya)
  let E = (O.at(0), ya)
  let outer = P-arcpts(O, R, 45, -45, n: 30) + P-arcpts(O, R, 225, 135, n: 30)
  let inner = P-arcpts(O, r1, 0, 360, n: 60)
  P-hatch(p, (outer, inner), ang: 0, gap: 5)
  circ(p, O, R, stroke: lb)
  circ(p, O, r1, stroke: lb)
  seg(p, C, D, stroke: lb)
  seg(p, A, B, stroke: lb)
  seg(p, O, A, stroke: dsh)
  seg(p, O, B, stroke: dsh)
  seg(p, O, E, stroke: dsh)
  ring(p, O, r: 2.5)
  lbl(p, O, $O$, dir: "n", d: 12)
  lbl(p, C, $C$, dir: "nw", d: 9)
  lbl(p, D, $D$, dir: "ne", d: 9)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
  lbl(p, E, $E$, dir: "s", d: 11)
})

// ───────── 复习题五 ─────────
// 第 2 题：游泳池，中间是矩形（长 35 m、宽 10 m），两端是弓形弧（所对圆心角 120°）
#let fig-P-rv-2(width: 345 * k) = px-canvas(345, 110, origin: (345, 1170), width: width, (p, u) => {
  import cetz.draw: *
  let (x0, x1) = (378, 672)
  let hh = 84
  let (yt, yb) = (1180, 1264)
  let r = hh / (2 * calc.sin(60deg))
  let ym = (yt + yb) / 2
  let O1 = (x0 + r * calc.cos(60deg), ym)
  let O2 = (x1 - r * calc.cos(60deg), ym)
  seg(p, (x0, yt), (x1, yt), stroke: lb)
  seg(p, (x0, yb), (x1, yb), stroke: lb)
  P-arc(p, O1, r, 120, 240, stroke: lb)
  P-arc(p, O2, r, -60, 60, stroke: lb)
  seg(p, O1, (x0, yt))
  seg(p, O1, (x0, yb))
  seg(p, O2, (x1, yt))
  seg(p, O2, (x1, yb))
})
// 第 4 题：七个等圆相切，紧套于圆环中；r 为等圆半径，x 为圆环的宽
#let fig-P-rv-4(width: 270 * k) = px-canvas(270, 260, origin: (170, 580), width: width, (p, u) => {
  import cetz.draw: *
  let C = (300, 707)
  let r = 30
  circ(p, C, 4 * r, stroke: lb)
  circ(p, C, 3 * r, stroke: lb)
  circ(p, C, r)
  for a in (90, 30, -30, -90, -150, 150) { circ(p, P-pt(C, 2 * r, a), r) }
  // 尺寸：x（圆环的宽）、2r（上面小圆的直径）、r（中心圆的半径）
  line(p(300, 587), p(300, 617), stroke: lt, mark: arw2)
  line(p(300, 617), p(300, 677), stroke: lt, mark: arw2)
  line(p(300, 677), p(300, 707), stroke: lt, mark: arw2)
  lbl(p, (308, 601), $x$, dir: "c", d: 0)
  P-lbw(p, (288, 647), $2 r$)
  lbl(p, (308, 692), $r$, dir: "c", d: 0)
})
// 第 6 题：道路拐弯处（环形扇面）：圆心角 60°，路宽 4 m，内弧半径 8 m
#let fig-P-rv-6(width: 250 * k) = px-canvas(250, 205, origin: (540, 612), width: width, (p, u) => {
  import cetz.draw: *
  let O = (650, 795)
  let sc = 15.2
  let ri = 8 * sc
  let ro = 12 * sc
  let loop = P-arcpts(O, ro, 120, 60, n: 40) + P-arcpts(O, ri, 60, 120, n: 40)
  P-hatch(p, (loop,), ang: 80, gap: 5)
  seg(p, O, P-pt(O, ro, 120), stroke: lb)
  seg(p, O, P-pt(O, ro, 60), stroke: lb)
  P-arc(p, O, ro, 60, 120, stroke: lb)
  P-arc(p, O, ri, 60, 120, stroke: lb)
  P-arc(p, O, 30, 60, 120, stroke: lt)
  lbl(p, (650, 756), $60°$, dir: "c", d: 0)
  // 沿右边的尺寸线（向外偏 18）：8 与 4
  let nx = calc.cos(-30deg)
  let ny = -calc.sin(-30deg)
  let off(pt) = (pt.at(0) + 18 * calc.cos(-30deg), pt.at(1) + 18 * calc.sin(30deg))
  let a0 = off(O)
  let a1 = off(P-pt(O, ri, 60))
  let a2 = off(P-pt(O, ro, 60))
  line(p(..a0), p(..a1), stroke: lt, mark: arw2)
  line(p(..a1), p(..a2), stroke: lt, mark: arw2)
  lbl(p, P-lerp(a0, a1, 0.5), $8$, dir: "se", d: 9)
  lbl(p, P-lerp(a1, a2, 0.5), $4$, dir: "se", d: 9)
})
// 第 9 题：菱形，以各边为直径向形内作半圆，阴影为四个叶形
#let P-arcsel(c, r, a0, a1, M2, r2) = {
  // 圆 (c, r) 上从 a0 到 a1 的两段弧里，取中点落在圆 (M2, r2) 内的那一段
  let a1u = if a1 > a0 { a1 } else { a1 + 360 }
  let arcA = P-arcpts(c, r, a0, a1u, n: 40)
  let arcB = P-arcpts(c, r, a0, a1u - 360, n: 40)
  let m = arcA.at(20)
  let d = calc.sqrt(calc.pow(m.at(0) - M2.at(0), 2) + calc.pow(m.at(1) - M2.at(1), 2))
  if d < r2 { arcA } else { arcB }
}
#let P-ang(c, pt) = calc.rem(calc.atan2(pt.at(0) - c.at(0), -(pt.at(1) - c.at(1))).deg() + 360, 360)
#let fig-P-rv-9(width: 390 * k) = px-canvas(390, 215, origin: (175, 215), width: width, (p, u) => {
  import cetz.draw: *
  let O = (367, 324)
  let Vs = ((193, 324), (367, 235), (541, 324), (367, 413))   // 左、上、右、下
  let side = calc.sqrt(174 * 174 + 89 * 89)
  let rr = side / 2
  let mids = range(4).map(i => P-lerp(Vs.at(i), Vs.at(calc.rem(i + 1, 4)), 0.5))
  // 每个顶点处的叶形：顶点 V = Vs[i]，邻边的圆心为 mids[i-1]（上一边）和 mids[i]（下一边）
  for i in range(4) {
    let V = Vs.at(i)
    let M1 = mids.at(calc.rem(i + 3, 4))
    let M2 = mids.at(i)
    let a1 = P-arcsel(M1, rr, P-ang(M1, V), P-ang(M1, O), M2, rr)
    let a2 = P-arcsel(M2, rr, P-ang(M2, O), P-ang(M2, V), M1, rr)
    let big = calc.rem(i, 2) == 0
    P-hatch(p, (a1 + a2,), ang: if big { 22 } else { 90 }, gap: 5)
  }
  poly(p, Vs, close: true, stroke: lb)
  seg(p, Vs.at(0), Vs.at(2), stroke: lt)
  // 各边为直径的半圆（弧过中心 O）
  for i in range(4) {
    let M = mids.at(i)
    let Va = Vs.at(i)
    let Vb = Vs.at(calc.rem(i + 1, 4))
    // 取经过 O 的那半圆
    let aa = P-ang(M, Va)
    let ab = P-ang(M, Vb)
    let arcA = P-arcpts(M, rr, aa, if ab > aa { ab } else { ab + 360 }, n: 40)
    let arcB = P-arcpts(M, rr, aa, (if ab > aa { ab } else { ab + 360 }) - 360, n: 40)
    let pick(arc) = {
      let q = arc.at(20)
      let c = P-ang(M, O)
      // 半圆中点距 O 较近的那段是朝内的
      calc.sqrt(calc.pow(q.at(0) - O.at(0), 2) + calc.pow(q.at(1) - O.at(1), 2))
    }
    let arc = if pick(arcA) < pick(arcB) { arcA } else { arcB }
    line(..arc.map(q => p(..q)), stroke: lb)
  }
})
// 第 10 题：圆 O 的直径 AB 三等分于 M、N，各半圆把圆分成 P₁–P₄ 与 ·
#let fig-P-rv-10(width: 250 * k) = px-canvas(250, 250, origin: (595, 205), width: width, (p, u) => {
  import cetz.draw: *
  let O = (723, 328)
  let r = 107
  let A = (O.at(0) - r, 328)
  let B = (O.at(0) + r, 328)
  let M = (A.at(0) + 2 * r / 3, 328)
  let N = (A.at(0) + 4 * r / 3, 328)
  circ(p, O, r, stroke: lb)
  seg(p, A, B)
  // 上方：以 A 为一端的半圆（直径 AM、AN）
  let c1 = P-lerp(A, M, 0.5)
  let c2 = P-lerp(A, N, 0.5)
  P-arc(p, c1, 2 * r / 6 * 2 / 2 * 1, 0, 180, stroke: lb)
  P-arc(p, c2, r * 2 / 3, 0, 180, stroke: lb)
  // 下方：以 B 为一端的半圆（直径 BN、BM）
  let c3 = P-lerp(N, B, 0.5)
  let c4 = P-lerp(M, B, 0.5)
  P-arc(p, c3, 2 * r / 6 * 2 / 2 * 1, 180, 360, stroke: lb)
  P-arc(p, c4, r * 2 / 3, 180, 360, stroke: lb)
  ring(p, O, r: 2.5)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, M, $M$, dir: "sw", d: 9)
  lbl(p, N, $N$, dir: "ne", d: 11)
  lbl(p, O, $O$, dir: "s", d: 11)
  lbl(p, (658, 307), $P_1$, dir: "c", d: 0)
  lbl(p, (690, 271), $P_2$, dir: "c", d: 0)
  lbl(p, (743, 409), $P_3$, dir: "c", d: 0)
  lbl(p, (767, 373), $P_4$, dir: "c", d: 0)
  lbl(p, (768, 222), $C$, dir: "c", d: 0)
  lbl(p, (683, 437), $D$, dir: "c", d: 0)
})
// 第 11 题：三弧（半径皆为 r，圆心分别是另两弧的交点）
#let fig-P-rv-11(width: 240 * k) = px-canvas(240, 235, origin: (665, 765), width: width, (p, u) => {
  import cetz.draw: *
  let r = 203.5
  let T = (783.5, 779)
  let BL = (682, 951.5)
  let BR = (886, 951.5)
  P-arc(p, T, r, 240, 300, stroke: lb)
  P-arc(p, BL, r, 0, 60, stroke: lb)
  P-arc(p, BR, r, 120, 180, stroke: lb)
  poly(p, (T, BL, BR), close: true)
  lbl(p, (742, 871), $r$, dir: "c", d: 0)
  lbl(p, (822, 871), $r$, dir: "c", d: 0)
  lbl(p, (785, 943), $r$, dir: "c", d: 0)
})


