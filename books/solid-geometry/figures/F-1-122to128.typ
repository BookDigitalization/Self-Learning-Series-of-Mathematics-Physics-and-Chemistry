// 图 1·122、1·123（原书 p.110）、1·124（p.111）、1·125（p.112）、1·126（p.113）、1·127（p.114 上）、1·128（p.114 下）；页面 200 dpi 坐标。
#import "F-base.typ": *

// 三面角 V—ABC：顶点 V，三条棱的交点与末端
#let tri-angle(p, V, A, B, C, ends, thick: true) = {
  import cetz.draw: *
  let (ea, eb, ec) = ends
  pl(p, V, A, ea)
  pl(p, V, B, eb)
  pl(p, V, C, ec)
  tseg(p, A, B)
  tseg(p, B, C)
  dseg(p, A, C)
}

#let fig-F-1-122(width: 380 * k) = px-canvas(380, 240, origin: (100, 1055), width: width, (p, u) => {
  import cetz.draw: *
  tri-angle(p, (194, 1085), (140, 1200), (187, 1217), (252, 1185), ((122, 1232), (185, 1260), (272, 1210)))
  tri-angle(p, (365, 1085), (312, 1202), (362, 1219), (427, 1182), ((292, 1245), (361, 1260), (452, 1215)))
  L(p, 192, 1072, $V$)
  L(p, 120, 1247, $A$)
  L(p, 179, 1274, $B$)
  L(p, 272, 1226, $C$)
  L(p, 365, 1072, $V_1$)
  L(p, 292, 1257, $A_1$)
  L(p, 362, 1279, $B_1$)
  L(p, 455, 1232, $C_1$)
})

#let fig-F-1-123(width: 360 * k) = px-canvas(360, 240, origin: (490, 1050), width: width, (p, u) => {
  import cetz.draw: *
  tri-angle(p, (579, 1074), (525, 1187), (570, 1205), (639, 1174), ((508, 1233), (566, 1265), (656, 1204)))
  tri-angle(p, (765, 1079), (701, 1174), (771, 1210), (821, 1196), ((681, 1205), (772, 1250), (825, 1227)))
  L(p, 580, 1060, $V$)
  L(p, 503, 1245, $A$)
  L(p, 565, 1268, $B$)
  L(p, 656, 1218, $C$)
  L(p, 766, 1065, $V_1$)
  L(p, 682, 1221, $C_1$)
  L(p, 777, 1265, $B_1$)
  L(p, 825, 1226, $A_1$)
})

#let fig-F-1-124(width: 400 * k) = px-canvas(400, 245, origin: (520, 398), width: width, (p, u) => {
  import cetz.draw: *
  tri-angle(p, (607, 421), (550, 551), (605, 572), (681, 530), ((534, 591), (603, 617), (702, 575)))
  tri-angle(p, (799, 419), (748, 548), (805, 566), (881, 522), ((732, 592), (806, 615), (902, 552)))
  L(p, 610, 405, $V$)
  L(p, 537, 615, $A$)
  L(p, 601, 632, $B$)
  L(p, 712, 572, $C$)
  L(p, 806, 409, $V_1$)
  L(p, 732, 605, $A_1$)
  L(p, 805, 631, $B_1$)
  L(p, 907, 570, $C_1$)
})

#let fig-F-1-125(width: 600 * k) = px-canvas(600, 245, origin: (200, 250), width: width, (p, u) => {
  import cetz.draw: *
  // 左：三面角 V—ABC
  let V = (356, 272)
  let A = (250, 399)
  let B = (317, 452)
  let C = (420, 404)
  let D = (268, 376)
  let E = (297, 436)
  let F = (318, 401)
  pl(p, V, D, A, (225, 422))
  pl(p, V, B, (308, 483))
  pl(p, V, C, (429, 425))
  tseg(p, A, B)
  tseg(p, B, C)
  dseg(p, A, C)
  dseg(p, D, F)
  dseg(p, E, F)
  seg(p, D, E)
  // 右：三面角 V1—A1B1C1
  let V1 = (680, 271)
  let A1 = (570, 400)
  let B1 = (640, 450)
  let C1 = (745, 402)
  let D1 = (592, 373)
  let E1 = (622, 437)
  let F1 = (652, 400)
  pl(p, V1, D1, A1, (551, 421))
  pl(p, V1, B1, (635, 487))
  pl(p, V1, C1, (757, 427))
  tseg(p, A1, B1)
  tseg(p, B1, C1)
  dseg(p, A1, C1)
  dseg(p, D1, F1)
  dseg(p, E1, F1)
  seg(p, D1, E1)
  L(p, 362, 260, $V$)
  L(p, 232, 388, $A$)
  L(p, 259, 370, $D$)
  L(p, 320, 385, $F$)
  L(p, 429, 394, $C$)
  L(p, 290, 455, $E$)
  L(p, 327, 455, $B$)
  L(p, 692, 261, $V_1$)
  L(p, 577, 364, $D_1$)
  L(p, 555, 387, $A_1$)
  L(p, 639, 381, $F_1$)
  L(p, 759, 392, $C_1$)
  L(p, 615, 449, $E_1$)
  L(p, 655, 455, $B_1$)
})

