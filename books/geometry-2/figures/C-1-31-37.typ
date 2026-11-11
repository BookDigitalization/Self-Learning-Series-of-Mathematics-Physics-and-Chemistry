// 图 1·31（原书 p.43）、习题 1·5 第 4 题图（p.44）、图 1·32、1·33（p.46）、1·34（p.47）、1·35（p.48）、1·36（p.49）、1·37（p.50）；页面 120 dpi 坐标。
// 图 1·31 原图上有读者用铅笔手写的 “4cm”“3cm”“5” 等标注，不属于原书印刷内容，不录；点 C、D 按 AB=5、AC=4、BC=3、AD=2 6/7、BD'=15 算出（1 cm = 33 像素）。
#import "C-base.typ": *

// 图 1·31 例 4
#let fig-C-1-31(width: 700 * k) = px-canvas(700, 190, origin: (180, 655), width: width, (p, u) => {
  import cetz.draw: *
  let A = (197, 800)
  let B = (362, 800)
  let C = (197 + 3.2 * 33, 800 - 2.4 * 33)
  let D = (197 + 20 / 7 * 33, 800)
  let D2 = (362 + 15 * 33, 800)
  let E = (C.at(0) + (C.at(0) - A.at(0)) * 0.55, C.at(1) + (C.at(1) - A.at(1)) * 0.55)
  seg(p, A, B)
  seg(p, A, C)
  seg(p, B, C)
  line(p(..B), p(..D2), stroke: lt)
  dseg(p, C, D)
  dseg(p, C, D2)
  dseg(p, C, E)
  anglearc(p, C, D, D2, 14)
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, B, $B$, dir: "se", d: 10)
  lbl(p, C, $C$, dir: "nw", d: 10)
  lbl(p, D, $D$, dir: "s", d: 12)
  lbl(p, D2, $D'$, dir: "s", d: 12)
  lbl(p, E, $E$, dir: "ne", d: 9)
})

// 习题 1·5 第 4 题图：AE 平分 ∠A，CE 平分 ∠C，E 在 BD 上；BF、DF 虚线，F 在 AC 上
#let fig-C-ex1-5-4(width: 520 * k) = px-canvas(520, 235, origin: (220, 985), width: width, (p, u) => {
  import cetz.draw: *
  let A = (297, 1008)
  let B = (237, 1190)
  let C = (725, 1192)
  let D = (440, 1015)
  let E = (351, 1092)
  let F = (420, 1062)
  seg(p, A, B)
  seg(p, A, D)
  seg(p, D, C)
  seg(p, B, C)
  seg(p, A, C)
  seg(p, B, D)
  seg(p, A, E)
  seg(p, E, C)
  dseg(p, B, F)
  dseg(p, F, D)
  anglearc(p, A, B, E, 22)
  anglearc(p, A, B, E, 27)
  anglearc(p, A, E, D, 22)
  anglearc(p, A, E, D, 27)
  anglearc(p, C, B, E, 44)
  anglearc(p, C, B, E, 49)
  anglearc(p, C, E, D, 44)
  anglearc(p, C, E, D, 49)
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "s", d: 12)
  lbl(p, C, $C$, dir: "s", d: 12)
  lbl(p, D, $D$, dir: "ne", d: 10)
  lbl(p, E, $E$, dir: "nw", d: 11)
  lbl(p, F, $F$, dir: "se", d: 11)
})

// 图 1·32 平面图（比例尺 1:1000）
#let fig-C-1-32(width: 265 * k) = px-canvas(265, 255, origin: (120, 1030), width: width, (p, u) => {
  import cetz.draw: *
  poly(p, ((131, 1037), (374, 1037), (374, 1275), (131, 1275)), close: true)
  poly(p, ((166, 1249), (252, 1249), (330, 1155), (218, 1089)), close: true)
  seg(p, (313, 1101), (342, 1072), mark: (end: "stealth", fill: black, scale: 0.5))
  content(p(351, 1066), tt[北])
  content(p(341, 1258), tsm[1:1000])
  lbl(p, (166, 1249), $A$, dir: "w", d: 9)
  lbl(p, (252, 1249), $B$, dir: "s", d: 10)
  lbl(p, (330, 1155), $C$, dir: "e", d: 9)
  lbl(p, (218, 1089), $D$, dir: "n", d: 10)
})

