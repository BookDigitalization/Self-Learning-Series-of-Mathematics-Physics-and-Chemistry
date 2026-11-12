// 解析几何 段 I：图 3·13–图 3·23（原书 p.137–153，§3·5–§3·7）。
// 读坐标时的页面渲染 200 dpi（页宽约 1031 像素）；k = 0.0152 cm/像素。
// 手绘小偏差不照描：轴取水平/竖直，其余位置、标注、箭头依原图。
#import "/common/geo.typ": *
#let k = 0.0152cm

#let I-ax(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: 0.7pt, mark: arw)
}
#let I-ln(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lw)
}
#let I-ar(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lw, mark: arw)
}
#let I-t(p, pt, body) = lbl(p, pt, body, dir: "c", d: 0)
// 圆弧（数学角，度，逆时针为正），可带箭头
#let I-arc(p, c, r, t0, t1, arrow: false) = {
  import cetz.draw: *
  let n = calc.max(4, calc.ceil(calc.abs(t1 - t0) / 4))
  let pts = range(n + 1).map(i => {
    let t = (t0 + (t1 - t0) * i / n) * 1deg
    p(c.at(0) + r * calc.cos(t), c.at(1) - r * calc.sin(t))
  })
  if arrow {
    line(..pts, stroke: lt, mark: (end: "stealth", fill: black, scale: 0.4))
  } else {
    line(..pts, stroke: lt)
  }
}
#let I-d(p, c) = pdot(p, c, r: 2.6)

// ───────── 图 3·13（p.137）：(a)–(d) ─────────
#let fig-I-3-13a(width: 325 * k) = px-canvas(325, 260, origin: (185, 205), width: width, (p, u) => {
  import cetz.draw: *
  let O = (258, 383)
  I-ax(p, (200, 383), (497, 383))
  I-ax(p, (258, 438), (258, 215))
  I-ln(p, (230, 282), (442, 414))
  I-ar(p, O, (348, 247))
  I-arc(p, O, 22, 0, 56)
  I-arc(p, (393, 383), 13, 0, 148)
  I-t(p, (222, 281), $l$); I-t(p, (355, 251), $Q$); I-t(p, (314, 316), $N$)
  I-t(p, (282, 370), $θ$); I-t(p, (402, 362), $α$); I-t(p, (247, 396), $O$)
  I-t(p, (500, 386), $x$); I-t(p, (259, 221), $y$)
})
#let fig-I-3-13b(width: 285 * k) = px-canvas(285, 260, origin: (585, 215), width: width, (p, u) => {
  import cetz.draw: *
  let O = (766, 396)
  I-ax(p, (592, 396), (845, 396))
  I-ax(p, (766, 455), (766, 240))
  I-ln(p, (598, 414), (802, 291))
  I-ar(p, O, (688, 268))
  I-arc(p, O, 18, 0, 121)
  I-arc(p, (628, 396), 22, 0, 31)
  I-t(p, (806, 290), $l$); I-t(p, (680, 278), $Q$); I-t(p, (712, 331), $N$)
  I-t(p, (785, 376), $θ$); I-t(p, (661, 385), $α$); I-t(p, (755, 409), $O$)
  I-t(p, (856, 397), $x$); I-t(p, (768, 227), $y$)
})
#let fig-I-3-13c(width: 320 * k) = px-canvas(320, 280, origin: (180, 480), width: width, (p, u) => {
  import cetz.draw: *
  let O = (386, 571)
  I-ax(p, (192, 571), (483, 571))
  I-ax(p, (386, 735), (386, 490))
  I-ln(p, (197, 540), (425, 680))
  I-ar(p, O, (310, 700))
  I-arc(p, O, 13, 0, 239)
  I-arc(p, (247.5, 571), 14, 0, 148)
  I-t(p, (197, 541), $l$); I-t(p, (325, 697), $Q$); I-t(p, (331, 640), $N$)
  I-t(p, (372, 552), $θ$); I-t(p, (258, 552), $α$); I-t(p, (397, 586), $O$)
  I-t(p, (484, 573), $x$); I-t(p, (387, 491), $y$)
})
#let fig-I-3-13d(width: 340 * k) = px-canvas(340, 280, origin: (540, 480), width: width, (p, u) => {
  import cetz.draw: *
  let O = (607, 563)
  I-ax(p, (549, 563), (848, 563))
  I-ax(p, (607, 750), (607, 500))
  I-ln(p, (570, 667), (805, 527))
  I-ar(p, O, (690, 690))
  I-arc(p, O, 13, 0, 304)
  I-arc(p, (744.5, 563), 22, 0, 31)
  I-t(p, (803, 530), $l$); I-t(p, (693, 689), $Q$); I-t(p, (663, 627), $N$)
  I-t(p, (595, 545), $θ$); I-t(p, (778, 552), $α$); I-t(p, (622, 572), $O$)
  I-t(p, (859, 563), $x$); I-t(p, (607, 486), $y$)
})

