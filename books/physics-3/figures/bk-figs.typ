// 书末插图（总复习题 p.352–360 的附图），除第 47 题（位图）外全部用 CeTZ 重绘。
// 坐标是原书页面 150 dpi 的像素坐标（y 向下），位置、比例为目测近似，元件连接关系、字母、数字照原图。
#import "/common/series.typ": *
#import cetz.draw: *

#let T = 1.1pt           // 导线
#let t = 0.7pt           // 细线
#let ar(s: 0.55) = (end: "stealth", fill: black, scale: s)
#let lab(p, x, y, body, size: 9pt) = content(p(x, y), anchor: "center", text(size: size, body))

// ───────── 元件符号 ─────────
// 电阻（锯齿线），a、b 为锯齿部分的两端
#let zz(p, a, b, n: 5, amp: 6) = {
  let dx = b.at(0) - a.at(0)
  let dy = b.at(1) - a.at(1)
  let len = calc.sqrt(dx * dx + dy * dy)
  let ux = dx / len
  let uy = dy / len
  let pts = (p(a.at(0), a.at(1)),)
  for i in range(1, 2 * n) {
    let s = if calc.rem(i, 2) == 1 { 1 } else { -1 }
    let f = i / (2 * n)
    pts.push(p(a.at(0) + dx * f - uy * amp * s, a.at(1) + dy * f + ux * amp * s))
  }
  pts.push(p(b.at(0), b.at(1)))
  line(..pts, stroke: 0.9pt)
}
// 导线折线
#let wire(p, ..pts) = line(..pts.pos().map(q => p(q.at(0), q.at(1))), stroke: T)
// 节点黑点、开口接线柱
#let dot(p, x, y) = circle(p(x, y), radius: 3.5, fill: black, stroke: none)
#let term(p, x, y) = circle(p(x, y), radius: 4, fill: white, stroke: t)
// 电池符号：极板与导线垂直；第一片长、第二片短，依次交替；(x, y) 是第一片的位置
#let batt(p, x, y, cells: 1, vert: false) = {
  for i in range(cells * 2) {
    let o = i * 6
    let h = if calc.rem(i, 2) == 0 { 11 } else { 6 }
    let w = if calc.rem(i, 2) == 0 { 1pt } else { 2.2pt }
    if vert {
      line(p(x - h, y + o), p(x + h, y + o), stroke: w)
    } else {
      line(p(x + o, y - h), p(x + o, y + h), stroke: w)
    }
  }
}
// 圆圈仪表、灯泡
#let meter(p, x, y, body, r: 22) = {
  circle(p(x, y), radius: r, stroke: T, fill: white)
  content(p(x, y), anchor: "center", text(size: 9pt, body))
}
#let lamp(p, x, y, r: 20) = {
  circle(p(x, y), radius: r, stroke: T, fill: white)
  let k = r * 0.7
  line(p(x - k, y - k), p(x + k, y + k), stroke: t)
  line(p(x - k, y + k), p(x + k, y - k), stroke: t)
}
// 线圈（几圈斜椭圆），沿水平或竖直方向
#let loops(p, x0, x1, y, n: 4, ry: 22) = {
  let step = (x1 - x0) / n
  for i in range(n) {
    circle(p(x0 + step * (i + 0.5), y), radius: (step * 0.45, ry), stroke: 0.9pt)
  }
}
// 铁心：带横线的矩形
#let core(p, x0, y0, x1, y1, lines: 4) = {
  rect(p(x0, y0), p(x1, y1), stroke: T, fill: white)
  for i in range(1, lines) {
    let yy = y0 + (y1 - y0) * i / lines
    line(p(x0, yy), p(x1, yy), stroke: 0.4pt)
  }
}
// 标注：粗体字母
#let bl(p, x, y, body) = lab(p, x, y, text(weight: "bold", body))

