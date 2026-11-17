// 第 2 章其余 CeTZ 重绘图：图 2·4（p.81）、2·11（p.86）、2·13/2·14（p.90）、2·17（p.94）、2·20（p.96）、2·21（p.100）
// 习题 2·2 第 4 题附图（p.85）、习题 2·3(3) 第 6 题附图（p.96）。
// 坐标：图 2·4 是放大渲染图的像素坐标；其余是原页 130 dpi 渲染图（宽 1068）的像素坐标，origin 为图左上角。
#import "/common/series.typ": *
#import "fig2-sym.typ": jdot, lamp, battery, meter, zigzag, lw

#let wire(p, ..pts) = {
  import cetz.draw: *
  line(..pts.pos().map(q => p(q.at(0), q.at(1))), stroke: lw)
}
#let lab(p, x, y, body, size: 8pt, anc: "center") = {
  import cetz.draw: *
  content(p(x, y), anchor: anc, text(size: size, body))
}
#let arrow(p, a, b, st: 1pt) = {
  import cetz.draw: *
  line(p(a.at(0), a.at(1)), p(b.at(0), b.at(1)), stroke: st, mark: (end: "stealth", fill: black, scale: 0.45))
}

// ───── 图 2·4 电路组成部分的符号 ─────
#let fig-2-4(width: 11cm) = px-canvas(1560, 880, origin: (0, 40), width: width, (p, u) => {
  import cetz.draw: *
  let sz = 9pt
  let k = 2.3
  // 导线连接
  wire(p, (45, 135), (425, 135)); wire(p, (228, 82), (228, 195)); jdot(p, 228, 135, r: 14)
  wire(p, (45, 297), (425, 297)); wire(p, (423, 240), (423, 355)); jdot(p, 423, 297, r: 14)
  bezier(p(466, 135), p(490, 218), p(484, 135), p(478, 205), stroke: lw)
  bezier(p(490, 218), p(466, 298), p(478, 232), p(484, 298), stroke: lw)
  lab(p, 497, 205, [连接在一], size: sz, anc: "west")
  lab(p, 497, 245, [起的导线], size: sz, anc: "west")
  // 不相连接的交叉导线
  wire(p, (45, 460), (425, 460)); wire(p, (228, 400), (228, 517))
  lab(p, 465, 452, [不相连接的], size: sz, anc: "west")
  lab(p, 465, 497, [交叉的导线], size: sz, anc: "west")
  // 电池
  wire(p, (45, 622), (215, 622)); wire(p, (238, 622), (410, 622))
  wire(p, (215, 580), (215, 670))
  line(p(238, 600), p(238, 642), stroke: 3.5pt)
  lab(p, 415, 598, [电池；细长线表示正], size: sz, anc: "west")
  lab(p, 415, 650, [极，粗短线表示负极], size: sz, anc: "west")
  // 电池组
  wire(p, (45, 780), (182, 780)); wire(p, (283, 780), (410, 780))
  for (x, long) in ((182, true), (200, false), (225, true), (243, false), (265, true), (283, false)) {
    if long { wire(p, (x, 735), (x, 830)) } else { line(p(x, 760), p(x, 805), stroke: 3.5pt) }
  }
  lab(p, 430, 785, [电池组], size: sz, anc: "west")
  // 发电机、电动机
  for (y, ch, name) in ((135, $G$, [发电机]), (292, $M$, [电动机])) {
    wire(p, (935, y), (1035, y), (1100, y - 57))
    circle(p(1107, y), radius: 45, fill: white, stroke: lw)
    wire(p, (1100, y + 55), (1175, y), (1290, y))
    lab(p, 1107, y, ch, size: sz)
    lab(p, 1295, y, name, size: sz, anc: "west")
  }
  // 电灯
  wire(p, (920, 460), (1065, 460)); wire(p, (1152, 460), (1290, 460)); lamp(p, 1108, 460, r: 45)
  lab(p, 1300, 460, [电灯], size: sz, anc: "west")
  // 电键
  wire(p, (935, 655), (1062, 655)); wire(p, (1055, 610), (1180, 657), (1290, 657))
  line(p(1062, 603), p(1088, 612), stroke: 3pt)
  lab(p, 1310, 650, [电键], size: sz, anc: "west")
  // 电铃
  wire(p, (920, 745), (1290, 745))
  wire(p, (1080, 745), (1080, 808), (1145, 808), (1145, 745))
  circle(p(1108, 825), radius: 12, fill: white, stroke: lw)
  lab(p, 1315, 745, [电铃], size: sz, anc: "west")
})

