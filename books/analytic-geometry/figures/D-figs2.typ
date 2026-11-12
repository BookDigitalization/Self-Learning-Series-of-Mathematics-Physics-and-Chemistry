// 图 1·51–1·56、列表用的交叉箭头表（p.63–65）、复习题一第 14 题图（p.70），页面渲染 200 dpi（页宽 1024 像素），k = 0.0152 cm/像素。
// 图 1·51：原图手绘且略有倾斜（水平虚线 P1Q2 和 x 轴都稍斜），按水平铅直重建；
//   θ1 的标注位置在原图里挤在 P1P2 与 P3M3 的交叉处，按“θ1 是 P1Q2 与 P1P2 的夹角”画弧放在那里。
#import "D-base.typ": *

// 图 1·51（p.59）
#let fig-D-1-51(width: 340 * k) = px-canvas(340, 330, origin: (560, 880), width: width, (p, u) => {
  import cetz.draw: *
  let (P1, P2, P3) = ((649, 1082), (792, 1059), (738, 946))
  let Q3 = (738, 1085)
  let Q2 = (792, 1085)
  seg(p, (560, 1141), (873, 1141), mark: arw)
  seg(p, (596, 1193), (596, 905), mark: arw)
  poly(p, (P1, P2, P3), close: true)
  dseg(p, P1, Q2)
  dseg(p, P2, (792, 1141))
  dseg(p, P3, (738, 1141))
  dseg(p, P1, (649, 1141))
  pdot(p, P1)
  pdot(p, P2)
  pdot(p, P3)
  anglearc(p, P1, P3, P2, 42)
  anglearc(p, P1, Q3, P3, 28)
  anglearc(p, P1, Q3, P2, 80)
  lbl(p, (780, 931), $P_3(x_3, y_3)$, dir: "c", d: 0)
  lbl(p, (843, 1064), $P_2(x_2, y_2)$, dir: "c", d: 0)
  lbl(p, (685, 1104), $P_1(x_1, y_1)$, dir: "c", d: 0)
  lbl(p, (684, 1004), $ρ_2$, dir: "c", d: 0)
  lbl(p, (752, 1055), $ρ_1$, dir: "c", d: 0)
  lbl(p, (686, 1056), $θ$, dir: "c", d: 0)
  lbl(p, (665, 1068), $θ_2$, dir: "c", d: 0)
  lbl(p, (729, 1072), $θ_1$, dir: "c", d: 0)
  lbl(p, (749, 1099), $Q_3$, dir: "c", d: 0)
  lbl(p, (804, 1091), $Q_2$, dir: "c", d: 0)
  lbl(p, (649, 1153), $M_1$, dir: "c", d: 0)
  lbl(p, (738, 1154), $M_3$, dir: "c", d: 0)
  lbl(p, (792, 1155), $M_2$, dir: "c", d: 0)
  lbl(p, (583, 1148), $O$, dir: "c", d: 0)
  lbl(p, (889, 1151), $x$, dir: "c", d: 0)
  lbl(p, (602, 896), $y$, dir: "c", d: 0)
})

// 图 1·52（p.61）：A(-5, -1)，B(1, -6)，C(2, 3)；单位长约 28 像素，原点 (713.5, 634)
#let fig-D-1-52(width: 380 * k) = px-canvas(380, 410, origin: (545, 440), width: width, (p, u) => {
  import cetz.draw: *
  let u1 = 28
  let q = (x, y) => (713.5 + u1 * x, 634 - u1 * y)
  let (A, B, C) = (q(-5, -1), q(1, -6), q(2, 3))
  seg(p, (546, 634), (870, 634), mark: arw)
  seg(p, (713.5, 832), (713.5, 470), mark: arw)
  for i in range(-5, 3) {
    if i != 0 { seg(p, (713.5 + u1 * i, 630), (713.5 + u1 * i, 638), stroke: lt) }
  }
  for j in range(-6, 3) {
    if j != 0 { seg(p, (709.5, 634 - u1 * j), (717.5, 634 - u1 * j), stroke: lt) }
  }
  // 单位正方形（阴影线）
  rect(p(..q(0, 1)), p(..q(1, 0)), stroke: lt)
  for t in range(1, 7) {
    let s = t * u1 / 7
    line(p(713.5, 634 - s), p(713.5 + s, 634), stroke: 0.4pt)
    line(p(713.5 + s, 634 - u1), p(713.5 + u1, 634 - u1 + s), stroke: 0.4pt)
  }
  poly(p, (A, B, C), close: true)
  pdot(p, A)
  pdot(p, B)
  pdot(p, C)
  lbl(p, (790, 535), $C(2, 3)$, dir: "c", d: 0)
  lbl(p, (642, 663), $A(-5, -1)$, dir: "c", d: 0)
  lbl(p, (797, 803), $B(1, -6)$, dir: "c", d: 0)
  lbl(p, (702, 645), $O$, dir: "c", d: 0)
  lbl(p, (743, 647), $1$, dir: "c", d: 0)
  lbl(p, (704, 607), $1$, dir: "c", d: 0)
  lbl(p, (884, 631), $x$, dir: "c", d: 0)
  lbl(p, (716, 455), $y$, dir: "c", d: 0)
})