// ───────── 总复习题 第 9 题 p.352 ─────────
#let bk-r09(width: 7.2cm) = px-canvas(470, 260, origin: (130, 440), width: width, (p, u) => {
  rect(p(170, 455), p(535, 478), stroke: T)
  rect(p(170, 600), p(535, 625), stroke: T)
  for x in (215, 300, 385, 470) {
    lab(p, x, 467, text(weight: "bold")[−], size: 10pt)
    lab(p, x, 613, text(weight: "bold")[+], size: 10pt)
  }
  circle(p(172, 540), radius: 4, fill: black, stroke: none)
  bezier(p(172, 540), p(530, 598), p(420, 538), p(500, 560), stroke: T)
  lab(p, 158, 517, $-e$, size: 10pt)
  // 间距 1 厘米
  line(p(553, 528), p(553, 480), stroke: 0.8pt, mark: ar(s: 0.5))
  line(p(553, 552), p(553, 598), stroke: 0.8pt, mark: ar(s: 0.5))
  line(p(538, 478), p(570, 478), stroke: t)
  line(p(538, 600), p(570, 600), stroke: t)
  lab(p, 553, 540, [1厘米], size: 9pt)
  // 板长 5 厘米
  line(p(172, 645), p(172, 675), stroke: t)
  line(p(530, 645), p(530, 675), stroke: t)
  line(p(172, 660), p(300, 660), stroke: 0.8pt)
  line(p(400, 660), p(530, 660), stroke: 0.8pt, mark: ar(s: 0.5))
  line(p(300, 660), p(172, 660), stroke: 0.8pt, mark: ar(s: 0.5))
  lab(p, 350, 660, [5厘米], size: 9pt)
})

// ───────── 第 17 题 p.353（平行板电容器）─────────
#let bk-r17(width: 7.2cm) = px-canvas(470, 290, origin: (630, 410), width: width, (p, u) => {
  rect(p(672, 426), p(704, 628), stroke: T)
  rect(p(1010, 426), p(1042, 628), stroke: T)
  for y in (462, 520, 585) {
    lab(p, 688, y, text(weight: "bold")[+], size: 10pt)
    lab(p, 1026, y - 1, text(weight: "bold")[−], size: 10pt)
  }
  for y in (445, 496, 548, 605) {
    line(p(704, y), p(1010, y), stroke: 0.8pt, mark: ar(s: 0.5))
  }
  for (x, n) in ((778, $M$), (856, $N$), (935, $P$)) {
    circle(p(x, 548), radius: 3, fill: black, stroke: none)
    lab(p, x, 527, n, size: 10pt)
  }
  lab(p, 655, 512, $A$, size: 10pt)
  lab(p, 1054, 513, $B$, size: 10pt)
  // B 板接地
  line(p(1042, 540), p(1066, 540), p(1066, 655), stroke: T)
  line(p(1050, 656), p(1082, 656), stroke: 1pt)
  line(p(1056, 664), p(1076, 664), stroke: 1pt)
  line(p(1061, 672), p(1071, 672), stroke: 1pt)
  // 距离 d
  line(p(700, 645), p(700, 665), stroke: t)
  line(p(1010, 645), p(1010, 665), stroke: t)
  line(p(700, 655), p(840, 655), stroke: 0.8pt, mark: ar(s: 0.5))
  line(p(878, 655), p(1010, 655), stroke: 0.8pt, mark: ar(s: 0.5))
  line(p(840, 655), p(700, 655), stroke: 0.8pt, mark: ar(s: 0.5))
  lab(p, 858, 655, $d$, size: 10pt)
})

// ───────── 第 18 题 p.353 ─────────
#let bk-r18(width: 5.4cm) = px-canvas(350, 160, origin: (150, 925), width: width, (p, u) => {
  term(p, 192, 967)
  wire(p, (196, 967), (285, 967))
  zz(p, (285, 967), (380, 967), n: 5)
  wire(p, (380, 967), (455, 967), (455, 985))
  zz(p, (455, 985), (455, 1040), n: 4)
  wire(p, (455, 1040), (455, 1080), (380, 1080))
  zz(p, (380, 1080), (285, 1080), n: 5)
  wire(p, (285, 1080), (196, 1080))
  term(p, 192, 1080)
  lab(p, 166, 965, text(weight: "bold", style: "italic")[A], size: 10pt)
  lab(p, 166, 1092, text(weight: "bold", style: "italic")[B], size: 10pt)
  lab(p, 473, 960, $C$, size: 10pt)
  lab(p, 475, 1087, $D$, size: 10pt)
  lab(p, 338, 940, $bold(R)_1$, size: 9pt)
  lab(p, 338, 1056, $bold(R)_2$, size: 9pt)
  lab(p, 483, 1012, $bold(R)_3$, size: 9pt)
  lab(p, 238, 990, text(weight: "bold", style: "italic")[I], size: 9pt)
})

