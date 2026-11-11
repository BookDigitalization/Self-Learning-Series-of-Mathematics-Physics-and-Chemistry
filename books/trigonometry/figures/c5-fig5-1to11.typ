// 三角 第 5 章 图 5·1–5·11（原书 p.177–189）。页面 200 dpi 坐标（页宽约 1271 像素）。
#import "c5-base.typ": *

// 图 5·1（p.177）锐角三角形，CD ⊥ AB
#let fig-c5-5-1(width: 450 * k) = px-canvas(450, 290, origin: (600, 900), width: width, (p, u) => {
  import cetz.draw: *
  let A = (625, 1157)
  let B = (1022, 1157)
  let C = (913, 927)
  let D = (913, 1157)
  poly(p, (A, B, C), close: true)
  c5-dseg(p, C, D)
  rtmark(p, D, C, B, s: 10)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, D, $D$, dir: "s", d: 12)
  lbl(p, c5-lerp(A, C, 0.55), $b$, dir: "nw", d: 11)
  lbl(p, c5-lerp(C, B, 0.5), $a$, dir: "ne", d: 11)
})

// 图 5·2（p.178）∠B 是直角
#let fig-c5-5-2(width: 260 * k) = px-canvas(260, 345, origin: (255, 222), width: width, (p, u) => {
  import cetz.draw: *
  let A = (277, 541)
  let B = (493, 541)
  let C = (493, 245)
  poly(p, (A, B, C), close: true)
  rtmark(p, B, A, C, s: 10)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, B, $B$, dir: "s", d: 12)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, c5-lerp(A, C, 0.5), $b$, dir: "nw", d: 10)
  lbl(p, c5-lerp(B, C, 0.5), $a$, dir: "e", d: 10)
})

// 图 5·3（p.178）∠B 是钝角，CD ⊥ AB 的延长线
#let fig-c5-5-3(width: 400 * k) = px-canvas(400, 345, origin: (585, 222), width: width, (p, u) => {
  import cetz.draw: *
  let A = (610, 540)
  let B = (780, 540)
  let D = (958, 540)
  let C = (958, 250)
  poly(p, (B, A, C, B))
  c5-dseg(p, B, D)
  c5-dseg(p, C, D)
  rtmark(p, D, A, C, s: 10)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, B, $B$, dir: "s", d: 12)
  lbl(p, D, $D$, dir: "se", d: 11)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, c5-lerp(A, C, 0.55), $b$, dir: "nw", d: 10)
  lbl(p, c5-lerp(B, C, 0.5), $a$, dir: "e", d: 10)
})

// 图 5·4（p.181）A = 105°，B = 60°，b = 4
#let fig-c5-5-4(width: 270 * k) = px-canvas(270, 415, origin: (705, 250), width: width, (p, u) => {
  import cetz.draw: *
  let A = (825, 629)
  let B = (946, 629)
  let C = (733, 272)
  poly(p, (A, B, C), close: true)
  anglearc(p, A, B, C, 16)
  anglearc(p, B, A, C, 16)
  lbl(p, A, $A$, dir: "s", d: 12)
  lbl(p, B, $B$, dir: "s", d: 12)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, c5-lerp(A, C, 0.45), $b = 4$, dir: "w", d: 20)
  lbl(p, c5-lerp(C, B, 0.55), $a$, dir: "ne", d: 10)
  lbl(p, c5-lerp(A, B, 0.5), $c$, dir: "s", d: 10)
  content(p(858, 611), tsm[$105°$])
  content(p(910, 614), tsm[$60°$])
})

