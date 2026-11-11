// 习题 2·6、2·7 里无编号的插图（p.145 第 1、4 题；p.146 第 10、11 题；p.149 第 4 题；p.150 第 5、6、7 题；p.151 第 9 题）；页面 120 dpi 坐标。
#import "H-base.typ": *

// 习题 2·6 第 1 题：两弦 CB 与 ED 交于圆外的点 A
#let fig-H-ex26-1(width: 330 * k) = px-canvas(330, 215, origin: (200, 212), width: width, (p, u) => {
  import cetz.draw: *
  let O = (319, 317)
  let r = 103
  let dx = calc.sqrt(r * r - 47 * 47)
  let C = (O.at(0) - dx, 270)
  let B = (O.at(0) + dx, 270)
  let D = cpt(O, r, -11)
  let E = cpt(O, r, 266)
  let A = isect(E, D, C, B)
  circ(p, O, r)
  seg(p, C, A)
  seg(p, E, A)
  lbl(p, A, $A$, dir: "e", d: 11)
  lbl(p, B, $B$, dir: "ne", d: 10)
  lbl(p, C, $C$, dir: "nw", d: 10)
  lbl(p, D, $D$, dir: "se", d: 11)
  lbl(p, E, $E$, dir: "s", d: 11)
})

// 习题 2·6 第 4 题：地球（圆 O）、彗星 M、切线 MT
#let fig-H-ex26-4(width: 235 * k) = px-canvas(235, 300, origin: (630, 165), width: width, (p, u) => {
  import cetz.draw: *
  let O = (741, 341)
  let r = 101
  let M = (741, 200)
  let N = (741, 442)
  let ta = tanp(M, O, r, 1)
  let tb = tanp(M, O, r, -1)
  let T = if ta.at(0) > tb.at(0) { ta } else { tb }
  circ(p, O, r)
  line(p(640, 341), p(842, 341), stroke: lw)
  line(p(..M), p(..N), stroke: lw)
  line(p(..M), p(..T), stroke: lw)
  line(p(660, 199), p(..M), stroke: lt)
  line(p(660, 240), p(748, 240), stroke: lt)
  dimv(p, 675, 199, 240)
  dimv(p, 675, 240, 341)
  lbl(p, (708, 221), [1880 \ 千米], dir: "c", d: 0)
  lbl(p, (708, 292), [6370 \ 千米], dir: "c", d: 0)
  ring(p, O)
  lbl(p, M, $M$, dir: "n", d: 10)
  lbl(p, T, $T$, dir: "se", d: 11)
  lbl(p, O, $O$, dir: "sw", d: 10)
  lbl(p, N, $N$, dir: "s", d: 10)
})

// 习题 2·6 第 10 题：PA 切圆 O 于 A，M 为 PA 中点，割线 MBC
#let fig-H-ex26-10(width: 380 * k) = px-canvas(380, 235, origin: (125, 290), width: width, (p, u) => {
  import cetz.draw: *
  let O = (373, 402)
  let r = 103
  let P = (154, 434)
  let ta = tanp(P, O, r, 1)
  let tb = tanp(P, O, r, -1)
  let A = if ta.at(1) < tb.at(1) { ta } else { tb }
  let M = lerp(P, A, 0.5)
  let C = cpt(O, r, -70)
  let B = lc2(M, C, O, r)
  circ(p, O, r)
  seg(p, P, A)
  seg(p, P, B)
  seg(p, P, C)
  seg(p, M, C)
  ticks(p, P, M, 1)
  ticks(p, M, A, 1)
  ring(p, O)
  lbl(p, P, $P$, dir: "w", d: 11)
  lbl(p, A, $A$, dir: "ne", d: 9)
  lbl(p, M, $M$, dir: "nw", d: 10)
  lbl(p, B, $B$, dir: "n", d: 11)
  lbl(p, C, $C$, dir: "s", d: 11)
  lbl(p, O, $O$, dir: "s", d: 11)
})

// 习题 2·6 第 11 题：圆内接四边形 ABCD，AD、BC 交于 E，EM ∥ AC，MT 为切线
#let fig-H-ex26-11(width: 380 * k) = px-canvas(380, 230, origin: (480, 300), width: width, (p, u) => {
  import cetz.draw: *
  let O = (739, 417)
  let r = 100
  let A = cpt(O, r, 68.4)
  let B = cpt(O, r, -25.9)
  let C = cpt(O, r, 205.9)
  let D = cpt(O, r, 164.5)
  let E = isect(A, D, B, C)
  let M = isect(E, (E.at(0) + C.at(0) - A.at(0), E.at(1) + C.at(1) - A.at(1)), B, D)
  let ta = tanp(M, O, r, 1)
  let tb = tanp(M, O, r, -1)
  let T = if ta.at(1) < tb.at(1) { ta } else { tb }
  circ(p, O, r)
  seg(p, A, B)
  seg(p, A, C)
  seg(p, B, C)
  seg(p, A, D)
  seg(p, C, D)
  seg(p, M, B)
  seg(p, E, M)
  seg(p, M, T)
  dseg(p, E, D)
  dseg(p, E, C)
  lbl(p, A, $A$, dir: "ne", d: 10)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, C, $C$, dir: "sw", d: 11)
  lbl(p, D, $D$, dir: "nw", d: 10)
  lbl(p, E, $E$, dir: "w", d: 11)
  lbl(p, M, $M$, dir: "nw", d: 10)
  lbl(p, T, $T$, dir: "n", d: 10)
})