// ───────── 第 20 题 p.353 ─────────
#let bk-r20(width: 7.2cm) = px-canvas(480, 250, origin: (630, 1300), width: width, (p, u) => {
  wire(p, (655, 1383), (700, 1383))
  zz(p, (700, 1383), (772, 1383), n: 4)
  wire(p, (772, 1383), (850, 1383))
  // 并联部分
  wire(p, (850, 1383), (895, 1352), (910, 1352))
  zz(p, (910, 1352), (985, 1352), n: 4)
  wire(p, (985, 1352), (1032, 1383), (1065, 1383))
  wire(p, (850, 1383), (895, 1418), (910, 1418))
  zz(p, (910, 1418), (985, 1418), n: 4)
  wire(p, (985, 1418), (1035, 1383))
  // 外框与电池
  wire(p, (655, 1383), (655, 1505), (835, 1505))
  batt(p, 838, 1505)
  wire(p, (850, 1505), (1080, 1505), (1080, 1383), (1065, 1383))
  for (x, n) in ((655, $A$), (812, $B$), (1065, $C$)) { dot(p, x, 1383); lab(p, x - 2, 1363, n, size: 10pt) }
  wire(p, (772, 1383), (812, 1383))
  lab(p, 740, 1358, [2欧姆], size: 8.5pt)
  lab(p, 947, 1325, [3欧姆], size: 8.5pt)
  lab(p, 947, 1392, [6欧姆], size: 8.5pt)
  lab(p, 868, 1348, $I_1$, size: 10pt)
  lab(p, 868, 1421, $I_2$, size: 10pt)
  lab(p, 671, 1445, $I$, size: 10pt)
  line(p(655, 1428), p(655, 1470), stroke: 0.8pt, mark: ar(s: 0.5))
})

// ───────── 第 21 题 p.354 ─────────
#let bk-r21(width: 8.6cm) = px-canvas(520, 240, origin: (300, 280), width: width, (p, u) => {
  wire(p, (345, 362), (345, 310), (545, 310))
  batt(p, 545, 310)
  wire(p, (557, 310), (782, 310), (782, 358))
  meter(p, 345, 390, $A_1$, r: 28)
  meter(p, 778, 385, $A_2$, r: 28)
  wire(p, (345, 418), (345, 463), (433, 463))
  wire(p, (433, 463), (433, 433), (462, 433))
  zz(p, (462, 433), (540, 433), n: 5)
  wire(p, (540, 433), (563, 433), (563, 463))
  wire(p, (433, 463), (433, 492), (563, 492), (563, 463))
  wire(p, (563, 463), (625, 463))
  zz(p, (625, 463), (720, 463), n: 6)
  wire(p, (720, 463), (757, 463), (782, 463), (782, 413))
  for (x, y, n) in ((433, 463, $A$), (563, 463, $B$), (757, 463, $C$)) { dot(p, x, y) }
  lab(p, 418, 481, $A$, size: 10pt)
  lab(p, 578, 480, $B$, size: 10pt)
  lab(p, 762, 478, $C$, size: 10pt)
  lab(p, 500, 407, $R_1 = 5$ + [欧姆], size: 8.5pt)
  lab(p, 668, 436, $R_2 = 7$ + [欧姆], size: 8.5pt)
})