// 图 5·5（p.181）A = 11°48′，C = 34°30′，b = 13.02
#let fig-c5-5-5(width: 530 * k) = px-canvas(530, 175, origin: (362, 818), width: width, (p, u) => {
  import cetz.draw: *
  let A = (385, 958)
  let B = (768, 955)
  let C = (862, 840)
  poly(p, (A, B, C), close: true)
  anglearc(p, A, B, C, 40)
  anglearc(p, C, A, B, 30)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, B, $B$, dir: "s", d: 12)
  lbl(p, C, $C$, dir: "ne", d: 10)
  lbl(p, c5-lerp(A, C, 0.45), $b = 13.02$, dir: "n", d: 13)
  lbl(p, c5-lerp(B, C, 0.5), $a$, dir: "se", d: 10)
  lbl(p, c5-lerp(A, B, 0.5), $c$, dir: "s", d: 11)
  content(p(458, 944), tsm[$11°48'$])
  content(p(812, 868), tsm[$34°30'$])
})

// 图 5·6（p.182）测河对岸 B，AC = 100 米，∠BAC = 74°，∠BCA = 44°（按角度算出 B 的位置）
#let fig-c5-5-6(width: 440 * k) = px-canvas(440, 345, origin: (385, 850), width: width, (p, u) => {
  import cetz.draw: *
  let A = (403, 1175)
  let C = (815, 1175)
  let ab = 412 * calc.sin(44deg) / calc.sin(62deg)
  let B = (403 + ab * calc.cos(74deg), 1175 - ab * calc.sin(74deg))
  // 河面（水波纹），y 在 930–1112 之间
  let rows = (939, 967, 997, 1025, 1053, 1080, 1105)
  for (i, y) in rows.enumerate() {
    let x = 412 + calc.rem(i, 2) * 18
    while x < 800 {
      let x2 = calc.min(x + 50, 807)
      let pts = range(11).map(j => {
        let t = j / 10
        p(x + (x2 - x) * t, y + 2.5 * calc.sin(t * 2 * calc.pi))
      })
      line(..pts, stroke: (paint: black, thickness: 1.1pt))
      x = x2 + 12
    }
  }
  // 两岸之间的部分画虚线
  let wy0 = 925
  let wy1 = 1115
  let cut(P, Q, y) = c5-lerp(P, Q, (y - P.at(1)) / (Q.at(1) - P.at(1)))
  seg(p, A, cut(A, B, wy1))
  c5-dseg(p, cut(A, B, wy1), cut(A, B, wy0))
  seg(p, cut(A, B, wy0), B)
  seg(p, B, cut(B, C, wy0))
  c5-dseg(p, cut(B, C, wy0), cut(B, C, wy1))
  seg(p, cut(B, C, wy1), C)
  seg(p, A, C)
  anglearc(p, A, C, B, 30)
  anglearc(p, C, B, A, 30)
  lbl(p, A, $A$, dir: "s", d: 13)
  lbl(p, B, $B$, dir: "n", d: 11)
  lbl(p, C, $C$, dir: "se", d: 11)
  content(p(452, 1158), tsm[$74°$])
  content(p(768, 1155), tsm[$44°$])
})

// 图 5·7（p.184）A 是钝角的三种情形；以 C 为圆心、a 为半径画弧（虚线）
#let fig-c5-5-7(width: 880 * k) = px-canvas(880, 735, origin: (180, 228), width: width, (p, u) => {
  import cetz.draw: *
  // (i) a > b
  let C = (208, 262)
  let A = (302, 512)
  let B = (525, 512)
  let P = (620, 512)
  seg(p, C, A)
  seg(p, A, P)
  seg(p, C, B)
  anglearc(p, A, C, P, 13)
  c5-darc(p, C, c5-dist(C, B), -52, -25)
  lbl(p, C, $C$, dir: "nw", d: 9)
  lbl(p, A, $A$, dir: "s", d: 12)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, P, $P$, dir: "s", d: 12)
  lbl(p, c5-lerp(C, A, 0.5), $b$, dir: "w", d: 10)
  lbl(p, c5-lerp(C, B, 0.5), $a > b$, dir: "ne", d: 12)
  content(p(400, 585), tt[(i)])
  // (ii) a = b
  let C = (633, 232)
  let A = (733, 512)
  let P = (1030, 512)
  let r = c5-dist(C, A)
  seg(p, C, A)
  seg(p, A, P)
  seg(p, C, c5-on(C, r, -34))
  anglearc(p, A, C, P, 13)
  c5-darc(p, C, r, -82, -21)
  lbl(p, C, $C$, dir: "nw", d: 9)
  lbl(p, A, $A$, dir: "s", d: 13)
  lbl(p, P, $P$, dir: "s", d: 12)
  lbl(p, c5-lerp(C, A, 0.5), $b$, dir: "w", d: 10)
  lbl(p, c5-lerp(C, c5-on(C, r, -34), 0.55), $a = b$, dir: "ne", d: 12)
  content(p(817, 585), tt[(ii)])
  // (iii) a < b
  let C = (402, 622)
  let A = (493, 893)
  let P = (780, 893)
  let r = 225
  seg(p, C, A)
  seg(p, A, P)
  seg(p, C, c5-on(C, r, -36))
  anglearc(p, A, C, P, 13)
  c5-darc(p, C, r, -84, -20)
  lbl(p, C, $C$, dir: "nw", d: 9)
  lbl(p, A, $A$, dir: "s", d: 12)
  lbl(p, P, $P$, dir: "s", d: 12)
  lbl(p, c5-lerp(C, A, 0.45), $b$, dir: "w", d: 10)
  lbl(p, c5-lerp(C, c5-on(C, r, -36), 0.5), $a < b$, dir: "ne", d: 12)
  content(p(616, 945), tt[(iii)])
})

