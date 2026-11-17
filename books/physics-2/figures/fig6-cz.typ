// 第 6 章 CeTZ 重绘的示意图：图 6·2、6·3、6·8、6·10、6·18—6·23
// 坐标取自 render-pages.py --dpi 200 --grid 100 输出的原书页面像素（y 向下）。
#import "/common/series.typ": *

#let arr = (end: "stealth", fill: black, scale: 0.45)
#let arr2 = (start: "stealth", end: "stealth", fill: black, scale: 0.45)

// 45° 斜线填充：在矩形 (x0,y0)-(x1,y1) 内，对满足 inside(x, y) 的区域画 "/" 形斜线
#let hatch(p, inside, x0, y0, x1, y1, step: 7, sk: 0.5pt) = {
  import cetz.draw: *
  let c = x0 + y0
  while c <= x1 + y1 {
    let start = none
    let prev = none
    for x in range(x0, x1 + 1) {
      let y = c - x
      let ok = y >= y0 and y <= y1 and inside(x, y)
      if ok {
        if start == none { start = (x, y) }
        prev = (x, y)
      } else if start != none {
        line(p(..start), p(..prev), stroke: sk)
        start = none
      }
    }
    if start != none { line(p(..start), p(..prev), stroke: sk) }
    c += step
  }
}
#let hrect(p, x0, y0, x1, y1, step: 7, sk: 0.9pt) = {
  import cetz.draw: *
  rect(p(x0, y0), p(x1, y1), stroke: sk)
  hatch(p, (x, y) => true, x0, y0, x1, y1, step: step)
}

// 图 6·2 在云母片上，石蜡熔化的地方呈椭圆形（原书 p.183）
#let fig-6-2(width: 4.4cm) = px-canvas(290, 190, origin: (230, 1085), width: width, (p, u) => {
  import cetz.draw: *
  rect(p(313, 1093), p(497, 1225), stroke: 1pt)
  for y in range(1099, 1225, step: 6) { line(p(313, y), p(497, y), stroke: 0.4pt) }
  circle(p(407, 1157), radius: (63 * u, 37 * u), fill: white, stroke: 0.9pt)
  circle(p(407, 1157), radius: 2.5 * u, fill: black, stroke: none)
  content(p(272, 1117), anchor: "east", text(size: 8pt, [石蜡]))
  content(p(268, 1186), anchor: "east", text(size: 8pt, [云母片]))
  line(p(300, 1118), p(352, 1148), stroke: 0.6pt)
  line(p(315, 1189), p(330, 1194), stroke: 0.6pt)
})

// 图 6·3 在玻璃片上，石蜡熔化的地方呈圆形（原书 p.184）
#let fig-6-3(width: 4.4cm) = px-canvas(290, 160, origin: (170, 175), width: width, (p, u) => {
  import cetz.draw: *
  rect(p(247, 185), p(439, 318), stroke: 1pt)
  for y in range(191, 318, step: 6) { line(p(247, y), p(439, y), stroke: 0.4pt) }
  circle(p(341, 249), radius: 38 * u, fill: white, stroke: 0.9pt)
  circle(p(341, 249), radius: 2.5 * u, fill: black, stroke: none)
  content(p(205, 210), anchor: "east", text(size: 8pt, [石蜡]))
  content(p(203, 266), anchor: "east", text(size: 8pt, [玻璃片]))
  line(p(230, 211), p(300, 240), stroke: 0.6pt)
  line(p(232, 269), p(252, 271), stroke: 0.6pt)
})

// 图 6·8 使棒产生拉伸形变的作用力（原书 p.193）
#let fig-6-8(width: 3.0cm) = px-canvas(220, 420, origin: (740, 875), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  // (a)
  hrect(p, 779, 977, 822, 1177)
  line(p(802, 977), p(802, 900), stroke: 0.9pt, mark: arr)
  line(p(800, 1178), p(800, 1245), stroke: 0.9pt, mark: arr)
  lab(806, 889, $P$)
  lab(768, 978, $A$)
  lab(767, 1173, $B$)
  lab(813, 1237, $P$)
  lab(797, 1287, $(a)$)
  // (b)
  rect(p(843, 967), p(945, 993), stroke: 0.9pt)
  hatch(p, (x, y) => true, 843, 967, 945, 993, step: 6)
  hrect(p, 875, 993, 917, 1177)
  line(p(898, 990), p(898, 900), stroke: 0.9pt, mark: arr)
  line(p(893, 1178), p(893, 1248), stroke: 0.9pt, mark: arr)
  lab(899, 889, $P$)
  lab(857, 985, $A$)
  lab(860, 1175, $B$)
  lab(909, 1237, $P$)
  lab(893, 1289, $(b)$)
})

// 图 6·10 使棒产生压缩形变的作用力（原书 p.194）
#let fig-6-10(width: 2.2cm) = px-canvas(120, 400, origin: (700, 535), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  hrect(p, 747, 637, 790, 835)
  line(p(770, 562), p(770, 635), stroke: 0.9pt, mark: arr)
  line(p(767, 905), p(767, 838), stroke: 0.9pt, mark: arr)
  lab(773, 548, $P$)
  lab(738, 636, $A$)
  lab(732, 832, $B$)
  lab(766, 922, $P$)
})

