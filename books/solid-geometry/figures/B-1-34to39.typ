// 图 1·34（原书 p.28）、1·35（p.29）、1·36（p.29）、1·37（p.30）、1·38（p.30）、1·39（p.31）；200 dpi 页面坐标。
#import "B-base.typ": *

// 图 1·34 (1)(2)
#let fig-B-1-34(width: 700 * k) = bc(150, 940, 2, 700, 260, width: width, P => {
  import cetz.draw: *
  // (1)：竖直平面
  poly(P, ((112, 236), (553, 88), (533, 300), (92, 455)), close: true)
  // 水平平面
  seg(P, (42, 455), (433, 448))
  seg(P, (433, 448), (572, 300))
  dseg(P, (190, 303), (533, 300))
  seg(P, (533, 300), (572, 300))
  dseg(P, (190, 303), (100, 398))
  seg(P, (100, 398), (42, 455))
  tseg(P, (218, 258), (440, 185))
  tseg(P, (213, 345), (432, 268))
  ctext(P, (300, 490), [(1)])
  // (2)：另一画面坐标换成本画布坐标
  let g2(pt) = (700 + pt.at(0) * 2 / 3, 20 + pt.at(1) * 2 / 3)
  poly(P, ((445, 28), (228, 247), (130, 635), (348, 415)).map(g2), close: true)
  poly(P, ((348, 415), (903, 408), (688, 628), (132, 635)).map(g2), close: true)
  tseg(P, g2((540, 330)), g2((800, 62)))
  ctext(P, (1010, 490), [(2)])
})

// 图 1·35
#let fig-B-1-35(width: 260 * k) = bc(640, 200, 2, 260, 220, width: width, P => {
  import cetz.draw: *
  poly(P, ((45, 90), (240, 5), (245, 325), (45, 408)), close: true)
  poly(P, ((240, 5), (443, 95), (443, 415), (245, 325)), close: true)
  lbl(P, (75, 110), $M$, dir: "c", d: 0)
  lbl(P, (258, 160), $c$, dir: "c", d: 0)
  lbl(P, (413, 120), $N$, dir: "c", d: 0)
  lbl(P, (20, 235), $a$, dir: "c", d: 0)
  lbl(P, (468, 210), $b$, dir: "c", d: 0)
})

// 图 1·36
#let fig-B-1-36(width: 360 * k) = bc(540, 510, 3, 360, 280, width: width, P => {
  import cetz.draw: *
  // 平面 S
  seg(P, (135, 272), (565, 150))
  seg(P, (565, 150), (1000, 35))
  tseg(P, (135, 272), (145, 765))
  tseg(P, (145, 765), (575, 645))
  dseg(P, (575, 645), (900, 548))
  tseg(P, (900, 548), (1005, 525))
  seg(P, (1000, 35), (1005, 525))
  // 平面 P
  seg(P, (240, 48), (565, 150))
  seg(P, (565, 150), (895, 252))
  seg(P, (240, 48), (240, 225))
  dseg(P, (240, 225), (245, 540))
  dseg(P, (245, 540), (395, 587))
  seg(P, (420, 595), (575, 645))
  tseg(P, (895, 252), (905, 745))
  tseg(P, (575, 645), (905, 745))
  // 交线 AA'
  tseg(P, (565, 150), (575, 645))
  // 直线 b
  seg(P, (558, 190), (548, 265))
  dseg(P, (545, 285), (492, 612))
  dseg(P, (225, 733), (480, 620))
  lbl(P, (570, 105), $A$, dir: "c", d: 0)
  lbl(P, (170, 312), $S$, dir: "c", d: 0)
  lbl(P, (852, 298), $P$, dir: "c", d: 0)
  lbl(P, (97, 560), $a$, dir: "c", d: 0)
  lbl(P, (547, 467), $b$, dir: "c", d: 0)
  lbl(P, (462, 552), $B$, dir: "c", d: 0)
  lbl(P, (920, 460), $c$, dir: "c", d: 0)
})

