// 图 2·55（原书 p.131）、2·56（p.131）、2·57（p.132）、2·58（p.133）、2·59、2·60（p.134）、2·61（p.135）；页面 200 dpi 坐标。
#import "H-base.typ": *

// 图 2·55：作一个角等于已知角。左 ∠AOB，右所作 ∠A'O'B'
// 右图 E' 为原图所印字母（正文未提及），照录；弧按作图过程示意
#let fig-H-2-55(width: 620 * k) = px-canvas(620, 270, origin: (170, 250), width: width, (p, u) => {
  import cetz.draw: *
  let O = (200, 452)
  let ang = 41.6
  let D = H-pol(O, 150, ang)
  let C = (350, 452)
  seg(p, O, (445, 452))
  seg(p, O, H-pol(O, 245, ang))
  H-arc(p, O, 150, -4, 52, st: dsh)
  lbl(p, O, $O$, dir: "w", d: 11)
  lbl(p, (445, 452), $A$, dir: "e", d: 10)
  lbl(p, H-pol(O, 245, ang), $B$, dir: "ne", d: 10)
  lbl(p, D, $D$, dir: "n", d: 18)
  lbl(p, C, $C$, dir: "s", d: 15)
  // 右
  let O2 = (530, 452)
  let ang2 = 41.7
  let D2 = H-pol(O2, 157, ang2)
  let C2 = (687, 452)
  seg(p, O2, (780, 452))
  seg(p, O2, H-pol(O2, 255, ang2))
  H-arc(p, O2, 157, -4, 56, st: dsh)
  H-arc(p, C2, 110, 86, 128, st: dsh)
  lbl(p, O2, $O'$, dir: "w", d: 12)
  lbl(p, (780, 452), $A'$, dir: "e", d: 10)
  lbl(p, H-pol(O2, 255, ang2), $B'$, dir: "ne", d: 10)
  lbl(p, D2, $D'$, dir: "n", d: 18)
  lbl(p, C2, $C'$, dir: "s", d: 15)
  lbl(p, H-pol(O2, 157, 56), $E'$, dir: "w", d: 11)
})

// 图 2·56：已知三边 a、b、c 作三角形（CB=a，CA=b，BA=c）
// AB 边旁的字母 原书作 a（扫描确印，形似 α）：按下页作法（以 B 为圆心、c 之长为半径）及线段长度（BA 与已知线段 c 等长）订正为 c
#let fig-H-2-56(width: 660 * k) = px-canvas(660, 190, origin: (200, 1085), width: width, (p, u) => {
  import cetz.draw: *
  pseg(p, (239, 1123), (477, 1123))
  pseg(p, (239, 1151), (402, 1151))
  pseg(p, (239, 1183), (437, 1183))
  content(p(358, 1111), tt($a$))
  content(p(320, 1139), tt($b$))
  content(p(338, 1171), tt($c$))
  let (C, B, A, P) = ((508, 1241), (750, 1241), (602, 1109), (837, 1241))
  poly(p, (A, C, B), close: false)
  seg(p, A, B)
  seg(p, C, P)
  H-arc(p, C, 162, 49, 60, st: dsh)
  H-arc(p, B, 198, 132, 143.5, st: dsh)
  lbl(p, A, $A$, dir: "n", d: 16)
  lbl(p, C, $C$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "s", d: 14)
  lbl(p, P, $P$, dir: "e", d: 10)
  content(p(543, 1173), tt($b$))
  content(p(683, 1166), tt($c$)) // 原书作 a
  content(p(631, 1253), tt($a$))
})

// 图 2·57：已知两边和夹角作三角形。左已知 b、c、∠A，右所作 △ACB
#let fig-H-2-57(width: 560 * k) = px-canvas(560, 270, origin: (250, 770), width: width, (p, u) => {
  import cetz.draw: *
  pseg(p, (291, 785), (508, 785))
  pseg(p, (291, 815), (495, 815))
  content(p(404, 774), tt($b$))
  content(p(389, 805), tt($c$))
  // 已知角 A
  let A0 = (289, 928)
  seg(p, A0, H-pol(A0, 175, 16.7))
  seg(p, A0, H-pol(A0, 185, -27.7))
  H-arc(p, A0, 87, -49, 50, st: dsh)
  lbl(p, A0, $A$, dir: "w", d: 11)
  // 所作三角形
  let (A, C, B2) = ((529, 973), (746, 973), (737, 781))
  let B = (680, 835)
  seg(p, A, C)
  seg(p, A, B2)
  seg(p, B, C)
  H-arc(p, A, 91, -26, 68, st: dsh)
  H-arc(p, (620, 973), 64, 100, 126, st: dsh)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, B, $B$, dir: "nw", d: 11)
  lbl(p, B2, $B'$, dir: "ne", d: 10)
  content(p(655, 987), tt($b$))
  content(p(612, 885), tt($c$))
})

