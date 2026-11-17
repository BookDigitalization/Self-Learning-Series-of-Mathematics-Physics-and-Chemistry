// 复习题三附图（原书 p.219–222）：第 2、3 题、第 4 题、第 6 题、第 9 题、第 12 题、第 14 题、第 15 题（第 8 题见 rev3b-8.typ）
// 全部 CeTZ 重绘。第 6 题 (a)(b) 图里磁极上的字母在扫描里模糊，按 N、S 读（原图左极像“V”）。
// 坐标：第 2、3 题和第 4 题是 220 dpi 局部图的像素坐标；第 6、12、14、15 题是原页 130 dpi 渲染图的像素坐标；第 9 题是 200 dpi 局部图的像素坐标。
#import "fig3b-lib.typ": *

// 第 2、3 题：环形电流和磁针（局部图，画布原点 (200, 0)）
#let fig-rev-3b-2(width: 3.5cm) = px-canvas(260, 430, origin: (200, 0), width: width, (p, u) => {
  import cetz.draw: *
  // 环形导线：椭圆弧，上方留缺口
  let pts = ()
  for k in range(0, 331, step: 6) {
    let a = (105 + k) * 1deg
    pts.push((313 + 88 * calc.cos(a), 192 - 108 * calc.sin(a)))
  }
  line(..pts.map(q => p(..q)), stroke: 1.4pt)
  line(p(301, 86), p(310, 52), stroke: 1.4pt)
  line(p(352, 86), p(366, 52), stroke: 1.4pt)
  lab(p, 278, 40, [−], size: 11pt)
  lab(p, 398, 40, [+], size: 11pt)
  // 悬挂的磁针
  rect(p(310, 93), p(372, 101), fill: luma(160), stroke: 0.8pt)
  line(p(335, 101), p(335, 165), stroke: 0.9pt)
  line(p(335, 163), p(335, 210), p(268, 187), close: true, fill: white, stroke: 0.9pt)
  line(p(338, 168), p(338, 207), p(392, 187), close: true, fill: black, stroke: 0.9pt)
  lab(p, 255, 188, $S$, size: 9pt)
  lab(p, 410, 188, $N$, size: 9pt)
  // 环里的电流 I
  ar(p, (362, 262), (308, 268), st: 1.1pt)
  lab(p, 342, 236, $I$, size: 9pt)
  // 下面的磁针
  line(p(330, 340), p(330, 380), p(268, 360), close: true, fill: white, stroke: 0.9pt)
  line(p(333, 342), p(333, 378), p(386, 360), close: true, fill: black, stroke: 0.9pt)
  line(p(331, 380), p(331, 395), stroke: 0.9pt)
  rect(p(320, 393), p(342, 399), fill: black, stroke: none)
  lab(p, 255, 355, $S$, size: 9pt)
  lab(p, 418, 358, $N$, size: 9pt)
})

// 第 4 题：烧杯里漂着带锌片、铜片的软木塞，上接小铜线圈（局部图 441×500）
#let fig-rev-3b-4(width: 3.7cm) = px-canvas(441, 330, origin: (0, 20), width: width, (p, u) => {
  import cetz.draw: *
  // 烧杯
  line(p(36, 213), p(52, 213), p(52, 350), p(60, 362), p(395, 362), p(405, 350), p(405, 215), p(418, 215), stroke: 1.8pt)
  // 液体（短横线）
  for (y, x0, x1) in ((236, 58, 175), (236, 275, 400), (252, 58, 160), (252, 285, 400), (270, 58, 200), (270, 255, 400), (290, 58, 195), (290, 258, 400), (310, 58, 400), (330, 58, 400)) {
    line(p(x0, y), p(x1, y), stroke: 0.5pt)
  }
  // 软木塞（斜线）、锌片和铜片
  rect(p(177, 208), p(272, 258), fill: white, stroke: 1.2pt)
  for i in range(14) {
    let x = 181 + i * 6.6
    line(p(x, 258), p(calc.min(x + 40, 272), 258 - calc.min(x + 40, 272) + x), stroke: 0.5pt)
  }
  line(p(200, 258), p(200, 300), stroke: 1pt)
  line(p(250, 258), p(250, 300), stroke: 1pt)
  // 铜线圈
  pl(p, (200, 208), (200, 188), (148, 185), (148, 92), (152, 72), (186, 66), st: 1.1pt)
  for x in (200, 232, 266) { circle(p(x, 82), radius: (11, 20), stroke: 1.1pt) }
  pl(p, (276, 66), (305, 70), (313, 92), (313, 185), (250, 188), (250, 208), st: 1.1pt)
})

