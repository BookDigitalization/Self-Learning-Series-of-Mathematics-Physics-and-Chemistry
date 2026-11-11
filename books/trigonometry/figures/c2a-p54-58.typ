// 图 2·17（原书 p.54）、图 2·18（p.56）、图 2·19、图 2·20（p.57）、图 2·21（p.58）；页面 200 dpi 坐标。
#import "c2a-base.typ": *

// 图 2·17 终边在坐标轴上：P1、P2、P3、P4
#let fig-c2a-2-17(width: 460 * k) = px-canvas(460, 425, origin: (395, 240), width: width, (p, u) => {
  import cetz.draw: *
  let O = (600, 482)
  c2a-axes(p, O, 400, 840, 660, 255, ol: none, st: lb)
  lbl(p, O, $O$, dir: "se", d: 12)
  for (pt, l, d) in (((740, 482), $P_1$, "se"), ((600, 340), $P_2$, "e"), ((458, 482), $P_3$, "se"), ((600, 622), $P_4$, "e")) {
    c2a-dot(p, pt)
    lbl(p, pt, l, dir: d, d: 14)
  }
})

// 图 2·18 已知 sin α = 1/2，作角 α：y = 1 的直线与半径为 2 的弧交于 P1、P2
#let fig-c2a-2-18(width: 530 * k) = px-canvas(530, 400, origin: (340, 670), width: width, (p, u) => {
  import cetz.draw: *
  let O = (590, 998)
  let e = 108
  let P1 = c2a-pol(O, 2 * e, 30)
  let P2 = c2a-pol(O, 2 * e, 150)
  c2a-axes(p, O, 345, 870, 1065, 680, ol: none, st: lb)
  lbl(p, O, $O$, dir: "se", d: 12)
  line(p(365, O.at(1) - e), p(815, O.at(1) - e), stroke: (paint: black, thickness: 1.1pt, dash: "dashed"))
  arc(p(..O), start: 25deg, stop: 155deg, radius: 2 * e, anchor: "origin", stroke: (paint: black, thickness: 1.1pt, dash: "dashed"))
  c2a-seg(p, O, P1, st: lb)
  c2a-seg(p, O, P2, st: lb)
  c2a-seg(p, P1, (P1.at(0), O.at(1)), st: lb)
  c2a-seg(p, P2, (P2.at(0), O.at(1)), st: lb)
  c2a-arc(p, O, 55, 0, 30, arrow: true)
  c2a-arc(p, O, 40, 0, 150, arrow: true)
  lbl(p, (662, 982), $alpha_1$, dir: "c", d: 0)
  lbl(p, (612, 937), $alpha_2$, dir: "c", d: 0)
  lbl(p, P1, $P_1$, dir: "ne", d: 14)
  lbl(p, P2, $P_2$, dir: "nw", d: 14)
})

// 图 2·19 已知 cos α = −0.6，作角 α：x = −3 的直线与半径为 5 的弧交于 P1、P2
#let fig-c2a-2-19(width: 430 * k) = px-canvas(430, 430, origin: (225, 935), width: width, (p, u) => {
  import cetz.draw: *
  let O = (458, 1173)
  let e = 35
  let P1 = (O.at(0) - 3 * e, O.at(1) - 4 * e)
  let P2 = (O.at(0) - 3 * e, O.at(1) + 4 * e)
  c2a-axes(p, O, 233, 640, 1355, 945, ol: none, st: lb)
  lbl(p, O, $O$, dir: "se", d: 12)
  c2a-seg(p, (O.at(0) - 3 * e, 995), (O.at(0) - 3 * e, 1345), st: lb)
  arc(p(..O), start: 116deg, stop: 244deg, radius: 5 * e, anchor: "origin", stroke: (paint: black, thickness: 1.1pt, dash: "dashed"))
  c2a-seg(p, O, P1, st: lb)
  c2a-seg(p, O, P2, st: lb)
  let a1 = dirang(P1.at(0) - O.at(0), P1.at(1) - O.at(1)).deg()
  let a2 = 360 + dirang(P2.at(0) - O.at(0), P2.at(1) - O.at(1)).deg()
  c2a-arc(p, O, 30, 0, a1, arrow: true)
  c2a-arc(p, O, 18, 0, a2, arrow: true)
  lbl(p, (492, 1137), $alpha_1$, dir: "c", d: 0)
  lbl(p, (426, 1157), $alpha_2$, dir: "c", d: 0)
  lbl(p, P1, $P_1$, dir: "nw", d: 14)
  lbl(p, P2, $P_2$, dir: "sw", d: 14)
})

// 图 2·20 已知 tan α = 5/2，作角 α：P1(2, 5)，P2(−2, −5)
#let fig-c2a-2-20(width: 400 * k) = px-canvas(400, 465, origin: (670, 915), width: width, (p, u) => {
  import cetz.draw: *
  let O = (815, 1170)
  let e = 34
  let P1 = (O.at(0) + 2 * e, O.at(1) - 5 * e)
  let P2 = (O.at(0) - 2 * e, O.at(1) + 5 * e)
  c2a-axes(p, O, 678, 1060, 1370, 925, ol: none, st: lb)
  lbl(p, O, $O$, dir: "se", d: 12)
  c2a-seg(p, P1, P2, st: lb)
  c2a-seg(p, P1, (P1.at(0), O.at(1)), st: lb)
  c2a-seg(p, P2, (P2.at(0), O.at(1)), st: lb)
  let a1 = dirang(P1.at(0) - O.at(0), P1.at(1) - O.at(1)).deg()
  let a2 = 360 + dirang(P2.at(0) - O.at(0), P2.at(1) - O.at(1)).deg()
  c2a-arc(p, O, 28, 0, a1, arrow: true)
  c2a-arc(p, O, 17, 0, a2, arrow: true)
  lbl(p, (856, 1157), $alpha_1$, dir: "c", d: 0)
  lbl(p, (788, 1151), $alpha_2$, dir: "c", d: 0)
  lbl(p, P1, $P_1$, dir: "n", d: 13)
  lbl(p, P2, $P_2$, dir: "s", d: 14)
})

// 图 2·21 已知 cot α = −2，作角 α：P1(−2, 1)，P2(2, −1)
#let fig-c2a-2-21(width: 470 * k) = px-canvas(470, 340, origin: (340, 525), width: width, (p, u) => {
  import cetz.draw: *
  let O = (558, 718)
  let e = 69
  let P1 = (O.at(0) - 2 * e, O.at(1) - e)
  let P2 = (O.at(0) + 2 * e, O.at(1) + e)
  c2a-axes(p, O, 350, 800, 850, 530, ol: none, st: lb)
  lbl(p, O, $O$, dir: "se", d: 12)
  c2a-seg(p, P1, P2, st: lb)
  c2a-seg(p, P1, (P1.at(0), O.at(1)), st: lb)
  c2a-seg(p, P2, (P2.at(0), O.at(1)), st: lb)
  let a1 = dirang(P1.at(0) - O.at(0), P1.at(1) - O.at(1)).deg()
  let a2 = 360 + dirang(P2.at(0) - O.at(0), P2.at(1) - O.at(1)).deg()
  c2a-arc(p, O, 28, 0, a1, arrow: true)
  c2a-arc(p, O, 17, 0, a2, arrow: true)
  lbl(p, (592, 686), $alpha_1$, dir: "c", d: 0)
  lbl(p, (530, 742), $alpha_2$, dir: "c", d: 0)
  lbl(p, P1, $P_1$, dir: "n", d: 14)
  lbl(p, P2, $P_2$, dir: "s", d: 14)
})
