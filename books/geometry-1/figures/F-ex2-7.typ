// 习题 2·7 各题插图（原书 p.106–108）：第 1、2、3、5、6、7 题；页面 200 dpi 坐标。
// 第 5 题的树和人是写实插画，保留原扫描裁剪的二值化 PNG（F-q5-tree.png、F-q5-man.png），字母、虚线、三角板用 CeTZ 补。
#import "F-base.typ": *

// 第 1 题（p.106）：AB=AC，BO、CO 分别是两底角的平分线
#let fig-F-q1(width: 230 * k) = px-canvas(230, 270, origin: (205, 960), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, O) = ((317, 983), (221, 1221), (417, 1221), (318, 1148))
  poly(p, (A, B, C), close: true)
  seg(p, B, O)
  seg(p, C, O)
  ticks(p, A, B, 1)
  ticks(p, A, C, 1)
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "sw", d: 11)
  lbl(p, C, $C$, dir: "se", d: 11)
  lbl(p, O, $O$, dir: "n", d: 11)
  F-num(p, 247, 1188, $3$)
  F-num(p, 262, 1209, $1$)
  F-num(p, 393, 1188, $4$)
})

// 第 2 题（p.106）：AB=AC，PQ∥BC，交两腰于 E、F
#let fig-F-q2(width: 330 * k) = px-canvas(330, 270, origin: (515, 960), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((693, 982), (590, 1220), (792, 1220))
  let (E, F) = (F-at(A, B, (1158 - 982) / (1220 - 982)), F-at(A, C, (1158 - 982) / (1220 - 982)))
  poly(p, (A, B, C), close: true)
  seg(p, (532, 1158), (842, 1158))
  anglearc(p, B, C, A, 22)
  anglearc(p, C, B, A, 22)
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "sw", d: 11)
  lbl(p, C, $C$, dir: "se", d: 11)
  lbl(p, (532, 1158), $P$, dir: "w", d: 10)
  lbl(p, (842, 1158), $Q$, dir: "e", d: 10)
  lbl(p, E, $E$, dir: "nw", d: 11)
  lbl(p, F, $F$, dir: "ne", d: 11)
  F-num(p, 631, 1148, $1$)
  F-num(p, 748, 1148, $2$)
})

// 第 3 题（p.107）：河两岸 B、D 间的距离；A、B、C 在岸线上
#let fig-F-q3b(width: 400 * k) = px-canvas(400, 230, origin: (320, 375), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((335, 580), (412, 578), (690, 578), (603, 388))
  // 水纹：每行两段短划
  let offs = (0, 14, 6, 22, 10, 3, 18, 8, 26, 12, 4, 20, 9, 16, 2, 24)
  for i in range(16) {
    let y = 398 + i * 11
    let o = offs.at(i)
    let g = 430 + calc.rem(i * 53, 220)   // 每行断口位置错开，和原图的水纹一致
    line(p(368 + o, y), p(g - 6, y), stroke: lt)
    line(p(g + 6, y), p(708 - o / 2, y), stroke: lt)
  }
  seg(p, A, (712, 578))
  seg(p, D, B)
  seg(p, D, C)
  lbl(p, A, $A$, dir: "w", d: 9)
  lbl(p, B, $B$, dir: "s", d: 11)
  lbl(p, C, $C$, dir: "s", d: 11)
  lbl(p, D, $D$, dir: "n", d: 11)
})

// 第 5 题（p.107）：用等腰直角三角板 DEF 测树高 AB；AK=CD，DK=a
#let fig-F-q5(width: 410 * k) = px-canvas(410, 410, origin: (320, 850), width: width, (p, u) => {
  import cetz.draw: *
  F-img(p, u, "F-q5-tree.png", (325, 864, 480, 1246))
  F-img(p, u, "F-q5-man.png", (676, 1152, 712, 1236))
  let (B, E, D, F) = ((405, 866), (644, 1116), (688, 1158), (644, 1158))
  let bob = (643, 1185)
  dseg(p, B, E)
  seg(p, E, D)
  seg(p, E, F)
  seg(p, F, D)
  seg(p, F, bob)
  rect(p(637, 1200), p(650, 1185), fill: black, stroke: none)
  poly(p, ((654, 1137), (654, 1149), (667, 1149)), close: true)
  dseg(p, (396, 1158), (676, 1158))
  dseg(p, (410, 1233), (696, 1233))
  lbl(p, (412, 868), $B$, dir: "n", d: 14)
  lbl(p, (396, 1158), $C$, dir: "w", d: 10)
  lbl(p, (408, 1233), $A$, dir: "s", d: 12)
  lbl(p, E, $E$, dir: "ne", d: 11)
  lbl(p, (692, 1150), $D$, dir: "ne", d: 12)
  lbl(p, F, $F$, dir: "sw", d: 11)
  lbl(p, (697, 1233), $K$, dir: "s", d: 12)
})

// 第 6 题（p.108）：屋架 AB=7.4 m，D 是 AB 中点，DE、BC 垂直于 AC，∠HAB=150°
#let fig-F-q6(width: 500 * k) = px-canvas(500, 190, origin: (225, 395), width: width, (p, u) => {
  import cetz.draw: *
  let (H, A, E, C, B, D) = ((252, 548), (340, 548), (459, 548), (578, 548), (580, 414), (460, 481))
  seg(p, H, (702, 548))
  seg(p, A, B)
  seg(p, B, (697, 483))
  seg(p, D, E)
  seg(p, B, C)
  seg(p, D, C)
  // 屋架右端的折断符号
  line(p(697, 483), p(706, 495), p(697, 506), p(706, 518), p(697, 530), p(702, 548), stroke: lw)
  anglearc(p, A, H, B, 16)
  lbl(p, (312, 534), $150°$, dir: "c", d: 0)
  lbl(p, H, $H$, dir: "w", d: 9)
  lbl(p, A, $A$, dir: "s", d: 12)
  lbl(p, E, $E$, dir: "s", d: 12)
  lbl(p, C, $C$, dir: "s", d: 12)
  lbl(p, B, $B$, dir: "n", d: 11)
  lbl(p, D, $D$, dir: "nw", d: 11)
})

// 第 7 题（p.108）：AB=AC，∠1=∠2（BD、CD 各与 BA、CA 成等角）
#let fig-F-q7(width: 300 * k) = px-canvas(300, 190, origin: (320, 705), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((470, 725), (335, 880), (605, 880), (470, 790))
  poly(p, (A, B, C), close: true)
  seg(p, B, D)
  seg(p, C, D)
  anglearc(p, B, A, D, 42)
  anglearc(p, C, D, A, 42)
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "sw", d: 11)
  lbl(p, C, $C$, dir: "se", d: 11)
  lbl(p, D, $D$, dir: "n", d: 11)
  F-num(p, 388, 810, $1$)
  F-num(p, 548, 810, $2$)
})
