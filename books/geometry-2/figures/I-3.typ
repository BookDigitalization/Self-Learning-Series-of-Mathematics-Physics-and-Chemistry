// 第 3 章的插图（段 I）：图 3·1（原书 p.166）、3·2（p.166）、3·3（p.167）、习题 3·1 第 2 题（p.168）、
// 图 3·4（p.169）、p.170 脚注的小方格图、图 3·5（p.171）、习题 3·2 第 9 题（p.175）、第 10 题（p.176）；页面 120 dpi 坐标。
#import "I-base.typ": *

// ───────── 图 3·1：矩形 ABCD 分成 6 个 1 平方厘米的方格，旁边是面积单位 U ─────────
#let fig-I-3-1(width: 330 * k) = px-canvas(330, 300, origin: (540, 170), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((571, 400), (704, 400), (704, 198), (571, 198))
  line(p(..A), p(..B), p(..C), p(..D), close: true, stroke: lb)
  dseg(p, (637.5, 198), (637.5, 400))
  dseg(p, (571, 265.5), (704, 265.5))
  dseg(p, (571, 333), (704, 333))
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
  lbl(p, C, $C$, dir: "ne", d: 9)
  lbl(p, D, $D$, dir: "nw", d: 9)
  lbl(p, (640, 436), $P$, dir: "c", d: 0)
  // 面积单位 U
  line(p(762, 199), p(826, 199), p(826, 264), p(762, 264), close: true, stroke: lb)
  lbl(p, (796, 186), tt[1cm], dir: "c", d: 0)
  content(p(751, 232), tt[1cm], angle: 90deg)
  lbl(p, (800, 275), $U$, dir: "c", d: 0)
})

// ───────── 图 3·2：五边形 ABCDE 放在方格纸上（一个方格是 1 cm²） ─────────
#let fig-I-3-2(width: 450 * k) = px-canvas(450, 255, origin: (280, 805), width: width, (p, u) => {
  import cetz.draw: *
  let xs = range(5).map(i => 440 + 66.25 * i)
  let ys = (819, 886.7, 954.4, 1022)
  // 矩形轮廓（阶梯形）
  line(p(440, 886.7), p(xs.at(1), 886.7), p(xs.at(1), 819), p(705, 819), p(705, 1022), p(440, 1022), close: true, stroke: lb)
  dseg(p, (xs.at(1), 819), (xs.at(1), 1022))
  dseg(p, (xs.at(2), 819), (xs.at(2), 1022))
  dseg(p, (xs.at(3), 819), (xs.at(3), 1022))
  dseg(p, (440, 886.7), (705, 886.7))
  dseg(p, (440, 954.4), (705, 954.4))
  let (A, B, C, D, E) = ((475, 1022), (704, 1020), (647, 900), (576, 843), (458, 920))
  line(p(..A), p(..E), p(..D), p(..C), p(..B), stroke: lb)
  lbl(p, A, $A$, dir: "s", d: 12)
  lbl(p, B, $B$, dir: "se", d: 12)
  lbl(p, C, $C$, dir: "ne", d: 9)
  lbl(p, D, $D$, dir: "n", d: 10)
  lbl(p, E, $E$, dir: "nw", d: 9)
  lbl(p, (580, 1050), $P$, dir: "c", d: 0)
  // 面积单位 U
  line(p(292, 887), p(358, 887), p(358, 957), p(292, 957), close: true, stroke: lb)
  lbl(p, (328, 877), tt[1cm], dir: "c", d: 0)
  content(p(282, 922), tt[1cm], angle: 90deg)
  lbl(p, (324, 968), $U$, dir: "c", d: 0)
})

