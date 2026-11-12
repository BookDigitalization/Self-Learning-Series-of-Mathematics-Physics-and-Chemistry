// 图 1·29（原书 p.24，写实插画，PNG）、1·40（p.34）、1·41（p.34）、1·42（p.35）、1·43（p.36）、1·44（p.37）、1·45（p.37）、
// 1·46（p.38）、1·47（p.38）、1·48（p.39）；200 dpi 页面坐标。
#import "B-base.typ": *

// 图 1·29：PNG 取自 p.24，字母 a、b、M 已涂掉，用文字重加
#let fig-B-1-29(width: 380 * k) = px-canvas(380, 300, origin: (500, 1080), width: width, (p, u) => {
  import cetz.draw: *
  pimg(p, u, "/books/solid-geometry/figures/B-fig1-29.png", (500, 1080, 880, 1380))
  lbl(p, (643, 1235), $a$, dir: "c", d: 0)
  lbl(p, (706, 1231), $b$, dir: "c", d: 0)
  lbl(p, (607, 1311), $M$, dir: "c", d: 0)
})

// 图 1·40
#let fig-B-1-40(width: 330 * k) = bc(570, 570, 2, 330, 450, width: width, P => {
  import cetz.draw: *
  // 上图：两条相交直线 AOB（异面直线平移到 O 点）
  tseg(P, (80, 270), (298, 268))
  tseg(P, (325, 268), (530, 268))
  tseg(P, (248, 105), (355, 440))
  lbl(P, (45, 283), $A$, dir: "c", d: 0)
  lbl(P, (250, 78), $B$, dir: "c", d: 0)
  lbl(P, (322, 240), $O$, dir: "c", d: 0)
  // 下图：平面 M 与直线 a、b
  plane(P, (185, 543), (587, 540), (458, 795), (60, 798))
  tseg(P, (268, 470), (335, 680))
  dseg(P, (337, 688), (373, 792))
  tseg(P, (375, 797), (397, 862))
  tseg(P, (137, 738), (297, 738))
  lbl(P, (297, 482), $b$, dir: "c", d: 0)
  lbl(P, (530, 568), $M$, dir: "c", d: 0)
  lbl(P, (208, 758), $a$, dir: "c", d: 0)
})

// 图 1·41（正方体）
#let fig-B-1-41(width: 340 * k) = bc(560, 1060, 2, 340, 310, width: width, P => {
  import cetz.draw: *
  let A = (95, 565)
  let B = (440, 558)
  let C = (562, 435)
  let D = (215, 437)
  let A1 = (88, 213)
  let B1 = (440, 210)
  let C1 = (557, 93)
  let D1 = (205, 92)
  tseg(P, A1, B1)
  tseg(P, A1, D1)
  tseg(P, D1, C1)
  tseg(P, C1, C)
  tseg(P, B1, B)
  tseg(P, A1, A)
  tseg(P, A, B)
  tseg(P, B, C)
  tseg(P, B1, C1)
  tseg(P, B1, C)
  sseg(P, A1, C1)
  dseg(P, D1, D)
  dseg(P, D, C)
  dseg(P, A, B1)
  dseg(P, A, C)
  lbl(P, (193, 60), $D_1$, dir: "c", d: 0)
  lbl(P, (575, 82), $C_1$, dir: "c", d: 0)
  lbl(P, (45, 213), $A_1$, dir: "c", d: 0)
  lbl(P, (470, 214), $B_1$, dir: "c", d: 0)
  lbl(P, (190, 432), $D$, dir: "c", d: 0)
  lbl(P, (592, 435), $C$, dir: "c", d: 0)
  lbl(P, (90, 597), $A$, dir: "c", d: 0)
  lbl(P, (440, 592), $B$, dir: "c", d: 0)
})

