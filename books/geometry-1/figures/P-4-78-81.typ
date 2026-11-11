// 图 4·78（原书 p.282）、图 4·79（p.283）、图 4·80（p.284）、图 4·81（p.285）；页面 200 dpi 坐标。
#import "P-base.typ": *

// 图 4·78 在已知线段 a 上作含有已知圆周角 e 的弧
#let fig-P-4-78(width: 610 * k) = px-canvas(610, 320, origin: (225, 255), width: width, (p, u) => {
  import cetz.draw: *
  // 已知线段 a 和角 e
  pseg(p, (244, 353), (444, 353))
  lbl(p, (340, 342), $a$, dir: "c", d: 0)
  P-angle(p, (239, 516), (424, 516), (320, 382), 42, $e$, (292, 488))
  // 作图
  let o = (700, 391)
  let r = 118
  let hw = calc.sqrt(r * r - 58 * 58)
  let a = (700 - hw, 449)
  let b = (700 + hw, 449)
  let c = P-pt(o, r, 64.5)
  let aa = P-ang(o, a) + 360
  parc(p, o, r, aa, -29.5, st: lb)
  parc(p, o, r, aa, 330.5, st: dsh)
  seg(p, a, b)
  seg(p, a, c)
  seg(p, c, b)
  dseg(p, (700, 283), (700, 535))
  let t = (o.at(0) + 0.7 * (o.at(0) - b.at(0)), o.at(1) + 0.7 * (o.at(1) - b.at(1)))
  dseg(p, b, t)
  let d = (b.at(0) - 0.53 * 122, b.at(1) + 0.85 * 122)
  line(p(..b), p(..d), stroke: lb)
  anglearc(p, b, a, d, 38)
  anglearc(p, c, a, b, 16)
  P-cen(p, o, r: 2.5)
  lbl(p, (742, 317), $e$, dir: "c", d: 0)
  lbl(p, (589, 453), $A$, dir: "c", d: 0)
  lbl(p, (810, 452), $B$, dir: "c", d: 0)
  lbl(p, c, $C$, dir: "ne", d: 9)
  lbl(p, (702, 289), $N$, dir: "c", d: 0)
  lbl(p, (630, 346), $T$, dir: "c", d: 0)
  lbl(p, (716, 383), $O$, dir: "c", d: 0)
  lbl(p, (676, 458), $a$, dir: "c", d: 0)
  lbl(p, (711, 462), $M$, dir: "c", d: 0)
  lbl(p, d, $D$, dir: "sw", d: 10)
})

// 图 4·79 基本轨迹定理：以 AB 为弦并含有圆周角 1 的两个弧
#let fig-P-4-79(width: 290 * k) = px-canvas(290, 490, origin: (550, 700), width: width, (p, u) => {
  import cetz.draw: *
  let a = (592, 963)
  let b = (793, 963)
  let r = 122
  let d = calc.sqrt(r * r - 100.5 * 100.5)
  let o1 = (692.5, 963 - d)
  let o2 = (692.5, 963 + d)
  P-c(p, o1, r, st: lb)
  P-c(p, o2, r, st: lb)
  line(p(..a), p(..b), stroke: lb)
  let pp = P-pt(o1, r, 63.6)
  let p1 = P-pt(o1, r, 106.7)
  let t = (963 - 828) / (963 - p1.at(1))
  let q2 = (a.at(0) + t * (p1.at(0) - a.at(0)), 828)
  let tq = (777 - 731) / (963 - p1.at(1))
  let q = (p1.at(0) - tq * (b.at(0) - p1.at(0)) , 731)
  seg(p, a, pp)
  seg(p, pp, b)
  dseg(p, a, q)
  dseg(p, a, p1)
  dseg(p, b, q)
  dseg(p, b, q2)
  anglearc(p, pp, a, b, 36)
  anglearc(p, p1, a, b, 28)
  lbl(p, (739, 811), $1$, dir: "c", d: 0)
  lbl(p, a, $A$, dir: "w", d: 11)
  lbl(p, b, $B$, dir: "e", d: 11)
  lbl(p, pp, $P$, dir: "ne", d: 10)
  lbl(p, (669, 762), $P'$, dir: "c", d: 0)
  lbl(p, q, $Q$, dir: "n", d: 9)
  lbl(p, q2, $Q'$, dir: "w", d: 11)
  lbl(p, (697, 1164), $K$, dir: "c", d: 0)
})

