// 图 2·72–2·78（原书 p.150–154）；页面 200 dpi 坐标。
#import "I-base.typ": *

// 图 2·72：角 AOB 的平分线 OC 上的点 P，PE ⊥ OA，PF ⊥ OB。(1) 左，(2) 右（原图 OA、OB 描得较粗）
#let I-f72(O, op, l, th, thick: false, width: 305 * k) = px-canvas(305, 225, origin: (O.at(0) - 17, 215), width: width, (p, u) => {
  import cetz.draw: *
  let c = calc.cos(th)
  let s = calc.sin(th)
  let B = (O.at(0) + l * c, O.at(1) - l * s)
  let A = (O.at(0) + l * c, O.at(1) + l * s)
  let C = (O.at(0) + l + 10, O.at(1))
  let P = (O.at(0) + op, O.at(1))
  let F = I-foot(P, O, B)
  let E = I-foot(P, O, A)
  let st = if thick { lb } else { lw }
  line(p(..O), p(..B), stroke: st)
  line(p(..O), p(..A), stroke: st)
  seg(p, O, C)
  seg(p, P, F)
  seg(p, P, E)
  rtmark(p, F, O, P, s: 7)
  rtmark(p, E, O, P, s: 7)
  lbl(p, O, $O$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, A, $A$, dir: "e", d: 11)
  lbl(p, C, $C$, dir: "e", d: 10)
  lbl(p, P, $P$, dir: "ne", d: 11)
  lbl(p, F, $F$, dir: "nw", d: 10)
  lbl(p, E, $E$, dir: "sw", d: 10)
})
#let fig-I-2-72a(width: 305 * k) = I-f72((187, 322), 213, 250, 20deg, width: width)
#let fig-I-2-72b(width: 310 * k) = I-f72((515, 322), 227, 255, 20deg, thick: true, width: width)

// 图 2·73：过 P 垂直于 OC 的直线与 OA、OB 交于 E、F
#let fig-I-2-73(width: 345 * k) = px-canvas(345, 255, origin: (525, 985), width: width, (p, u) => {
  import cetz.draw: *
  let O = (545, 1115)
  let th = 21deg
  let l = 300
  let B = (O.at(0) + l * calc.cos(th), O.at(1) - l * calc.sin(th))
  let A = (O.at(0) + l * calc.cos(th), O.at(1) + l * calc.sin(th))
  let C = (850, 1115)
  let P = (790, 1115)
  let F = (790, O.at(1) - 245 * calc.tan(th))
  let E = (790, O.at(1) + 245 * calc.tan(th))
  line(p(..O), p(..B), stroke: lb)
  line(p(..O), p(..A), stroke: lb)
  seg(p, O, C)
  seg(p, F, E)
  rtmark(p, P, O, F, s: 8)
  lbl(p, O, $O$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, A, $A$, dir: "e", d: 11)
  lbl(p, C, $C$, dir: "e", d: 10)
  lbl(p, P, $P$, dir: "ne", d: 11)
  lbl(p, F, $F$, dir: "nw", d: 10)
  lbl(p, E, $E$, dir: "s", d: 10)
})

// 图 2·74：O 是 ∠A、∠B 的平分线的交点（三角形的内心）
#let fig-I-2-74(width: 400 * k) = px-canvas(400, 265, origin: (460, 430), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((481, 661), (832, 661), (708, 455))
  let a = I-len(I-sub(B, C))
  let b = I-len(I-sub(C, A))
  let c = I-len(I-sub(A, B))
  let O = I-mul(I-add(I-add(I-mul(A, a), I-mul(B, b)), I-mul(C, c)), 1 / (a + b + c))
  let D = I-foot(O, B, C)
  let E = I-foot(O, A, C)
  let F = I-foot(O, A, B)
  poly(p, (A, B, C), close: true)
  seg(p, A, O)
  seg(p, B, O)
  dseg(p, O, D)
  dseg(p, O, E)
  dseg(p, O, F)
  anglearc(p, A, B, O, 38)
  anglearc(p, B, A, O, 30)
  anglearc(p, B, A, O, 36)
  rtmark(p, D, O, B, s: 7)
  rtmark(p, E, O, A, s: 7)
  rtmark(p, F, O, A, s: 7)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, D, $D$, dir: "ne", d: 9)
  lbl(p, E, $E$, dir: "nw", d: 9)
  lbl(p, F, $F$, dir: "s", d: 11)
  lbl(p, O, $O$, dir: "n", d: 11)
})