// 第 6 题：四种情况下的通电线圈和磁极（原页坐标，画布原点 (165, 1115)）
#let fig-rev-3b-6(width: 11.5cm) = px-canvas(740, 190, origin: (165, 1115), width: width, (p, u) => {
  import cetz.draw: *
  // ox：相对 (a) 图的横向位移；dir：左侧引线电流向下（"down"）或向上（"up"）
  let panel(ox, dir) = {
    // 磁极：凹面朝向线圈
    line(p(173 + ox, 1167), p(208 + ox, 1167), p(196 + ox, 1208), p(208 + ox, 1250), p(173 + ox, 1250), close: true, fill: luma(220), stroke: 1pt)
    line(p(298 + ox, 1167), p(335 + ox, 1167), p(335 + ox, 1250), p(298 + ox, 1250), p(310 + ox, 1208), close: true, fill: luma(220), stroke: 1pt)
    // 线圈
    pl(p, (237 + ox, 1128), (237 + ox, 1170), (218 + ox, 1170), (218 + ox, 1248), (285 + ox, 1248), (285 + ox, 1170), (259 + ox, 1170), (259 + ox, 1128), st: 1.1pt)
    if dir == "down" {
      ar(p, (237 + ox, 1130), (237 + ox, 1160), scale: 0.45)
      ar(p, (259 + ox, 1166), (259 + ox, 1134), scale: 0.45)
    } else {
      ar(p, (237 + ox, 1166), (237 + ox, 1134), scale: 0.45)
      ar(p, (259 + ox, 1130), (259 + ox, 1160), scale: 0.45)
    }
  }
  panel(0, "down")
  panel(190, "down")
  panel(392, "up")
  panel(587, "up")
  lab(p, 190, 1210, $N$, size: 9pt)
  lab(p, 321, 1210, $S$, size: 9pt)
  lab(p, 380, 1210, $N$, size: 9pt)
  lab(p, 511, 1210, $S$, size: 9pt)
  // (c)：F₁ 在左极侧向外，F₂ 在右极侧向外
  ar(p, (610, 1205), (592, 1218), scale: 0.45)
  lab(p, 598, 1196, $F_1$, size: 8.5pt)
  ar(p, (675, 1210), (694, 1198), scale: 0.45)
  lab(p, 686, 1222, $F_2$, size: 8.5pt)
  // (d)：F₁、F₂ 在线圈内
  ar(p, (806, 1207), (827, 1192), scale: 0.45)
  lab(p, 830, 1180, $F_1$, size: 8.5pt)
  ar(p, (869, 1205), (850, 1218), scale: 0.45)
  lab(p, 841, 1228, $F_2$, size: 8.5pt)
  lab(p, 255, 1278, $(a)$, size: 9pt)
  lab(p, 445, 1278, $(b)$, size: 9pt)
  lab(p, 645, 1278, $(c)$, size: 9pt)
  lab(p, 835, 1278, $(d)$, size: 9pt)
})

// 第 9 题：磁力线和直导线 AB（200 dpi 局部图，画布原点 (0, 560)）
#let fig-rev-3b-9(width: 4.6cm) = px-canvas(555, 420, origin: (0, 560), width: width, (p, u) => {
  import cetz.draw: *
  for y in (590, 672, 752, 828, 893, 953) { ar(p, (45, y), (530, y), st: 1pt, scale: 0.5) }
  rect(p(250, 590), p(278, 955), radius: 12, fill: white, stroke: 1.1pt)
  for y in (603, 787, 940) { circle(p(264, y), radius: 3.5, fill: black, stroke: none) }
  ar(p, (264, 735), (264, 672), st: 2.5pt, scale: 0.6)
  lab(p, 232, 625, $A$, size: 9pt)
  lab(p, 236, 702, $I$, size: 9pt)
  lab(p, 229, 787, $O$, size: 9pt)
  lab(p, 232, 940, $B$, size: 9pt)
})