#let fig-F-1-126(width: 200 * k) = px-canvas(200, 320, origin: (735, 735), width: width, (p, u) => {
  import cetz.draw: *
  let V = (840, 857)
  let A = (761, 972)
  let B = (809, 1002)
  let C = (891, 975)
  let A1 = (884, 790)
  let B1 = (858, 772)
  let C1 = (811, 787)
  pl(p, (747, 995), A, V, A1, (898, 766))
  pl(p, (802, 1032), B, V)
  seg(p, B1, (864, 750))
  pl(p, (902, 1002), C, V, C1)
  // 上半部分的 A1B1C1（对顶三面角的截面）
  tseg(p, C1, B1)
  tseg(p, B1, A1)
  tseg(p, C1, A1)
  tseg(p, A, B)
  tseg(p, B, C)
  dseg(p, A, C)
  dseg(p, V, B1)
  L(p, 856, 851, $V$)
  L(p, 745, 971, $A$)
  L(p, 816, 1017, $B$)
  L(p, 902, 974, $C$)
  L(p, 848, 754, $B_1$)
  L(p, 802, 787, $C_1$)
  L(p, 897, 801, $A_1$)
})

// 图 1·127：三个三面角模型的展开图（原书 p.114 上）。(1)(2) 全等，(2)(3) 对称。
// 圆心 O、半径 r；扇形沿逆时针依次为：黑色 a0→a2、白（或红）a2→360°、红（或白）360°→a3（角度以数学角计，a3 > 360）。
#let sector-model(p, O, r, a0, a2, a3, tab, labs) = {
  import cetz.draw: *
  arc(p(..O), start: a0 * 1deg, stop: a3 * 1deg, radius: r, anchor: "origin", stroke: lb)
  tseg(p, O, cpt(O, r, a0))
  tseg(p, O, cpt(O, r, a3))
  dseg(p, O, cpt(O, r, a2))
  dseg(p, O, cpt(O, r, 0))
  // 黏合用的小舌
  tpoly(p, (tab.at(0), tab.at(1), cpt(O, r, a0)))
  // 角度记号（带箭头的圆弧）
  arc(p(..O), start: (a2 - 360) * 1deg, stop: (a3 - 360) * 1deg, radius: 32, anchor: "origin", stroke: lt, mark: arw2)
  for (x, y, body) in labs { L(p, x, y, body) }
}

#let fig-F-1-127(width: 730 * k) = px-canvas(730, 290, origin: (100, 370), width: width, (p, u) => {
  import cetz.draw: *
  sector-model(p, (207, 492), 113, 213, 260, 490, ((190, 487), (116, 537)),
    ((240, 424, tt[红色]), (242, 460, tt[130°]), (247, 519, tt[100°]), (246, 554, tt[白色]), (167, 567, tt[黑色]), (182, 532, tt[45°])))
  sector-model(p, (460, 492), 113, 213, 260, 490, ((443, 487), (369, 537)),
    ((493, 424, tt[红色]), (495, 460, tt[130°]), (500, 519, tt[100°]), (499, 554, tt[白色]), (420, 567, tt[黑色]), (435, 532, tt[45°])))
  sector-model(p, (715, 489), 112, 187, 231, 460, ((700, 474), (620, 481)),
    ((750, 420, tt[白色]), (755, 461, tt[100°]), (667, 509, tt[45°]), (642, 531, tt[黑色]), (761, 517, tt[130°]), (747, 559, tt[红色])))
  L(p, 240, 632, tt[(1)])
  L(p, 466, 632, tt[(2)])
  L(p, 706, 632, tt[(3)])
})

#let fig-F-1-128(width: 700 * k) = px-canvas(700, 270, origin: (100, 1030), width: width, (p, u) => {
  import cetz.draw: *
  // 左：四面角 S—ABCD
  let S = (255, 1045)
  let A = (157, 1194)
  let B = (217, 1212)
  let C = (347, 1210)
  let D = (271, 1162)
  seg(p, S, (131, 1232))
  seg(p, S, (205, 1267))
  seg(p, S, (374, 1257))
  dseg(p, S, (285, 1262))
  tseg(p, A, B)
  tseg(p, B, C)
  dseg(p, A, C)
  dseg(p, A, D)
  dseg(p, D, C)
  // 右：四面角 S1—A1B1C1D1
  let S1 = (617, 1052)
  let A1 = (538, 1195)
  let B1 = (585, 1212)
  let C1 = (702, 1197)
  let D1 = (642, 1162)
  seg(p, S1, (514, 1237))
  seg(p, S1, (575, 1270))
  seg(p, S1, (737, 1250))
  dseg(p, S1, (658, 1255))
  tseg(p, A1, B1)
  tseg(p, B1, C1)
  dseg(p, A1, C1)
  dseg(p, A1, D1)
  dseg(p, D1, C1)
  L(p, 256, 1025, $S$)
  L(p, 139, 1185, $A$)
  L(p, 227, 1229, $B$)
  L(p, 360, 1209, $C$)
  L(p, 285, 1151, $D$)
  L(p, 622, 1041, $S_1$)
  L(p, 515, 1192, $A_1$)
  L(p, 602, 1230, $B_1$)
  L(p, 717, 1192, $C_1$)
  L(p, 657, 1152, $D_1$)
})
