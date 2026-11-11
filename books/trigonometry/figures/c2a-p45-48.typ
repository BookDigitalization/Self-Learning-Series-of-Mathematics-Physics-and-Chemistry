// 图 2·5、图 2·6（原书 p.45）、图 2·7（p.46）、图 2·8（p.47）、图 2·9、图 2·10、图 2·11（p.48）；页面 200 dpi 坐标。
#import "c2a-base.typ": *

// 图 2·5 直角坐标系：两轴上的刻度、象限编号；A(+4)、B(−3)、D(−5)
#let fig-c2a-2-5(width: 470 * k) = px-canvas(470, 470, origin: (625, 315), width: width, (p, u) => {
  import cetz.draw: *
  let O = (798, 498)
  let e = 34.5
  let X(n) = (O.at(0) + n * e, O.at(1))
  let Y(n) = (O.at(0), O.at(1) - n * e)
  c2a-axes(p, O, 635, 1075, 765, 335, ol: none)
  lbl(p, O, $O$, dir: "nw", d: 11)
  for n in (-3, -2, -1, 1, 2, 3, 4, 5) {
    c2a-tick(p, X(n))
    lbl(p, X(n), text(size: 7pt)[#if n < 0 [−#calc.abs(n)] else [#n]], dir: "s", d: 13)
  }
  for n in (2, 1, -1, -2, -3, -4, -5, -6) {
    c2a-tick(p, Y(n), h: false)
    lbl(p, Y(n), text(size: 7pt)[#if n < 0 [−#calc.abs(n)] else [#n]], dir: "e", d: 14)
  }
  c2a-dot(p, X(-3))
  c2a-dot(p, X(4))
  c2a-dot(p, Y(-5))
  lbl(p, X(-3), $B$, dir: "n", d: 12)
  lbl(p, X(4), $A$, dir: "n", d: 12)
  lbl(p, Y(-5), $D$, dir: "w", d: 13)
  ctext(p, (905, 400), tt[I])
  ctext(p, (705, 400), tt[II])
  ctext(p, (695, 637), tt[III])
  ctext(p, (898, 643), tt[IV])
})

// 图 2·6 点 P 的坐标：MP ⊥ Ox，NP ⊥ Oy；A、B、C、D、E、F 各点
#let fig-c2a-2-6(width: 490 * k) = px-canvas(490, 485, origin: (240, 948), width: width, (p, u) => {
  import cetz.draw: *
  let O = (468, 1218)
  let e = 35
  let Q(x, y) = (O.at(0) + x * e, O.at(1) - y * e)
  c2a-axes(p, O, 252, 715, 1420, 960, ol: none, st: lb)
  lbl(p, O, $O$, dir: "sw", d: 12)
  for n in range(-6, 7) { if n != 0 { c2a-tick(p, Q(n, 0)) } }
  for n in range(-5, 7) { if n != 0 { c2a-tick(p, Q(0, n), h: false) } }
  c2a-seg(p, Q(0, 3), Q(2, 3))
  c2a-seg(p, Q(2, 3), Q(2, 0))
  lbl(p, Q(0, 3), $N$, dir: "w", d: 11)
  lbl(p, Q(2, 3), $P$, dir: "ne", d: 10)
  lbl(p, Q(2, 0), $M$, dir: "s", d: 13)
  for (pt, l, d) in ((Q(3, 2), $A$, "e"), (Q(-3, 2), $B$, "n"), (Q(-4, -2), $C$, "n"), (Q(3, -2.5), $D$, "s")) {
    c2a-dot(p, pt)
    lbl(p, pt, l, dir: d, d: 11)
  }
  c2a-dot(p, Q(4, 0))
  lbl(p, Q(4, 0), $E$, dir: "s", d: 13)
  c2a-dot(p, Q(0, -3))
  lbl(p, Q(0, -3), $F$, dir: "w", d: 12)
})

// 图 2·7 画点 P(2.5, −3.5)
#let fig-c2a-2-7(width: 400 * k) = px-canvas(400, 430, origin: (170, 975), width: width, (p, u) => {
  import cetz.draw: *
  let O = (228, 1077)
  let e = 71
  let Q(x, y) = (O.at(0) + x * e, O.at(1) - y * e)
  c2a-axes(p, O, 178, 555, 1390, 985, ol: none)
  lbl(p, O, $O$, dir: "sw", d: 12)
  for n in (1, 2, 3, 4) { c2a-tick(p, Q(n, 0)) }
  for n in (-1, -2, -3, -4) { c2a-tick(p, Q(0, n), h: false) }
  c2a-seg(p, O, Q(2.5, 0), st: lb)
  c2a-seg(p, O, Q(0, -3.5), st: lb)
  c2a-seg(p, Q(2.5, 0), Q(2.5, -3.5), st: lb)
  c2a-seg(p, Q(0, -3.5), Q(2.5, -3.5), st: lb)
  c2a-dot(p, Q(2.5, -3.5), r: 4)
  lbl(p, Q(2.5, 0), $M$, dir: "n", d: 12)
  lbl(p, Q(0, -3.5), $N$, dir: "w", d: 12)
  lbl(p, Q(2.5, -3.5), $P$, dir: "s", d: 13)
})

