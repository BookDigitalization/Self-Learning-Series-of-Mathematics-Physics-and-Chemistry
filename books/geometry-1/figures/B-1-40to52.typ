// 图 1·40–图 1·52（原书 p.27–32），读坐标时的页面渲染 200 dpi。
// 原图手绘，射线方向按图上量得并按题意规整（如 1·43 三等分、1·52 的 1:2:3:4）。
#import "/books/geometry-1/figures/B-lib.typ": *

// 图 1·40（p.27）：∠ABC = ∠1 + ∠2 + ∠3
#let fig-B-1-40(width: 650 * k) = px-canvas(650, 235, origin: (160, 295), width: width, (p, u) => {
  import cetz.draw: *
  let v1 = (172, 473)
  B-ray(p, v1, (303, 473))
  B-ray(p, v1, (297, 414))
  anglearc(p, v1, (303, 473), (297, 414), 45)
  lbl(p, (226, 462), $1$, dir: "c", d: 0)
  let v2 = (343, 406)
  B-ray(p, v2, (480, 406))
  B-ray(p, v2, (478, 355))
  anglearc(p, v2, (480, 406), (478, 355), 60)
  lbl(p, (414, 395), $2$, dir: "c", d: 0)
  let v3 = (347, 500)
  B-ray(p, v3, (470, 500))
  B-ray(p, v3, (465, 418))
  anglearc(p, v3, (470, 500), (465, 418), 40)
  lbl(p, (396, 488), $3$, dir: "c", d: 0)
  let b = (522, 495)
  let a = (783, 489)
  let d = (737, 392)
  let e = (680, 330)
  let c = (545, 308)
  for t in (a, d, e, c) { B-ray(p, b, t) }
  anglearc(p, b, a, d, 62)
  anglearc(p, b, d, e, 52)
  anglearc(p, b, e, c, 38)
  lbl(p, (582, 481), $1$, dir: "c", d: 0)
  lbl(p, (572, 458), $2$, dir: "c", d: 0)
  lbl(p, (540, 452), $3$, dir: "c", d: 0)
  lbl(p, b, $B$, dir: "s", d: 12)
  lbl(p, a, $A$, dir: "e", d: 10)
  lbl(p, d, $D$, dir: "e", d: 10)
  lbl(p, e, $E$, dir: "ne", d: 10)
  lbl(p, c, $C$, dir: "n", d: 11)
})

// 图 1·41（p.27）：∠EOF = ∠4 − ∠5
#let fig-B-1-41(width: 740 * k) = px-canvas(740, 290, origin: (120, 670), width: width, (p, u) => {
  import cetz.draw: *
  let v4 = (130, 815)
  B-ray(p, v4, (302, 815))
  B-ray(p, v4, (285, 682))
  anglearc(p, v4, (302, 815), (285, 682), 50)
  lbl(p, (188, 797), $4$, dir: "c", d: 0)
  let v5 = (140, 943)
  B-ray(p, v5, (302, 943))
  B-ray(p, v5, (300, 862))
  anglearc(p, v5, (302, 943), (300, 862), 50)
  lbl(p, (185, 932), $5$, dir: "c", d: 0)
  // 中：E 在下，∠4 = ∠EOG，∠5 = ∠FOG
  let o = (333, 888)
  let e = B-pt(o, 0, 227)
  let g = B-pt(o, 41, 230)
  let f = B-pt(o, 14, 230)
  for t in (e, g, f) { B-ray(p, o, t) }
  anglearc(p, o, e, g, 100)
  anglearc(p, o, f, g, 68)
  lbl(p, (385, 862), $5$, dir: "c", d: 0)
  lbl(p, (412, 851), $4$, dir: "c", d: 0)
  lbl(p, o, $O$, dir: "w", d: 11)
  lbl(p, e, $E$, dir: "e", d: 10)
  lbl(p, g, $G$, dir: "ne", d: 10)
  lbl(p, f, $F$, dir: "e", d: 10)
  // 右：G 在下，∠4 = ∠GOF，∠5 = ∠GOE
  let o2 = (607, 885)
  let g2 = B-pt(o2, 0, 233)
  let e2 = B-pt(o2, 27, 230)
  let f2 = B-pt(o2, 42, 235)
  for t in (g2, e2, f2) { B-ray(p, o2, t) }
  anglearc(p, o2, g2, f2, 100)
  anglearc(p, o2, g2, e2, 72)
  lbl(p, (665, 869), $5$, dir: "c", d: 0)
  lbl(p, (693, 862), $4$, dir: "c", d: 0)
  lbl(p, o2, $O$, dir: "w", d: 11)
  lbl(p, g2, $G$, dir: "e", d: 10)
  lbl(p, e2, $E$, dir: "e", d: 10)
  lbl(p, f2, $F$, dir: "ne", d: 10)
})