// ───────── 图 3·14（p.137）：(a)(b)，直线过原点 ─────────
#let fig-I-3-14a(width: 315 * k) = px-canvas(315, 290, origin: (175, 1100), width: width, (p, u) => {
  import cetz.draw: *
  let O = (314, 1269)
  I-ax(p, (196, 1269), (475, 1269))
  I-ax(p, (314, 1345), (314, 1112))
  I-ln(p, (238, 1197), (382, 1337))
  I-ar(p, O, (390, 1192))
  I-arc(p, O, 22, 0, 45)
  I-t(p, (238, 1193), $l$); I-t(p, (401, 1191), $Q$)
  I-t(p, (343, 1258), $θ$); I-t(p, (302, 1281), $O$)
  I-t(p, (480, 1268), $x$); I-t(p, (316, 1112), $y$)
})
#let fig-I-3-14b(width: 285 * k) = px-canvas(285, 290, origin: (570, 1100), width: width, (p, u) => {
  import cetz.draw: *
  let O = (693, 1263)
  I-ax(p, (577, 1263), (830, 1263))
  I-ax(p, (693, 1340), (693, 1112))
  I-ln(p, (618, 1332), (776, 1188))
  I-ar(p, O, (621, 1186))
  I-arc(p, O, 17, 0, 133)
  I-t(p, (776, 1183), $l$); I-t(p, (606, 1180), $Q$)
  I-t(p, (700, 1237), $θ$); I-t(p, (703, 1275), $O$)
  I-t(p, (836, 1262), $x$); I-t(p, (693, 1110), $y$)
})

// ───────── 图 3·15（p.138）：l 与 y 轴重合 ─────────
#let fig-I-3-15(width: 315 * k) = px-canvas(315, 320, origin: (130, 985), width: width, (p, u) => {
  import cetz.draw: *
  I-ax(p, (135, 1178), (435, 1178))
  I-ax(p, (248, 1295), (248, 1000))
  I-t(p, (240, 1090), $l$); I-t(p, (236, 1191), $O$); I-t(p, (370, 1193), $Q$)
  I-t(p, (436, 1180), $x$); I-t(p, (250, 990), $y$)
})

// ───────── 图 3·16（p.138）─────────
#let fig-I-3-16(width: 425 * k) = px-canvas(425, 300, origin: (465, 1000), width: width, (p, u) => {
  import cetz.draw: *
  let O = (537, 1226)
  let N = (583, 1138)
  I-ax(p, (473, 1226), (862, 1226))
  I-ax(p, (537, 1285), (537, 1030))
  I-ln(p, (495, 1090), (815, 1262))
  I-ar(p, O, (625, 1060))
  line(p(..O), p(..N), stroke: 1.6pt)
  line(p(..N), p(583, 1226), stroke: lt)
  I-arc(p, O, 20, 0, 62)
  I-arc(p, (759, 1226), 22, 0, 28)
  content(p(598, 1133), tt($N (p cos θ, p sin θ)$), anchor: "west")
  I-t(p, (636, 1050), $Q$); I-t(p, (551, 1163), $p$); I-t(p, (590, 1186), $y$)
  I-t(p, (562, 1212), $θ$); I-t(p, (772, 1212), $α$); I-t(p, (823, 1258), $l$)
  I-t(p, (526, 1238), $O$); I-t(p, (873, 1233), $x$); I-t(p, (541, 1012), $y$)
})