// 图 1·42
#let fig-B-1-42(width: 360 * k) = bc(540, 1060, 2, 360, 250, width: width, P => {
  import cetz.draw: *
  plane(P, (230, 198), (680, 198), (520, 365), (68, 362))
  tseg(P, (288, 92), (288, 275))
  ring(P, (288, 285), r: 3.2)
  dseg(P, (288, 303), (288, 352))
  tseg(P, (288, 362), (287, 485))
  tseg(P, (470, 82), (518, 245))
  ring(P, (521, 255), r: 3.2)
  dseg(P, (530, 280), (548, 318))
  tseg(P, (552, 324), (588, 440))
  lbl(P, (290, 62), $b$, dir: "c", d: 0)
  lbl(P, (467, 60), $a$, dir: "c", d: 0)
  lbl(P, (607, 222), $M$, dir: "c", d: 0)
})

// 图 1·43
#let fig-B-1-43(width: 420 * k) = bc(480, 900, 2, 420, 260, width: width, P => {
  import cetz.draw: *
  let A = (385, 68)
  let A1 = (388, 430)
  let C = (195, 310)
  let D = (437, 312)
  let B = (380, 248)
  let E = (335, 312)
  plane(P, (278, 170), (780, 172), (600, 358), (95, 352))
  tseg(P, A, C)
  tseg(P, A, D)
  tseg(P, C, D)
  tseg(P, C, A1)
  tseg(P, D, A1)
  tseg(P, A, E)
  tseg(P, E, A1)
  dseg(P, A, A1)
  dseg(P, B, C)
  dseg(P, B, D)
  dseg(P, B, E)
  tseg(P, (510, 200), (590, 315))
  tseg(P, (515, 292), (640, 255))
  lbl(P, (380, 40), $A$, dir: "c", d: 0)
  lbl(P, (368, 230), $B$, dir: "c", d: 0)
  lbl(P, (172, 315), $C$, dir: "c", d: 0)
  lbl(P, (460, 318), $D$, dir: "c", d: 0)
  lbl(P, (305, 332), $E$, dir: "c", d: 0)
  lbl(P, (390, 462), $A_1$, dir: "c", d: 0)
  lbl(P, (493, 198), $a$, dir: "c", d: 0)
  lbl(P, (633, 225), $b$, dir: "c", d: 0)
  lbl(P, (715, 203), $M$, dir: "c", d: 0)
})

// 图 1·44
#let fig-B-1-44(width: 360 * k) = bc(540, 580, 2, 360, 230, width: width, P => {
  import cetz.draw: *
  plane(P, (205, 215), (708, 220), (532, 398), (28, 392))
  tseg(P, (300, 70), (298, 290))
  tseg(P, (298, 290), (232, 330))
  tseg(P, (298, 290), (398, 335))
  tseg(P, (472, 70), (470, 275))
  tseg(P, (470, 275), (405, 320))
  tseg(P, (470, 275), (570, 322))
  lbl(P, (298, 45), $A$, dir: "c", d: 0)
  lbl(P, (472, 40), $C$, dir: "c", d: 0)
  lbl(P, (503, 250), $D$, dir: "c", d: 0)
  lbl(P, (385, 297), $G$, dir: "c", d: 0)
  lbl(P, (592, 297), $H$, dir: "c", d: 0)
  lbl(P, (208, 332), $E$, dir: "c", d: 0)
  lbl(P, (298, 328), $B$, dir: "c", d: 0)
  lbl(P, (402, 362), $F$, dir: "c", d: 0)
  lbl(P, (95, 375), $M$, dir: "c", d: 0)
})

// 图 1·45
#let fig-B-1-45(width: 360 * k) = bc(540, 1200, 2, 360, 170, width: width, P => {
  import cetz.draw: *
  plane(P, (262, 75), (698, 80), (545, 238), (100, 230))
  tseg(P, (365, 10), (490, 148))
  dseg(P, (505, 160), (555, 215))
  tseg(P, (560, 222), (637, 308))
  tseg(P, (262, 200), (372, 105))
  tseg(P, (420, 212), (530, 112))
  lbl(P, (368, 8), $c$, dir: "c", d: 0)
  lbl(P, (490, 182), $O$, dir: "c", d: 0)
  lbl(P, (247, 215), $a$, dir: "c", d: 0)
  lbl(P, (402, 213), $b$, dir: "c", d: 0)
  lbl(P, (628, 100), $M$, dir: "c", d: 0)
})

