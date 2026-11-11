// 习题 2·9 第 3–10 题、第 12、14、15、16 题的插图（原书 p.119–122）；页面 200 dpi 坐标。
// 图形只按已知条件描出各点位置，原图无等长记号的不加。
#import "G-base.typ": *

// 第 3 题（p.119）
#let fig-G-q3(width: 270 * k) = px-canvas(270, 270, origin: (160, 445), width: width, (p, u) => {
  import cetz.draw: *
  let (C, D, A, B) = ((298, 458), (293, 641), (187, 689), (393, 698))
  seg(p, C, A)
  seg(p, C, B)
  seg(p, C, D)
  seg(p, D, A)
  seg(p, D, B)
  lbl(p, C, $C$, dir: "n")
  lbl(p, A, $A$, dir: "sw")
  lbl(p, B, $B$, dir: "se")
  lbl(p, D, $D$, dir: "s", d: 11)
  content(p(284, 620), tsm($1$))
  content(p(304, 621), tsm($2$))
})

// 第 4 题（p.119）
#let fig-G-q4(width: 330 * k) = px-canvas(330, 190, origin: (500, 515), width: width, (p, u) => {
  import cetz.draw: *
  let (D, C, B, A) = ((597, 531), (800, 531), (730, 666), (528, 666))
  poly(p, (A, B, C, D), close: true)
  seg(p, D, B)
  lbl(p, D, $D$, dir: "nw")
  lbl(p, C, $C$, dir: "ne")
  lbl(p, B, $B$, dir: "se")
  lbl(p, A, $A$, dir: "sw")
  content(p(597, 551), tsm($2$))
  content(p(623, 541), tsm($3$))
  content(p(703, 655), tsm($1$))
  content(p(727, 645), tsm($4$))
})

// 第 5 题（p.119）
#let fig-G-q5(width: 330 * k) = px-canvas(330, 190, origin: (120, 1015), width: width, (p, u) => {
  import cetz.draw: *
  let (B, C, A, D) = ((150, 1036), (418, 1036), (218, 1170), (353, 1168))
  seg(p, B, C)
  seg(p, B, A)
  seg(p, C, D)
  seg(p, B, D)
  seg(p, C, A)
  lbl(p, B, $B$, dir: "nw")
  lbl(p, C, $C$, dir: "ne")
  lbl(p, A, $A$, dir: "sw")
  lbl(p, D, $D$, dir: "se")
})

// 第 6 题（p.119）：E 在 AB 上，D 在 AC 上
#let fig-G-q6(width: 340 * k) = px-canvas(340, 315, origin: (490, 935), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((515, 1078), (783, 945), (800, 1227))
  let E = G-at(A, B, 0.505)
  let D = G-at(A, C, 0.466)
  seg(p, A, B)
  seg(p, A, C)
  seg(p, E, C)
  seg(p, B, D)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "ne")
  lbl(p, C, $C$, dir: "se")
  lbl(p, E, $E$, dir: "n", d: 11)
  lbl(p, D, $D$, dir: "s", d: 11)
  content(p(648, 1027), tsm($1$))
  content(p(648, 1133), tsm($2$))
})

// 第 7 题（p.120）：B、D、C、F 在一条直线上
#let fig-G-q7(width: 230 * k) = px-canvas(230, 335, origin: (240, 305), width: width, (p, u) => {
  import cetz.draw: *
  let (B, F) = ((257, 332), (442, 610))
  let D = G-at(B, F, 0.249)
  let C = G-at(B, F, 0.708)
  let A = (278, C.at(1))
  let E = (418, D.at(1))
  seg(p, B, F)
  seg(p, B, A)
  seg(p, A, C)
  seg(p, D, E)
  seg(p, E, F)
  lbl(p, B, $B$, dir: "n")
  lbl(p, D, $D$, dir: "ne", d: 11)
  lbl(p, E, $E$, dir: "ne", d: 10)
  lbl(p, A, $A$, dir: "s", d: 11)
  lbl(p, C, $C$, dir: "se", d: 11)
  lbl(p, F, $F$, dir: "s")
})

// 第 8 题（p.120）
#let fig-G-q8(width: 330 * k) = px-canvas(330, 190, origin: (545, 400), width: width, (p, u) => {
  import cetz.draw: *
  let (D, C, B, A) = ((638, 425), (842, 425), (773, 563), (568, 563))
  poly(p, (A, B, C, D), close: true)
  seg(p, D, B)
  anglearc(p, D, A, B, 16)   // ∠1、∠2 的小角弧（原图有）
  anglearc(p, B, D, C, 16)
  lbl(p, D, $D$, dir: "n", d: 10)
  lbl(p, C, $C$, dir: "ne")
  lbl(p, B, $B$, dir: "se")
  lbl(p, A, $A$, dir: "sw")
  content(p(645, 449), tsm($1$))
  content(p(769, 541), tsm($2$))
})