// ───────── 第 23 题 p.354 ─────────
#let bk-r23(width: 8.4cm) = px-canvas(500, 270, origin: (120, 870), width: width, (p, u) => {
  wire(p, (148, 1112), (148, 997))
  batt(p, 148, 955, cells: 3, vert: true)
  wire(p, (148, 955), (148, 900), (200, 900))
  zz(p, (200, 900), (270, 900), n: 4)
  wire(p, (270, 900), (578, 900))
  wire(p, (148, 1112), (578, 1112))
  lab(p, 232, 922, $bold(R)_1$, size: 9pt)
  lab(p, 181, 968, $cal(E)$, size: 11pt)
  // 支路 R2（K1）
  wire(p, (330, 900), (330, 930))
  line(p(330, 930), p(358, 962), stroke: T)
  wire(p, (330, 965), (330, 992))
  zz(p, (330, 992), (330, 1072), n: 4)
  wire(p, (330, 1072), (330, 1112))
  lab(p, 378, 934, $bold(K)_1$, size: 9pt)
  lab(p, 354, 1050, $bold(R)_2$, size: 9pt)
  // 支路 A、R3
  wire(p, (418, 900), (418, 947))
  meter(p, 418, 972, $A$, r: 25)
  wire(p, (418, 997), (418, 1002))
  zz(p, (418, 1002), (418, 1078), n: 4)
  wire(p, (418, 1078), (418, 1112))
  lab(p, 441, 1050, $bold(R)_3$, size: 9pt)
  // 支路 R4（K2）
  wire(p, (497, 900), (497, 930))
  line(p(497, 930), p(525, 962), stroke: T)
  wire(p, (497, 965), (497, 992))
  zz(p, (497, 992), (497, 1072), n: 4)
  wire(p, (497, 1072), (497, 1112))
  lab(p, 552, 934, $bold(K)_2$, size: 9pt)
  lab(p, 524, 1050, $bold(R)_4$, size: 9pt)
  // 伏特计 V
  wire(p, (578, 900), (578, 947))
  meter(p, 578, 972, $V$, r: 25)
  wire(p, (578, 997), (578, 1112))
  for x in (330, 418, 497) { dot(p, x, 900); dot(p, x, 1112) }
})

// ───────── 第 26 题 p.354 ─────────
#let bk-r26(width: 8.6cm) = px-canvas(560, 230, origin: (490, 1410), width: width, (p, u) => {
  wire(p, (508, 1483), (580, 1483))
  wire(p, (580, 1452), (580, 1522))
  wire(p, (580, 1452), (648, 1452))
  wire(p, (580, 1522), (648, 1522))
  lamp(p, 668, 1452)
  lamp(p, 668, 1522)
  wire(p, (688, 1452), (750, 1452), (750, 1522), (688, 1522))
  wire(p, (750, 1483), (797, 1483))
  wire(p, (797, 1452), (797, 1522))
  wire(p, (797, 1452), (860, 1452))
  wire(p, (797, 1522), (860, 1522))
  lamp(p, 880, 1452)
  lamp(p, 880, 1522)
  wire(p, (900, 1452), (955, 1452), (955, 1522), (900, 1522))
  wire(p, (955, 1483), (1027, 1483))
  wire(p, (508, 1483), (508, 1603))
  wire(p, (1027, 1483), (1027, 1603))
  dot(p, 580, 1483)
  dot(p, 775, 1483)
  dot(p, 955, 1483)
  lab(p, 706, 1433, $A$, size: 10pt)
  lab(p, 911, 1431, $B$, size: 10pt)
  lab(p, 702, 1531, $C$, size: 10pt)
  lab(p, 911, 1531, $D$, size: 10pt)
  line(p(508, 1585), p(700, 1585), stroke: 0.8pt, mark: ar(s: 0.5))
  line(p(820, 1585), p(1027, 1585), stroke: 0.8pt, mark: ar(s: 0.5))
  line(p(700, 1585), p(508, 1585), stroke: 0.8pt, mark: ar(s: 0.5))
  lab(p, 765, 1584, [220伏特], size: 8.5pt)
})

// ───────── 第 32 题 p.355 ─────────
#let bk-r32(width: 4.6cm) = px-canvas(260, 400, origin: (840, 1085), width: width, (p, u) => {
  wire(p, (878, 1118), (930, 1118))
  zz(p, (930, 1118), (1000, 1118), n: 4)
  wire(p, (1000, 1118), (1052, 1118), (1052, 1185))
  zz(p, (1052, 1185), (1052, 1250), n: 4)
  wire(p, (1052, 1250), (1052, 1305))
  wire(p, (878, 1118), (878, 1175))
  zz(p, (878, 1175), (878, 1250), n: 4)
  wire(p, (878, 1250), (878, 1305))
  wire(p, (878, 1305), (930, 1305))
  zz(p, (930, 1305), (1000, 1305), n: 4)
  wire(p, (1000, 1305), (1052, 1305))
  wire(p, (878, 1305), (885, 1320))
  zz(p, (885, 1320), (958, 1442), n: 5)
  wire(p, (1052, 1305), (1045, 1320))
  zz(p, (1045, 1320), (962, 1442), n: 5)
  dot(p, 878, 1305)
  dot(p, 1052, 1305)
  lab(p, 865, 1118, $E$, size: 10pt)
  lab(p, 1068, 1118, $D$, size: 10pt)
  lab(p, 858, 1305, $A$, size: 10pt)
  lab(p, 1070, 1305, $B$, size: 10pt)
  lab(p, 959, 1458, $C$, size: 10pt)
  lab(p, 967, 1096, $r$, size: 10pt)
  lab(p, 1072, 1220, $r$, size: 10pt)
  lab(p, 893, 1385, $r$, size: 10pt)
  lab(p, 1030, 1383, $r$, size: 10pt)
})

