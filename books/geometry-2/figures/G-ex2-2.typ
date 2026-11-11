// 习题 2·2 第 7、13、18、20 题的图（原书 p.126、p.127）；页面 120 dpi 坐标。
// 第 7 题卡尺（写实器械）画成简化轮廓：只保留脚、横梁和滑块，圆与 A、B、C、D、O、s、l、x 照原图。
// 第 13 题测径器：直尺与刻度按原图示意（刻度条数不求与原图一致）。
// 第 18 题：P 点取原图位置。第 20 题：圆 O 半径 124 像素，按 AC ⊥ BD 重算各点；原图 AB、CD 上的两个小记号不画（看不出含义）。
#import "G-base.typ": *

// 第 7 题
#let fig-G-ex22-7(width: 340 * k) = px-canvas(340, 310, origin: (520, 310), width: width, (p, u) => {
  import cetz.draw: *
  let O = (715, 487)
  let A = (628, 437)
  let B = (802, 437)
  circ(p, O, 100, stroke: lb)
  // 卡尺轮廓
  line(p(630, 437), p(614, 412), p(614, 378), p(625, 378), p(625, 325), p(638, 325), p(638, 355), p(773, 355), p(773, 328),
    p(797, 328), p(797, 352), p(805, 362), p(805, 385), p(809, 395), p(809, 415), p(800, 437), stroke: lw)
  line(p(614, 392), p(809, 392), stroke: lw)
  rect(p(568, 342), p(627, 378), stroke: lw)
  rect(p(574, 350), p(620, 366), stroke: lt)
  rect(p(586, 378), p(606, 388), stroke: lw)
  // 竖直虚线 C…O，水平虚线过 O
  line(p(715, 325), p(715, 487), stroke: (paint: black, thickness: 0.6pt, dash: "dash-dotted"))
  line(p(600, 487), p(830, 487), stroke: (paint: black, thickness: 0.6pt, dash: "dash-dotted"))
  dseg(p, A, O)
  ring(p, O, r: 3)
  dimh(p, 628, 802, 437, lab: $l$, labx: 705, gapw: 20)
  line(p(725, 388), p(725, 436), stroke: lt, mark: arw2)
  lbl(p, (732, 413), $s$, dir: "c", d: 0)
  lbl(p, (672, 463), $x$, dir: "c", d: 0)
  lbl(p, (715, 372), $C$, dir: "c", d: 0)
  lbl(p, (718, 452), $D$, dir: "c", d: 0)
  lbl(p, (722, 503), $O$, dir: "c", d: 0)
  lbl(p, (608, 441), $A$, dir: "c", d: 0)
  lbl(p, (822, 441), $B$, dir: "c", d: 0)
})

// 第 13 题：测径器
#let fig-G-ex22-13(width: 270 * k) = px-canvas(270, 220, origin: (560, 995), width: width, (p, u) => {
  import cetz.draw: *
  let O = (677, 1090)
  let N = (677, 1005)
  let M = (677, 1175)
  let A = (595, 1112)
  let B = (598, 1178)
  let C = (812, 1178)
  circ(p, O, 85, stroke: lb)
  // 直尺：竖尺（A 所在）与横尺
  rect(p(570, 1112), p(598, 1200), stroke: lb)
  rect(p(570, 1178), p(815, 1200), stroke: lb)
  for i in range(1, 7) {
    let y = 1112 + i * 10
    line(p(598, y), p(if calc.even(i) { 586 } else { 590 }, y), stroke: lt)
  }
  for i in range(1, 19) {
    let x = 598 + i * 12
    line(p(x, 1178), p(x, if calc.rem(i, 3) == 0 { 1192 } else { 1187 }), stroke: lt)
  }
  seg(p, A, N)
  seg(p, A, M)
  G-bold(p, N, M)
  ring(p, O, r: 3)
  lbl(p, (684, 1000), $N$, dir: "c", d: 0)
  lbl(p, (692, 1090), $O$, dir: "c", d: 0)
  lbl(p, (586, 1103), $A$, dir: "c", d: 0)
  lbl(p, (612, 1172), $B$, dir: "c", d: 0)
  lbl(p, (689, 1168), $M$, dir: "c", d: 0)
  lbl(p, (806, 1166), $C$, dir: "c", d: 0)
})

// 第 18 题：矩形内一点 P
#let fig-G-ex22-18(width: 290 * k) = px-canvas(290, 185, origin: (190, 830), width: width, (p, u) => {
  import cetz.draw: *
  let A = (208, 850)
  let D = (450, 850)
  let B = (208, 990)
  let C = (450, 990)
  let P = (380, 937)
  poly(p, (A, B, C, D), close: true)
  seg(p, A, P)
  seg(p, B, P)
  seg(p, C, P)
  seg(p, D, P)
  dseg(p, (380, 850), (380, 990))
  ring(p, P, r: 3)
  lbl(p, A, $A$, dir: "nw", d: 9)
  lbl(p, D, $D$, dir: "ne", d: 9)
  lbl(p, B, $B$, dir: "sw", d: 9)
  lbl(p, C, $C$, dir: "se", d: 9)
  lbl(p, (380, 838), $E$, dir: "c", d: 0)
  lbl(p, (380, 1003), $F$, dir: "c", d: 0)
  lbl(p, (393, 932), $P$, dir: "c", d: 0)
})

// 第 20 题：圆 O 中两弦 AC ⊥ BD 交于 H
#let fig-G-ex22-20(width: 295 * k) = px-canvas(295, 295, origin: (555, 745), width: width, (p, u) => {
  import cetz.draw: *
  let O = (703, 893)
  let r = 124
  let A = (703 - calc.sqrt(r * r - 35 * 35), 858)
  let C = (703 + calc.sqrt(r * r - 35 * 35), 858)
  let D = (686, 893 - calc.sqrt(r * r - 17 * 17))
  let B = (686, 893 + calc.sqrt(r * r - 17 * 17))
  let H = (686, 858)
  let M = (703, 858)
  let N = (686, 893)
  circ(p, O, r, stroke: lb)
  poly(p, (A, B, C, D), close: true)
  seg(p, A, C)
  seg(p, D, B)
  dseg(p, A, O)
  dseg(p, M, O)
  dseg(p, O, B)
  dseg(p, N, O)
  rtmark(p, H, D, A, s: 9)
  ring(p, O, r: 3)
  lbl(p, D, $D$, dir: "n", d: 11)
  lbl(p, A, $A$, dir: "w", d: 10)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, B, $B$, dir: "s", d: 11)
  lbl(p, (672, 857), $H$, dir: "c", d: 0)
  lbl(p, (708, 846), $M$, dir: "c", d: 0)
  lbl(p, (672, 897), $N$, dir: "c", d: 0)
  lbl(p, (719, 897), $O$, dir: "c", d: 0)
})