// 图 2·75：直线 l 上求一点，使与 AB、CD 距离相等
#let fig-I-2-75(width: 460 * k) = px-canvas(460, 370, origin: (410, 885), width: width, (p, u) => {
  import cetz.draw: *
  let O = (506, 1177)
  seg(p, (506, 892), (506, 1245), stroke: lt)
  seg(p, (427, 1177), (857, 1177), stroke: lt)
  line(p(440, 905), p(847, 1227), stroke: lb)
  let A = (428, 1221)
  let B = (586, 1132)
  let C = (430, 1135)
  let D = (590, 1224)
  line(p(..A), p(..B), stroke: lb)
  line(p(..C), p(..D), stroke: lb)
  anglearc(p, O, B, C, 55)
  anglearc(p, O, D, B, 55)
  // 作图用的交弧记号
  line(p(489, 1100), p(527, 1071), stroke: lt)
  line(p(491, 1076), p(521, 1089), stroke: lt)
  line(p(612, 1200), p(641, 1163), stroke: lt)
  line(p(617, 1160), p(636, 1197), stroke: lt)
  lbl(p, (440, 905), $l$, dir: "nw", d: 8)
  lbl(p, (506, 957), $P$, dir: "ne", d: 11)
  lbl(p, (784, 1177), $Q$, dir: "ne", d: 11)
  lbl(p, (525, 1198), $O$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "sw", d: 6)
  lbl(p, B, $B$, dir: "ne", d: 6)
  lbl(p, C, $C$, dir: "nw", d: 6)
  lbl(p, D, $D$, dir: "se", d: 6)
})

// 图 2·76：圆 O，半径 R；A 在圆内，B 在圆外，P、P' 在圆上
#let fig-I-2-76(width: 320 * k) = px-canvas(320, 315, origin: (560, 940), width: width, (p, u) => {
  import cetz.draw: *
  let O = (708, 1098)
  let r = 140
  let P = (848, 1098)
  let P2 = (672, 962)
  let A = (790, 1098)
  let B = (848, 1212)
  circ(p, O, r)
  seg(p, O, P)
  seg(p, O, P2)
  seg(p, O, B)
  ring(p, A, r: 2.6)
  ring(p, B, r: 2.6)
  lbl(p, O, $O$, dir: "sw", d: 10)
  lbl(p, P, $P$, dir: "e", d: 11)
  lbl(p, P2, $P'$, dir: "n", d: 11)
  lbl(p, A, $A$, dir: "n", d: 12)
  lbl(p, B, $B$, dir: "e", d: 12)
  lbl(p, (702, 1025), $R$, dir: "c", d: 0)
})

// 图 2·77：以 O 为圆心、2.5 厘米为半径画圆，与直线 MN 相交于 P1、P2；O 到 MN 的距离 2.2 厘米
#let fig-I-2-77(width: 445 * k) = px-canvas(445, 225, origin: (300, 160), width: width, (p, u) => {
  import cetz.draw: *
  let O = (527, 350)
  let r = 170
  let dd = 150
  let h = calc.sqrt(r * r - dd * dd)
  let P1 = (527 - h, 350 - dd)
  let P2 = (527 + h, 350 - dd)
  let F = (527, 350 - dd)
  arc(p(..O), start: -3deg, stop: 183deg, radius: r, anchor: "origin", stroke: lw)
  seg(p, (318, 350 - dd), (730, 350 - dd))
  seg(p, O, P1)
  seg(p, O, F)
  rtmark(p, F, O, P2, s: 9)
  content(p(472, 280), angle: -62deg, tsm[2.5 cm])
  content(p(546, 275), angle: -90deg, tsm[2.2 cm])
  lbl(p, (318, 350 - dd), $M$, dir: "w", d: 11)
  lbl(p, (730, 350 - dd), $N$, dir: "e", d: 11)
  lbl(p, P1, $P_1$, dir: "nw", d: 15)
  lbl(p, P2, $P_2$, dir: "ne", d: 15)
  lbl(p, O, $O$, dir: "s", d: 11)
})

// 图 2·78：具有公共底边 BC 的一群等腰三角形，顶点 A1、A2、A3 都在 BC 的垂直平分线 PQ 上
#let fig-I-2-78(width: 345 * k) = px-canvas(345, 595, origin: (545, 490), width: width, (p, u) => {
  import cetz.draw: *
  let (B, C, M) = ((578, 738), (860, 738), (719, 738))
  let (A1, A2, A3) = ((719, 568), (719, 640), (719, 1015))
  seg(p, (719, 520), (719, 1050))
  seg(p, B, C)
  poly(p, (B, A1, C))
  poly(p, (B, A2, C))
  poly(p, (B, A3, C))
  lbl(p, (719, 520), $P$, dir: "n", d: 11)
  lbl(p, (719, 1050), $Q$, dir: "s", d: 11)
  lbl(p, A1, $A_1$, dir: "ne", d: 12)
  lbl(p, A2, $A_2$, dir: "ne", d: 12)
  lbl(p, A3, $A_3$, dir: "se", d: 12)
  lbl(p, M, $M$, dir: "ne", d: 12)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
})
