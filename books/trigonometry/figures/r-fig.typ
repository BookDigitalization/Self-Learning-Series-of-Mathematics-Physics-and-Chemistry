// 段 r：总复习题（原书 p.304–315）里的无编号插图。页面渲染 dpi：200（页宽约 1270 像素）。
// 第 83（p.311）、102、104（p.313）、107、108（p.314）、114（p.315）题。
#import "/common/geo.typ": *

#let rk = 0.014cm   // 1 像素（200 dpi）≈ 0.0127 cm，放大约 1.1 倍

// 从外点 s 向圆 (o, r) 作切线，side = ±1 取两条中的一条；返回切点
#let r-tangent(s, o, r, side) = {
  let dx = o.at(0) - s.at(0)
  let dy = o.at(1) - s.at(1)
  let d = calc.sqrt(dx * dx + dy * dy)
  let th = calc.atan2(dx, dy) + side * calc.asin(r / d)
  let l = calc.sqrt(d * d - r * r)
  (s.at(0) + l * calc.cos(th), s.at(1) + l * calc.sin(th))
}

// ───────── 第 83 题（p.311）─────────
#let fig-r-83(width: 400 * rk) = px-canvas(400, 200, origin: (645, 1065), width: width, (p, u) => {
  import cetz.draw: *
  let A = (660, 1238)
  let B = (853, 1238)
  let C = (937, 1238)
  let D = (1027, 1238)
  let P = (1027, 1080)
  seg(p, A, D, stroke: lb)
  seg(p, D, P, stroke: lb)
  seg(p, A, P, stroke: lb)
  seg(p, B, P, stroke: lb)
  seg(p, C, P, stroke: lb)
  anglearc(p, A, D, P, 28)
  anglearc(p, B, D, P, 26)
  anglearc(p, C, D, P, 26)
  lbl(p, (708, 1228), $alpha$, dir: "c", d: 0)
  lbl(p, (885, 1220), $2 alpha$, dir: "c", d: 0)
  lbl(p, (970, 1220), $3 alpha$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "s", d: 14)
  lbl(p, B, $B$, dir: "s", d: 14)
  lbl(p, C, $C$, dir: "s", d: 14)
  lbl(p, D, $D$, dir: "s", d: 14)
  lbl(p, P, $P$, dir: "n", d: 10)
})

// ───────── 第 102 题（p.313）─────────
#let fig-r-102(width: 360 * rk) = px-canvas(360, 320, origin: (255, 728), width: width, (p, u) => {
  import cetz.draw: *
  let A = (273, 1012)
  let B = (600, 1012)
  let O = (405, 818)
  let r = 79
  let C = r-tangent(A, O, r, -1)
  let D = r-tangent(A, O, r, 1)
  let F = r-tangent(B, O, r, 1)
  let E = r-tangent(B, O, r, -1)
  circ(p, O, r, stroke: lb)
  seg(p, A, B, stroke: lb)
  seg(p, A, C, stroke: lb)
  seg(p, A, D, stroke: lb)
  seg(p, B, F, stroke: lb)
  seg(p, B, E, stroke: lb)
  dseg(p, A, O)
  dseg(p, B, O)
  dseg(p, O, C)
  dseg(p, O, F)
  ring(p, O, r: 2.5)
  anglearc(p, A, B, D, 30)
  anglearc(p, A, B, C, 44)
  anglearc(p, B, A, E, 30)
  anglearc(p, B, A, F, 44)
  lbl(p, (318, 1003), $alpha$, dir: "c", d: 0)
  lbl(p, (306, 958), $beta$, dir: "c", d: 0)
  lbl(p, (553, 1003), $alpha'$, dir: "c", d: 0)
  lbl(p, (566, 956), $beta'$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "s", d: 14)
  lbl(p, B, $B$, dir: "s", d: 14)
  lbl(p, C, $C$, dir: "w", d: 12)
  lbl(p, F, $F$, dir: "ne", d: 12)
  lbl(p, D, $D$, dir: "e", d: 12)
  lbl(p, E, $E$, dir: "nw", d: 14)
})