// ───────── 图 3·17（p.141） ─────────
#let fig-I-3-17(width: 365 * k) = px-canvas(365, 365, origin: (545, 505), width: width, (p, u) => {
  import cetz.draw: *
  let O = (685, 730)
  circ(p, O, 87)
  I-ax(p, (545, 730), (895, 730))
  I-ax(p, (685, 859), (685, 528))
  I-ln(p, (565, 765), (665, 591))
  I-ln(p, (717, 844), (823, 663))
  I-ln(p, (610, 685), (685, 730))
  I-ar(p, O, (758, 772))
  I-arc(p, O, 35, 0, 330, arrow: true)
  I-arc(p, O, 25, 0, 150, arrow: true)
  I-t(p, (670, 584), $l_2$); I-t(p, (829, 664), $l_1$)
  I-t(p, (615, 720), $60°$); I-t(p, (816, 714), $60°$)
  I-t(p, (668, 696), $θ_1$); I-t(p, (698, 711), $θ_2$)
  I-t(p, (674, 741), $O$); I-t(p, (904, 731), $x$); I-t(p, (685, 513), $y$)
})

// ───────── 图 3·18（p.149）：(a) P₁ 与 O 在 l 的异旁；(b) 同旁 ─────────
#let I-dim(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lt, mark: arw2)
}
#let fig-I-3-18a(width: 380 * k) = px-canvas(380, 275, origin: (125, 615), width: width, (p, u) => {
  import cetz.draw: *
  let O = (201, 826)
  I-ax(p, (134, 826), (489, 826))
  I-ax(p, (201, 858), (201, 636))
  I-ln(p, (152, 721), (397, 863))   // l
  I-ln(p, (163, 692), (434, 848))   // l1
  I-ar(p, O, (295, 669))
  line(p(173, 807), p(195, 818), stroke: lt)
  I-dim(p, (186, 813), (222, 756))
  I-dim(p, (186, 813), (236, 730))
  line(p(291, 800), p(304, 773), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.4))
  I-d(p, (304, 773))
  I-arc(p, O, 22, 0, 59)
  I-t(p, (153, 712), $l$); I-t(p, (155, 696), $l_1$); I-t(p, (302, 664), $Q$)
  I-t(p, (272, 738), $N_1$); I-t(p, (252, 772), $N$)
  I-t(p, (211, 790), $p$); I-t(p, (209, 771), $p_1$)
  content(p(314, 772), tt($P_1 (x_1, y_1)$), anchor: "west")
  I-t(p, (282, 812), $H$); I-t(p, (223, 815), $θ$); I-t(p, (190, 838), $O$)
  I-t(p, (492, 826), $x$); I-t(p, (196, 622), $y$)
  I-t(p, (266, 880), text(style: "italic")[(a)])
})
#let fig-I-3-18b(width: 390 * k) = px-canvas(390, 275, origin: (515, 615), width: width, (p, u) => {
  import cetz.draw: *
  let O = (595, 826)
  I-ax(p, (519, 826), (889, 826))
  I-ax(p, (595, 865), (592, 632))
  I-ln(p, (552, 673), (856, 847))   // l
  I-ln(p, (543, 717), (795, 865))   // l1
  I-ar(p, O, (690, 667))
  line(p(565, 806), p(590, 817), stroke: lt)
  I-dim(p, (581, 808), (639, 713))
  I-dim(p, (581, 808), (618, 750))
  line(p(703, 757), p(680, 796), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.4))
  I-d(p, (680, 796))
  I-arc(p, O, 22, 0, 59)
  I-t(p, (550, 668), $l$); I-t(p, (534, 714), $l_1$); I-t(p, (699, 662), $Q$)
  I-t(p, (672, 722), $N$); I-t(p, (651, 762), $N_1$)
  I-t(p, (604, 767), $p$); I-t(p, (607, 787), $p_1$)
  content(p(668, 809), tt($P_1 (x_1, y_1)$), anchor: "west")
  I-t(p, (713, 747), $H$); I-t(p, (620, 815), $θ$); I-t(p, (586, 839), $O$)
  I-t(p, (895, 825), $x$); I-t(p, (591, 619), $y$)
  I-t(p, (660, 880), text(style: "italic")[(b)])
})