// ───── 图 2·11 研究电流和电压的关系 ─────
#let fig-2-11(width: 5.6cm) = px-canvas(390, 300, origin: (105, 315), width: width, (p, u) => {
  import cetz.draw: *
  // 电流表、电压表（带刻度盘的方盒）
  let box(x0, y0, x1, y1, letter) = {
    rect(p(x0, y0), p(x1, y1), fill: white, stroke: lw)
    arc(p((x0 + x1) / 2 - 22, y0 + 40), start: 30deg, stop: 150deg, radius: 26, stroke: 0.7pt)
    circle(p((x0 + x1) / 2, y1 - 15), radius: 8, stroke: lw)
    content(p((x0 + x1) / 2, y0 + 33), anchor: "center", text(size: 7.5pt, math.italic(letter)))
    circle(p(x0 + 8, y1 + 8), radius: 3.5, fill: white, stroke: lw)
    circle(p(x1 - 8, y1 + 8), radius: 3.5, fill: white, stroke: lw)
  }
  box(148, 395, 242, 468, $A$)
  box(345, 350, 443, 425, $V$)
  lab(p, 195, 380, [电流表], size: 8pt)
  lab(p, 395, 333, [电压表], size: 8pt)
  // 回路
  wire(p, (156, 476), (122, 476), (122, 578), (212, 578))
  battery(p, 220, 578, n: 3, h: 13, pitch: 10, gap: 5)
  wire(p, (256, 578), (466, 578), (466, 480))
  arrow(p, (466, 530), (466, 556))
  wire(p, (234, 476), (292, 480))
  arrow(p, (255, 479), (275, 479))
  wire(p, (353, 433), (292, 433), (292, 480))
  wire(p, (435, 433), (466, 433), (466, 480))
  // 导线圈
  for i in range(11) {
    circle(p(300 + i * 15.5, 480), radius: 8, stroke: 0.9pt)
  }
  wire(p, (292, 480), (298, 480))
  wire(p, (462, 480), (466, 480))
  jdot(p, 292, 480, r: 4); jdot(p, 466, 480, r: 4)
  arrow(p, (122, 482), (122, 482))
  lab(p, 135, 497, $I$, size: 8pt)
  lab(p, 292, 497, $P$, size: 8pt); lab(p, 480, 490, $Q$, size: 8pt)
  lab(p, 375, 508, [导线圈], size: 8pt)
  lab(p, 238, 548, [电池组], size: 8pt)
})