// 图 1·42（p.28）：∠POQ = ∠a + ∠a + ∠a
#let fig-B-1-42(width: 500 * k) = px-canvas(500, 225, origin: (250, 250), width: width, (p, u) => {
  import cetz.draw: *
  let v = (258, 422)
  B-ray(p, v, (437, 422))
  B-ray(p, v, (430, 378))
  anglearc(p, v, (437, 422), (430, 378), 75)
  lbl(p, (330, 412), $a$, dir: "c", d: 0)
  let o = (463, 450)
  let ps = (0, 14, 28.5, 43).map(a => B-pt(o, a, 265))
  for t in ps { B-ray(p, o, t) }
  for i in range(3) { anglearc(p, o, ps.at(i), ps.at(i + 1), 75) }
  for (x, y) in ((527, 441), (522, 426), (517, 409)) { lbl(p, (x, y), $a$, dir: "c", d: 0) }
  lbl(p, o, $O$, dir: "w", d: 11)
  lbl(p, ps.at(0), $P$, dir: "e", d: 10)
  lbl(p, ps.at(1), $R$, dir: "e", d: 10)
  lbl(p, ps.at(2), $S$, dir: "e", d: 10)
  lbl(p, ps.at(3), $Q$, dir: "ne", d: 10)
})

// 图 1·43（p.28）：三等分 ∠AOB
#let fig-B-1-43(width: 330 * k) = px-canvas(330, 230, origin: (150, 880), width: width, (p, u) => {
  import cetz.draw: *
  let o = (180, 1097)
  let a = B-pt(o, 0, 255)
  let e = B-pt(o, 22, 255)
  let f = B-pt(o, 44, 252)
  let b = B-pt(o, 66, 228)
  for t in (a, e, f, b) { B-ray(p, o, t) }
  lbl(p, o, $O$, dir: "sw", d: 9)
  lbl(p, a, $A$, dir: "e", d: 10)
  lbl(p, e, $E$, dir: "e", d: 10)
  lbl(p, f, $F$, dir: "ne", d: 10)
  lbl(p, b, $B$, dir: "n", d: 11)
})

// 图 1·44（p.28）：OC 是 ∠AOB 的平分线
#let fig-B-1-44(width: 340 * k) = px-canvas(340, 230, origin: (510, 880), width: width, (p, u) => {
  import cetz.draw: *
  let o = (545, 1097)
  let a = B-pt(o, 0, 275)
  let c = B-pt(o, 23, 265)
  let b = B-pt(o, 46, 265)
  for t in (a, c, b) { B-ray(p, o, t) }
  anglearc(p, o, a, c, 34)
  anglearc(p, o, c, b, 34)
  lbl(p, o, $O$, dir: "sw", d: 9)
  lbl(p, a, $A$, dir: "e", d: 10)
  lbl(p, c, $C$, dir: "e", d: 10)
  lbl(p, b, $B$, dir: "ne", d: 10)
})