// 第 9 题（p.120）
#let fig-G-q9(width: 330 * k) = px-canvas(330, 190, origin: (190, 945), width: width, (p, u) => {
  import cetz.draw: *
  let (D, C, A, B) = ((284, 963), (421, 963), (220, 1098), (488, 1098))
  seg(p, A, B)
  seg(p, A, D)
  seg(p, B, C)
  seg(p, A, C)
  seg(p, B, D)
  lbl(p, D, $D$, dir: "n", d: 10)
  lbl(p, C, $C$, dir: "n", d: 10)
  lbl(p, A, $A$, dir: "sw")
  lbl(p, B, $B$, dir: "se")
  content(p(245, 1067), tsm($4$))
  content(p(257, 1087), tsm($1$))
  content(p(460, 1072), tsm($3$))
  content(p(447, 1090), tsm($2$))
})

// 第 10 题（p.120）
#let fig-G-q10(width: 300 * k) = px-canvas(300, 245, origin: (560, 905), width: width, (p, u) => {
  import cetz.draw: *
  let (A, C, B, D) = ((590, 1027), (823, 1027), (757, 929), (757, 1126))
  seg(p, A, C)
  seg(p, A, B)
  seg(p, A, D)
  seg(p, B, C)
  seg(p, D, C)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, B, $B$, dir: "n", d: 10)
  lbl(p, D, $D$, dir: "s", d: 10)
  content(p(632, 1015), tsm($1$))
  content(p(630, 1041), tsm($2$))
})

// 第 12 题（p.121）：B、C、D、E 在一条直线上
#let fig-G-q12(width: 330 * k) = px-canvas(330, 215, origin: (510, 200), width: width, (p, u) => {
  import cetz.draw: *
  let (B, C, D, E, A) = ((535, 385), (603, 385), (737, 385), (803, 385), (668, 218))
  seg(p, B, E)
  seg(p, A, B)
  seg(p, A, C)
  seg(p, A, D)
  seg(p, A, E)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "s", d: 10)
  lbl(p, D, $D$, dir: "s", d: 10)
  lbl(p, E, $E$, dir: "e", d: 11)
})

// 第 14 题（p.121）：F 在 AB 上，E 在 AC 上；原图无 BC 线
#let fig-G-q14(width: 250 * k) = px-canvas(250, 250, origin: (150, 990), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((274, 1010), (172, 1208), (377, 1208))
  let F = G-at(A, B, 0.58)
  let E = G-at(A, C, 0.58)
  seg(p, A, B)
  seg(p, A, C)
  seg(p, B, E)
  seg(p, C, F)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, F, $F$, dir: "w", d: 11)
  lbl(p, E, $E$, dir: "e", d: 11)
  lbl(p, B, $B$, dir: "sw", d: 11)
  lbl(p, C, $C$, dir: "se", d: 11)
})

// 第 15 题（p.121）：直线 AE、CD 相交于 B
#let fig-G-q15(width: 445 * k) = px-canvas(445, 175, origin: (395, 1025), width: width, (p, u) => {
  import cetz.draw: *
  let (C, E, A, D) = ((413, 1045), (778, 1050), (452, 1170), (818, 1175))
  let B = G-meet(C, D, A, E)
  seg(p, C, D)
  seg(p, A, E)
  seg(p, C, A)
  seg(p, E, D)
  lbl(p, C, $C$, dir: "nw", d: 10)
  lbl(p, E, $E$, dir: "ne", d: 10)
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, D, $D$, dir: "se", d: 10)
  content(p(B.at(0), B.at(1) - 12), tt($B$))
})

// 第 16 题（p.122）
#let fig-G-q16(width: 315 * k) = px-canvas(315, 190, origin: (565, 165), width: width, (p, u) => {
  import cetz.draw: *
  let (D, C, B, A) = ((650, 191), (855, 191), (795, 326), (588, 326))
  poly(p, (A, B, C, D), close: true)
  seg(p, A, C)
  lbl(p, D, $D$, dir: "nw")
  lbl(p, C, $C$, dir: "ne")
  lbl(p, B, $B$, dir: "se")
  lbl(p, A, $A$, dir: "sw")
})