// 图 2·8 求点 P 的坐标：OM 对应 −3，MP 对应 4
#let fig-c2a-2-8(width: 400 * k) = px-canvas(400, 360, origin: (705, 1065), width: width, (p, u) => {
  import cetz.draw: *
  let O = (978, 1410)
  let e = 71
  let Q(x, y) = (O.at(0) + x * e, O.at(1) - y * e)
  c2a-axes(p, O, 712, 1095, 1418, 1075, ol: none)
  lbl(p, O, $O$, dir: "se", d: 12)
  for n in (-1, -2) { c2a-tick(p, Q(n, 0)) }
  c2a-seg(p, Q(-3, 0), Q(-3, 4), st: lb)
  for n in (1, 2, 3) { c2a-tick(p, Q(-3, n), h: false) }
  c2a-dot(p, Q(-3, 4), r: 4)
  lbl(p, Q(-3, 0), $M$, dir: "s", d: 12)
  lbl(p, Q(-3, 4), $P$, dir: "n", d: 12)
})

// 图 2·9 画点 P(−5, −3.5)
#let fig-c2a-2-9(width: 530 * k) = px-canvas(530, 420, origin: (295, 355), width: width, (p, u) => {
  import cetz.draw: *
  let O = (705, 505)
  let e = 70
  let Q(x, y) = (O.at(0) + x * e, O.at(1) - y * e)
  c2a-axes(p, O, 305, 815, 760, 365, ol: none)
  lbl(p, O, $O$, dir: "se", d: 12)
  for n in (-1, -2, -3, -4) { c2a-tick(p, Q(n, 0)) }
  c2a-seg(p, Q(-5, 0), Q(-5, -3.5), st: lb)
  for n in (-1, -2, -3) { c2a-tick(p, Q(-5, n), h: false) }
  c2a-dot(p, Q(-5, -3.5), r: 4)
  lbl(p, Q(-5, 0), $M$, dir: "n", d: 12)
  lbl(p, Q(-5, -3.5), $P$, dir: "s", d: 12)
})

// 图 2·10 从原点到点 (3, 4) 的距离
#let fig-c2a-2-10(width: 460 * k) = px-canvas(460, 430, origin: (140, 1075), width: width, (p, u) => {
  import cetz.draw: *
  let O = (193, 1452)
  let P = (402, 1183)
  let M = (402, 1452)
  c2a-axes(p, O, 148, 585, 1495, 1080, ol: none, st: lb)
  lbl(p, O, $O$, dir: "sw", d: 12)
  c2a-seg(p, O, P, st: lb)
  c2a-seg(p, P, M, st: lb)
  lbl(p, P, $P(3, 4)$, dir: "n", d: 13)
  lbl(p, ((O.at(0) + P.at(0)) / 2, (O.at(1) + P.at(1)) / 2), $r$, dir: "nw", d: 10)
  lbl(p, (402, 1310), $4$, dir: "e", d: 9)
  lbl(p, (300, 1452), $3$, dir: "s", d: 12)
})

// 图 2·11 从原点到点 (−3, −2) 的距离
#let fig-c2a-2-11(width: 420 * k) = px-canvas(420, 340, origin: (595, 1150), width: width, (p, u) => {
  import cetz.draw: *
  let O = (872, 1302)
  let P = (663, 1437)
  let M = (663, 1302)
  c2a-axes(p, O, 607, 1000, 1480, 1160, ol: none, st: lb)
  lbl(p, O, $O$, dir: "se", d: 12)
  c2a-seg(p, O, P, st: lb)
  c2a-seg(p, P, M, st: lb)
  lbl(p, P, $(-3, -2)$, dir: "s", d: 14)
  lbl(p, ((O.at(0) + P.at(0)) / 2, (O.at(1) + P.at(1)) / 2), $r$, dir: "se", d: 10)
  lbl(p, (663, 1368), $-2$, dir: "w", d: 14)
  lbl(p, (767, 1302), $-3$, dir: "n", d: 11)
})