// 图 1·45（p.29）：折纸得直角
#let fig-B-1-45(width: 430 * k) = px-canvas(430, 220, origin: (270, 645), width: width, (p, u) => {
  import cetz.draw: *
  poly(p, ((285, 672), (688, 672), (688, 838), (285, 838)), close: true)
  line(p(488, 672), p(488, 818), stroke: dsh)
  B-arc(p, (488, 838), 0, 180, 15)
  lbl(p, (467, 821), $d$, dir: "c", d: 0)
  lbl(p, (508, 821), $d$, dir: "c", d: 0)
  lbl(p, (488, 656), $C$, dir: "c", d: 0)
  lbl(p, (488, 851), $O$, dir: "c", d: 0)
  lbl(p, (289, 851), $B$, dir: "c", d: 0)
  lbl(p, (685, 851), $A$, dir: "c", d: 0)
})

// 图 1·46（p.30）：锐角 ∠A、∠B 与钝角 ∠C、∠D
#let fig-B-1-46(width: 700 * k) = px-canvas(700, 230, origin: (150, 335), width: width, (p, u) => {
  import cetz.draw: *
  let a = (190, 395)
  B-ray(p, a, (166, 565))
  B-ray(p, a, (253, 562))
  anglearc(p, a, (166, 565), (253, 562), 40)
  lbl(p, a, $A$, dir: "n", d: 10)
  let b = (285, 490)
  B-ray(p, b, (405, 407))
  B-ray(p, b, (430, 494))
  anglearc(p, b, (405, 407), (430, 494), 32)
  lbl(p, b, $B$, dir: "w", d: 11)
  let c = (578, 435)
  B-ray(p, c, (465, 514))
  B-ray(p, c, (697, 513))
  anglearc(p, c, (465, 514), (697, 513), 18)
  anglearc(p, c, (465, 514), (697, 513), 23)
  lbl(p, c, $C$, dir: "n", d: 11)
  let d = (828, 460)
  B-ray(p, d, (741, 343))
  B-ray(p, d, (764, 562))
  anglearc(p, d, (741, 343), (764, 562), 18)
  anglearc(p, d, (741, 343), (764, 562), 23)
  lbl(p, d, $D$, dir: "e", d: 12)
})

// 图 1·47（p.30）：大于平角的角
#let fig-B-1-47(width: 240 * k) = px-canvas(240, 150, origin: (640, 790), width: width, (p, u) => {
  import cetz.draw: *
  let v = (828, 860)
  B-ray(p, v, (660, 800))
  B-ray(p, v, (665, 935))
  B-arc(p, v, -155.3, 160.4, 38)
})

// 图 1·48（p.31）：∠AOB = ∠DOC
#let fig-B-1-48(width: 440 * k) = px-canvas(440, 175, origin: (255, 165), width: width, (p, u) => {
  import cetz.draw: *
  let o = (475, 307)
  B-ray(p, (280, 307), (690, 307))
  B-ray(p, o, (292, 185))
  B-ray(p, o, (655, 180))
  lbl(p, (280, 307), $A$, dir: "w", d: 10)
  lbl(p, (690, 307), $D$, dir: "e", d: 10)
  lbl(p, o, $O$, dir: "s", d: 12)
  lbl(p, (292, 185), $B$, dir: "nw", d: 10)
  lbl(p, (655, 180), $C$, dir: "ne", d: 10)
})

// 图 1·49（p.31）：∠AOC = ∠BOD
#let fig-B-1-49(width: 420 * k) = px-canvas(420, 270, origin: (430, 665), width: width, (p, u) => {
  import cetz.draw: *
  let o = (612, 915)
  let a = (835, 915)
  let b = (815, 775)
  let c = (580, 690)
  let d = (450, 750)
  for t in (a, b, c, d) { B-ray(p, o, t) }
  anglearc(p, o, a, c, 34)
  anglearc(p, o, b, d, 24)
  lbl(p, o, $O$, dir: "s", d: 12)
  lbl(p, a, $A$, dir: "e", d: 10)
  lbl(p, b, $B$, dir: "ne", d: 10)
  lbl(p, c, $C$, dir: "n", d: 11)
  lbl(p, d, $D$, dir: "nw", d: 10)
})