// ───────── 图 3·3：面积割补法（四个分图） ─────────
#let fig-I-3-3(width: 580 * k) = px-canvas(580, 505, origin: (250, 470), width: width, (p, u) => {
  import cetz.draw: *
  let bez(a, c1, c2, b) = bezier(p(..a), p(..b), p(..c1), p(..c2), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.5))
  // (1)
  let (A, B, C, D, E) = ((282, 634), (480, 634), (542, 498), (344, 498), (344, 634))
  line(p(..A), p(..B), p(..C), p(..D), close: true, stroke: lb)
  tseg(p, D, E)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, E, $E$, dir: "s", d: 11)
  lbl(p, B, $B$, dir: "se", d: 9)
  lbl(p, C, $C$, dir: "ne", d: 9)
  lbl(p, D, $D$, dir: "n", d: 10)
  lbl(p, (326, 578), $I$, dir: "c", d: 0)
  lbl(p, (415, 572), $I I$, dir: "c", d: 0)
  lbl(p, (396, 687), tsm[(1)], dir: "c", d: 0)
  // (2)
  let (A2, E2, D2, Ep, Dp) = ((547, 631), (617, 631), (617, 498), (610, 631), (610, 497))
  let (B2, C2) = ((746, 631), (806, 498))
  line(p(..E2), p(..B2), p(..C2), p(..D2), close: true, stroke: lb)
  line(p(..A2), p(..Ep), p(..Dp), close: true, stroke: lb)
  bez((577, 615), (620, 668), (745, 676), (773, 602))
  lbl(p, Dp, $D'$, dir: "n", d: 9)
  lbl(p, D2, $D$, dir: "ne", d: 9)
  lbl(p, A2, $A$, dir: "sw", d: 9)
  lbl(p, (596, 622), $E'$, dir: "c", d: 0)
  lbl(p, (630, 621), $E$, dir: "c", d: 0)
  lbl(p, (733, 618), $B$, dir: "c", d: 0)
  lbl(p, C2, $C$, dir: "ne", d: 9)
  lbl(p, (591, 572), $I$, dir: "c", d: 0)
  lbl(p, (689, 568), $I I$, dir: "c", d: 0)
  lbl(p, (661, 687), tsm[(2)], dir: "c", d: 0)
  // (3)
  let (D3, C3, E3, Ep3) = ((313, 750), (503, 750), (313, 885), (511, 885))
  let (B3, A3, Dp3) = ((440, 885), (448, 885), (511, 750))
  line(p(..E3), p(..D3), p(..C3), stroke: lb)
  tseg(p, E3, Ep3)
  tseg(p, B3, C3)
  tseg(p, A3, Dp3)
  tseg(p, Dp3, Ep3)
  bez((295, 868), (330, 935), (470, 945), (493, 865))
  lbl(p, D3, $D$, dir: "nw", d: 9)
  lbl(p, (321, 878), $E$, dir: "c", d: 0)
  lbl(p, Ep3, $E'$, dir: "se", d: 11)
  lbl(p, (436, 897), $B$, dir: "c", d: 0)
  lbl(p, (454, 897), $A$, dir: "c", d: 0)
  lbl(p, C3, $C$, dir: "nw", d: 9)
  lbl(p, Dp3, $D'$, dir: "ne", d: 9)
  lbl(p, (491, 830), $I$, dir: "c", d: 0)
  lbl(p, (385, 828), $I I$, dir: "c", d: 0)
  lbl(p, (397, 958), tsm[(3)], dir: "c", d: 0)
  // (4)
  let (D4, Dp4, E4, Ep4, A4) = ((545, 750), (742, 750), (545, 885), (742, 885), (678, 885))
  line(p(..D4), p(..Dp4), p(..Ep4), p(..E4), close: true, stroke: lb)
  tseg(p, A4, Dp4)
  lbl(p, D4, $D$, dir: "nw", d: 9)
  lbl(p, Dp4, $D'$, dir: "ne", d: 9)
  lbl(p, E4, $E$, dir: "sw", d: 9)
  lbl(p, Ep4, $E'$, dir: "se", d: 11)
  lbl(p, (720, 842), $I$, dir: "c", d: 0)
  lbl(p, (610, 825), $I I$, dir: "c", d: 0)
  lbl(p, (663, 958), tsm[(4)], dir: "c", d: 0)
})

// ───────── 习题 3·1 第 2 题：□ABCD 与 □ABC'D' 有公共的底边 ─────────
#let fig-I-3-ex1-2(width: 360 * k) = px-canvas(360, 215, origin: (290, 520), width: width, (p, u) => {
  import cetz.draw: *
  let (Dp, D, Cp, C) = ((307, 536), (443, 536), (505, 536), (639, 536))
  let (A, B) = ((374, 703), (574, 703))
  tseg(p, Dp, C)
  tseg(p, A, B)
  tseg(p, Dp, A)
  tseg(p, D, A)
  tseg(p, Cp, B)
  tseg(p, C, B)
  lbl(p, Dp, $D'$, dir: "nw", d: 9)
  lbl(p, D, $D$, dir: "n", d: 10)
  lbl(p, Cp, $C'$, dir: "nw", d: 9)
  lbl(p, C, $C$, dir: "ne", d: 9)
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, B, $B$, dir: "s", d: 12)
  lbl(p, (372, 610), $I$, dir: "c", d: 0)
  lbl(p, (470, 610), $I I I$, dir: "c", d: 0)
  lbl(p, (575, 607), $I I$, dir: "c", d: 0)
})

// ───────── 图 3·4：矩形 ABCD 的底 b = 5a，高 h = 3a ─────────
#let fig-I-3-4(width: 480 * k) = px-canvas(480, 270, origin: (280, 160), width: width, (p, u) => {
  import cetz.draw: *
  let (D, C, A, B) = ((425, 178), (758, 178), (425, 382), (758, 382))
  let wd = 66.6
  let ht = 68
  line(p(..A), p(..B), p(..C), p(..D), close: true, stroke: lb)
  for i in range(1, 5) { dseg(p, (425 + wd * i, 178), (425 + wd * i, 382)) }
  for j in range(1, 3) { dseg(p, (425, 178 + ht * j), (758, 178 + ht * j)) }
  lbl(p, D, $D$, dir: "nw", d: 9)
  lbl(p, C, $C$, dir: "ne", d: 9)
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, B, $B$, dir: "se", d: 10)
  for y in (215, 280, 342) { lbl(p, (418, y), $a$, dir: "c", d: 0) }
  for y in (212, 283, 350) { lbl(p, (764, y), $a$, dir: "c", d: 0) }
  for x in (459, 525, 659, 725) { lbl(p, (x, 396), $a$, dir: "c", d: 0) }
  lbl(p, (592, 374), $a$, dir: "c", d: 0)
  // 高 h 的尺寸线
  line(p(406, 178), p(406, 262), stroke: lt, mark: (start: "stealth", fill: black, scale: 0.45))
  line(p(406, 298), p(406, 382), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.45))
  line(p(398, 178), p(414, 178), stroke: lt)
  line(p(398, 382), p(414, 382), stroke: lt)
  lbl(p, (405, 280), $h$, dir: "c", d: 0)
  dimh(p, 426, 756, 403, lab: $b$, labx: 590)
  line(p(758, 395), p(758, 411), stroke: lt)
  // 面积单位 U
  line(p(293, 247), p(360, 247), p(360, 314), p(293, 314), close: true, stroke: lb)
  lbl(p, (326, 238), $a$, dir: "c", d: 0)
  lbl(p, (287, 277), $a$, dir: "c", d: 0)
  lbl(p, (326, 326), $U$, dir: "c", d: 0)
})