// 图 1·53 (a)、(b)（p.62）：P1P2 为底，P3 在上；边上箭头标顶点顺序（(a) 反时针 P1→P2→P3，(b) 顺时针 P1→P3→P2）
#let fig-D-1-53a(width: 270 * k) = px-canvas(270, 235, origin: (190, 755), width: width, (p, u) => {
  import cetz.draw: *
  let (P1, P2, P3) = ((216, 947), (443, 947), (357, 779))
  seg(p, P1, P2, mark: arw)
  seg(p, P2, P3, mark: arw)
  seg(p, P3, P1, mark: arw)
  anglearc(p, P1, P2, P3, 26)
  pdot(p, P1, r: 2.5)
  pdot(p, P2, r: 2.5)
  pdot(p, P3, r: 2.5)
  lbl(p, (254, 934), $α$, dir: "c", d: 0)
  lbl(p, (330, 903), $(+)$, dir: "c", d: 0)
  lbl(p, (219, 962), $P_1$, dir: "c", d: 0)
  lbl(p, (446, 962), $P_2$, dir: "c", d: 0)
  lbl(p, (359, 764), $P_3$, dir: "c", d: 0)
})
#let fig-D-1-53b(width: 270 * k) = px-canvas(270, 235, origin: (530, 755), width: width, (p, u) => {
  import cetz.draw: *
  let (P1, P2, P3) = ((553, 944), (774, 944), (693, 779))
  seg(p, P1, P3, mark: arw)
  seg(p, P3, P2, mark: arw)
  seg(p, P2, P1, mark: arw)
  anglearc(p, P1, P2, P3, 28)
  pdot(p, P1, r: 2.5)
  pdot(p, P2, r: 2.5)
  pdot(p, P3, r: 2.5)
  lbl(p, (587, 927), $α$, dir: "c", d: 0)
  lbl(p, (666, 900), $(-)$, dir: "c", d: 0)
  lbl(p, (556, 958), $P_1$, dir: "c", d: 0)
  lbl(p, (776, 959), $P_2$, dir: "c", d: 0)
  lbl(p, (694, 764), $P_3$, dir: "c", d: 0)
})

// 图 1·54（p.62）：O 为一个顶点
#let fig-D-1-54(width: 340 * k) = px-canvas(340, 260, origin: (350, 1150), width: width, (p, u) => {
  import cetz.draw: *
  let (O, P1, P2) = ((421, 1341), (558, 1259), (505, 1230))
  seg(p, (360, 1341), (647, 1342), mark: arw)
  seg(p, (421, 1397), (421, 1172), mark: arw)
  seg(p, O, P1)
  seg(p, O, P2)
  seg(p, P1, P2)
  pdot(p, O)
  pdot(p, P1)
  pdot(p, P2)
  lbl(p, (501, 1213), $P_2$, dir: "c", d: 0)
  lbl(p, (577, 1257), $P_1$, dir: "c", d: 0)
  lbl(p, (411, 1354), $O$, dir: "c", d: 0)
  lbl(p, (653, 1341), $x$, dir: "c", d: 0)
  lbl(p, (421, 1157), $y$, dir: "c", d: 0)
})

// 图 1·55（p.64）：四边形 P1P2P3P4（对角线 P1P3 为点划线）
#let fig-D-1-55(width: 340 * k) = px-canvas(340, 310, origin: (220, 1060), width: width, (p, u) => {
  import cetz.draw: *
  let (P1, P2, P3, P4) = ((279, 1300), (433, 1298), (405, 1144), (303, 1144))
  seg(p, (230, 1222), (507, 1222), mark: arw)
  seg(p, (353, 1348), (353, 1072), mark: arw)
  poly(p, (P1, P2, P3, P4), close: true)
  line(p(..P1), p(..P3), stroke: (paint: black, thickness: 0.6pt, dash: "dash-dotted"))
  lbl(p, (297, 1130), $P_4$, dir: "c", d: 0)
  lbl(p, (401, 1130), $P_3$, dir: "c", d: 0)
  lbl(p, (282, 1314), $P_1$, dir: "c", d: 0)
  lbl(p, (429, 1311), $P_2$, dir: "c", d: 0)
  lbl(p, (364, 1233), $O$, dir: "c", d: 0)
  lbl(p, (523, 1219), $x$, dir: "c", d: 0)
  lbl(p, (353, 1056), $y$, dir: "c", d: 0)
})

