// 习题 4·15 的插图：第 10 题（原书 p.280）、第 12 题、第 13 题、第 14 题、第 15 题（p.281）；页面 200 dpi 坐标。
#import "P-base.typ": *

// 在顶点 v 处把两边（朝向点 a1、a2）用切线长为 t 的圆弧磨圆
#let P-corner(p, v, a1, a2, t, st: lb) = {
  let u1 = P-go((0, 0), (a1.at(0) - v.at(0), a1.at(1) - v.at(1)), 1)
  let u2 = P-go((0, 0), (a2.at(0) - v.at(0), a2.at(1) - v.at(1)), 1)
  let t1 = (v.at(0) + t * u1.at(0), v.at(1) + t * u1.at(1))
  let t2 = (v.at(0) + t * u2.at(0), v.at(1) + t * u2.at(1))
  let al = calc.acos(u1.at(0) * u2.at(0) + u1.at(1) * u2.at(1)) / 2
  let b = P-go((0, 0), (u1.at(0) + u2.at(0), u1.at(1) + u2.at(1)), 1)
  let dist = t / calc.cos(al)
  let o = (v.at(0) + b.at(0) * dist, v.at(1) + b.at(1) * dist)
  let r = t * calc.tan(al)
  let q0 = P-ang(o, t1)
  let q1 = P-ang(o, t2)
  let df = calc.rem(q1 - q0 + 540, 360) - 180
  parc(p, o, r, q0, q0 + df, st: st)
}

// 第 10 题：等边三角形 ABC，各角的吻接弧使 AP = AR = AB/4
#let fig-P-q10(width: 320 * k) = px-canvas(320, 275, origin: (560, 830), width: width, (p, u) => {
  import cetz.draw: *
  let a = (584, 1082)
  let b = (852, 1082)
  let c = (718, 850)
  poly(p, (a, b, c), close: true)
  let t = 67
  P-corner(p, a, b, c, t)
  P-corner(p, b, c, a, t)
  P-corner(p, c, a, b, t)
  lbl(p, c, $C$, dir: "n", d: 10)
  lbl(p, a, $A$, dir: "w", d: 11)
  lbl(p, b, $B$, dir: "e", d: 11)
  lbl(p, P-go(a, c, t), $P$, dir: "w", d: 10)
  lbl(p, P-go(a, b, t), $R$, dir: "s", d: 10)
})

// 第 12 题：公路方向改变 60° 的吻接弧（示意图）
#let fig-P-q12(width: 480 * k) = px-canvas(480, 160, origin: (100, 160), width: width, (p, u) => {
  import cetz.draw: *
  let o = (330, 301)
  let ca = calc.cos(30deg)
  // 上缘
  seg(p, (115, 175), (565, 175))
  parc(p, o, 126, 90, 30)
  seg(p, P-pt(o, 126, 30), (475, 300))
  // 下缘
  seg(p, (115, 203), (330, 203))
  parc(p, o, 98, 90, 30)
  seg(p, P-pt(o, 98, 30), (451, 314))
  // 60° 角：延长线与路的直线部分的夹角
  let v = (402.6, 175)
  dseg(p, v, P-pt(o, 126, 30))
  anglearc(p, v, (500, 175), (440, 238), 30)
  lbl(p, (422, 187), $60°$, dir: "c", d: 0)
  P-arrow(p, (165, 188), (205, 188))
  P-arrow(p, (433, 255), (447, 280))
})

// 第 13 题：三心曲线 AC = CD = DB = CG = DG；弧 AE、EF、FB 的圆心分别是 C、G、D
#let fig-P-q13(width: 260 * k) = px-canvas(260, 180, origin: (565, 155), width: width, (p, u) => {
  import cetz.draw: *
  let a = (590, 246)
  let c = (660, 246)
  let d = (730, 246)
  let b = (800, 246)
  let g = (695, 246 + 70 * calc.sqrt(3) / 2)
  let e = P-pt(c, 70, 120)
  let f = P-pt(d, 70, 60)
  seg(p, a, b)
  seg(p, g, e)
  seg(p, g, f)
  parc(p, c, 70, 180, 120, st: lb)
  parc(p, g, 140, 120, 60, st: lb)
  parc(p, d, 70, 60, 0, st: lb)
  lbl(p, e, $E$, dir: "nw", d: 10)
  lbl(p, f, $F$, dir: "ne", d: 10)
  lbl(p, a, $A$, dir: "sw", d: 10)
  lbl(p, c, $C$, dir: "s", d: 11)
  lbl(p, d, $D$, dir: "s", d: 11)
  lbl(p, b, $B$, dir: "se", d: 10)
  lbl(p, g, $G$, dir: "s", d: 10)
})

// 第 14 题：铁轨分成两条的曲线 ABC（两段相切的弧）
// 原图的两段弧约各转 60°（正文说“度数都是 45°”），这里按原图形状画。
#let fig-P-q14(width: 340 * k) = px-canvas(340, 125, origin: (120, 660), width: width, (p, u) => {
  import cetz.draw: *
  let r = 85
  let o1 = (218, 680 + r)
  let a = (218, 680)
  let b = P-pt(o1, r, 30)
  let o2 = (2 * b.at(0) - o1.at(0), 2 * b.at(1) - o1.at(1))
  let c = (o2.at(0), o2.at(1) + r)
  seg(p, (130, 680), (428, 680))
  seg(p, c, (448, c.at(1)))
  parc(p, o1, r, 90, 30, st: lb)
  parc(p, o2, r, 210, 270, st: lb)
  dseg(p, a, o1)
  dseg(p, o1, o2)
  dseg(p, o2, c)
  lbl(p, a, $A$, dir: "n", d: 10)
  lbl(p, b, $B$, dir: "e", d: 11)
  lbl(p, c, $C$, dir: "s", d: 11)
})

// 第 15 题：正方形 ABCD 的渐伸线（边长 s，弧 C1、12、23、34、45 的半径依次为 s、2s、…、5s）
#let fig-P-q15(width: 340 * k) = px-canvas(340, 275, origin: (495, 530), width: width, (p, u) => {
  import cetz.draw: *
  let s = 33
  let a = (609, 714)
  let b = (642, 714)
  let c = (642, 681)
  let d = (609, 681)
  seg(p, a, (609 + 5 * s + 33, 714))
  seg(p, (609, 681 + 99), d)
  seg(p, (609 - 99, 681), c)
  seg(p, (642, 681 - 132), (642, 714))
  parc(p, b, s, 90, 0, st: lb)
  parc(p, a, 2 * s, 0, -90, st: lb)
  parc(p, d, 3 * s, -90, -180, st: lb)
  parc(p, c, 4 * s, 180, 90, st: lb)
  parc(p, b, 5 * s, 90, 0, st: lb)
  lbl(p, (642 + s, 714), $1$, dir: "se", d: 9)
  lbl(p, (609, 714 + 2 * s), $2$, dir: "s", d: 9)
  lbl(p, (609 - 3 * s, 681), $3$, dir: "w", d: 9)
  lbl(p, (642, 681 - 4 * s), $4$, dir: "n", d: 9)
  lbl(p, (642 + 5 * s, 714), $5$, dir: "e", d: 9)
  lbl(p, a, $A$, dir: "w", d: 10)
  lbl(p, b, $B$, dir: "s", d: 10)
  lbl(p, c, $C$, dir: "ne", d: 10)
  lbl(p, d, $D$, dir: "nw", d: 10)
})