// ───────── p.170 脚注附图：边长为 a 的正方形十等分，共 100 个小方格 ─────────
#let fig-I-3-grid(width: 2.4cm) = px-canvas(185, 190, origin: (645, 1080), width: width, (p, u) => {
  import cetz.draw: *
  let (x0, y0, x1, y1) = (647, 1083, 827, 1267)
  for i in range(11) {
    let x = x0 + (x1 - x0) * i / 10
    let y = y0 + (y1 - y0) * i / 10
    let sw = if i in (0, 10) { 1.1pt } else { 0.5pt }
    line(p(x, y0), p(x, y1), stroke: sw)
    line(p(x0, y), p(x1, y), stroke: sw)
  }
})

// ───────── 图 3·5：用有理数近似值夹住矩形 ABCD ─────────
#let fig-I-3-5(width: 340 * k) = px-canvas(340, 260, origin: (545, 815), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((575, 1058), (840, 1058), (840, 851), (575, 851))
  let (B1, C1, D1) = ((826, 1058), (826, 870), (575, 870))
  let (B2, C2, D2) = ((858, 1058), (858, 836), (575, 836))
  line(p(..A), p(..B), p(..C), p(..D), close: true, stroke: lb)
  dseg(p, D1, C1)
  dseg(p, C1, B1)
  dseg(p, D2, C2)
  dseg(p, C2, B2)
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, (820, 1078), $B_1$, dir: "c", d: 0)
  lbl(p, (842, 1078), $B$, dir: "c", d: 0)
  lbl(p, (864, 1079), $B_2$, dir: "c", d: 0)
  lbl(p, C, $C$, dir: "ne", d: 9)
  lbl(p, C1, $C_1$, dir: "sw", d: 10)
  lbl(p, C2, $C_2$, dir: "ne", d: 9)
  lbl(p, (561, 834), $D_2$, dir: "c", d: 0)
  lbl(p, (561, 852), $D$, dir: "c", d: 0)
  lbl(p, (559, 871), $D_1$, dir: "c", d: 0)
})