// ───────── 第 34 题 p.356（滑线电桥）─────────
#let bk-r34(width: 8.4cm) = px-canvas(500, 330, origin: (320, 420), width: width, (p, u) => {
  wire(p, (358, 596), (402, 560))
  zz(p, (402, 560), (520, 492), n: 6)
  wire(p, (520, 492), (568, 458))
  wire(p, (568, 458), (632, 492))
  zz(p, (632, 492), (722, 548), n: 6)
  wire(p, (722, 548), (770, 596))
  // 检流计和滑动接头
  wire(p, (568, 458), (568, 512))
  meter(p, 568, 533, $G$, r: 20)
  wire(p, (568, 553), (568, 570), (505, 573))
  wire(p, (505, 573), (493, 585))
  // 电阻线 ADC 和米尺
  line(p(358, 596), p(770, 596), stroke: 1.6pt)
  line(p(372, 628), p(755, 628), stroke: 0.8pt)
  for k in range(0, 11) {
    let x = 372 + k * 38.3
    line(p(x, 628), p(x, if calc.rem(k, 5) == 0 { 614 } else { 620 }), stroke: 0.8pt)
  }
  // 电池
  wire(p, (358, 596), (358, 690), (535, 690))
  batt(p, 538, 690)
  wire(p, (550, 690), (770, 690), (770, 596))
  lab(p, 343, 593, $A$, size: 10pt)
  lab(p, 568, 440, $B$, size: 10pt)
  lab(p, 782, 593, $C$, size: 10pt)
  lab(p, 475, 579, $D$, size: 10pt)
  lab(p, 438, 505, $R$, size: 10pt)
  lab(p, 693, 503, $R_x$, size: 10pt)
})

// ───────── 第 44 题 p.357（两个量程的伏特计）─────────
#let bk-r44(width: 8.6cm) = px-canvas(580, 200, origin: (350, 970), width: width, (p, u) => {
  wire(p, (380, 1115), (380, 1052), (463, 1052))
  term(p, 380, 1118)
  circle(p(505, 1052), radius: 42, stroke: T, fill: white)
  zz(p, (478, 1052), (532, 1052), n: 3, amp: 5)
  wire(p, (547, 1052), (610, 1052))
  zz(p, (610, 1048), (690, 1048), n: 4)
  wire(p, (690, 1048), (727, 1048))
  zz(p, (755, 1048), (830, 1048), n: 4)
  wire(p, (727, 1048), (755, 1048))
  wire(p, (830, 1048), (868, 1048), (868, 1112))
  wire(p, (727, 1048), (727, 1112))
  term(p, 727, 1115)
  term(p, 868, 1115)
  dot(p, 727, 1048)
  lab(p, 380, 1134, text(weight: "bold")[+], size: 11pt)
  lab(p, 505, 997, $bold(R)_g$, size: 9pt)
  lab(p, 648, 1022, $bold(R)_1$, size: 9pt)
  lab(p, 792, 1020, $bold(R)_2$, size: 9pt)
  lab(p, 730, 1141, [3伏特], size: 9pt)
  lab(p, 866, 1141, [15伏特], size: 9pt)
})

