// 习题 2·3~2·4 第 1、8、10、16 题的图（原书 p.134、p.135）；页面 120 dpi 坐标。
// 第 10 题起重机（写实器械）画成简化示意：保留直柱 c、吊杆 b、吊链 a、120° 角和斜线填充的建筑物剖面。
#import "G-base.typ": *

// 第 1 题左图：锐角三角形，b 在 c 上的射影 p
#let fig-G-ex234-1a(width: 270 * k) = px-canvas(270, 190, origin: (210, 195), width: width, (p, u) => {
  import cetz.draw: *
  let A = (228, 352)
  let B = (460, 352)
  let P = (385, 210)
  let F = (385, 352)
  poly(p, (A, P, B), close: true)
  seg(p, A, B)
  seg(p, P, F)
  rtmark(p, F, P, B, s: 8)
  lbl(p, (295, 278), $b$, dir: "c", d: 0)
  lbl(p, (432, 278), $a$, dir: "c", d: 0)
  lbl(p, (373, 293), $h$, dir: "c", d: 0)
  lbl(p, (320, 342), $c$, dir: "c", d: 0)
  dimh(p, 228, 385, 368, lab: $p$, labx: 305, gapw: 14)
  seg(p, (228, 360), (228, 376))
  seg(p, (385, 360), (385, 376))
})

// 第 1 题右图：钝角（b 在 c 延长线上的射影 p）
#let fig-G-ex234-1b(width: 250 * k) = px-canvas(250, 200, origin: (495, 185), width: width, (p, u) => {
  import cetz.draw: *
  let A = (510, 352)
  let B = (655, 352)
  let P = (727, 198)
  let F = (727, 352)
  seg(p, A, P)
  seg(p, B, P)
  seg(p, A, B)
  dseg(p, B, F)
  seg(p, P, F)
  rtmark(p, F, P, B, s: 8)
  lbl(p, (607, 268), $b$, dir: "c", d: 0)
  lbl(p, (692, 297), $a$, dir: "c", d: 0)
  lbl(p, (735, 277), $h$, dir: "c", d: 0)
  lbl(p, (593, 343), $c$, dir: "c", d: 0)
  dimh(p, 510, 727, 366, lab: $p$, labx: 620, gapw: 14)
  seg(p, (510, 358), (510, 374))
  seg(p, (727, 358), (727, 374))
})

// 第 8 题：铁质梁架
#let fig-G-ex234-8(width: 470 * k) = px-canvas(470, 185, origin: (255, 1000), width: width, (p, u) => {
  import cetz.draw: *
  let L = (267, 1152)
  let R = (712, 1148)
  let T = (489, 1013)
  let M = (488, 1150)
  let PL = (405, 1067)
  let PR = (574, 1067)
  let QL = (340, 1111)
  let QR = (647, 1109)
  G-bold(p, L, T)
  G-bold(p, T, R)
  G-bold(p, L, R)
  G-bold(p, T, M)
  G-bold(p, PL, (405, 1150))
  G-bold(p, PR, (574, 1150))
  G-bold(p, PL, M)
  G-bold(p, PR, M)
  G-bold(p, QL, (405, 1150))
  G-bold(p, QR, (574, 1150))
  line(p(..PL), p(..PR), stroke: (thickness: 1.3pt, dash: "dashed"))
  rtmark(p, (405, 1150), PL, R, s: 8)
  rtmark(p, (574, 1150), PR, L, s: 8)
  lbl(p, (386, 1091), $3$, dir: "c", d: 0)
  lbl(p, (396, 1111), $3$, dir: "c", d: 0)
  lbl(p, (372, 1120), $3$, dir: "c", d: 0)
  lbl(p, (604, 1095), $3$, dir: "c", d: 0)
  lbl(p, (581, 1108), $3$, dir: "c", d: 0)
  lbl(p, (608, 1120), $3$, dir: "c", d: 0)
  dimh(p, 405, 489, 1168, lab: $3$, labx: 447, gapw: 14)
  dimh(p, 489, 574, 1168, lab: $3$, labx: 531, gapw: 14)
  seg(p, (405, 1160), (405, 1176))
  seg(p, (489, 1160), (489, 1176))
  seg(p, (574, 1160), (574, 1176))
})

// 第 10 题：起重机
#let fig-G-ex234-10(width: 330 * k) = px-canvas(330, 200, origin: (545, 225), width: width, (p, u) => {
  import cetz.draw: *
  // 建筑物剖面：C 形（上臂 337–355，下臂 395–412，竖臂 710–735）
  let hatch(x0, y0, x1, y1) = {
    let x = x0
    while x < x1 {
      let xe = calc.min(x + (y1 - y0), x1)
      line(p(x, y1), p(xe, y1 - (xe - x)), stroke: lt)
      x += 8
    }
  }
  line(p(560, 337), p(735, 337), p(735, 412), p(560, 412), stroke: lw)
  line(p(560, 355), p(710, 355), p(710, 395), p(560, 395), stroke: lw)
  hatch(562, 337, 735, 355)
  hatch(562, 395, 735, 412)
  hatch(710, 355, 735, 395)
  // 直柱 c（双线）
  rect(p(724, 235), p(735, 337), stroke: lw)
  // 缆索与吊杆
  seg(p, (730, 243), (578, 337))
  seg(p, (735, 243), (830, 400))
  line(p(737, 338), p(829, 402), stroke: lw)
  line(p(735, 345), p(826, 406), stroke: lw)
  // 地面与底座
  line(p(735, 412), p(868, 412), stroke: lw)
  rect(p(824, 403), p(842, 411), stroke: lw)
  for x in range(740, 868, step: 11) {
    line(p(x, 414), p(x - 6, 422), stroke: lt)
  }
  // 120° 角：直柱与吊杆之间
  arc(p(735, 340), start: -90deg, stop: -30deg, radius: 16, anchor: "origin", stroke: lt)
  lbl(p, (722, 292), $c$, dir: "c", d: 0)
  lbl(p, (766, 327), $120°$, dir: "c", d: 0)
  lbl(p, (806, 322), $a$, dir: "c", d: 0)
  lbl(p, (814, 357), $b$, dir: "c", d: 0)
})

// 第 16 题：等腰梯形 ABCD，AE ⊥ BC，DF ⊥ BC
#let fig-G-ex234-16(width: 315 * k) = px-canvas(315, 190, origin: (570, 1050), width: width, (p, u) => {
  import cetz.draw: *
  let A = (655, 1070)
  let D = (795, 1070)
  let B = (587, 1210)
  let C = (863, 1210)
  let E = (655, 1210)
  let F = (795, 1210)
  poly(p, (A, B, C, D), close: true)
  seg(p, A, C)
  dseg(p, A, E)
  dseg(p, D, F)
  rtmark(p, E, A, C, s: 8)
  rtmark(p, F, D, C, s: 8)
  lbl(p, A, $A$, dir: "nw", d: 9)
  lbl(p, D, $D$, dir: "ne", d: 9)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, E, $E$, dir: "s", d: 12)
  lbl(p, F, $F$, dir: "s", d: 12)
})
