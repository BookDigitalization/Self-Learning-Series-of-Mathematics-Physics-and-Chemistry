// 习题 1·8（原书 p.39–40）、习题 1·9（p.45–47）里的无编号插图；页面 200 dpi 坐标。
#import "C-base.typ": *

// ───────── 习题 1·8 ─────────
// 第 1 题（p.39）
#let fig-C-ex8-1(width: 600 * k) = px-canvas(600, 215, origin: (190, 725), width: width, (p, u) => {
  import cetz.draw: *
  pdot(p, (225, 745))
  seg(p, (230, 925), (472, 745))
  seg(p, (527, 790), (790, 770))
  lbl(p, (215, 748), $P_1$, dir: "c", d: 0)
  lbl(p, (215, 922), $l_1$, dir: "c", d: 0)
  lbl(p, (512, 793), $l_2$, dir: "c", d: 0)
  pdot(p, (692, 910))
  lbl(p, (713, 912), $P_2$, dir: "c", d: 0)
})

// 第 4 题（p.39）
#let fig-C-ex8-4(width: 440 * k) = px-canvas(440, 235, origin: (270, 1035), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (298, 1105), (688, 1052))
  seg(p, (300, 1232), (690, 1232))
  ring(p, (581, 1070), r: 3)
  ring(p, (372, 1232), r: 3)
  lbl(p, (290, 1108), $A$, dir: "c", d: 0)
  lbl(p, (692, 1050), $B$, dir: "c", d: 0)
  lbl(p, (582, 1052), $P$, dir: "c", d: 0)
  lbl(p, (290, 1230), $C$, dir: "c", d: 0)
  lbl(p, (700, 1236), $D$, dir: "c", d: 0)
  lbl(p, (372, 1250), $Q$, dir: "c", d: 0)
})

// 第 5 题（p.40）：原图把顶点印成 Q，正文作 O，这里按正文写 O
#let fig-C-ex8-5(width: 340 * k) = px-canvas(340, 235, origin: (140, 470), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (302, 650), (302, 495))
  seg(p, (302, 650), (472, 650))
  seg(p, (302, 650), (170, 560))
  rtmark(p, (302, 650), (302, 600), (400, 650), s: 8)
  lbl(p, (303, 483), $P$, dir: "c", d: 0)
  lbl(p, (157, 548), $B$, dir: "c", d: 0)
  lbl(p, (480, 650), $A$, dir: "c", d: 0)
  lbl(p, (303, 664), $O$, dir: "c", d: 0)
  lbl(p, (283, 615), tsm($x$), dir: "c", d: 0)
  lbl(p, (336, 629), tsm($90°$), dir: "c", d: 0)
})

// 第 7 题（p.40）
#let fig-C-ex8-7(width: 340 * k) = px-canvas(340, 280, origin: (545, 415), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (665, 582), (663, 440))
  seg(p, (665, 582), (835, 585))
  seg(p, (665, 582), (585, 660))
  anglearc(p, (665, 582), (663, 440), (585, 660), 16)
  lbl(p, (663, 428), $C$, dir: "c", d: 0)
  lbl(p, (676, 572), $O$, dir: "c", d: 0)
  lbl(p, (843, 585), $A$, dir: "c", d: 0)
  lbl(p, (574, 667), $B$, dir: "c", d: 0)
})

// ───────── 习题 1·9 ─────────
// 第 1 题（p.45）
#let fig-C-ex9-1(width: 340 * k) = px-canvas(340, 235, origin: (545, 820), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (558, 1035), (860, 1035))
  seg(p, (707, 1035), (707, 850))
  seg(p, (707, 1035), (570, 952))
  seg(p, (707, 1035), (855, 947))
  rtmark(p, (707, 1035), (707, 950), (800, 1035), s: 14)
  anglearc(p, (707, 1035), (860, 1035), (855, 947), 32)
  anglearc(p, (707, 1035), (558, 1035), (570, 952), 32)
  lbl(p, (707, 832), $C$, dir: "c", d: 0)
  lbl(p, (562, 946), $D$, dir: "c", d: 0)
  lbl(p, (862, 943), $B$, dir: "c", d: 0)
  lbl(p, (547, 1035), $E$, dir: "c", d: 0)
  lbl(p, (870, 1036), $A$, dir: "c", d: 0)
  lbl(p, (704, 1049), $O$, dir: "c", d: 0)
})

// 第 5 题（p.46）
#let fig-C-ex9-5(width: 340 * k) = px-canvas(340, 230, origin: (140, 275), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (260, 482), (170, 308))
  seg(p, (260, 482), (260, 300))
  seg(p, (260, 482), (440, 397))
  seg(p, (260, 482), (460, 482))
  lbl(p, (162, 295), $D$, dir: "c", d: 0)
  lbl(p, (261, 287), $C$, dir: "c", d: 0)
  lbl(p, (448, 395), $B$, dir: "c", d: 0)
  lbl(p, (467, 485), $A$, dir: "c", d: 0)
  lbl(p, (258, 496), $O$, dir: "c", d: 0)
})