// 图 1·56（p.65）：正六边形 ABCDEF，中心 O (390, 1236)，半径 a ≈ 111.5 像素；单位正方形边长约 28 像素
#let fig-D-1-56(width: 400 * k) = px-canvas(400, 310, origin: (230, 1065), width: width, (p, u) => {
  import cetz.draw: *
  let (cx, cy) = (390, 1236)
  let r = 111.5
  let h = r * 0.866
  let A = (cx + r, cy)
  let D = (cx - r, cy)
  let B = (cx + r / 2, cy - h)
  let C = (cx - r / 2, cy - h)
  let E = (cx - r / 2, cy + h)
  let F = (cx + r / 2, cy + h)
  seg(p, (235, cy), (555, cy), mark: arw)
  seg(p, (cx, 1360), (cx, 1077), mark: arw)
  rect(p(cx, cy), p(cx + 28, cy - 28), stroke: lt)
  for t in range(1, 8) {
    let s = t * 4
    line(p(cx, cy - s), p(cx + s, cy), stroke: 0.4pt)
    line(p(cx + s, cy - 28), p(cx + 28, cy - 28 + s), stroke: 0.4pt)
  }
  poly(p, (A, B, C, D, E, F), close: true)
  dseg(p, B, (cx + 28, cy - 28))
  for v in (A, B, C, D, E, F) { pdot(p, v, r: 3) }
  lbl(p, (525, 1221), $A(a, 0)$, dir: "c", d: 0)
  lbl(p, (448, 1126), $B$, dir: "c", d: 0)
  lbl(p, (332, 1129), $C$, dir: "c", d: 0)
  lbl(p, (270, 1223), $D$, dir: "c", d: 0)
  lbl(p, (335, 1347), $E$, dir: "c", d: 0)
  lbl(p, (446, 1345), $F$, dir: "c", d: 0)
  lbl(p, (483, 1176), $a$, dir: "c", d: 0)
  lbl(p, (449, 1246), $a$, dir: "c", d: 0)
  lbl(p, (379, 1247), $O$, dir: "c", d: 0)
  lbl(p, (419, 1247), $1$, dir: "c", d: 0)
  lbl(p, (380, 1209), $1$, dir: "c", d: 0)
  lbl(p, (551, 1237), $x$, dir: "c", d: 0)
  lbl(p, (392, 1068), $y$, dir: "c", d: 0)
})

// 列表（p.63）：先在坐标上定出各顶点，写成两列并划箭头（带“+ / −”引导箭头）
#let tab-D-63a() = D-arrtab((
  ($x_1$, $y_1$), ($x_2$, $y_2$), ($x_3$, $y_3$), ($x_1$, $y_1$),
), lead: true, wd: 44, dy: 46)
// 列表（p.63）：例 1 的三个顶点 A(-5, -1)，B(1, -6)，C(2, 3)
#let tab-D-63b() = D-arrtab((
  ($-5$, $-1$), ($1$, $-6$), ($2$, $3$), ($-5$, $-1$),
), wd: 48, dy: 46)
// 列表（p.64）：四边形的四个顶点
#let tab-D-64() = D-arrtab((
  ($x_1$, $y_1$), ($x_2$, $y_2$), ($x_3$, $y_3$), ($x_4$, $y_4$), ($x_1$, $y_1$),
), wd: 38, dy: 43)
// 列表（p.65）：正六边形各顶点 A、B、C、D、E、F、A
#let tab-D-65() = D-arrtab((
  ($a$, $0$),
  ($a / 2$, $a / 2 sqrt(3)$),
  ($-a / 2$, $a / 2 sqrt(3)$),
  ($-a$, $0$),
  ($-a / 2$, $-a / 2 sqrt(3)$),
  ($a / 2$, $-a / 2 sqrt(3)$),
  ($a$, $0$),
), wd: 54, dy: 46, wl: 60, wr: 110)

// 复习题一第 14 题图（p.70）：圆心 C(3, 0)，弦 AB 的中点 D(5, 4)，单位长约 16.7 像素，原点 (429, 1143.5)
#let fig-D-ex-14(width: 330 * k) = px-canvas(330, 330, origin: (330, 960), width: width, (p, u) => {
  import cetz.draw: *
  let (O, C, A, B, D) = ((429, 1143.5), (479, 1143.5), (480, 1061), (543, 1094.5), (511, 1078))
  seg(p, (339, 1143.5), (620, 1143.5), mark: arw)
  seg(p, (429, 1272), (429, 979), mark: arw)
  circ(p, C, 81)
  seg(p, A, B)
  seg(p, C, A)
  seg(p, C, D)
  seg(p, C, B)
  pdot(p, C)
  pdot(p, A)
  pdot(p, B)
  pdot(p, D, r: 1.8)
  lbl(p, (481, 1049), $A$, dir: "c", d: 0)
  lbl(p, (556, 1063), $D(5, 4)$, dir: "c", d: 0)
  lbl(p, (559, 1090), $B$, dir: "c", d: 0)
  lbl(p, (500, 1162), $C(3, 0)$, dir: "c", d: 0)
  lbl(p, (419, 1154), $O$, dir: "c", d: 0)
  lbl(p, (634, 1143), $x$, dir: "c", d: 0)
  lbl(p, (429, 966), $y$, dir: "c", d: 0)
})