// 习题 2·7 第 4 题：九章算术“圆材埋壁”
#let fig-H-ex27-4(width: 250 * k) = px-canvas(250, 235, origin: (640, 780), width: width, (p, u) => {
  import cetz.draw: *
  let O = (764, 896)
  let r = 101
  let M = (684, 896)
  let dy = calc.sqrt(r * r - 80 * 80)
  let A = (684, 896 - dy)
  let B = (684, 896 + dy)
  circ(p, O, r)
  line(p(663, 896), p(865, 896), stroke: lb)
  seg(p, A, B)
  rtmark(p, M, (663, 896), A, s: 7)
  ring(p, O)
  lbl(p, A, $A$, dir: "nw", d: 10)
  lbl(p, B, $B$, dir: "sw", d: 11)
  lbl(p, M, $M$, dir: "ne", d: 10)
  lbl(p, (663, 896), $C$, dir: "w", d: 11)
  lbl(p, (865, 896), $D$, dir: "e", d: 11)
  lbl(p, O, $O$, dir: "s", d: 11)
})

// 习题 2·7 第 5 题 图(1)：轴的纵断面
#let fig-H-ex27-5a(width: 380 * k) = px-canvas(380, 135, origin: (205, 172), width: width, (p, u) => {
  import cetz.draw: *
  let O = (511, 231.5)
  let r = 50
  let (xl, xr, yt, yb) = (234, 475, 197.5, 266)
  line(p(xl, yt), p(xr, yt), stroke: lb)
  line(p(xl, yb), p(xr, yb), stroke: lb)
  line(p(xl, yt), p(xl, yb), stroke: lb)
  line(p(xr, yt), p(xr, yb), stroke: lb)
  arc(p(..O), start: -136.6deg, stop: 136.6deg, radius: r, anchor: "origin", stroke: lb)
  line(p(..O), p(O.at(0) + r, 231.5), stroke: lb)
  line(p(210, yt), p(xl, yt), stroke: lt)
  line(p(210, yb), p(xl, yb), stroke: lt)
  dimv(p, 220, yt, yb, lab: [40], gaph: 20)
  line(p(xl, yb), p(xl, 286), stroke: lt)
  line(p(xr, yb), p(xr, 296), stroke: lt)
  line(p(O.at(0) + r, 238), p(O.at(0) + r, 300), stroke: lt)
  dimh(p, xl, xr, 280, lab: [160], gapw: 30)
  dimh(p, xr, O.at(0) + r, 291, lab: $x$, gapw: 14)
  ring(p, O)
  lbl(p, (530, 219), $R = 36$, dir: "c", d: 0)
  lbl(p, (O.at(0) + r, 231.5), $B$, dir: "e", d: 10)
  lbl(p, (xr, yb), $C$, dir: "w", d: 9)
  lbl(p, (xr, yt), $D$, dir: "n", d: 10)
  lbl(p, O, $O$, dir: "sw", d: 10)
})

// 习题 2·7 第 5 题 图(2)：圆头部分，AB ⊥ CD 于 M
#let fig-H-ex27-5b(width: 135 * k) = px-canvas(135, 140, origin: (588, 172), width: width, (p, u) => {
  import cetz.draw: *
  let O = (655, 238)
  let r = 52
  let dx = calc.sqrt(r * r - 24.5 * 24.5)
  let M = (655, 262.5)
  let C = (655 - dx, 262.5)
  let D = (655 + dx, 262.5)
  circ(p, O, r)
  line(p(655, 186), p(655, 290), stroke: lb)
  line(p(..C), p(..D), stroke: lb)
  dseg(p, O, C)
  ring(p, O)
  lbl(p, (655, 186), $B$, dir: "n", d: 9)
  lbl(p, (655, 290), $A$, dir: "s", d: 9)
  lbl(p, C, $C$, dir: "w", d: 10)
  lbl(p, D, $D$, dir: "e", d: 10)
  lbl(p, M, $M$, dir: "ne", d: 9)
  lbl(p, O, $O$, dir: "w", d: 11)
})