// ───── 图 2·13、2·14 电阻率示意 ─────
#let fig-2-13(width: 5.4cm) = px-canvas(290, 280, origin: (140, 610), width: width, (p, u) => {
  import cetz.draw: *
  let hatch(pts) = {
    line(..pts.map(q => p(q.at(0), q.at(1))), close: true, fill: luma(200), stroke: 1.1pt)
  }
  // 立方体
  hatch(((258, 645), (284, 670), (284, 745), (258, 720)))
  line(p(258, 645), p(332, 645), p(357, 670), p(284, 670), close: true, fill: white, stroke: 1.1pt)
  line(p(284, 670), p(357, 670), p(357, 745), p(284, 745), close: true, fill: white, stroke: 1.1pt)
  lab(p, 290, 625, [1 厘米], size: 7.5pt)
  lab(p, 213, 727, [1 (厘米)#super[2]], size: 7.5pt)
  arrow(p, (190, 692), (258, 692)); lab(p, 175, 690, $R = rho$, size: 7.5pt)
  arrow(p, (357, 693), (412, 693))
  // 圆柱体
  circle(p(280, 832), radius: (16, 45), fill: luma(200), stroke: 1.1pt)
  line(p(280, 787), p(340, 787), stroke: 1.1pt)
  line(p(280, 877), p(340, 877), stroke: 1.1pt)
  arc(p(340, 877), start: -90deg, stop: 90deg, radius: (28, 45), stroke: 1.1pt)
  lab(p, 320, 770, [1 厘米], size: 7.5pt)
  arrow(p, (190, 830), (262, 830)); lab(p, 175, 830, $R = rho$, size: 7.5pt)
  lab(p, 213, 857, [1 (厘米)#super[2]], size: 7.5pt)
  arrow(p, (372, 832), (420, 832))
})

#let fig-2-14(width: 5.8cm) = px-canvas(340, 100, origin: (550, 730), width: width, (p, u) => {
  import cetz.draw: *
  rect(p(587, 762), p(865, 797), radius: 17, stroke: 1.1pt)
  circle(p(590, 780), radius: (12, 18), fill: luma(200), stroke: 1.1pt)
  lab(p, 735, 747, [1 米], size: 7.5pt)
  lab(p, 598, 813, [1 (毫米)#super[2]], size: 7.5pt)
  lab(p, 737, 826, $R = rho$, size: 7.5pt)
})

// ───── 图 2·17 电灯变阻器 ─────
#let fig-2-17(width: 5.6cm) = px-canvas(350, 130, origin: (95, 335), width: width, (p, u) => {
  import cetz.draw: *
  wire(p, (120, 350), (425, 350), (425, 385))
  wire(p, (120, 457), (425, 457), (425, 421))
  circle(p(118, 350), radius: 3, fill: white, stroke: lw)
  circle(p(118, 457), radius: 3, fill: white, stroke: lw)
  for x in (182, 243, 304, 363, 423) {
    wire(p, (x, 350), (x, 385)); wire(p, (x, 421), (x, 457))
    lamp(p, x, 403, r: 18)
    if x != 423 { jdot(p, x, 350, r: 3.5); jdot(p, x, 457, r: 3.5) }
  }
  lab(p, 103, 348, $A$, size: 8pt, anc: "east")
  lab(p, 103, 457, $B$, size: 8pt, anc: "east")
})

// ───── 图 2·20 部分电路 ─────
#let fig-2-20(width: 6.4cm) = px-canvas(400, 100, origin: (112, 1060), width: width, (p, u) => {
  import cetz.draw: *
  arrow(p, (117, 1097), (170, 1097))
  wire(p, (170, 1097), (222, 1097), (255, 1097))
  zigzag(p, 255, 1097, 125, n: 6, a: 7)
  arrow(p, (380, 1097), (422, 1097))
  arrow(p, (422, 1097), (505, 1097))
  jdot(p, 222, 1096, r: 4); jdot(p, 422, 1096, r: 4)
  lab(p, 148, 1085, $I$, size: 8pt)
  lab(p, 222, 1080, $A$, size: 8pt); lab(p, 225, 1115, $U_1$, size: 8pt)
  lab(p, 325, 1075, $R$, size: 8pt)
  lab(p, 422, 1080, $B$, size: 8pt); lab(p, 425, 1115, $U_2$, size: 8pt)
  lab(p, 320, 1147, $V = U_1 - U_2$, size: 8pt)
})