// 第 7 题（p.46）：三直线交于一点
#let fig-C-ex9-7(width: 340 * k) = px-canvas(340, 260, origin: (525, 255), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (565, 507), (785, 277), stroke: (paint: black, thickness: 1.2pt, cap: "round"))
  seg(p, (553, 300), (820, 497), stroke: (paint: black, thickness: 1.2pt, cap: "round"))
  seg(p, (537, 333), (843, 460), stroke: (paint: black, thickness: 1.2pt, cap: "round"))
  anglearc(p, (672, 390), (785, 277), (553, 300), 27)
  anglearc(p, (672, 390), (537, 333), (565, 507), 16)
  C-n(p, 676, 350, $1$)
  C-n(p, 718, 383, $2$)
  C-n(p, 750, 432, $3$)
  C-n(p, 672, 415, $4$)
  C-n(p, 645, 397, $5$)
  C-n(p, 607, 350, $6$)
})

// 第 9 题（p.46）
#let fig-C-ex9-9(width: 400 * k) = px-canvas(400, 250, origin: (130, 880), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (145, 1107), (503, 1115))
  seg(p, (327, 897), (222, 1109))
  seg(p, (327, 897), (418, 1113))
  anglearc(p, (222, 1109), (145, 1107), (327, 897), 24)
  anglearc(p, (418, 1113), (503, 1115), (327, 897), 24)
  lbl(p, (327, 888), $D$, dir: "c", d: 0)
  lbl(p, (138, 1105), $A$, dir: "c", d: 0)
  lbl(p, (512, 1115), $B$, dir: "c", d: 0)
  lbl(p, (222, 1125), $E$, dir: "c", d: 0)
  lbl(p, (418, 1127), $F$, dir: "c", d: 0)
  C-n(p, 205, 1082, $2$)
  C-n(p, 245, 1098, $1$)
  C-n(p, 405, 1098, $3$)
  C-n(p, 443, 1090, $4$)
})

// 第 10 题（p.46）
#let fig-C-ex9-10(width: 295 * k) = px-canvas(295, 320, origin: (545, 835), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (555, 925), (825, 935))
  seg(p, (575, 1058), (822, 1060))
  seg(p, (662, 856), (750, 1133))
  anglearc(p, (685, 930), (555, 925), (662, 856), 20)
  anglearc(p, (727, 1059), (822, 1060), (662, 856), 20)
  lbl(p, (662, 848), $E$, dir: "c", d: 0)
  lbl(p, (752, 1142), $F$, dir: "c", d: 0)
  lbl(p, (553, 925), $A$, dir: "c", d: 0)
  lbl(p, (832, 935), $B$, dir: "c", d: 0)
  lbl(p, (572, 1058), $C$, dir: "c", d: 0)
  lbl(p, (828, 1060), $D$, dir: "c", d: 0)
  C-n(p, 668, 913, $2$)
  C-n(p, 697, 913, $1$)
  C-n(p, 678, 941, $3$)
  C-n(p, 704, 941, $4$)
  C-n(p, 712, 1045, $6$)
  C-n(p, 742, 1043, $5$)
  C-n(p, 717, 1070, $7$)
  C-n(p, 744, 1070, $8$)
})

// 第 11 题（p.47）
#let fig-C-ex9-11(width: 290 * k) = px-canvas(290, 210, origin: (150, 220), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (172, 245), (405, 405))
  seg(p, (165, 408), (408, 262))
  lbl(p, (169, 243), $D$, dir: "c", d: 0)
  lbl(p, (412, 257), $C$, dir: "c", d: 0)
  lbl(p, (162, 411), $B$, dir: "c", d: 0)
  lbl(p, (411, 406), $A$, dir: "c", d: 0)
  lbl(p, (295, 346), $O$, dir: "c", d: 0)
})

// 第 12 题（p.47）
#let fig-C-ex9-12(width: 340 * k) = px-canvas(340, 215, origin: (490, 215), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (503, 398), (805, 398))
  seg(p, (660, 398), (565, 238))
  seg(p, (660, 398), (758, 242))
  seg(p, (660, 398), (520, 322))
  anglearc(p, (660, 398), (805, 398), (758, 242), 30)
  anglearc(p, (660, 398), (503, 398), (520, 322), 30)
  lbl(p, (497, 398), $A$, dir: "c", d: 0)
  lbl(p, (813, 399), $B$, dir: "c", d: 0)
  lbl(p, (565, 226), $C$, dir: "c", d: 0)
  lbl(p, (760, 230), $P$, dir: "c", d: 0)
  lbl(p, (512, 314), $Q$, dir: "c", d: 0)
  lbl(p, (660, 413), $O$, dir: "c", d: 0)
})

// 第 13 题（p.47）
#let fig-C-ex9-13(width: 370 * k) = px-canvas(370, 330, origin: (300, 590), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (315, 687), (645, 687))
  seg(p, (315, 805), (645, 805))
  seg(p, (397, 610), (540, 893))
  lbl(p, (310, 687), $A$, dir: "c", d: 0)
  lbl(p, (653, 687), $B$, dir: "c", d: 0)
  lbl(p, (308, 808), $C$, dir: "c", d: 0)
  lbl(p, (659, 808), $D$, dir: "c", d: 0)
  lbl(p, (394, 602), $E$, dir: "c", d: 0)
  lbl(p, (542, 905), $F$, dir: "c", d: 0)
  C-n(p, 414, 676, $1$)
  C-n(p, 444, 672, $4$)
  C-n(p, 425, 698, $2$)
  C-n(p, 455, 698, $3$)
  C-n(p, 478, 797, $5$)
  C-n(p, 505, 797, $6$)
  C-n(p, 490, 822, $8$)
  C-n(p, 517, 820, $7$)
})