// 图 1·46 (1)(2)
#let fig-B-1-46(width: 680 * k) = bc(180, 800, 2, 680, 250, width: width, P => {
  import cetz.draw: *
  // (1)
  plane(P, (148, 150), (605, 152), (468, 385), (15, 376))
  tseg(P, (400, 70), (400, 308))
  tseg(P, (245, 305), (397, 68))
  tseg(P, (245, 308), (400, 310))
  lbl(P, (410, 35), $P$, dir: "c", d: 0)
  lbl(P, (400, 345), $A$, dir: "c", d: 0)
  lbl(P, (232, 335), $B$, dir: "c", d: 0)
  lbl(P, (315, 345), $l$, dir: "c", d: 0)
  lbl(P, (550, 180), $M$, dir: "c", d: 0)
  ctext(P, (288, 432), [(1)])
  // (2)
  seg(P, (752, 155), (860, 156))
  dseg(P, (860, 156), (1005, 157))
  seg(P, (1005, 157), (1205, 160))
  seg(P, (752, 155), (620, 383))
  seg(P, (620, 383), (1070, 390))
  seg(P, (1070, 390), (1205, 160))
  tpoly(P, ((855, 68), (1005, 68), (1005, 318), (855, 318)), close: true)
  tseg(P, (855, 70), (1005, 315))
  lbl(P, (855, 45), $B$, dir: "c", d: 0)
  lbl(P, (1020, 45), $A$, dir: "c", d: 0)
  lbl(P, (1035, 340), $P$, dir: "c", d: 0)
  lbl(P, (930, 345), $l$, dir: "c", d: 0)
  lbl(P, (1155, 185), $M$, dir: "c", d: 0)
  ctext(P, (900, 430), [(2)])
})

// 图 1·47
#let fig-B-1-47(width: 360 * k) = bc(520, 1160, 2, 360, 215, width: width, P => {
  import cetz.draw: *
  // 平面 M
  dseg(P, (222, 225), (650, 220))
  dseg(P, (222, 225), (175, 285))
  seg(P, (175, 285), (150, 312))
  seg(P, (150, 312), (65, 390))
  seg(P, (65, 390), (485, 388))
  seg(P, (485, 388), (565, 310))
  seg(P, (565, 310), (650, 220))
  // 平面 N
  seg(P, (248, 118), (150, 312))
  seg(P, (668, 112), (565, 310))
  tseg(P, (248, 118), (668, 112))
  tseg(P, (150, 312), (565, 310))
  tseg(P, (140, 98), (145, 310))
  lbl(P, (447, 92), $a$, dir: "c", d: 0)
  lbl(P, (622, 145), $N$, dir: "c", d: 0)
  lbl(P, (118, 200), $b$, dir: "c", d: 0)
  lbl(P, (112, 305), $A$, dir: "c", d: 0)
  lbl(P, (347, 332), $c$, dir: "c", d: 0)
  lbl(P, (130, 372), $M$, dir: "c", d: 0)
})

// 图 1·48
#let fig-B-1-48(width: 400 * k) = bc(500, 940, 2, 400, 250, width: width, P => {
  import cetz.draw: *
  plane(P, (265, 272), (762, 262), (590, 447), (100, 458))
  tseg(P, (437, 65), (298, 345))
  tseg(P, (437, 65), (580, 375))
  tseg(P, (437, 65), (445, 322))
  tseg(P, (298, 345), (445, 322))
  tseg(P, (445, 322), (580, 375))
  poly(P, ((440, 70), (478, 82), (497, 124), (446, 108)), close: true)
  lbl(P, (440, 38), $P$, dir: "c", d: 0)
  lbl(P, (275, 352), $A$, dir: "c", d: 0)
  lbl(P, (435, 350), $O$, dir: "c", d: 0)
  lbl(P, (605, 380), $B$, dir: "c", d: 0)
  lbl(P, (190, 432), text(font: fonts.song, size: 8pt)[地面], dir: "c", d: 0)
})