// ───── 图 2·21 电流热效应 ─────
#let fig-2-21(width: 5.4cm) = px-canvas(320, 520, origin: (110, 580), width: width, (p, u) => {
  import cetz.draw: *
  // 上部导线、电池组、电流表
  wire(p, (127, 605), (127, 720), (235, 720), (235, 775))
  wire(p, (127, 605), (205, 605))
  battery(p, 212, 605, n: 1, h: 13, pitch: 10, gap: 5)
  line(p(232, 605), p(310, 605), stroke: (thickness: 0.8pt, dash: "dashed"))
  battery(p, 312, 605, n: 1, h: 13, pitch: 10, gap: 5)
  wire(p, (330, 605), (410, 605), (410, 648))
  meter(p, 410, 670, $A$, r: 22, size: 8pt)
  wire(p, (410, 692), (410, 720), (318, 720), (318, 775))
  // 盖子（斜线填充的条）和接线柱
  rect(p(130, 790), p(420, 806), fill: luma(215), stroke: 0.9pt)
  for x in (235, 318) { rect(p(x - 7, 775), p(x + 7, 790), fill: white, stroke: lw) }
  // 温度计
  line(p(272, 682), p(272, 925), stroke: 0.9pt); line(p(279, 682), p(279, 925), stroke: 0.9pt)
  circle(p(275.5, 937), radius: 8, fill: white, stroke: 0.9pt)
  // 外容器
  line(p(165, 806), p(165, 1088), p(385, 1088), p(385, 806), stroke: 1.2pt)
  // 内容器、液体
  line(p(210, 865), p(210, 1040), p(342, 1040), p(342, 865), stroke: 1.2pt)
  for y in range(895, 1030, step: 12) { line(p(214, y), p(238, y), stroke: 0.5pt); line(p(300, y), p(338, y), stroke: 0.5pt) }
  line(p(210, 893), p(342, 893), stroke: 0.7pt)
  // 导线圈 R
  wire(p, (235, 790), (235, 975)); wire(p, (318, 790), (318, 975))
  for i in range(5) { circle(p(245 + i * 15, 985), radius: 7, stroke: 0.8pt) }
  wire(p, (235, 975), (240, 985)); wire(p, (318, 975), (312, 985))
  lab(p, 280, 1008, $R$, size: 7.5pt)
  // 支座
  for x in (230, 320) { line(p(x - 16, 1086), p(x + 16, 1086), p(x, 1042), close: true, fill: black, stroke: none) }
})

// ───── 习题 2·2 第 4 题附图 ─────
#let fig-ex-2-2-4(width: 11cm) = px-canvas(570, 200, origin: (270, 718), width: width, (p, u) => {
  let V(x, y) = meter(p, x, y, $V$, r: 15, size: 8pt)
  let A(x, y) = meter(p, x, y, $A$, r: 15, size: 8pt)
  let lb(x, y, name) = lab(p, x, y, name, size: 8pt)
  let key(x1, x2, y) = {
    import cetz.draw: *
    line(p(x1, y), p(x2, y - 20), stroke: lw)
    lb(x2 + 10, y - 22, $K$)
  }
  for (ox, vr) in ((0, 207), (283, 124)) {
    // 上方：电压表支路
    wire(p, (322 + ox, 810), (322 + ox, 737), ((322 + ox + vr + 288 + ox) / 2 - 15, 737))
    V((322 + ox + vr + 288 + ox) / 2, 737)
    wire(p, ((322 + ox + vr + 288 + ox) / 2 + 15, 737), (vr + 288 + ox, 737), (vr + 288 + ox, 810))
    // 中排：电灯、电流表
    wire(p, (288 + ox, 810), (359 + ox, 810)); lamp(p, 373 + ox, 810, r: 14, stroke: lw)
    wire(p, (387 + ox, 810), (433 + ox, 810)); A(448 + ox, 810)
    wire(p, (463 + ox, 810), (545 + ox, 810), (545 + ox, 905))
    jdot(p, 322 + ox, 810, r: 3.5); jdot(p, vr + 288 + ox, 810, r: 3.5)
    // 下排：电池、电键
    wire(p, (288 + ox, 810), (288 + ox, 905), (390 + ox, 905))
    battery(p, 394 + ox, 905, n: 1, h: 12, pitch: 10, gap: 5)
    wire(p, (404 + ox, 905), (455 + ox, 905))
    key(455 + ox, 500 + ox, 905)
    wire(p, (505 + ox, 905), (545 + ox, 905))
  }
  // 两个电路的右侧接点
  lab(p, 400, 955, text(weight: "bold", $(a)$), size: 8pt)
  lab(p, 690, 955, text(weight: "bold", $(b)$), size: 8pt)
})

