// 习题 5·2 的插图：第 2、3 题（原书 p.277）、第 8、9、10、11 题（p.278）；页面 120 dpi 坐标。
#import "O-base.typ": *

// 第 2 题：两圆内切于 A，大圆半径 OC 交小圆于 B
#let fig-O-q2(width: 215 * k) = px-canvas(215, 225, origin: (205, 325), width: width, (p, u) => {
  import cetz.draw: *
  let O = (316, 432)
  let A = (316, 527)
  let O1 = (316, 479.5)
  let dir = (-calc.sin(40deg), calc.cos(40deg))
  let C = (O.at(0) + 95 * dir.at(0), O.at(1) + 95 * dir.at(1))
  let B = (O.at(0) + 72.8 * dir.at(0), O.at(1) + 72.8 * dir.at(1))
  O-circ(p, O, 95, st: lb)
  O-circ(p, O1, 47.5, st: lb)
  O-ln(p, O, A, st: lb)
  O-ln(p, O, C, st: lb)
  ring(p, O, r: 3)
  ring(p, O1, r: 3)
  lbl(p, O, $O$, dir: "n", d: 12)
  lbl(p, B, $B$, dir: "e", d: 13)
  lbl(p, C, $C$, dir: "sw", d: 11)
  lbl(p, A, $A$, dir: "s", d: 12)
})

// 第 3 题：传动装置，小圆盘上接触部分所对圆心角 135°
#let fig-O-q3(width: 380 * k) = px-canvas(380, 250, origin: (460, 318), width: width, (p, u) => {
  import cetz.draw: *
  let r = 42
  let R = 116.6
  let O = (511, 442)
  let O1 = (706, 442)
  let A = O-pt(O, r, 112.5)
  let A2 = O-pt(O, r, 247.5)
  let B = O-pt(O1, R, 112.5)
  let B2 = O-pt(O1, R, 247.5)
  O-arc(p, O, r, 112.5, 247.5, st: lb)
  O-arc(p, O, r, -112.5, 112.5)
  O-arc(p, O1, R, -112.5, 112.5, st: lb)
  O-arc(p, O1, R, 112.5, 247.5)
  O-ln(p, A, B, st: lb)
  O-ln(p, A2, B2, st: lb)
  O-ln(p, O, A, st: lb)
  O-ln(p, O, A2, st: lb)
  O-ln(p, O1, B, st: lb)
  O-ln(p, O1, B2, st: lb)
  O-ln(p, O, O1)
  ring(p, O, r: 3)
  ring(p, O1, r: 3)
  lbl(p, (506, 421), $R$, dir: "c", d: 0)
  content(p(490, 449), angle: 90deg, tt($135°$))
  lbl(p, (518, 456), $O$, dir: "c", d: 0)
  lbl(p, (729, 447), $O_1$, dir: "c", d: 0)
})

// 第 8 题：扇形，弧长 150 cm，半径 86.0 cm，圆心角 α
#let fig-O-q8(width: 265 * k) = px-canvas(265, 205, origin: (170, 175), width: width, (p, u) => {
  import cetz.draw: *
  let O = (309, 349)
  let R = 137
  let A = O-pt(O, R, 140.5)
  let B = O-pt(O, R, 39.5)
  O-arc(p, O, R, 39.5, 140.5, st: lb)
  O-ln(p, O, A, st: lb)
  O-ln(p, O, B, st: lb)
  // 弧长尺寸线（半径 151），中间断开放文字
  let mk = (fill: black, scale: 0.45)
  O-arc(p, O, 151, 39.5, 77, st: lt, mark: (start: "stealth", ..mk))
  O-arc(p, O, 151, 103, 140.5, st: lt, mark: (end: "stealth", ..mk))
  for a in (39.5, 140.5) {
    O-ln(p, O-pt(O, 143, a), O-pt(O, 159, a), st: lt)
  }
  lbl(p, (309, 198), $150 "cm"$, dir: "c", d: 0)
  // 半径尺寸线（沿 OB 外侧）
  let n = (0.636, 0.771)
  let S = (O.at(0) + 13 * n.at(0), O.at(1) + 13 * n.at(1))
  let T = (B.at(0) + 13 * n.at(0), B.at(1) + 13 * n.at(1))
  let M = ((S.at(0) + T.at(0)) / 2, (S.at(1) + T.at(1)) / 2)
  let ud = (0.771, -0.636)
  O-ln(p, S, (M.at(0) - 24 * ud.at(0), M.at(1) - 24 * ud.at(1)), st: lt, mark: (start: "stealth", ..mk))
  O-ln(p, (M.at(0) + 24 * ud.at(0), M.at(1) + 24 * ud.at(1)), T, st: lt, mark: (end: "stealth", ..mk))
  for e in (S, T) {
    O-ln(p, (e.at(0) - 6 * n.at(0), e.at(1) - 6 * n.at(1)), (e.at(0) + 6 * n.at(0), e.at(1) + 6 * n.at(1)), st: lt)
  }
  content(p(M.at(0), M.at(1)), angle: 39.5deg, tt($86.0 "cm"$))
  anglearc(p, O, A, B, 22)
  lbl(p, (309, 329), $α$, dir: "c", d: 0)
})