// 图 2·58 例 1：已知斜边 c 和直角边 a，作直角三角形
#let fig-H-2-58(width: 590 * k) = px-canvas(590, 270, origin: (200, 470), width: width, (p, u) => {
  import cetz.draw: *
  pseg(p, (229, 549), (497, 549))
  pseg(p, (229, 580), (448, 580))
  content(p(370, 538), tt($c$))
  content(p(345, 569), tt($a$))
  let (A, B, C) = ((555, 705), (702, 483), (702, 705))
  seg(p, (470, 705), (765, 705))
  seg(p, B, C)
  seg(p, A, B)
  rtmark(p, C, B, A)
  H-arc(p, B, 266, 227, 246, st: dsh)
  lbl(p, B, $B$, dir: "n", d: 12)
  lbl(p, C, $C$, dir: "s", d: 13)
  lbl(p, A, $A$, dir: "s", d: 13)
  lbl(p, (470, 705), $l$, dir: "w", d: 9)
  content(p(612, 590), tt($c$))
  content(p(715, 593), tt($a$))
})

// 图 2·59 例 2：已知顶角 ∠A' 和底边 a 作等腰三角形（左：已知；中：作底角；右：所作 △ABC）
// 中图交于 P 处的两道短弧、右图 B、C 处的弧按作图过程示意
#let fig-H-2-59(width: 730 * k) = px-canvas(730, 250, origin: (130, 155), width: width, (p, u) => {
  import cetz.draw: *
  // 左
  let A1 = (153, 245)
  seg(p, A1, (314, 199))
  seg(p, A1, (298, 337))
  anglearc(p, A1, (314, 199), (298, 337), 24)
  anglearc(p, A1, (314, 199), (298, 337), 30)
  pseg(p, (155, 372), (338, 372))
  content(p(247, 360), tt($a$))
  lbl(p, A1, $A'$, dir: "w", d: 11)
  // 中
  let E = (499, 372)
  let D = H-pol(E, 170, 50.6)
  let P = H-pol(E, 200, 115.3)
  seg(p, (385, 372), (622, 372))
  seg(p, E, D)
  seg(p, E, P)
  H-arc(p, E, 85, 40, 180, st: dsh)
  anglearc(p, E, (622, 372), D, 21)
  anglearc(p, E, (622, 372), D, 26)
  let X = H-pol(E, 156, 115.3)
  line(p(X.at(0) - 24, X.at(1) + 2), p(X.at(0) + 20, X.at(1) - 5), stroke: lt)
  line(p(X.at(0) - 14, X.at(1) + 15), p(X.at(0) + 14, X.at(1) - 16), stroke: lt)
  lbl(p, E, $E$, dir: "s", d: 10)
  lbl(p, (385, 372), $G$, dir: "w", d: 10)
  lbl(p, (622, 372), $F$, dir: "e", d: 8)
  lbl(p, D, $D$, dir: "e", d: 10)
  lbl(p, P, $P$, dir: "nw", d: 8)
  content(p(499, 349), tsm($1$))
  content(p(480, 361), tsm($2$))
  // 右
  let (B, C, A) = ((655, 372), (844, 372), (750, 165))
  poly(p, (B, A, C), close: false)
  seg(p, B, C)
  H-arc(p, B, 86, -8, 70, st: dsh)
  H-arc(p, C, 86, 110, 188, st: dsh)
  H-arc(p, (741, 372), 88, 112, 134, st: lt)
  H-arc(p, (758, 372), 88, 46, 68, st: lt)
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "sw", d: 10)
  lbl(p, C, $C$, dir: "e", d: 10)
  content(p(672, 362), tsm($1$))
  content(p(824, 362), tsm($1$))
})

// 图 2·60 例 3 草图：△A'B'C'，M' 为 A'C' 的中点，阴影为 △B'M'C'（斜纹）
#let fig-H-2-60(width: 330 * k) = px-canvas(330, 330, origin: (540, 885), width: width, (p, u) => {
  import cetz.draw: *
  let (B, A, C) = ((570, 1190), (835, 1190), (748, 903))
  let M = H-at(A, C, 0.5)
  H-hatch(p, (B, M, C), 12, 7)
  poly(p, (B, A, C), close: true)
  seg(p, B, M)
  lbl(p, C, $C'$, dir: "n", d: 11)
  lbl(p, B, $B'$, dir: "w", d: 11)
  lbl(p, A, $A'$, dir: "e", d: 11)
  lbl(p, M, $M'$, dir: "e", d: 11)
  content(p(643, 1048), tt($a$))
  content(p(793, 995), tt($b / 2$))
  content(p(716, 1120), tt($m_b$))
})

// 图 2·61 例 3：已知 a、b、m_b，作 △BMC，延长 CM 至 A，使 MA=CM
// C 处的交叉短弧按作图过程示意（原图是一个星形的叉）
#let fig-H-2-61(width: 630 * k) = px-canvas(630, 340, origin: (170, 610), width: width, (p, u) => {
  import cetz.draw: *
  pseg(p, (187, 716), (522, 716))
  pseg(p, (187, 746), (473, 746))
  pseg(p, (187, 775), (447, 775))
  content(p(355, 706), tt($a$))
  content(p(330, 736), tt($b$))
  content(p(312, 765), tt($m_b$))
  let (C, B, A) = ((702, 640), (527, 912), (790, 912))
  let M = H-at(C, A, 0.5)
  poly(p, (B, A, C), close: true)
  seg(p, B, M)
  H-arc(p, B, 323, 52, 62, st: lt)
  H-arc(p, M, 143, 97, 119, st: lt)
  lbl(p, C, $C$, dir: "n", d: 13)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, A, $A$, dir: "e", d: 11)
  lbl(p, M, $M$, dir: "e", d: 11)
  content(p(606, 764), tt($a$))
  content(p(672, 850), tt($m_b$))
  content(p(740, 700), tt($b / 2$))
})