// ───────── 习题 3·2 第 9 题：四种截面（阴影部分） ─────────
// 两端箭头指向被标注线段两端的“夹入式”尺寸线（水平 / 竖直）：din-h(p, x0, x1, y, 左端外点, 右端外点)
#let din-h(p, xa, xb, y, ext) = {
  import cetz.draw: *
  line(p(xa - ext, y), p(xa, y), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.4))
  line(p(xb + ext, y), p(xb, y), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.4))
}
#let din-v(p, x, ya, yb, ext) = {
  import cetz.draw: *
  line(p(x, ya - ext), p(x, ya), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.4))
  line(p(x, yb + ext), p(x, yb), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.4))
}
// 两端带箭头、中间留出文字的尺寸线（竖直）
#let dimv(p, x, y0, y1, lab, laby: auto, gapw: 18) = {
  import cetz.draw: *
  let m = if laby == auto { (y0 + y1) / 2 } else { laby }
  line(p(x, y0), p(x, m - gapw / 2), stroke: lt, mark: (start: "stealth", fill: black, scale: 0.4))
  line(p(x, m + gapw / 2), p(x, y1), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.4))
  lbl(p, (x, m), lab, dir: "c", d: 0)
}
#let fig-I-3-ex2-9(width: 600 * k) = px-canvas(600, 520, origin: (240, 755), width: width, (p, u) => {
  import cetz.draw: *
  let hp(pts) = line(..pts.map(q => p(..q)), close: true, fill: hatch, stroke: lw)
  // (1) L 形
  hp(((321, 777), (346.5, 777), (346.5, 897), (465, 897), (465, 922), (321, 922)))
  din-h(p, 321, 346.5, 767, 21)
  lbl(p, (333, 767), $a$, dir: "c", d: 0)
  dimv(p, 305, 777, 922, $b$)
  line(p(297, 777), p(313, 777), stroke: lt)
  line(p(297, 922), p(313, 922), stroke: lt)
  dimh(p, 320, 467, 934, lab: $b$, labx: 393)
  din-v(p, 477, 897, 922, 18)
  lbl(p, (477, 909), $a$, dir: "c", d: 0)
  lbl(p, (389, 978), tt[(1)], dir: "c", d: 0)
  // (2) T 形
  hp(((565, 889), (629, 889), (629, 770), (652, 770), (652, 889), (715, 889), (715, 920), (565, 920)))
  din-h(p, 629, 652, 761, 20)
  lbl(p, (640, 761), $a$, dir: "c", d: 0)
  line(p(652, 770), p(743, 772), stroke: lt)
  dimv(p, 739, 772, 920, $h$)
  din-v(p, 727, 889, 920, 18)
  lbl(p, (727, 905), $t$, dir: "c", d: 0)
  dimh(p, 565, 715, 934, lab: $b$, labx: 640)
  lbl(p, (657, 977), tt[(2)], dir: "c", d: 0)
  // (3) 倒 U 形
  hp(((255, 1045), (441, 1045), (441, 1195), (416, 1195), (416, 1075), (280, 1075), (280, 1195), (255, 1195)))
  dimh(p, 255, 441, 1032, lab: $d$, labx: 348)
  line(p(255, 1025), p(255, 1040), stroke: lt)
  line(p(441, 1025), p(441, 1040), stroke: lt)
  din-v(p, 450, 1045, 1075, 12)
  lbl(p, (450, 1060), $a$, dir: "c", d: 0)
  dimv(p, 243, 1045, 1195, $b$)
  line(p(235, 1045), p(251, 1045), stroke: lt)
  line(p(235, 1195), p(251, 1195), stroke: lt)
  din-h(p, 255, 280, 1205, 18)
  lbl(p, (267, 1205), $t$, dir: "c", d: 0)
  din-h(p, 416, 441, 1205, 18)
  lbl(p, (429, 1205), $t$, dir: "c", d: 0)
  lbl(p, (349, 1248), tt[(3)], dir: "c", d: 0)
  // (4) Z 形
  hp(((525, 1049), (673, 1049), (673, 1171), (797, 1171), (797, 1195), (643, 1195), (643, 1072), (525, 1072)))
  dimh(p, 525, 673, 1037, lab: $b$, labx: 595)
  line(p(525, 1030), p(525, 1044), stroke: lt)
  line(p(673, 1030), p(673, 1044), stroke: lt)
  din-v(p, 517, 1049, 1072, 16)
  lbl(p, (517, 1060), $t$, dir: "c", d: 0)
  line(p(673, 1049), p(820, 1049), stroke: lt)
  dimv(p, 818, 1049, 1195, $h$)
  din-h(p, 643, 673, 1130, 25)
  lbl(p, (658, 1130), $d$, dir: "c", d: 0)
  din-v(p, 804, 1171, 1195, 18)
  lbl(p, (804, 1183), $t$, dir: "c", d: 0)
  dimh(p, 643, 797, 1205, lab: $b$, labx: 715)
  lbl(p, (700, 1248), tt[(4)], dir: "c", d: 0)
})