// 图 6·18 弯曲形变是由两个大小相等、方向相反的力偶 F₁r₁ 和 F₂r₂ 所产生的（原书 p.196）
#let fig-6-18(width: 4.0cm) = px-canvas(240, 230, origin: (680, 1030), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  line(p(697, 1123), p(897, 1123), stroke: 1pt)
  line(p(697, 1122), p(697, 1060), stroke: 0.9pt, mark: arr)
  line(p(897, 1122), p(897, 1085), stroke: 0.9pt, mark: arr)
  line(p(765, 1124), p(765, 1246), stroke: 0.9pt, mark: arr)
  // r₁、r₂ 的括线
  line(p(700, 1112), p(700, 1116), p(762, 1116), stroke: 0.6pt)
  line(p(768, 1116), p(894, 1116), p(894, 1112), stroke: 0.6pt)
  lab(702, 1040, $F_1$)
  lab(899, 1064, $F_2$)
  lab(733, 1098, $r_1$)
  lab(830, 1098, $r_2$)
  lab(787, 1200, $F_1$)
  lab(789, 1238, $F_2$)
})

// 图 6·19 针的位置表示弯曲的物体的一边伸长了，而另一边缩短了（原书 p.197）
#let fig-6-19(width: 6.4cm) = px-canvas(470, 190, origin: (180, 895), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  // (a) 橡皮棒与长针
  rect(p(188, 966), p(395, 977), stroke: 0.8pt)
  hatch(p, (x, y) => true, 188, 966, 395, 977, step: 4, sk: 0.4pt)
  for x in (230, 268, 308, 350) { line(p(x, 905), p(x, 1048), stroke: 1pt) }
  line(p(350, 925), p(360, 916), stroke: 0.5pt)
  line(p(345, 978), p(358, 993), stroke: 0.5pt)
  content(p(364, 916), anchor: "west", text(size: 8pt, [长针]))
  content(p(358, 1002), anchor: "west", text(size: 8pt, [橡皮棒]))
  lab(312, 1073, $(a)$)
  // (b) 弯曲后：针沿半径方向，圆心在棒下方
  let cx = 543
  let cy = 1167
  let pt(x, y0, y1) = {
    let t = (y1 - y0) / (cy - y0)
    (x + (cx - x) * t, y1)
  }
  for (tx, ty) in ((462, 918), (517, 907), (566, 905), (619, 912)) {
    line(p(tx, ty), p(..pt(tx, ty, 1048)), stroke: 1pt)
  }
  // 棒：以 (cx, cy) 为圆心的弧，宽约 11 px
  arc(p(cx, cy), start: 60.7deg, stop: 119.3deg, radius: 200 * 1 * u, anchor: "origin", stroke: 0.8pt)
  arc(p(cx, cy), start: 60.7deg, stop: 119.3deg, radius: 189 * u, anchor: "origin", stroke: 0.8pt)
  for k in range(0, 59) {
    let a = (60.7 + k * 1.0) * 1deg
    line((p(cx, cy).at(0) + 189 * calc.cos(a), p(cx, cy).at(1) + 189 * calc.sin(a)), (p(cx, cy).at(0) + 200 * calc.cos(a), p(cx, cy).at(1) + 200 * calc.sin(a)), stroke: 0.4pt)
  }
  lab(548, 1068, $(b)$)
})

// 图 6·20 截面积分别是 A 和 B 的梁，反抗弯曲的作用是几乎相等的（原书 p.197）
#let fig-6-20(width: 3.6cm) = px-canvas(270, 180, origin: (670, 895), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  // (a) 工字梁
  rect(p(679, 903), p(767, 1027), stroke: (thickness: 0.8pt, dash: "dashed"))
  let ibeam(x, y) = y <= 923 or y >= 1010 or (x >= 716 and x <= 735)
  hatch(p, ibeam, 681, 905, 766, 1026, step: 5, sk: 0.5pt)
  line(p(681, 905), p(766, 905), p(766, 923), p(735, 923), p(735, 1010), p(766, 1010), p(766, 1026), p(681, 1026), p(681, 1010), p(716, 1010), p(716, 923), p(681, 923), close: true, stroke: 1pt)
  lab(779, 950, $A$)
  lab(720, 1062, $(a)$)
  // (b) 矩形
  hrect(p, 821, 905, 912, 1030, step: 5, sk: 1pt)
  lab(926, 958, $B$)
  lab(861, 1063, $(b)$)
})

