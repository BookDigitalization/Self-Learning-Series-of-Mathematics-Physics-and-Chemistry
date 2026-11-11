// 习题 2·9 第 18–24 题的插图（原书 p.122–124）；页面 200 dpi 坐标。
// 第 18、19、20、22 题带实物（平分角仪、曲尺、池塘、河流），用 CeTZ 画成示意：
// 仪器按几何关系重建，池塘、河流的轮廓和水纹只求大致相似。
#import "G-base.typ": *

// 第 18 题 平分角仪（p.122）
#let fig-G-q18(width: 360 * k) = px-canvas(360, 445, origin: (150, 565), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D, E) = ((322, 594), (462, 735), (322, 833), (180, 733), (322, 984))
  G-bar(p, (322, 600), E, 14, hatch: true, hstep: 7)
  for (a, b) in ((A, B), (B, C), (C, D), (D, A)) { G-bar(p, a, b, 12) }
  for c in (A, B, C, D) { G-hole(p, c, r: 4) }
  rect(p(331, 706), p(356, 738), fill: white, stroke: none)
  content(p(343, 722), tsm[槽])
  lbl(p, A, $A$, dir: "n", d: 20)
  lbl(p, B, $B$, dir: "e", d: 20)
  content(p(349, 838), tt($C$))
  lbl(p, D, $D$, dir: "w", d: 20)
  lbl(p, E, $E$, dir: "s", d: 11)
})

// 第 19 题 曲尺平分角（p.122）
#let fig-G-q19(width: 385 * k) = px-canvas(385, 365, origin: (495, 635), width: width, (p, u) => {
  import cetz.draw: *
  let (O, A, B, C) = ((855, 652), (530, 727), (770, 975), (552, 945))
  // 曲尺：直角在 (612, 890)，内角 M 在 (640, 862)
  line(p(612, 648), p(640, 648), p(640, 862), p(853, 862), p(853, 890), p(612, 890), close: true, stroke: lw, fill: white)
  for i in range(0, 21) {
    let y = 862 - i * 10
    line(p(640, y), p(640 - (if calc.rem(i, 5) == 0 { 12 } else { 8 }), y), stroke: lt)
  }
  for i in range(0, 21) {
    let x = 640 + i * 10
    line(p(x, 862), p(x, 862 + (if calc.rem(i, 5) == 0 { 12 } else { 8 })), stroke: lt)
  }
  seg(p, O, A)
  seg(p, O, B)
  seg(p, O, C)
  lbl(p, O, $O$, dir: "ne", d: 11)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "s", d: 11)
  lbl(p, C, $C$, dir: "sw", d: 11)
  content(p(649, 690), tt($P$))
  content(p(666, 852), tt($M$))
  content(p(811, 850), tt($Q$))
})

// 第 20 题 池塘两头 A、B（p.123）
#let fig-G-q20(width: 350 * k) = px-canvas(350, 310, origin: (170, 300), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, D, E) = ((237, 378), (493, 375), (428, 583), (185, 583))
  let C = G-meet(A, D, B, E)
  // 池塘轮廓
  catmull(p(245, 378), p(250, 342), p(264, 320), p(292, 311), p(322, 306), p(352, 313), p(386, 303), p(420, 309), p(452, 320), p(480, 330), p(494, 352), p(493, 375),
    p(470, 392), p(430, 405), p(390, 400), p(350, 406), p(310, 401), p(270, 394), close: true, stroke: lw, fill: white)
  // 水纹（横向短划线）
  for (y, x0, x1) in ((322, 292, 440), (334, 262, 468), (346, 256, 486), (358, 255, 488), (370, 258, 488), (382, 268, 478), (394, 290, 440)) {
    line(p(x0, y), p(x1, y), stroke: (paint: black, thickness: 0.8pt, dash: (4pt, 2.4pt)))
  }
  seg(p, A, D)
  seg(p, B, E)
  seg(p, E, D)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, C, $C$, dir: "e", d: 12)
  lbl(p, E, $E$, dir: "sw", d: 10)
  lbl(p, D, $D$, dir: "se", d: 10)
})

// 第 21 题（p.123）：AB=AC，E 在 AC 延长线上，BF=CE，FE 交 BC 于 M，FD∥AE。
// 原图只标了 BF、FD、CE 各 1 道短横和 B、C、E 及 ∠1、∠2 等处的弧；F、E、D、M 按 BF=CE、FD∥AE 的条件算出。
#let fig-G-q21(width: 305 * k) = px-canvas(305, 350, origin: (540, 275), width: width, (p, u) => {
  import cetz.draw: *
  let (B, C, A) = ((560, 490), (762, 490), (661, 290))
  let s = 96
  let F = G-go(B, A, s)
  let E = G-go(C, (2 * C.at(0) - A.at(0), 2 * C.at(1) - A.at(1)), s)
  let M = G-meet(F, E, B, C)
  let D = G-meet(F, (F.at(0) + (C.at(0) - A.at(0)), F.at(1) + (C.at(1) - A.at(1))), B, C)
  seg(p, A, B)
  seg(p, A, E)
  seg(p, B, C)
  seg(p, F, E)
  seg(p, F, D)
  ticks(p, B, F, 1)
  ticks(p, F, D, 1)
  ticks(p, C, E, 1)
  anglearc(p, B, C, A, 25)
  anglearc(p, C, B, A, 25)
  anglearc(p, D, C, F, 15)
  anglearc(p, F, D, M, 22)
  anglearc(p, E, F, C, 20)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "w", d: 12)
  lbl(p, C, $C$, dir: "e", d: 12)
  lbl(p, F, $F$, dir: "nw", d: 11)
  lbl(p, E, $E$, dir: "s", d: 11)
  content(p(M.at(0), M.at(1) - 12), tt($M$))
  content(p(D.at(0) + 4, D.at(1) + 16), tt($D$))
  content(p(D.at(0) + 21, D.at(1) - 9), tsm($1$))
  content(p(753, 509), tsm($2$))
})