// ───── 习题 2·3(3) 第 6 题附图 ─────
#let fig-ex-2-3-6(width: 6.6cm) = px-canvas(370, 300, origin: (315, 380), width: width, (p, u) => {
  import cetz.draw: *
  let pt(x, y) = p(x, y)
  // 转柄变阻器：三段电阻线 R3、R2、R1 和接触点
  line(pt(437, 472), pt(446, 462), pt(455, 478), pt(464, 458), pt(473, 475), pt(482, 455), pt(494, 470), stroke: lw)
  line(pt(497, 478), pt(497, 500), stroke: lw)
  line(pt(510, 425), pt(522, 452), pt(522, 470), stroke: lw)
  line(pt(494, 470), pt(502, 440), pt(512, 462), pt(520, 425), pt(535, 445), pt(545, 420), pt(560, 440), pt(572, 418), pt(585, 438), pt(600, 435), stroke: lw)
  line(pt(600, 435), pt(612, 452), pt(625, 462), pt(638, 475), pt(645, 492), pt(650, 517), stroke: lw)
  line(pt(567, 478), pt(567, 460), pt(574, 440), stroke: lw)
  for (x, y) in ((497, 500), (522, 470), (567, 478), (588, 517)) {
    circle(pt(x, y), radius: 4, fill: white, stroke: lw)
  }
  // 转柄
  line(pt(540, 517), pt(580, 488), stroke: 2.2pt)
  jdot(pt, 540, 517, r: 4.5)
  // A、B 两点及电压
  wire(p, (360, 517), (536, 517))
  wire(p, (592, 517), (650, 517))
  wire(p, (360, 517), (360, 600))
  jdot(p, 650, 517, r: 4)
  arrow(p, (360, 535), (360, 517)); arrow(p, (360, 560), (360, 603))
  circle(pt(360, 515), radius: 3, fill: white, stroke: lw)
  circle(pt(361, 607), radius: 3, fill: white, stroke: lw)
  lab(p, 360, 497, $A$, size: 8pt); lab(p, 362, 626, $B$, size: 8pt)
  lab(p, 370, 560, [120 伏特], size: 8pt, anc: "west")
  // R_0
  wire(p, (362, 610), (362, 645), (432, 645), (540, 645))
  zigzag(p, 540, 645, 70, n: 4, a: 8)
  wire(p, (610, 645), (650, 645), (650, 517))
  lab(p, 440, 428, $R_3$, size: 8pt); lab(p, 548, 394, $R_2$, size: 8pt); lab(p, 640, 462, $R_1$, size: 8pt)
  lab(p, 568, 668, $R_0$, size: 8pt)
})

// 脚注（原书 p.96）里行文中的电阻符号：锯齿形、长方形
#let sym-zz = box(width: 2.4em, height: 0.8em, baseline: 0.15em,
  cetz.canvas(length: 1em, {
    import cetz.draw: *
    line((0, 0.4), (0.15, 0.4), (0.35, 0.7), (0.65, 0.1), (0.95, 0.7), (1.25, 0.1), (1.55, 0.7), (1.85, 0.1), (2.05, 0.4), (2.4, 0.4), stroke: 0.5pt)
  }))
#let sym-rect = box(width: 2.4em, height: 0.8em, baseline: 0.15em,
  cetz.canvas(length: 1em, {
    import cetz.draw: *
    line((0, 0.4), (0.3, 0.4), stroke: 0.5pt)
    rect((0.3, 0.1), (2.1, 0.7), stroke: 0.5pt)
    line((2.1, 0.4), (2.4, 0.4), stroke: 0.5pt)
  }))