// 第 12 题：电流计 G 和 R₁、R₂、R₃ 组成的多量程伏特计（原页坐标，画布原点 (285, 205)）
#let fig-rev-3b-12(width: 7.6cm) = px-canvas(520, 180, origin: (285, 205), width: width, (p, u) => {
  import cetz.draw: *
  circle(p(390, 243), radius: 24, stroke: 1pt)
  lab(p, 390, 243, $G$, size: 9pt)
  pl(p, (297, 335), (297, 243), (366, 243))
  pl(p, (414, 243), (462, 243))
  zig(p, 462, 512, 243, n: 4, lead: 0, amp: 6)
  pl(p, (512, 243), (572, 243))
  zig(p, 572, 622, 243, n: 4, lead: 0, amp: 6)
  pl(p, (622, 243), (700, 243))
  zig(p, 700, 745, 243, n: 4, lead: 0, amp: 6)
  pl(p, (745, 243), (790, 243), (790, 326))
  pl(p, (540, 243), (540, 330))
  pl(p, (652, 243), (652, 330))
  node(p, 540, 243, r: 2.5)
  node(p, 652, 243, r: 2.5)
  for (x, y) in ((297, 339), (540, 334), (652, 334), (790, 330)) {
    circle(p(x, y), radius: 4, fill: white, stroke: 0.9pt)
  }
  lab(p, 487, 222, $R_1$, size: 8.5pt)
  lab(p, 598, 222, $R_2$, size: 8.5pt)
  lab(p, 722, 222, $R_3$, size: 8.5pt)
  lab(p, 297, 361, [+], size: 10pt)
  lab(p, 538, 357, [1.5伏特], size: 8.5pt)
  lab(p, 653, 355, [3伏特], size: 8.5pt)
  lab(p, 785, 351, [15伏特], size: 8.5pt)
})

// 第 14 题：串联电阻 R₁、R₂（原页坐标，画布原点 (335, 1235)）
#let fig-rev-3b-14(width: 7cm) = px-canvas(440, 60, origin: (335, 1235), width: width, (p, u) => {
  import cetz.draw: *
  pl(p, (343, 1252), (400, 1252), (430, 1252))
  ar(p, (343, 1252), (372, 1252), scale: 0.5)
  zig(p, 430, 540, 1252, n: 6, lead: 0, amp: 6)
  pl(p, (540, 1252), (603, 1252))
  zig(p, 603, 665, 1252, n: 5, lead: 0, amp: 6)
  pl(p, (665, 1252), (765, 1252))
  ar(p, (720, 1252), (765, 1252), scale: 0.5)
  node(p, 400, 1252)
  node(p, 570, 1252)
  node(p, 697, 1252)
  lab(p, 398, 1272, $A$, size: 8.5pt)
  lab(p, 485, 1272, $R_1$, size: 8.5pt)
  lab(p, 568, 1272, $C$, size: 8.5pt)
  lab(p, 633, 1272, $R_2$, size: 8.5pt)
  lab(p, 695, 1272, $B$, size: 8.5pt)
})

// 第 15 题：有两个量度范围的安培计的内部接线（原页坐标，画布原点 (325, 305)）
#let fig-rev-3b-15(width: 6.2cm) = px-canvas(350, 270, origin: (325, 305), width: width, (p, u) => {
  import cetz.draw: *
  circle(p(481, 365), radius: 36, stroke: 1pt)
  zig(p, 450, 512, 365, n: 4, lead: 0.1, amp: 6)
  pl(p, (445, 365), (342, 365), (342, 463))
  pl(p, (517, 365), (628, 365), (628, 463))
  zig(p, 342, 484, 463, n: 5, lead: 0.28, amp: 6)
  zig(p, 484, 628, 463, n: 5, lead: 0.28, amp: 6)
  pl(p, (342, 463), (342, 530))
  pl(p, (484, 463), (484, 530))
  pl(p, (628, 463), (628, 530))
  node(p, 342, 463, r: 2.5)
  node(p, 484, 463, r: 2.5)
  node(p, 628, 463, r: 2.5)
  for x in (342, 484, 628) { circle(p(x, 534), radius: 4, fill: white, stroke: 0.9pt) }
  lab(p, 482, 318, $R_g$, size: 9pt)
  lab(p, 410, 440, $R_1$, size: 8.5pt)
  lab(p, 558, 440, $R_2$, size: 8.5pt)
  lab(p, 342, 553, [+], size: 10pt)
  lab(p, 479, 553, [10安培], size: 8.5pt)
  lab(p, 630, 553, [1安培], size: 8.5pt)
})