// 第 9 题：皮带附着滑轮的弧 AB
#let fig-O-q9(width: 300 * k) = px-canvas(300, 185, origin: (540, 190), width: width, (p, u) => {
  import cetz.draw: *
  let O = (687, 277)
  let r = 76
  let A = O-pt(O, r, 143.5)
  let B = O-pt(O, r, 36.5)
  let ln = 131.8
  let E1 = (A.at(0) - 0.595 * ln, A.at(1) + 0.804 * ln)
  let E2 = (B.at(0) + 0.595 * ln, B.at(1) + 0.804 * ln)
  O-arc(p, O, r, 143.5, 396.5)
  O-arc(p, O, r, 36.5, 143.5, st: lb)
  O-ln(p, E1, A, st: lb)
  O-ln(p, B, E2, st: lb)
  pdot(p, E1, r: 3)
  pdot(p, E2, r: 3)
  dseg(p, O, A)
  dseg(p, O, B)
  ring(p, O, r: 3)
  lbl(p, A, $A$, dir: "nw", d: 13)
  lbl(p, B, $B$, dir: "ne", d: 13)
  lbl(p, O, $O$, dir: "s", d: 14)
})

// 第 10 题：正三角形 AOB，高 OD 延长交圆于 E
#let fig-O-q10(width: 205 * k) = px-canvas(205, 225, origin: (205, 645), width: width, (p, u) => {
  import cetz.draw: *
  let O = (308, 751)
  let r = 95.5
  let A = O-pt(O, r, 240)
  let B = O-pt(O, r, 300)
  let D = (308, A.at(1))
  let E = (308, 751 + r)
  O-circ(p, O, r, st: lb)
  O-ln(p, O, A, st: lb)
  O-ln(p, O, B, st: lb)
  O-ln(p, A, B, st: lb)
  O-ln(p, O, E, st: lb)
  ring(p, O, r: 3)
  lbl(p, O, $O$, dir: "n", d: 12)
  lbl(p, D, $D$, dir: "ne", d: 12)
  lbl(p, A, $A$, dir: "sw", d: 14)
  lbl(p, B, $B$, dir: "se", d: 12)
  lbl(p, E, $E$, dir: "s", d: 12)
})

// 第 11 题：∠AOB = 120°，圆 O' 与两半径及弧 ACB 相切（按题设 120° 画）
#let fig-O-q11(width: 310 * k) = px-canvas(310, 205, origin: (540, 660), width: width, (p, u) => {
  import cetz.draw: *
  let O = (697, 833)
  let rs = 157
  let A = O-pt(O, rs, 150)
  let B = O-pt(O, rs, 30)
  let C = (697, 833 - rs)
  let x = rs / (1 + 1 / calc.sin(60deg))
  let O2 = (697, 833 - (rs - x))
  let F = O-pt(O, 42.07, 150)
  O-arc(p, O, rs, 30, 150, st: lb)
  O-ln(p, O, A, st: lb)
  O-ln(p, O, B, st: lb)
  O-ln(p, O, C, st: lb)
  O-ln(p, O2, F, st: lb)
  O-circ(p, O2, x, st: lb)
  rtmark(p, F, O2, O, s: 7)
  ring(p, O, r: 3)
  ring(p, O2, r: 3)
  // 尺寸线 r（沿 OA 外侧）
  let mk = (fill: black, scale: 0.45)
  let n = (-0.5, 0.866)
  let S = (O.at(0) + 14 * n.at(0), O.at(1) + 14 * n.at(1))
  let T = (A.at(0) + 14 * n.at(0), A.at(1) + 14 * n.at(1))
  let M = ((S.at(0) + T.at(0)) / 2, (S.at(1) + T.at(1)) / 2)
  let ud = (-0.866, -0.5)
  O-ln(p, S, (M.at(0) - 9 * ud.at(0), M.at(1) - 9 * ud.at(1)), st: lt, mark: (start: "stealth", ..mk))
  O-ln(p, (M.at(0) + 9 * ud.at(0), M.at(1) + 9 * ud.at(1)), T, st: lt, mark: (end: "stealth", ..mk))
  for e in (S, T) {
    O-ln(p, (e.at(0) - 6 * n.at(0), e.at(1) - 6 * n.at(1)), (e.at(0) + 6 * n.at(0), e.at(1) + 6 * n.at(1)), st: lt)
  }
  lbl(p, (M.at(0) - 4, M.at(1) + 1), $r$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, O, $O$, dir: "s", d: 13)
  lbl(p, O2, $O'$, dir: "e", d: 12)
  lbl(p, (706, 712), $x$, dir: "c", d: 0)
  lbl(p, (672, 765), $x$, dir: "c", d: 0)
})