// 习题 2·7 第 6 题：玻璃镜头（剖面线表示断面）
#let fig-H-ex27-6(width: 270 * k) = px-canvas(270, 160, origin: (125, 882), width: width, (p, u) => {
  import cetz.draw: *
  let (xl, xr, yt, yb) = (157.5, 309, 900, 1021)
  let T = (377.5, 957.5)
  let R = 91.5
  let m = 0.9
  // 剖面线：y = y0 + m (x - xl)，限制在矩形内、圆（T, R）外
  let y0 = yt - m * (xr - xl) + 4
  while y0 < yb {
    let xa = calc.max(xl, xl + (yt - y0) / m)
    let xb = calc.min(xr, xl + (yb - y0) / m)
    let q = y0 - m * xl - T.at(1)
    let a2 = 1 + m * m
    let b2 = -2 * T.at(0) + 2 * m * q
    let c2 = T.at(0) * T.at(0) + q * q - R * R
    let disc = b2 * b2 - 4 * a2 * c2
    if disc > 0 {
      let x1 = (-b2 - calc.sqrt(disc)) / (2 * a2)
      xb = calc.min(xb, x1)
    }
    if xa < xb {
      line(p(xa, y0 + m * (xa - xl)), p(xb, y0 + m * (xb - xl)), stroke: 0.4pt)
    }
    y0 += 11
  }
  line(p(xl, yt), p(xr, yt), stroke: lb)
  line(p(xl, yb), p(xr, yb), stroke: lb)
  line(p(xl, yt), p(xl, yb), stroke: lb)
  line(p(xr, yt), p(xr, yb), stroke: lw)
  arc(p(..T), start: 140deg, stop: 220deg, radius: R, anchor: "origin", stroke: lw)
  let dl = (paint: black, thickness: 1.3pt, dash: "dashed")
  line(p(xr, yt), p(..T), stroke: dl)
  line(p(xr, yb), p(..T), stroke: dl)
  line(p(xl + 3, 957.5), p(..T), stroke: (paint: black, thickness: 0.6pt, dash: "dash-dotted"), mark: arw)
  line(p(127, yt), p(xl, yt), stroke: lt)
  line(p(127, yb), p(xl, yb), stroke: lt)
  dimv(p, 142, yt, yb, lab: $b$, gaph: 20)
  lbl(p, (350, 919), $R$, dir: "c", d: 0)
  lbl(p, (297, 965), $a$, dir: "c", d: 0)
})

// 习题 2·7 第 7 题：推杆头
#let fig-H-ex27-7(width: 410 * k) = px-canvas(410, 190, origin: (425, 862), width: width, (p, u) => {
  import cetz.draw: *
  let O = (724, 955)
  let r = 88.5
  let (xl, xr, yt, yb) = (447.5, 651, 905, 1005)
  let th = calc.atan2(-73, 50)   // 数学角：D 在圆心左上
  line(p(xl, yt), p(xr, yt), stroke: lb)
  line(p(xl, yb), p(xr, yb), stroke: lb)
  line(p(xl, yt), p(xl, yb), stroke: lb)
  line(p(xr, yt), p(xr, yb), stroke: lb)
  arc(p(..O), start: -th, stop: th, radius: r, anchor: "origin", stroke: lb)
  line(p(722, 866.5), p(822, 866.5), stroke: lt)
  line(p(722, 1043.5), p(822, 1043.5), stroke: lt)
  dimv(p, 816, 866.5, 1043.5, lab: [25], laby: 955, gaph: 26)
  dimh(p, xl, xr, 893, lab: [30], gapw: 28)
  line(p(xl, 888), p(xl, yt), stroke: lt)
  line(p(xr, 888), p(xr, yt), stroke: lt)
  dimv(p, 435, yt, yb, lab: [15], laby: 960, gaph: 24)
  line(p(425, yt), p(xl, yt), stroke: lt)
  line(p(425, yb), p(xl, yb), stroke: lt)
})

// 习题 2·7 第 9 题：半圆直径 AB，两弦 AD、BE 交于 C，F 为 C 在 AB 上的射影
#let fig-H-ex27-9(width: 245 * k) = px-canvas(245, 230, origin: (645, 245), width: width, (p, u) => {
  import cetz.draw: *
  let O = (764, 366)
  let r = 100
  let A = (664, 366)
  let B = (864, 366)
  let D = cpt(O, r, 71.3)
  let E = cpt(O, r, 136.6)
  let C = isect(A, D, B, E)
  let F = (C.at(0), 366)
  circ(p, O, r)
  seg(p, A, B)
  seg(p, A, D)
  seg(p, B, E)
  dseg(p, A, E)
  dseg(p, D, B)
  dseg(p, C, F)
  ring(p, O)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, D, $D$, dir: "ne", d: 10)
  lbl(p, E, $E$, dir: "nw", d: 10)
  lbl(p, F, $F$, dir: "s", d: 11)
  lbl(p, O, $O$, dir: "s", d: 11)
})