// 图 4·80 例 1：已知 a、h_a 和 ∠A，作三角形
#let fig-P-4-80(width: 680 * k) = px-canvas(680, 285, origin: (170, 990), width: width, (p, u) => {
  import cetz.draw: *
  // 已知条件
  pseg(p, (198, 1015), (468, 1015))
  lbl(p, (330, 1004), $a$, dir: "c", d: 0)
  pseg(p, (195, 1048), (372, 1048))
  lbl(p, (275, 1037), $h_a$, dir: "c", d: 0)
  P-angle(p, (190, 1236), (405, 1236), (270, 1075), 28, $A$, (182, 1247))
  // 作图
  let b = (532, 1226)
  let c = (797, 1226)
  let r = 148
  let dd = calc.sqrt(r * r - 132.5 * 132.5)
  let o = (664.5, 1226 - dd)
  let ab = P-ang(o, b) + 360
  parc(p, o, r, ab, P-ang(o, c), st: lb)
  let (a2, a1) = P-lc((0, 1049), (1, 1049), o, r)
  dseg(p, (507, 1049), (838, 1049))
  seg(p, b, c)
  seg(p, a2, b)
  seg(p, a2, c)
  seg(p, a1, b)
  seg(p, a1, c)
  seg(p, a1, (a1.at(0), 1226))
  seg(p, (627, 1049), (627, 1226))
  lbl(p, a1, $A$, dir: "ne", d: 10)
  lbl(p, a2, $A'$, dir: "nw", d: 11)
  lbl(p, b, $B$, dir: "sw", d: 10)
  lbl(p, c, $C$, dir: "se", d: 10)
  lbl(p, (a1.at(0), 1226), $D$, dir: "s", d: 10)
  lbl(p, (627, 1226), $Q$, dir: "s", d: 10)
  lbl(p, (629, 1038), $P$, dir: "c", d: 0)
  lbl(p, (613, 1135), $h_a$, dir: "c", d: 0)
  lbl(p, (660, 1216), $a$, dir: "c", d: 0)
})

// 图 4·81 例 2：已知 a、h_b 和 ∠A，作三角形
// 原图 E 处的“d”照录（正文“∠BEC = d”），应指直角。
#let fig-P-4-81(width: 660 * k) = px-canvas(660, 260, origin: (190, 930), width: width, (p, u) => {
  import cetz.draw: *
  pseg(p, (220, 940), (493, 940))
  lbl(p, (348, 929), $a$, dir: "c", d: 0)
  pseg(p, (220, 975), (388, 975))
  lbl(p, (295, 963), $h_b$, dir: "c", d: 0)
  P-angle(p, (218, 1135), (377, 1135), (258, 1010), 28, $A$, (206, 1145))
  anglearc(p, (218, 1135), (377, 1135), (258, 1010), 33)
  // 作图
  let b = (540, 1134)
  let c = (812, 1134)
  let mb = (676, 1134)
  let hb = 168
  let r = 272 / (2 * calc.sin(72.3deg))
  let dd = calc.sqrt(r * r - 136 * 136)
  let o = (676, 1134 - dd)
  let ab = P-ang(o, b) + 360
  parc(p, o, r, ab, P-ang(o, c), st: lb)
  parc(p, mb, 136, 180, 0)
  let xx = hb * hb / (2 * 136)
  let e = (540 + xx, 1134 - calc.sqrt(hb * hb - xx * xx))
  let (i1, i2) = P-lc(c, e, o, r)
  let dist(s, t) = calc.sqrt(calc.pow(s.at(0) - t.at(0), 2) + calc.pow(s.at(1) - t.at(1), 2))
  let a = if dist(i1, c) > dist(i2, c) { i1 } else { i2 }
  seg(p, b, c)
  seg(p, a, b)
  seg(p, a, c)
  seg(p, b, e)
  anglearc(p, e, b, c, 36)
  lbl(p, (e.at(0) + 14, e.at(1) + 30), $d$, dir: "c", d: 0)
  lbl(p, a, $A$, dir: "nw", d: 10)
  lbl(p, e, $E$, dir: "ne", d: 10)
  lbl(p, b, $B$, dir: "sw", d: 10)
  lbl(p, c, $C$, dir: "se", d: 10)
  lbl(p, (680, 1124), $a$, dir: "c", d: 0)
  lbl(p, (619, 1074), $h_b$, dir: "c", d: 0)
})