// 图 1·37
#let fig-B-1-37(width: 340 * k) = bc(560, 410, 2, 340, 200, width: width, P => {
  import cetz.draw: *
  poly(P, ((22, 200), (190, 35), (630, 40), (465, 205)), close: true)
  poly(P, ((22, 200), (190, 368), (625, 370), (465, 205)), close: true)
  tseg(P, (197, 113), (450, 118))
  tseg(P, (220, 287), (445, 290))
  lbl(P, (318, 92), $a$, dir: "c", d: 0)
  lbl(P, (300, 180), $b$, dir: "c", d: 0)
  lbl(P, (340, 262), $c$, dir: "c", d: 0)
})

// 图 1·38（E、F、G、H 按 AB、BC、CD、DA 的中点重算）
#let fig-B-1-38(width: 520 * k) = bc(250, 740, 2, 520, 260, width: width, P => {
  import cetz.draw: *
  let A = (415, 76)
  let B = (273, 360)
  let C = (752, 400)
  let D = (505, 258)
  let mid(a, b) = ((a.at(0) + b.at(0)) / 2, (a.at(1) + b.at(1)) / 2)
  let E = mid(A, B)
  let F = mid(B, C)
  let G = mid(C, D)
  let H = mid(D, A)
  plane(P, (290, 193), (996, 190), (770, 455), (35, 460))
  tseg(P, A, B)
  tseg(P, B, C)
  tseg(P, A, H)
  dseg(P, H, D)
  dseg(P, D, G)
  tseg(P, G, C)
  tseg(P, B, D)
  tpoly(P, (E, F, G, H), close: true)
  tseg(P, E, G)
  tseg(P, F, H)
  lbl(P, (410, 50), $A$, dir: "c", d: 0)
  lbl(P, (487, 148), $H$, dir: "c", d: 0)
  lbl(P, (310, 215), $E$, dir: "c", d: 0)
  lbl(P, (527, 262), $D$, dir: "c", d: 0)
  lbl(P, (645, 300), $G$, dir: "c", d: 0)
  lbl(P, (775, 405), $C$, dir: "c", d: 0)
  lbl(P, (245, 358), $B$, dir: "c", d: 0)
  lbl(P, (505, 410), $F$, dir: "c", d: 0)
})

// 图 1·39
#let fig-B-1-39(width: 420 * k) = bc(480, 390, 2, 420, 260, width: width, P => {
  import cetz.draw: *
  // 上平面
  plane(P, (315, 42), (810, 38), (632, 235), (135, 242))
  // 下平面
  seg(P, (205, 305), (262, 305))
  dseg(P, (262, 305), (545, 301))
  seg(P, (545, 301), (755, 298))
  seg(P, (205, 305), (22, 495))
  seg(P, (22, 495), (580, 486))
  seg(P, (580, 486), (755, 298))
  // 下三角形 ADE（阴影）
  let A = (200, 428)
  let E = (445, 420)
  let C = (505, 424)
  let D = (490, 358)
  let B = (582, 333)
  let A1 = (305, 183)
  let E1 = (540, 182)
  let C1 = (600, 183)
  let D1 = (590, 108)
  let B1 = (680, 90)
  hatch(P, (A, D, E), (1, -0.45), 9)
  hatch(P, (A1, D1, E1), (1, -0.35), 9)
  tseg(P, A, C)
  tseg(P, A, D)
  tseg(P, D, E)
  tseg(P, D, B)
  tseg(P, A1, C1)
  tseg(P, A1, D1)
  tseg(P, D1, E1)
  tseg(P, D1, B1)
  // AA1、DD1、EE1
  tseg(P, A, (272, 243))
  dseg(P, (272, 243), A1)
  tseg(P, E, (517, 238))
  dseg(P, (517, 238), E1)
  tseg(P, D, (541, 238))
  dseg(P, (541, 238), D1)
  lbl(P, (178, 428), $A$, dir: "c", d: 0)
  lbl(P, (435, 448), $E$, dir: "c", d: 0)
  lbl(P, (532, 430), $C$, dir: "c", d: 0)
  lbl(P, (524, 368), $D$, dir: "c", d: 0)
  lbl(P, (597, 325), $B$, dir: "c", d: 0)
  lbl(P, (262, 187), $A_1$, dir: "c", d: 0)
  lbl(P, (490, 210), $E_1$, dir: "c", d: 0)
  lbl(P, (627, 188), $C_1$, dir: "c", d: 0)
  lbl(P, (603, 87), $D_1$, dir: "c", d: 0)
  lbl(P, (715, 95), $B_1$, dir: "c", d: 0)
})