// 图 5·8（p.185）A 是直角的三种情形
#let fig-c5-5-8(width: 850 * k) = px-canvas(850, 830, origin: (250, 175), width: width, (p, u) => {
  import cetz.draw: *
  // (i) a > b
  let C = (280, 248)
  let A = (280, 460)
  let B = (568, 460)
  let P = (650, 460)
  seg(p, C, A)
  seg(p, A, P)
  seg(p, C, B)
  rtmark(p, A, C, P, s: 9)
  c5-darc(p, C, c5-dist(C, B), -50, -20)
  lbl(p, C, $C$, dir: "nw", d: 9)
  lbl(p, A, $A$, dir: "s", d: 12)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, P, $P$, dir: "s", d: 12)
  lbl(p, c5-lerp(C, A, 0.5), $b$, dir: "w", d: 9)
  lbl(p, c5-lerp(C, B, 0.5), $a > b$, dir: "ne", d: 12)
  content(p(455, 570), tt[(i)])
  // (ii) a = b
  let C = (745, 195)
  let A = (745, 500)
  let P = (1075, 500)
  let r = c5-dist(C, A)
  seg(p, C, A)
  seg(p, A, P)
  seg(p, C, c5-on(C, r, -43))
  rtmark(p, A, C, P, s: 9)
  c5-darc(p, C, r, -101, -30)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, A, $A$, dir: "s", d: 12)
  lbl(p, P, $P$, dir: "s", d: 12)
  lbl(p, c5-lerp(C, A, 0.45), $b$, dir: "w", d: 9)
  lbl(p, c5-lerp(C, c5-on(C, r, -43), 0.55), $a = b$, dir: "ne", d: 12)
  content(p(870, 570), tt[(ii)])
  // (iii) a < b
  let C = (548, 612)
  let A = (548, 908)
  let P = (885, 908)
  let r = 243
  seg(p, C, A)
  seg(p, A, P)
  seg(p, C, c5-on(C, r, -49))
  rtmark(p, A, C, P, s: 9)
  c5-darc(p, C, r, -109, -31)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, A, $A$, dir: "s", d: 12)
  lbl(p, P, $P$, dir: "s", d: 12)
  lbl(p, c5-lerp(C, A, 0.5), $b$, dir: "w", d: 9)
  lbl(p, c5-lerp(C, c5-on(C, r, -49), 0.5), $a < b$, dir: "ne", d: 12)
  content(p(670, 990), tt[(iii)])
})

// 图 5·9（p.186）A 是锐角的五种情形
#let fig-c5-5-9(width: 910 * k) = px-canvas(910, 935, origin: (140, 560), width: width, (p, u) => {
  import cetz.draw: *
  // (i) a > b
  let A = (217, 748)
  let C = (338, 580)
  let B = (515, 748)
  let P = (560, 748)
  seg(p, A, C)
  seg(p, A, P)
  seg(p, C, B)
  c5-darc(p, C, c5-dist(C, B), -59, -22)
  lbl(p, A, $A$, dir: "s", d: 12)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, P, $P$, dir: "s", d: 12)
  lbl(p, (225, 665), $b$, dir: "c", d: 0)
  lbl(p, c5-lerp(C, B, 0.4), $a > b$, dir: "ne", d: 12)
  content(p(370, 845), tt[(i)])
  // (ii) a = b
  let A = (617, 748)
  let C = (758, 578)
  let B = (899, 748)
  let P = (985, 748)
  let r = c5-dist(C, A)
  seg(p, A, C)
  seg(p, A, P)
  seg(p, C, B)
  c5-darc(p, C, r, -132, -29)
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, P, $P$, dir: "s", d: 12)
  lbl(p, c5-lerp(A, C, 0.6), $b$, dir: "nw", d: 11)
  lbl(p, c5-lerp(C, B, 0.4), $a = b$, dir: "ne", d: 12)
  content(p(785, 845), tt[(ii)])
  // (iii) a < b，a > b sin A：两解 B_1、B_2
  let A = (153, 1102)
  let C = (407, 895)
  let F = (407, 1102)
  let B1 = (525, 1102)
  let B2 = (289, 1102)
  let P = (600, 1102)
  let r = c5-dist(C, B1)
  seg(p, A, C)
  seg(p, A, P)
  seg(p, C, B1)
  seg(p, C, B2)
  c5-dseg(p, C, F)
  c5-darc(p, C, r, -134, -44)
  lbl(p, A, $A$, dir: "s", d: 12)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, B1, $B_1$, dir: "se", d: 12)
  lbl(p, B2, $B_2$, dir: "sw", d: 12)
  lbl(p, P, $P$, dir: "s", d: 12)
  lbl(p, (275, 985), $b$, dir: "c", d: 0)
  lbl(p, (528, 1000), $a > b sin A$, dir: "c", d: 0)
  content(p(375, 1170), tt[(iii)])
  // (iv) a = b sin A：一解（直角三角形）
  let A = (617, 1102)
  let C = (907, 897)
  let B = (907, 1102)
  let P = (1005, 1102)
  seg(p, A, C)
  seg(p, A, P)
  seg(p, C, B)
  c5-darc(p, C, c5-dist(C, B), -115, -62)
  lbl(p, A, $A$, dir: "s", d: 12)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "s", d: 13)
  lbl(p, P, $P$, dir: "s", d: 12)
  lbl(p, (757, 992), $b$, dir: "c", d: 0)
  lbl(p, (962, 993), $a = b sin A$, dir: "c", d: 0)
  content(p(782, 1170), tt[(iv)])
  // (v) a < b sin A：无解
  let A = (375, 1430)
  let C = (673, 1238)
  let F = (673, 1430)
  let P = (755, 1430)
  let r = 134
  seg(p, A, C)
  seg(p, A, P)
  seg(p, C, (673, 1238 + r))
  c5-dseg(p, (673, 1238 + r), F)
  c5-darc(p, C, r, -116, -59)
  lbl(p, A, $A$, dir: "s", d: 12)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, P, $P$, dir: "s", d: 12)
  lbl(p, (512, 1330), $b$, dir: "c", d: 0)
  lbl(p, (724, 1305), $a < b sin A$, dir: "c", d: 0)
  content(p(578, 1477), tt[(v)])
})