// ───────── 第 45 题 p.357（两个量程的安培计）─────────
#let bk-r45(width: 8.2cm) = px-canvas(480, 290, origin: (400, 1340), width: width, (p, u) => {
  circle(p(610, 1417), radius: 42, stroke: T, fill: white)
  zz(p, (583, 1417), (637, 1417), n: 3, amp: 5)
  wire(p, (568, 1417), (435, 1417), (435, 1535))
  wire(p, (652, 1417), (800, 1417), (800, 1535))
  wire(p, (435, 1535), (485, 1535))
  zz(p, (485, 1535), (560, 1535), n: 4)
  wire(p, (560, 1535), (613, 1535))
  wire(p, (613, 1535), (680, 1535))
  zz(p, (680, 1535), (752, 1535), n: 4)
  wire(p, (752, 1535), (800, 1535))
  wire(p, (613, 1535), (613, 1573))
  wire(p, (800, 1535), (800, 1573))
  wire(p, (435, 1535), (435, 1573))
  term(p, 613, 1578)
  term(p, 800, 1578)
  term(p, 435, 1578)
  dot(p, 435, 1535)
  dot(p, 613, 1535)
  dot(p, 800, 1535)
  lab(p, 435, 1602, text(weight: "bold")[+], size: 11pt)
  lab(p, 610, 1358, $bold(R)_g$, size: 9pt)
  lab(p, 520, 1511, $r_1$, size: 9pt)
  lab(p, 715, 1509, $r_2$, size: 9pt)
  lab(p, 612, 1603, [3安培], size: 9pt)
  lab(p, 797, 1601, [0.3安培], size: 9pt)
})

// ───────── 第 48 题 p.358 ─────────
#let bk-r48(width: 6.2cm) = px-canvas(380, 270, origin: (600, 550), width: width, (p, u) => {
  for (y0, y1, x1) in ((592, 618, 925), (637, 662, 925), (686, 709, 920), (735, 757, 920)) {
    line(p(620, y0), p(x1, y1), stroke: 0.8pt, mark: ar(s: 0.5))
  }
  // 导线 AB（带粗度的棒）
  line(p(668, 785), p(888, 585), stroke: 7pt)
  line(p(668, 785), p(888, 585), stroke: white + 5pt)
  line(p(700, 748), p(850, 612), stroke: 0.8pt, mark: ar(s: 0.5))
  lab(p, 645, 790, $A$, size: 10pt)
  lab(p, 910, 570, $B$, size: 10pt)
  lab(p, 742, 668, $I$, size: 10pt)
  lab(p, 941, 685, $H$, size: 10pt)
})

// ───────── 第 49 题 p.358 ─────────
#let bk-r49(width: 7cm) = px-canvas(420, 280, origin: (110, 1270), width: width, (p, u) => {
  wire(p, (130, 1318), (475, 1318))
  wire(p, (130, 1495), (475, 1495))
  wire(p, (130, 1318), (130, 1385))
  batt(p, 125, 1400, vert: true)
  wire(p, (130, 1413), (130, 1495))
  line(p(121, 1394), p(139, 1394), stroke: 1.8pt)
  line(p(121, 1406), p(139, 1406), stroke: 1.8pt)
  for y in (1295, 1357, 1413, 1468, 1522) {
    for x in (280, 322, 358, 395, 432, 467) {
      if not ((y == 1295 and x == 322) or (y == 1522 and x == 322)) {
        lab(p, x, y, text(weight: "bold")[×], size: 9pt)
      }
    }
  }
  line(p(343, 1285), p(343, 1528), stroke: T)
  lab(p, 338, 1295, $A$, size: 10pt)
  lab(p, 343, 1523, $B$, size: 10pt)
  lab(p, 158, 1370, text(weight: "bold")[+], size: 11pt)
  lab(p, 158, 1438, text(weight: "bold")[−], size: 11pt)
  lab(p, 497, 1412, $H$, size: 10pt)
})

// ───────── 第 50 题 p.358 ─────────
#let bk-r50(width: 7.4cm) = px-canvas(470, 220, origin: (590, 1310), width: width, (p, u) => {
  core(p, 610, 1367, 745, 1432)
  loops(p, 625, 740, 1400, n: 3, ry: 30)
  core(p, 902, 1367, 1030, 1432)
  loops(p, 915, 1020, 1400, n: 3, ry: 30)
  wire(p, (725, 1368), (735, 1325), (925, 1325), (930, 1368))
  wire(p, (620, 1432), (618, 1490))
  wire(p, (990, 1432), (1005, 1490))
  circle(p(825, 1400), radius: 22, stroke: T, fill: white)
  circle(p(825, 1400), radius: 4, fill: black, stroke: none)
  lab(p, 864, 1398, $I$, size: 10pt)
  line(p(825, 1427), p(825, 1485), stroke: 1pt, mark: ar(s: 0.6))
  lab(p, 828, 1503, $F$, size: 10pt)
  lab(p, 610, 1486, $A$, size: 10pt)
  lab(p, 1008, 1488, $B$, size: 10pt)
})