// 图 1·50（p.31）：∠AOB = 90°，∠1 = 21°30′，∠2 = 50°15′
#let fig-B-1-50(width: 260 * k) = px-canvas(260, 240, origin: (565, 975), width: width, (p, u) => {
  import cetz.draw: *
  let o = (590, 1205)
  let a = B-pt(o, 0, 210)
  let r1 = B-pt(o, 21.5, 190)
  let r2 = B-pt(o, 71.75, 185)
  let b = B-pt(o, 90, 213)
  for t in (a, r1, r2, b) { B-ray(p, o, t) }
  anglearc(p, o, a, r1, 42)
  anglearc(p, o, r1, r2, 33)
  anglearc(p, o, r2, b, 30)
  lbl(p, (640, 1194), $1$, dir: "c", d: 0)
  lbl(p, (622, 1172), $2$, dir: "c", d: 0)
  lbl(p, (595, 1162), $3$, dir: "c", d: 0)
  lbl(p, o, $O$, dir: "sw", d: 9)
  lbl(p, a, $A$, dir: "e", d: 11)
  lbl(p, b, $B$, dir: "n", d: 11)
})

// 图 1·51（p.32）：窗框，相邻两根木条的夹角 a = 30°
#let fig-B-1-51(width: 460 * k) = px-canvas(460, 255, origin: (290, 395), width: width, (p, u) => {
  import cetz.draw: *
  let o = (520, 628)
  arc(p(..o), start: 0deg, stop: 180deg, radius: 223, anchor: "origin", stroke: 1.4pt)
  arc(p(..o), start: 0deg, stop: 180deg, radius: 195, anchor: "origin", stroke: 1.1pt)
  line(p(297, 628), p(297, 648), p(743, 648), p(743, 628), stroke: 1.4pt)
  line(p(325, 628), p(715, 628), stroke: 1.1pt)
  // 中心的小半圆
  arc(p(..o), start: 0deg, stop: 180deg, radius: 45, anchor: "origin", stroke: 1.1pt)
  arc(p(..o), start: 0deg, stop: 180deg, radius: 35, anchor: "origin", stroke: 1.1pt)
  // 五根木条（双线）
  for ang in (30, 60, 90, 120, 150) {
    let c = calc.cos(ang * 1deg)
    let s = calc.sin(ang * 1deg)
    for off in (-4, 4) {
      let (ox, oy) = (o.at(0) - s * off, o.at(1) - c * off)
      line(p(ox + c * 45, oy - s * 45), p(ox + c * 195, oy - s * 195), stroke: 0.9pt)
    }
  }
  line(p(..o), p(..B-pt(o, 30, 240)), stroke: lt)
  lbl(p, (571, 617), $a$, dir: "c", d: 0)
})

// 图 1·52（p.32）：四条射线，∠AOB : ∠BOC : ∠COD : ∠DOA = 1 : 2 : 3 : 4
#let fig-B-1-52(width: 320 * k) = px-canvas(320, 250, origin: (565, 885), width: width, (p, u) => {
  import cetz.draw: *
  let o = (660, 1052)
  let a = B-pt(o, 0, 195)
  let b = B-pt(o, 36, 190)
  let c = B-pt(o, 108, 165)
  let d = B-pt(o, 216, 100)
  for t in (a, b, c, d) { B-ray(p, o, t) }
  lbl(p, o, $O$, dir: "s", d: 12)
  lbl(p, a, $A$, dir: "e", d: 11)
  lbl(p, b, $B$, dir: "ne", d: 10)
  lbl(p, c, $C$, dir: "nw", d: 10)
  lbl(p, d, $D$, dir: "sw", d: 10)
})