// ───────── 图 3·19（p.150）：直线过原点 ─────────
#let fig-I-3-19a(width: 320 * k) = px-canvas(320, 330, origin: (145, 1070), width: width, (p, u) => {
  import cetz.draw: *
  let O = (270, 1252)
  I-ax(p, (150, 1253), (449, 1253))
  I-ax(p, (270, 1370), (270, 1082))
  I-ln(p, (154, 1148), (357, 1327))
  I-ar(p, O, (363, 1164))
  line(p(191, 1175), p(228, 1137), stroke: lt)
  line(p(327, 1306), p(288, 1343), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.4))
  I-d(p, (228, 1137)); I-d(p, (288, 1343))
  I-arc(p, O, 25, 0, 45)
  I-t(p, (155, 1150), $l$); I-t(p, (374, 1153), $Q$)
  I-t(p, (246, 1135), $P_1$); I-t(p, (289, 1360), $P_2$)
  I-t(p, (302, 1239), $θ$); I-t(p, (261, 1265), $O$)
  I-t(p, (447, 1246), $x$); I-t(p, (266, 1074), $y$)
  I-t(p, (281, 1389), text(style: "italic")[(a)])
})
#let fig-I-3-19b(width: 320 * k) = px-canvas(320, 330, origin: (550, 1070), width: width, (p, u) => {
  import cetz.draw: *
  let O = (671, 1252)
  I-ax(p, (558, 1253), (855, 1253))
  I-ax(p, (671, 1367), (671, 1082))
  I-ln(p, (594, 1324), (763, 1161))
  I-ar(p, O, (586, 1167))
  line(p(730, 1187), p(698, 1150), stroke: lt)
  line(p(618, 1304), p(654, 1342), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.4))
  I-d(p, (698, 1150)); I-d(p, (654, 1342))
  I-arc(p, O, 17, 0, 135)
  I-t(p, (771, 1156), $l$); I-t(p, (569, 1150), $Q$)
  I-t(p, (696, 1134), $P_1$); I-t(p, (654, 1358), $P_2$)
  I-t(p, (680, 1221), $θ$); I-t(p, (680, 1263), $O$)
  I-t(p, (851, 1251), $x$); I-t(p, (671, 1086), $y$)
  I-t(p, (671, 1384), text(style: "italic")[(b)])
})

// ───────── 图 3·20（p.151）：l 与 y 轴重合 ─────────
#let fig-I-3-20(width: 305 * k) = px-canvas(305, 280, origin: (575, 415), width: width, (p, u) => {
  import cetz.draw: *
  I-ax(p, (580, 575), (869, 575))
  I-ax(p, (692, 685), (692, 439))
  line(p(692, 575), p(808, 575), stroke: 1.6pt, mark: arw)
  line(p(692, 518), p(773, 518), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.4))
  line(p(692, 633), p(608, 633), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.4))
  I-d(p, (773, 518)); I-d(p, (608, 633))
  I-t(p, (684, 539), $l$); I-t(p, (682, 587), $O$); I-t(p, (813, 588), $Q$)
  I-t(p, (872, 575), $x$); I-t(p, (691, 425), $y$)
  I-t(p, (794, 519), $P_1$); I-t(p, (608, 650), $P_2$)
})