// ───────── 第 51 题 p.359 ─────────
#let bk-r51(width: 11cm) = px-canvas(700, 300, origin: (290, 365), width: width, (p, u) => {
  // (a)
  meter(p, 345, 480, $G$, r: 30)
  bezier(p(345, 450), p(522, 408), p(380, 410), p(470, 380), stroke: T)
  bezier(p(345, 510), p(505, 520), p(330, 600), p(450, 580), stroke: T)
  line(p(522, 408), p(548, 402), p(530, 428), p(545, 450), p(532, 470), p(545, 495), p(540, 525), p(505, 520), stroke: T)
  for y in (398, 432, 465, 500, 535) {
    for x in (468, 505, 540, 575) {
      circle(p(x, y), radius: 3, fill: black, stroke: none)
    }
  }
  line(p(548, 470), p(588, 472), stroke: 0.9pt, mark: ar(s: 0.5))
  lab(p, 594, 476, $v$, size: 10pt)
  lab(p, 515, 408, $B$, size: 10pt)
  lab(p, 513, 514, $A$, size: 10pt)
  lab(p, 447, 610, $(a)$, size: 10pt)
  // (b)
  rect(p(770, 430), p(882, 540), stroke: T)
  for y in (405, 460, 512, 562) {
    for x in (738, 792, 845, 897, 943) {
      lab(p, x, y, text(weight: "bold")[×], size: 9pt)
    }
  }
  line(p(885, 474), p(945, 474), stroke: 0.9pt, mark: ar(s: 0.5))
  lab(p, 962, 476, $v$, size: 10pt)
  lab(p, 758, 424, $A$, size: 10pt)
  lab(p, 896, 424, $D$, size: 10pt)
  lab(p, 757, 541, $B$, size: 10pt)
  lab(p, 896, 541, $C$, size: 10pt)
  lab(p, 828, 610, $(b)$, size: 10pt)
})

// ───────── 第 52 题 p.359 ─────────
#let bk-r52(width: 7.4cm) = px-canvas(440, 340, origin: (170, 820), width: width, (p, u) => {
  // 左螺线管、右螺线管（铁心用竖直虚线框表示）
  for x in (335, 440) {
    line(p(x - 22, 875), p(x - 22, 1115), stroke: (thickness: 0.7pt, dash: "dashed"))
    line(p(x + 22, 875), p(x + 22, 1115), stroke: (thickness: 0.7pt, dash: "dashed"))
    for k in range(4) {
      let y = 940 + k * 40
      circle(p(x, y), radius: (24, 9), stroke: 0.9pt, fill: none)
    }
  }
  line(p(335, 940), p(335, 895), stroke: 1pt, mark: ar(s: 0.6))
  line(p(440, 895), p(440, 940), stroke: 1pt, mark: ar(s: 0.6))
  // 磁力线（虚线椭圆）
  arc(p(345, 880), start: 180deg, stop: 0deg, radius: (50 * u, 45 * u), stroke: (thickness: 0.7pt, dash: "dashed"))
  // 左回路
  wire(p, (210, 905), (313, 905))
  wire(p, (210, 905), (210, 930))
  batt(p, 210, 925, vert: true)
  wire(p, (210, 949), (210, 1010))
  zz(p, (210, 1010), (210, 1090), n: 4)
  wire(p, (210, 1062), (313, 1062))
  line(p(210, 1062), p(238, 1062), stroke: 0.8pt)
  lab(p, 193, 937, text(weight: "bold")[−], size: 10pt)
  lab(p, 193, 985, text(weight: "bold")[+], size: 10pt)
  lab(p, 183, 1067, $R$, size: 10pt)
  // 右回路
  wire(p, (462, 905), (570, 905), (570, 956))
  meter(p, 570, 978, $G$, r: 22)
  wire(p, (570, 1000), (570, 1062), (462, 1062))
  lab(p, 574, 885, $A$, size: 10pt)
  lab(p, 568, 1078, $B$, size: 10pt)
})