// 图 6·21 金属线的拉伸（原书 p.199）
#let fig-6-21(width: 2.4cm) = px-canvas(190, 640, origin: (730, 150), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  rect(p(760, 158), p(880, 178), stroke: 0.9pt)
  hatch(p, (x, y) => true, 760, 158, 880, 178, step: 6)
  line(p(818, 178), p(818, 625), stroke: 0.9pt)
  line(p(823, 178), p(823, 625), stroke: 0.9pt)
  // 重物
  rect(p(792, 625), p(836, 700), stroke: 0.9pt)
  line(p(796, 628), p(796, 698), stroke: 0.4pt)
  line(p(832, 628), p(832, 698), stroke: 0.4pt)
  circle(p(815, 657), radius: 2 * u, stroke: 0.6pt)
  line(p(815, 702), p(815, 772), stroke: 1pt, mark: arr)
  lab(831, 765, $P$)
  // L
  line(p(778, 182), p(778, 622), stroke: 0.6pt, mark: arr2)
  line(p(768, 626), p(788, 626), stroke: 0.6pt)
  lab(779, 400, $L$)
  // L₀
  line(p(853, 182), p(853, 596), stroke: 0.6pt, mark: arr2)
  lab(851, 395, $L_0$)
  line(p(836, 600), p(898, 600), stroke: 0.6pt)
  line(p(845, 652), p(845, 630), stroke: 0.6pt, mark: arr)
  lab(874, 614, $L - L_0$)
})

// 图 6·22 例 7 的支架（原书 p.208）
#let fig-6-22(width: 4.4cm) = px-canvas(310, 340, origin: (230, 260), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  // 墙
  line(p(262, 268), p(262, 528), stroke: 1pt)
  hatch(p, (x, y) => true, 240, 268, 262, 528, step: 6)
  line(p(240, 268), p(262, 268), stroke: 0.6pt)
  // 杆 AB（两条线）、CB
  line(p(262, 333), p(508, 477), stroke: 0.9pt)
  line(p(262, 338), p(508, 481), stroke: 0.9pt)
  line(p(262, 473), p(508, 473), stroke: 0.9pt)
  line(p(262, 478), p(508, 478), stroke: 0.9pt)
  // 重物
  line(p(510, 480), p(510, 538), stroke: 0.7pt)
  rect(p(489, 538), p(530, 565), stroke: 0.9pt)
  hatch(p, (x, y) => true, 489, 538, 530, 565, step: 5)
  lab(272, 317, $A$)
  lab(522, 473, $B$)
  lab(272, 493, $C$)
  lab(425, 457, $alpha$)
  lab(455, 463, $30°$)
  // 角 α 的弧：以 B 为圆心，半径约 79 px，从 CB 线（180°）到 AB 线（150°）
  arc(p(508, 475), start: 150deg, stop: 180deg, radius: 79 * u, anchor: "origin", stroke: 0.5pt)
})

// 图 6·23 测定材料硬度的示意图（原书 p.210）
#let fig-6-23(width: 4.6cm) = px-canvas(290, 260, origin: (200, 990), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  let ball(x, y) = (x - 349) * (x - 349) + (y - 1125) * (y - 1125) <= 58 * 58
  let dent(x, y) = (x - 349) * (x - 349) + (y - 1150) * (y - 1150) <= 53 * 53 and y >= 1158
  // 压痕处的斜线
  hatch(p, (x, y) => dent(x, y) and not ball(x, y), 296, 1158, 402, 1204, step: 4)
  // 表面两侧的斜线
  hatch(p, (x, y) => y >= 1158 and not ball(x, y), 243, 1158, 297, 1172, step: 4)
  hatch(p, (x, y) => y >= 1158 and not ball(x, y), 401, 1158, 492, 1172, step: 4)
  line(p(243, 1158), p(298, 1158), stroke: 0.8pt)
  line(p(400, 1158), p(492, 1158), stroke: 0.8pt)
  arc(p(349, 1150), start: 191deg, stop: 349deg, radius: 53 * u, anchor: "origin", stroke: 0.9pt)
  circle(p(349, 1125), radius: 58 * u, stroke: 1pt)
  // 压力 P
  line(p(349, 1006), p(349, 1066), stroke: 1pt, mark: arr)
  lab(364, 1002, $P$)
  // D
  line(p(291, 1125), p(334, 1125), stroke: 0.6pt, mark: (start: "stealth", fill: black, scale: 0.45))
  line(p(366, 1125), p(407, 1125), stroke: 0.6pt, mark: (end: "stealth", fill: black, scale: 0.45))
  lab(350, 1125, $D$)
  // h
  line(p(228, 1142), p(228, 1157), stroke: 0.6pt, mark: arr)
  line(p(228, 1217), p(228, 1187), stroke: 0.6pt, mark: arr)
  line(p(213, 1159), p(243, 1159), stroke: 0.6pt)
  line(p(240, 1185), p(318, 1185), stroke: (thickness: 0.6pt, dash: "dashed"))
  lab(213, 1172, $h$)
  // d
  line(p(300, 1197), p(300, 1235), stroke: 0.6pt)
  line(p(399, 1197), p(399, 1235), stroke: 0.6pt)
  line(p(300, 1227), p(337, 1227), stroke: 0.6pt, mark: (start: "stealth", fill: black, scale: 0.45))
  line(p(362, 1227), p(399, 1227), stroke: 0.6pt, mark: (end: "stealth", fill: black, scale: 0.45))
  lab(349, 1227, $d$)
})