// ───────── 图 3·21（p.152）：x cos60° + y sin60° − 2 = 0 ─────────
#let fig-I-3-21(width: 505 * k) = px-canvas(505, 250, origin: (270, 570), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (512, 768, 28)
  let X = x => ox + s * x
  let Y = y => oy - s * y
  let s3 = calc.sqrt(3)
  I-ax(p, (280, 768), (751, 768))
  I-ax(p, (512, 820), (512, 587))
  for x in (-5, -4, -3, -2, -1, 1, 2, 3, 6) { line(p(X(x), 768), p(X(x), 764), stroke: lt) }
  for y in (-1, 1, 2, 3, 4) { line(p(512, Y(y)), p(516, Y(y)), stroke: lt) }
  // 直线 x/2 + (√3/2) y = 2，法向 (1/2, √3/2)
  let ln-y = x => (2 - x / 2) / (s3 / 2)
  I-ln(p, (X(-3.94), Y(ln-y(-3.94))), (X(6.6), Y(ln-y(6.6))))
  let foot(x0, y0) = {
    let d = x0 / 2 + s3 / 2 * y0 - 2
    (x0 - d / 2, y0 - d * s3 / 2)
  }
  let B = (-4, s3 / 2)
  let C = (1, s3)
  let A = (6, s3)
  let fa = foot(..A)
  let fb = foot(..B)
  line(p(X(A.at(0)), Y(A.at(1))), p(X(fa.at(0)), Y(fa.at(1))), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.4))
  line(p(X(B.at(0)), Y(B.at(1))), p(X(fb.at(0)), Y(fb.at(1))), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.4))
  I-d(p, (X(A.at(0)), Y(A.at(1)))); I-d(p, (X(B.at(0)), Y(B.at(1)))); I-d(p, (X(C.at(0)), Y(C.at(1))))
  I-t(p, (342, 713), $B (-4, sqrt(3) / 2)$)
  // 原书图中作 C(1; √3)（分号），与正文统一为逗号
  I-t(p, (587, 697), $C (1, sqrt(3))$)
  I-t(p, (709, 697), $A (6, sqrt(3))$)
  I-t(p, (443, 705), $d_2$); I-t(p, (646, 746), $d_1$)
  I-t(p, (502, 781), $O$); I-t(p, (762, 764), $x$); I-t(p, (511, 577), $y$)
})

// ───────── 图 3·22、3·23（p.153）─────────
#let fig-I-3-22(width: 310 * k) = px-canvas(310, 220, origin: (160, 555), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (301, 681, 28)
  I-ax(p, (170, 681), (461, 681))
  I-ax(p, (299, 770), (299, 569))
  for x in (-3, -2, -1, 1, 2, 3) { line(p(ox + s * x, 681), p(ox + s * x, 677), stroke: lt) }
  for y in (-2, -1, 1, 2) { line(p(299, oy - s * y), p(303, oy - s * y), stroke: lt) }
  I-ln(p, (217, 749), (405, 655))
  line(p(216, 653), p(253, 729), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.4))
  I-d(p, (216, 653))
  content(p(248, 634), tt($P (-3, 1)$))
  I-t(p, (290, 692), $O$); I-t(p, (462, 681), $x$); I-t(p, (297, 560), $y$)
})
#let fig-I-3-23(width: 315 * k) = px-canvas(315, 265, origin: (515, 515), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, s) = (627, 665.5, 28.5)
  I-ax(p, (525, 665.5), (814, 665.5))
  I-ax(p, (627, 775), (627, 530))
  for x in (-3, -2, -1, 2, 3, 4) { line(p(ox + s * x, oy), p(ox + s * x, oy - 4), stroke: lt) }
  for y in (-3, -2, 1, 2, 3) { line(p(627, oy - s * y), p(631, oy - s * y), stroke: lt) }
  // 原图直线斜率约 0.5、与 3x − 4y = 0 不符（手绘），按方程画：斜率 3/4，垂足 (1.6, 1.2)，P(4, −2)
  I-ln(p, (ox + s * -2.42, oy + s * 0.75 * 2.42), (ox + s * 4.28, oy - s * 0.75 * 4.28))
  line(p(ox + s * 1.6, oy - s * 1.2), p(ox + s * 4, oy + s * 2), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.4))
  I-d(p, (ox + s * 4, oy + s * 2))
  content(p(775, 739), tt($P (4, -2)$))
  I-t(p, (616, 678), $O$); I-t(p, (818, 666), $x$); I-t(p, (627, 518), $y$)
})