// ───────── 第 54 题 p.359 ─────────
#let bk-r54(width: 6.6cm) = px-canvas(420, 300, origin: (700, 840), width: width, (p, u) => {
  core(p, 718, 962, 978, 1002, lines: 4)
  loops(p, 765, 935, 982, n: 4, ry: 28)
  wire(p, (770, 1002), (770, 1085), (800, 1085))
  batt(p, 805, 1085)
  wire(p, (817, 1085), (850, 1085))
  term(p, 855, 1085)
  line(p(855, 1085), p(895, 1062), stroke: T)
  wire(p, (898, 1085), (930, 1085), (930, 1002))
  lab(p, 862, 1056, $K$, size: 10pt)
  lab(p, 790, 1110, text(weight: "bold")[+], size: 10pt)
  lab(p, 836, 1110, text(weight: "bold")[−], size: 10pt)
  // 悬挂的金属环 A
  for i in range(7) {
    line(p(1022 + i * 10, 868), p(1014 + i * 10, 856), stroke: 0.7pt)
  }
  line(p(1015, 868), p(1088, 868), stroke: T)
  line(p(1052, 868), p(1052, 935), stroke: 0.9pt)
  circle(p(1052, 985), radius: (18, 50), stroke: T)
  lab(p, 1052, 1052, $A$, size: 10pt)
})

// ───────── 第 56 题 p.360 ─────────
#let bk-r56(width: 9cm) = px-canvas(520, 320, origin: (330, 200), width: width, (p, u) => {
  // 磁铁两极
  rect(p(345, 385), p(405, 505), stroke: T, fill: luma(225))
  rect(p(520, 382), p(580, 505), stroke: T, fill: luma(225))
  lab(p, 380, 442, $S$, size: 10pt)
  lab(p, 548, 442, $N$, size: 10pt)
  // 线框 ABCD
  line(p(457, 405), p(418, 405), p(418, 480), p(505, 480), p(505, 405), p(480, 405), stroke: T)
  lab(p, 421, 394, $A$, size: 10pt)
  lab(p, 513, 392, $D$, size: 10pt)
  lab(p, 421, 497, $B$, size: 10pt)
  lab(p, 510, 497, $C$, size: 10pt)
  // 导线
  wire(p, (457, 405), (457, 318), (765, 318))
  wire(p, (480, 405), (480, 345), (620, 345), (620, 470), (765, 470))
  // 螺线管与插入的磁铁
  core(p, 765, 302, 820, 490, lines: 8)
  for k in range(4) {
    circle(p(792, 335 + k * 45), radius: (30, 12), stroke: 0.9pt)
  }
  rect(p(777, 238), p(812, 285), stroke: T, fill: white)
  lab(p, 795, 262, $N$, size: 10pt)
  line(p(822, 232), p(822, 272), stroke: 1pt, mark: ar(s: 0.6))
  // 小磁针
  line(p(645, 352), p(690, 340), p(690, 365), close: true, stroke: T, fill: black)
  line(p(690, 340), p(735, 352), p(690, 365), close: true, stroke: T, fill: white)
  line(p(690, 365), p(690, 398), stroke: T)
  line(p(678, 398), p(702, 398), stroke: 2pt)
  lab(p, 643, 366, $N$, size: 10pt)
  lab(p, 741, 366, $S$, size: 10pt)
})

// ───────── 第 58 题 p.360 ─────────
#let bk-r58(width: 8.2cm) = px-canvas(480, 230, origin: (350, 955), width: width, (p, u) => {
  wire(p, (383, 1135), (383, 1012), (475, 1012))
  zz(p, (497, 1012), (575, 1012), n: 4)
  wire(p, (475, 1012), (497, 1012))
  wire(p, (575, 1012), (648, 1012))
  meter(p, 673, 1010, $M$, r: 25)
  wire(p, (698, 1012), (780, 1012), (780, 1135))
  meter(p, 527, 1065, $V$, r: 25)
  bezier(p(475, 1012), p(502, 1065), p(470, 1050), p(480, 1065), stroke: 0.9pt)
  bezier(p(595, 1012), p(552, 1065), p(595, 1050), p(580, 1065), stroke: 0.9pt)
  lab(p, 535, 985, $bold(R) = 7 bold(Omega)$, size: 9pt)
  line(p(385, 1135), p(520, 1135), stroke: 0.8pt, mark: ar(s: 0.5))
  line(p(780, 1135), p(600, 1135), stroke: 0.8pt, mark: ar(s: 0.5))
  lab(p, 560, 1134, [38伏特], size: 9pt)
  lab(p, 368, 1150, $A$, size: 10pt)
  lab(p, 795, 1150, $B$, size: 10pt)
})