// 图 5·10（p.188）a = 13.9，b = 8.43，A = 126°43′
#let fig-c5-5-10(width: 460 * k) = px-canvas(460, 275, origin: (140, 762), width: width, (p, u) => {
  import cetz.draw: *
  let A = (343, 1012)
  let B = (577, 1012)
  let C = (170, 780)
  poly(p, (A, B, C), close: true)
  anglearc(p, A, B, C, 15)
  lbl(p, A, $A$, dir: "s", d: 12)
  lbl(p, B, $B$, dir: "s", d: 12)
  lbl(p, C, $C$, dir: "nw", d: 9)
  lbl(p, c5-lerp(C, B, 0.45), $a = 13.9$, dir: "ne", d: 12)
  lbl(p, c5-lerp(C, A, 0.5), $b = 8.43$, dir: "w", d: 32)
  lbl(p, c5-lerp(A, B, 0.5), $c$, dir: "s", d: 11)
  content(p(390, 985), tsm[$126°43'$])
})

// 图 5·11（p.189）a = 16，b = 25，A = 33°15′：两解（按题设算出 C、B_1、B_2）
#let fig-c5-5-11(width: 520 * k) = px-canvas(520, 300, origin: (395, 1170), width: width, (p, u) => {
  import cetz.draw: *
  let s = 397 / 25
  let A = (420, 1423)
  let C = (420 + 397 * calc.cos(33.25deg), 1423 - 397 * calc.sin(33.25deg))
  let h = 1423 - C.at(1)
  let dx = calc.sqrt(calc.pow(16 * s, 2) - h * h)
  let B1 = (C.at(0) + dx, 1423)
  let B2 = (C.at(0) - dx, 1423)
  poly(p, (A, B1, C), close: true)
  seg(p, C, B2)
  anglearc(p, A, B1, C, 28)
  lbl(p, A, $A$, dir: "w", d: 10)
  lbl(p, B1, $B_1$, dir: "se", d: 12)
  lbl(p, B2, $B_2$, dir: "ne", d: 4)
  lbl(p, C, $C_1 (C_2)$, dir: "n", d: 12)
  lbl(p, c5-lerp(A, C, 0.5), $b = 25$, dir: "nw", d: 14)
  lbl(p, c5-lerp(C, B1, 0.45), $a = 16$, dir: "ne", d: 16)
  content(p(475, 1410), tsm[$33°15'$])
  // 尺寸线 c_2、c_1
  dimh(p, A.at(0), B2.at(0), 1442, lab: $c_2$)
  dimh(p, A.at(0), B1.at(0), 1460, lab: $c_1$)
  for x in (A.at(0), B2.at(0)) { line(p(x, 1436), p(x, 1448), stroke: lt) }
  for x in (A.at(0), B1.at(0)) { line(p(x, 1454), p(x, 1466), stroke: lt) }
})