// ───────── 第 104 题（p.313）─────────
#let fig-r-104(width: 410 * rk) = px-canvas(410, 340, origin: (655, 693), width: width, (p, u) => {
  import cetz.draw: *
  let A = (672, 808)
  let B = (722, 1012)
  let C = (1055, 1018)
  let D = (857, 707)
  poly(p, (A, B, C, D), close: true, stroke: lb)
  seg(p, A, C, stroke: lb)
  seg(p, B, D, stroke: lb)
  lbl(p, A, $A$, dir: "nw", d: 11)
  lbl(p, B, $B$, dir: "s", d: 13)
  lbl(p, C, $C$, dir: "s", d: 13)
  lbl(p, D, $D$, dir: "n", d: 10)
})

// ───────── 第 107 题（p.314）─────────
#let fig-r-107(width: 400 * rk) = px-canvas(400, 450, origin: (185, 588), width: width, (p, u) => {
  import cetz.draw: *
  let A = (205, 708)
  let B = (552, 603)
  let C = (205, 1020)
  let D = (366, 890)
  let E = (573, 887)
  poly(p, (C, A, B, E, D), close: false, stroke: lb)
  seg(p, A, D, stroke: lb)
  seg(p, C, D, stroke: lb)
  seg(p, D, B, stroke: lb)
  lbl(p, A, $A$, dir: "nw", d: 10)
  lbl(p, B, $B$, dir: "n", d: 11)
  lbl(p, C, $C$, dir: "s", d: 13)
  lbl(p, D, $D$, dir: "s", d: 14)
  lbl(p, E, $E$, dir: "s", d: 13)
})

// ───────── 第 108 题（p.314）─────────
#let fig-r-108(width: 370 * rk) = px-canvas(370, 330, origin: (630, 720), width: width, (p, u) => {
  import cetz.draw: *
  let A = (985, 738)
  let B = (985, 925)
  let C = (853, 967)
  let D = (660, 1028)
  let E = (985, 1033)
  poly(p, (D, E, A), close: true, stroke: lb)
  seg(p, D, B, stroke: lb)
  seg(p, C, A, stroke: lb)
  anglearc(p, D, B, A, 32)
  anglearc(p, C, B, A, 22)
  // 23°45′ 的引线（指向 ∠ADC 的角弧）
  line(p(681, 1000), p(681, 1013), stroke: lt, mark: arw)
  lbl(p, (683, 985), $23°45'$, dir: "c", d: 0)
  lbl(p, (912, 927), $41°19'$, dir: "c", d: 0)
  lbl(p, (930, 960), $40 "m"$, dir: "c", d: 0)
  lbl(p, (788, 1008), $60 "m"$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "e", d: 12)
  lbl(p, C, $C$, dir: "s", d: 14)
  lbl(p, D, $D$, dir: "s", d: 13)
  lbl(p, E, $E$, dir: "s", d: 13)
})

// ───────── 第 114 题（p.315）─────────
#let fig-r-114(width: 500 * rk) = px-canvas(500, 200, origin: (387, 815), width: width, (p, u) => {
  import cetz.draw: *
  let O = (551, 914)
  let r = 88
  let A = (O.at(0) + r * calc.cos(57deg), O.at(1) - r * calc.sin(57deg))
  let P = (810, 914)
  circ(p, O, r, stroke: lb)
  seg(p, (395, 914), (878, 914), stroke: lb)
  seg(p, O, A, stroke: lb)
  seg(p, A, P, stroke: lb)
  ring(p, O, r: 3)
  lbl(p, A, $A$, dir: "ne", d: 11)
  lbl(p, O, $O$, dir: "s", d: 15)
  lbl(p, P, $P$, dir: "s", d: 15)
})