// ───────── 习题 3·2 第 10 题：三角形与等积的矩形、平行四边形 ─────────
#let fig-I-3-ex2-10(width: 700 * k) = px-canvas(700, 430, origin: (140, 530), width: width, (p, u) => {
  import cetz.draw: *
  // 三角形：B、C 在底边，A 为顶点，D 为垂足
  let tri(B, C, ax, h) = {
    let A = (ax, B.at(1) - h)
    line(p(..B), p(..C), stroke: lb)
    tseg(p, B, A)
    tseg(p, A, C)
  }
  let h = 118
  // 第一行：矩形
  let B1 = (161, 664)
  let C1 = (339, 664)
  tri(B1, C1, 222, h); let A1 = (222, B1.at(1) - h); let D1 = (222, B1.at(1))
  dseg(p, (161, 664 - h), (339, 664 - h))
  dseg(p, (161, 664), (161, 664 - h))
  dseg(p, (339, 664), (339, 664 - h))
  tseg(p, A1, D1)
  rtmark(p, D1, B1, A1, s: 9)
  lbl(p, A1, $A$, dir: "n", d: 9)
  lbl(p, B1, $B$, dir: "sw", d: 9)
  lbl(p, D1, $D$, dir: "s", d: 10)
  lbl(p, C1, $C$, dir: "se", d: 9)
  lbl(p, (240, 702), tsm[(1)], dir: "c", d: 0)

  let B2 = (401, 667)
  let C2 = (572, 667)
  tri(B2, C2, 458, h); let A2 = (458, B2.at(1) - h); let D2 = (458, B2.at(1))
  let ym = 667 - h / 2
  dseg(p, (395, ym), (577, ym))
  dseg(p, (395, ym), (395, 667))
  dseg(p, (577, ym), (577, 667))
  dseg(p, A2, D2)
  rtmark(p, D2, C2, A2, s: 9)
  lbl(p, A2, $A$, dir: "n", d: 9)
  lbl(p, B2, $B$, dir: "sw", d: 9)
  lbl(p, D2, $D$, dir: "s", d: 10)
  lbl(p, C2, $C$, dir: "se", d: 9)
  lbl(p, (486, 702), tsm[(2)], dir: "c", d: 0)

  let B3 = (634, 671)
  let C3 = (812, 671)
  tri(B3, C3, 693, h); let A3 = (693, B3.at(1) - h); let D3 = (693, B3.at(1))
  let xm = (634 + 812) / 2
  dseg(p, (634, 671 - h), (xm, 671 - h))
  dseg(p, (634, 671), (634, 671 - h))
  dseg(p, (xm, 671), (xm, 671 - h))
  tseg(p, A3, D3)
  lbl(p, A3, $A$, dir: "n", d: 9)
  lbl(p, B3, $B$, dir: "sw", d: 9)
  lbl(p, D3, $D$, dir: "s", d: 10)
  lbl(p, C3, $C$, dir: "se", d: 9)

  // 第二行：平行四边形
  let B4 = (161, 886)
  let C4 = (339, 886)
  tri(B4, C4, 221, h); let A4 = (221, B4.at(1) - h); let D4 = (221, B4.at(1))
  dseg(p, A4, (A4.at(0) + 178, A4.at(1)))
  dseg(p, (A4.at(0) + 178, A4.at(1)), C4)
  dseg(p, A4, D4)
  lbl(p, A4, $A$, dir: "n", d: 9)
  lbl(p, B4, $B$, dir: "sw", d: 9)
  lbl(p, D4, $D$, dir: "s", d: 10)
  lbl(p, C4, $C$, dir: "se", d: 9)
  lbl(p, (247, 927), tsm[(3)], dir: "c", d: 0)

  let B5 = (394, 887)
  let C5 = (572, 887)
  tri(B5, C5, 457, h); let A5 = (457, B5.at(1) - h); let D5 = (457, B5.at(1))
  let M5 = lerp(A5, B5, 0.5)
  dseg(p, M5, (M5.at(0) + 178, M5.at(1)))
  dseg(p, (M5.at(0) + 178, M5.at(1)), C5)
  tseg(p, B5, C5)
  dseg(p, A5, D5)
  lbl(p, A5, $A$, dir: "n", d: 9)
  lbl(p, B5, $B$, dir: "sw", d: 9)
  lbl(p, D5, $D$, dir: "s", d: 10)
  lbl(p, C5, $C$, dir: "se", d: 9)
  lbl(p, (486, 927), tsm[(4)], dir: "c", d: 0)

  let B6 = (632, 887)
  let C6 = (812, 887)
  tri(B6, C6, 693, h); let A6 = (693, B6.at(1) - h); let D6 = (693, B6.at(1))
  let F6 = lerp(B6, C6, 0.5)
  dseg(p, A6, (A6.at(0) + (F6.at(0) - B6.at(0)), A6.at(1)))
  dseg(p, (A6.at(0) + (F6.at(0) - B6.at(0)), A6.at(1)), F6)
  tseg(p, A6, D6)
  lbl(p, A6, $A$, dir: "n", d: 9)
  lbl(p, B6, $B$, dir: "sw", d: 9)
  lbl(p, D6, $D$, dir: "s", d: 10)
  lbl(p, C6, $C$, dir: "se", d: 9)
})