// 图 1·33 平面图（比例尺 1:500）
#let fig-C-1-33(width: 425 * k) = px-canvas(425, 410, origin: (390, 868), width: width, (p, u) => {
  import cetz.draw: *
  poly(p, ((398, 875), (804, 875), (804, 1272), (398, 1272)), close: true)
  poly(p, ((440, 1241), (615, 1236), (764, 1047), (527, 920)), close: true)
  seg(p, (716, 955), (746, 922), mark: (end: "stealth", fill: black, scale: 0.5))
  content(p(764, 910), tt[北])
  content(p(732, 1257), tsm[1:500])
  lbl(p, (440, 1241), $A'$, dir: "w", d: 10)
  lbl(p, (615, 1236), $B'$, dir: "s", d: 10)
  lbl(p, (764, 1047), $C'$, dir: "e", d: 10)
  lbl(p, (527, 920), $D'$, dir: "n", d: 10)
})

// 图 1·34 正方形、矩形、菱形
#let fig-C-1-34(width: 710 * k) = px-canvas(710, 180, origin: (160, 1060), width: width, (p, u) => {
  import cetz.draw: *
  poly(p, ((178, 1080), (311, 1080), (311, 1214), (178, 1214)), close: true)
  poly(p, ((342, 1078), (542, 1077), (543, 1211), (343, 1212)), close: true)
  poly(p, ((591, 1145), (725, 1078), (858, 1142), (725, 1212)), close: true)
  lbl(p, (178, 1080), $D$, dir: "nw", d: 9)
  lbl(p, (311, 1080), $C$, dir: "n", d: 10)
  lbl(p, (311, 1214), $B$, dir: "s", d: 10)
  lbl(p, (178, 1214), $A$, dir: "sw", d: 9)
  lbl(p, (342, 1078), $D'$, dir: "n", d: 10)
  lbl(p, (542, 1077), $C'$, dir: "ne", d: 9)
  lbl(p, (543, 1211), $B'$, dir: "se", d: 9)
  lbl(p, (343, 1212), $A'$, dir: "s", d: 10)
  lbl(p, (591, 1145), $A''$, dir: "w", d: 13)
  lbl(p, (725, 1078), $D''$, dir: "n", d: 11)
  lbl(p, (858, 1142), $C''$, dir: "e", d: 13)
  lbl(p, (725, 1212), $B''$, dir: "s", d: 11)
})

// 图 1·35 例 1：两个锐角为 60° 的菱形（按边长 200、167 和 60° 重算，原图手绘略斜）
#let fig-C-1-35(width: 615 * k) = px-canvas(615, 220, origin: (165, 590), width: width, (p, u) => {
  import cetz.draw: *
  let rh(A, s) = {
    let B = (A.at(0) + s, A.at(1))
    let D = (A.at(0) + s / 2, A.at(1) - s * calc.sqrt(3) / 2)
    let C = (D.at(0) + s, D.at(1))
    (A, B, C, D)
  }
  let (A, B, C, D) = rh((182, 790), 200)
  let (A2, B2, C2, D2) = rh((519, 780), 167)
  poly(p, (A, B, C, D), close: true)
  poly(p, (A2, B2, C2, D2), close: true)
  anglearc(p, A, B, D, 30)
  anglearc(p, A2, B2, D2, 28)
  content(p(222, 771), tsm[$60°$])
  content(p(557, 764), tsm[$60°$])
  lbl(p, A, $A$, dir: "s", d: 12)
  lbl(p, B, $B$, dir: "s", d: 12)
  lbl(p, C, $C$, dir: "ne", d: 9)
  lbl(p, D, $D$, dir: "n", d: 11)
  lbl(p, A2, $A'$, dir: "s", d: 12)
  lbl(p, B2, $B'$, dir: "s", d: 12)
  lbl(p, C2, $C'$, dir: "ne", d: 9)
  lbl(p, D2, $D'$, dir: "n", d: 11)
})

// 图 1·36 例 2：整砖 ABCD 与半砖 EFDA
#let fig-C-1-36(width: 330 * k) = px-canvas(330, 215, origin: (350, 255), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((389, 434), (653, 436), (656, 276), (390, 274))
  let (E, F) = ((521, 435), (522, 276))
  poly(p, (A, B, C, D), close: true)
  seg(p, E, F)
  C-dim(p, (366, 274), (366, 436), $b$, gapw: 18)
  C-dim(p, (389, 457), (654, 457), $a$)
  line(p(392, 416), p(437, 416), stroke: lt, mark: (start: "stealth", fill: black, scale: 0.45))
  line(p(470, 416), p(521, 416), stroke: lt)
  content(p(452, 415), tt[$display(1/2) a$])
  lbl(p, D, $D$, dir: "nw", d: 9)
  lbl(p, F, $F$, dir: "n", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 9)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, E, $E$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
})

// 图 1·37 例 3：两个相似梯形及中位线
#let fig-C-1-37(width: 650 * k) = px-canvas(650, 215, origin: (220, 305), width: width, (p, u) => {
  import cetz.draw: *
  poly(p, ((237, 497), (472, 496), (402, 362), (271, 363)), close: true)
  seg(p, (254, 430), (436, 431))
  poly(p, ((565, 496), (855, 494), (770, 325), (604, 327)), close: true)
  seg(p, (586, 411), (814, 410))
  lbl(p, (237, 497), $A$, dir: "sw", d: 9)
  lbl(p, (472, 496), $B$, dir: "se", d: 9)
  lbl(p, (402, 362), $C$, dir: "ne", d: 9)
  lbl(p, (271, 363), $D$, dir: "nw", d: 9)
  lbl(p, (254, 430), $E$, dir: "w", d: 11)
  lbl(p, (436, 431), $F$, dir: "e", d: 11)
  lbl(p, (565, 496), $A'$, dir: "sw", d: 9)
  lbl(p, (855, 494), $B'$, dir: "se", d: 9)
  lbl(p, (770, 325), $C'$, dir: "ne", d: 9)
  lbl(p, (604, 327), $D'$, dir: "nw", d: 9)
  lbl(p, (586, 411), $E'$, dir: "w", d: 12)
  lbl(p, (814, 410), $F'$, dir: "e", d: 12)
})
