// 习题 4·2 第 12 题（原书 p.233）、习题 4·3 第 4、7、9、10、13、14 题（p.245–247）、
// 习题 4·4 第 1 题（p.256–257）、第 6 题（p.257）的插图；页面 120 dpi 坐标。
#import "M-base.typ": *

// 习题 4·2 第 12 题：AC 切圆 O 于 A，AB = AC = AO，OC、BC 分别交圆于 E、F
#let fig-M-ex2-12(width: 250 * k) = px-canvas(250, 320, origin: (640, 640), width: width, (p, u) => {
  import cetz.draw: *
  let O = (765, 800)
  let R = 100
  let A = (665, 800)
  let C = (665, 900)
  let B = M-pt(O, R, 120)
  let l = M-dist(O, C)
  let E = M-at(O, C, R / l)
  let dx = C.at(0) - B.at(0)
  let dy = C.at(1) - B.at(1)
  let tt1 = -2 * ((B.at(0) - O.at(0)) * dx + (B.at(1) - O.at(1)) * dy) / (dx * dx + dy * dy)
  let F = (B.at(0) + tt1 * dx, B.at(1) + tt1 * dy)
  circ(p, O, R)
  seg(p, (665, 658), (665, 944))
  seg(p, A, O)
  seg(p, O, C)
  dseg(p, A, B)
  dseg(p, O, B)
  dseg(p, B, C)
  ring(p, O, r: 2.5)
  lbl(p, B, $B$, dir: "n", d: 10)
  lbl(p, O, $O$, dir: "e", d: 10)
  lbl(p, A, $A$, dir: "w", d: 10)
  lbl(p, C, $C$, dir: "w", d: 10)
  lbl(p, F, $F$, dir: "ne", d: 10)
  lbl(p, E, $E$, dir: "se", d: 10)
})

// 习题 4·3 第 4 题：正方形 ABCD，各顶点为圆心、半对角线为半径的弧，交点 E F G H K L M N 成正八边形
#let fig-M-ex3-4(width: 335 * k) = px-canvas(335, 335, origin: (565, 365), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((592, 660), (862, 660), (862, 392), (592, 392))
  let O = (727, 526)
  let q = 79
  let E = (A.at(0) + q, 660)
  let F = (B.at(0) - q, 660)
  let G = (862, 660 - q)
  let H = (862, 392 + q)
  let K = (862 - q, 392)
  let L = (592 + q, 392)
  let M = (592, 392 + q)
  let N = (592, 660 - q)
  line(..(A, B, C, D).map(t => p(..t)), close: true, stroke: lb)
  line(..(E, F, G, H, K, L, M, N).map(t => p(..t)), close: true, stroke: lw)
  dseg(p, A, C)
  dseg(p, B, D)
  for (v, c) in ((E, B), (F, A), (G, C), (H, B), (K, D), (L, C), (M, A), (N, D)) {
    M-arc(p, c, v, O, stroke: dsh)
  }
  M-wlbl(p, (O.at(0) + 8, O.at(1) + 2), $O$)
  lbl(p, D, $D$, dir: "nw", d: 9)
  lbl(p, C, $C$, dir: "ne", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, E, $E$, dir: "s", d: 10)
  lbl(p, F, $F$, dir: "s", d: 10)
  lbl(p, G, $G$, dir: "e", d: 10)
  lbl(p, H, $H$, dir: "e", d: 10)
  lbl(p, K, $K$, dir: "n", d: 10)
  lbl(p, L, $L$, dir: "n", d: 10)
  lbl(p, M, $M$, dir: "w", d: 10)
  lbl(p, N, $N$, dir: "w", d: 10)
})

// 习题 4·3 第 7 题：螺丝帽（正六边形，边长 a，对边距 b）和扳头（示意）
#let fig-M-ex3-7(width: 370 * k) = px-canvas(370, 200, origin: (150, 245), width: width, (p, u) => {
  import cetz.draw: *
  let O = (249, 349)
  let R = 65
  let hex = M-ngon(O, R, 6, 0)
  let (C, D, E, F, A, B) = hex
  // 扳头外形：头部圆弧 + 手柄
  let H0 = (278, 350)
  let rh = 96
  let top0 = (206, 293)
  let bot0 = (206, 405)
  let a1 = 25
  let pts = ()
  // 从上钳口尖起，沿头部弧线顺时针到手柄上缘
  for i in range(0, 41) {
    pts.push(M-pt(H0, rh, 146 - (146 - a1) * i / 40))
  }
  let up = pts
  let dn = ()
  for i in range(0, 41) {
    dn.push(M-pt(H0, rh, -a1 - (146 - a1) * i / 40))
  }
  line(p(..top0), p(..up.first()), stroke: lw)
  line(..up.map(t => p(..t)), stroke: lw)
  line(p(..up.last()), p(505, 320), p(504, 388), p(..dn.first()), stroke: lw)
  line(..dn.map(t => p(..t)), stroke: lw)
  line(p(..dn.last()), p(..bot0), stroke: lw)
  line(p(..top0), p(206, 293), p(278, 293), stroke: lw)
  line(p(..bot0), p(206, 405), p(278, 405), stroke: lw)
  // 钳口内侧的弧
  arc(p(264, 349), start: -70deg, stop: 70deg, radius: 58, anchor: "origin", stroke: lw)
  poly(p, (A, B, C, D, E, F), close: true)
  circ(p, O, 28.5)
  // 尺寸线
  M-line(p, (160, 293), (214, 293), lt)
  M-line(p, (160, 405), (214, 405), lt)
  line(p(177, 295), p(177, 403), stroke: lt, mark: arw2)
  lbl(p, (169, 349), $b$, dir: "c", d: 0)
  dimh(p, A.at(0), B.at(0), 418, lab: $a$, gapw: 18)
})

// 习题 4·3 第 9 题：正八边形（白）与正方形（黑，网格）拼成的图案，AB 为正八边形两对边的距离
#let fig-M-ex3-9(width: 240 * k) = px-canvas(240, 235, origin: (590, 235), width: width, (p, u) => {
  import cetz.draw: *
  let pitch = 200 / 3
  let s = pitch / (1 + calc.sqrt(2))
  let h = pitch / 2
  let x0 = 606.7
  let y0 = 251.7
  rect(p(x0, y0), p(x0 + 3 * pitch, y0 + 3 * pitch), fill: M-grid, stroke: lb)
  for i in range(3) {
    for j in range(3) {
      let (cx, cy) = (x0 + pitch * (i + 0.5), y0 + pitch * (j + 0.5))
      let v = ((cx - s / 2, cy - h), (cx + s / 2, cy - h), (cx + h, cy - s / 2), (cx + h, cy + s / 2),
        (cx + s / 2, cy + h), (cx - s / 2, cy + h), (cx - h, cy + s / 2), (cx - h, cy - s / 2))
      line(..v.map(t => p(..t)), close: true, fill: white, stroke: lb)
    }
  }
  let (A, B) = ((675, 338), (742, 338))
  M-line(p, A, B, lt)
  line(p(696, 338), p(696, 317), p(722, 317), p(722, 338), stroke: lt)
  M-wlbl(p, (A.at(0) - 8, A.at(1) + 4), $A$)
  M-wlbl(p, (B.at(0) + 8, B.at(1) + 4), $B$)
  M-wlbl(p, (692, 308), $D$)
  M-wlbl(p, (727, 308), $C$)
})

// 习题 4·3 第 10 题：圆内接正三角形 ABD 与内接三角形 ABC（BC 为内接正六边形的边）
#let fig-M-ex3-10(width: 250 * k) = px-canvas(250, 240, origin: (600, 770), width: width, (p, u) => {
  import cetz.draw: *
  let O = (720, 890)
  let R = 100
  let D = M-pt(O, R, 90)
  let A = M-pt(O, R, 210)
  let B = M-pt(O, R, 330)
  let C = M-pt(O, R, 30)
  circ(p, O, R)
  poly(p, (A, B, D), close: true)
  seg(p, A, C)
  seg(p, B, C)
  lbl(p, D, $D$, dir: "n", d: 10)
  lbl(p, C, $C$, dir: "ne", d: 10)
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, B, $B$, dir: "se", d: 10)
})

// 习题 4·3 第 13 题：圆内接六等分点每隔一个相连成六角星，中间六边形 ABCDEF（阴影）
#let fig-M-ex3-13(width: 250 * k) = px-canvas(250, 240, origin: (205, 640), width: width, (p, u) => {
  import cetz.draw: *
  let O = (327, 757)
  let R = 100
  let inner = M-ngon(O, R / calc.sqrt(3), 6, 0)   // D E F A B C
  let (D, E, F, A, B, C) = inner
  circ(p, O, R)
  line(..inner.map(t => p(..t)), close: true, fill: M-hatch, stroke: lw)
  line(..M-ngon(O, R, 3, 90).map(t => p(..t)), close: true, stroke: lw)
  line(..M-ngon(O, R, 3, 270).map(t => p(..t)), close: true, stroke: lw)
  M-wlbl(p, (O.at(0) + 1, O.at(1) + 9), $O$)
  lbl(p, A, $A$, dir: "w", d: 13)
  lbl(p, F, $F$, dir: "nw", d: 14)
  lbl(p, E, $E$, dir: "ne", d: 14)
  lbl(p, D, $D$, dir: "e", d: 13)
  lbl(p, C, $C$, dir: "se", d: 14)
  lbl(p, B, $B$, dir: "sw", d: 14)
})

// 习题 4·3 第 14 题：正方形（边长 a）剪去四角成正八边形，求 x
#let fig-M-ex3-14(width: 265 * k) = px-canvas(265, 240, origin: (595, 640), width: width, (p, u) => {
  import cetz.draw: *
  let (x0, y0, a) = (636, 660, 200)
  let x = a / (2 + calc.sqrt(2))
  let (TL, TR, BR, BL) = ((x0, y0), (x0 + a, y0), (x0 + a, y0 + a), (x0, y0 + a))
  line(..(TL, TR, BR, BL).map(t => p(..t)), close: true, stroke: lw)
  let cuts = (
    ((x0, y0 + x), (x0 + x, y0)),
    ((x0 + a - x, y0), (x0 + a, y0 + x)),
    ((x0 + a, y0 + a - x), (x0 + a - x, y0 + a)),
    ((x0 + x, y0 + a), (x0, y0 + a - x)),
  )
  for (c1, c2) in cuts { M-line(p, c1, c2, lb) }
  // 上边的 x
  line(p(x0, 649), p(x0 + x, 649), stroke: lt, mark: arw2)
  M-line(p, (x0, 646), (x0, 660), lt)
  M-line(p, (x0 + x, 646), (x0 + x, 660), lt)
  lbl(p, (x0 + x / 2, 640), $x$, dir: "c", d: 0)
  // 左边的 x 和 a - 2x
  line(p(625, y0), p(625, y0 + x), stroke: lt, mark: arw2)
  line(p(625, y0 + x), p(625, y0 + a - x), stroke: lt, mark: arw2)
  M-line(p, (619, y0), (636, y0), lt)
  M-line(p, (619, y0 + x), (636, y0 + x), lt)
  M-line(p, (619, y0 + a - x), (636, y0 + a - x), lt)
  lbl(p, (614, y0 + x / 2), $x$, dir: "c", d: 0)
  content(p(612, y0 + a / 2), angle: 90deg, tsm($a - 2x$))
  // 斜边 a - 2x
  line(p(x0 + 7, y0 + x + 10), p(x0 + x + 10, y0 + 7), stroke: lt, mark: arw2)
  content(p(x0 + x / 2 + 21, y0 + x / 2 + 21), angle: 45deg, tsm($a - 2x$))
})

// 习题 4·4 第 1 题：八幅作图方法示意图（编号为作图顺序）
#let M-num(p, pt, n, dir) = lbl(p, pt, text(font: fonts.song, size: 8pt, str(n)), dir: dir, d: 9)

// (1) 正三角形：以 2 为圆心、R 为半径作弧
#let fig-M-ex4-1a(width: 180 * k) = px-canvas(180, 200, origin: (180, 1090), width: width, (p, u) => {
  import cetz.draw: *
  let O = (267, 1187)
  let R = 85
  let P1 = M-pt(O, R, 90)
  let P2 = M-pt(O, R, 270)
  let P3 = M-pt(O, R, 210)
  let P4 = M-pt(O, R, 330)
  circ(p, O, R)
  poly(p, (P1, P3, P4), close: true)
  dseg(p, P1, P2)
  M-arc(p, P2, P3, P4, stroke: dsh)
  line(p(..P2), p(..M-pt(P2, R, 50)), stroke: lt, mark: arw)
  ring(p, O, r: 2.5)
  lbl(p, O, $O$, dir: "e", d: 8)
  lbl(p, M-pt(P2, R * 0.55, 50), $R$, dir: "se", d: 9)
  M-num(p, P1, 1, "n")
  M-num(p, P2, 2, "s")
  M-num(p, P3, 3, "sw")
  M-num(p, P4, 4, "se")
})

// (2) 正三角形：30° 角
#let fig-M-ex4-1b(width: 180 * k) = px-canvas(180, 215, origin: (410, 1090), width: width, (p, u) => {
  import cetz.draw: *
  let O = (500, 1190)
  let R = 85
  let P1 = M-pt(O, R, 90)
  let P2 = M-pt(O, R, 270)
  let P3 = M-pt(O, R, 210)
  let P4 = M-pt(O, R, 330)
  circ(p, O, R)
  poly(p, (P1, P3, P4), close: true)
  M-line(p, P1, P2, lt)
  anglearc(p, P1, P2, P3, 22)
  ring(p, O, r: 2.5)
  lbl(p, O, $O$, dir: "e", d: 8)
  lbl(p, (P1.at(0) - 13, P1.at(1) + 38), $30°$, dir: "c", d: 0)
  M-num(p, P1, 1, "n")
  M-num(p, P2, 2, "s")
  M-num(p, P3, 3, "sw")
  M-num(p, P4, 4, "se")
})

// (3) 正三角形：半径 O2 的中点作弦
#let fig-M-ex4-1c(width: 180 * k) = px-canvas(180, 200, origin: (645, 1090), width: width, (p, u) => {
  import cetz.draw: *
  let O = (737, 1190)
  let R = 85
  let P1 = M-pt(O, R, 90)
  let P2 = M-pt(O, R, 270)
  let Mm = M-mid(O, P2)
  let h = calc.sqrt(R * R - 42.5 * 42.5)
  let (P3, P4) = ((O.at(0) - h, Mm.at(1)), (O.at(0) + h, Mm.at(1)))
  circ(p, O, R)
  poly(p, (P1, P3, P4), close: true)
  M-line(p, P1, P2, lt)
  ticks(p, O, Mm, 1)
  ticks(p, Mm, P2, 1)
  ring(p, O, r: 2.5)
  lbl(p, O, $O$, dir: "e", d: 8)
  M-num(p, P1, 1, "n")
  M-num(p, P2, 2, "s")
  M-num(p, P3, 3, "sw")
  M-num(p, P4, 4, "se")
})

// (4) 正方形：互相垂直的直径
#let fig-M-ex4-1d(width: 190 * k) = px-canvas(190, 195, origin: (213, 170), width: width, (p, u) => {
  import cetz.draw: *
  let O = (308, 272)
  let R = 85
  let P1 = M-pt(O, R, 180)
  let P2 = M-pt(O, R, 0)
  let P3 = M-pt(O, R, 90)
  let P4 = M-pt(O, R, 270)
  circ(p, O, R)
  poly(p, (P1, P3, P2, P4), close: true)
  M-line(p, P1, P2, lt)
  dseg(p, P3, P4)
  anglearc(p, O, P1, P3, 14)
  ring(p, O, r: 2.5)
  lbl(p, O, $O$, dir: "e", d: 8)
  lbl(p, (O.at(0) - 20, O.at(1) - 10), $90°$, dir: "c", d: 0)
  M-num(p, P3, 3, "n")
  M-num(p, P4, 4, "s")
  M-num(p, P1, 1, "w")
  M-num(p, P2, 2, "e")
})

// (5) 正方形：45° 角
#let fig-M-ex4-1e(width: 190 * k) = px-canvas(190, 195, origin: (457, 170), width: width, (p, u) => {
  import cetz.draw: *
  let O = (552, 270)
  let R = 85
  let (P2, P3, P1, P4) = M-ngon(O, R, 4, 45)
  circ(p, O, R)
  poly(p, (P1, P4, P2, P3), close: true)
  M-line(p, P1, P2, lt)
  M-line(p, P3, P4, lt)
  anglearc(p, P1, P4, P2, 22)
  ring(p, O, r: 2.5)
  lbl(p, O, $O$, dir: "e", d: 8)
  lbl(p, (P1.at(0) + 32, P1.at(1) - 7), $45°$, dir: "c", d: 0)
  M-num(p, P3, 3, "nw")
  M-num(p, P2, 2, "ne")
  M-num(p, P4, 4, "se")
  M-num(p, P1, 1, "sw")
})

// (6) 正六边形：以 1、2 为圆心、R 为半径作弧
#let fig-M-ex4-1f(width: 200 * k) = px-canvas(200, 195, origin: (695, 170), width: width, (p, u) => {
  import cetz.draw: *
  let O = (790, 277)
  let R = 85
  let (P2, P5, P3, P1, P4, P6) = M-ngon(O, R, 6, 0)
  circ(p, O, R)
  poly(p, (P1, P4, P6, P2, P5, P3), close: true)
  M-line(p, P1, P2, lt)
  M-arc(p, P1, P5, P6, stroke: dsh)
  M-arc(p, P2, P3, P4, stroke: dsh)
  ring(p, O, r: 2.5)
  lbl(p, O, $O$, dir: "e", d: 8)
  lbl(p, (O.at(0) - 36, O.at(1) - 17), $R$, dir: "c", d: 0)
  lbl(p, (O.at(0) + 34, O.at(1) - 17), $R$, dir: "c", d: 0)
  M-num(p, P3, 3, "nw")
  M-num(p, P5, 5, "ne")
  M-num(p, P1, 1, "w")
  M-num(p, P2, 2, "e")
  M-num(p, P4, 4, "sw")
  M-num(p, P6, 6, "se")
})

// (7) 正六边形：用三角板（示意）
#let fig-M-ex4-1g(width: 270 * k) = px-canvas(270, 230, origin: (170, 440), width: width, (p, u) => {
  import cetz.draw: *
  let O = (322, 545)
  let R = 88
  let (P4, P1, P5, P3, P2, P6) = M-ngon(O, R, 6, 30)
  circ(p, O, R)
  poly(p, (P1, P4, P6, P2, P3, P5), close: true)
  M-line(p, P3, P4, dashdot)
  M-line(p, P5, P6, dashdot)
  // 三角板（示意）
  line(p(185, 632), p(428, 632), p(428, 482), close: true, stroke: dashdot)
  ring(p, O, r: 2.5)
  lbl(p, O, $O$, dir: "e", d: 8)
  lbl(p, (O.at(0) - 20, O.at(1) + 22), $60°$, dir: "c", d: 0)
  M-num(p, P1, 1, "n")
  M-num(p, P2, 2, "s")
  M-num(p, P3, 3, "sw")
  M-num(p, P4, 4, "ne")
  M-num(p, P5, 5, "nw")
  M-num(p, P6, 6, "se")
})

// (8) 正六边形：用三角板（示意）
#let fig-M-ex4-1h(width: 215 * k) = px-canvas(215, 310, origin: (455, 355), width: width, (p, u) => {
  import cetz.draw: *
  let O = (565, 550)
  let R = 88
  let (P2, P6, P3, P1, P5, P4) = M-ngon(O, R, 6, 0)
  circ(p, O, R)
  poly(p, (P1, P3, P6, P2, P4, P5), close: true)
  M-line(p, P1, P2, lt)
  M-line(p, P3, P4, dashdot)
  // 三角板（示意）
  line(p(465, 365), p(465, 648), p(620, 648), close: true, stroke: dashdot)
  ring(p, O, r: 2.5)
  lbl(p, O, $O$, dir: "e", d: 8)
  lbl(p, (O.at(0) - 30, O.at(1) - 12), $60°$, dir: "c", d: 0)
  M-num(p, P1, 1, "w")
  M-num(p, P2, 2, "e")
  M-num(p, P3, 3, "nw")
  M-num(p, P6, 6, "ne")
  M-num(p, P5, 5, "sw")
  M-num(p, P4, 4, "se")
})

// (9) 正八边形：45° 角
#let fig-M-ex4-1i(width: 215 * k) = px-canvas(215, 215, origin: (685, 440), width: width, (p, u) => {
  import cetz.draw: *
  let O = (791, 546)
  let R = 93
  let (P2, P8, P3, P5, P1, P7, P4, P6) = M-ngon(O, R, 8, 0)
  circ(p, O, R)
  poly(p, (P1, P7, P4, P6, P2, P8, P3, P5), close: true)
  M-line(p, P1, P2, lt)
  M-line(p, P3, P4, lt)
  M-line(p, P5, P6, lt)
  M-line(p, P7, P8, lt)
  anglearc(p, O, P1, P5, 24)
  ring(p, O, r: 2.5)
  lbl(p, O, $O$, dir: "e", d: 8)
  lbl(p, (O.at(0) - 34, O.at(1) - 4), $45°$, dir: "c", d: 0)
  M-num(p, P3, 3, "n")
  M-num(p, P4, 4, "s")
  M-num(p, P1, 1, "w")
  M-num(p, P2, 2, "e")
  M-num(p, P5, 5, "nw")
  M-num(p, P8, 8, "ne")
  M-num(p, P7, 7, "sw")
  M-num(p, P6, 6, "se")
})

// 习题 4·4 第 6 题：“九五顶五九，八五分两边”的近似画法（单位：寸）
#let fig-M-ex4-6(width: 305 * k) = px-canvas(305, 300, origin: (595, 925), width: width, (p, u) => {
  import cetz.draw: *
  let s = 17.6
  let cx = 749
  let y1 = 1043
  let apex = (cx, y1 - 5.9 * s)
  let L = (cx - 8 * s, y1)
  let Rr = (cx + 8 * s, y1)
  let BL = (cx - 5 * s, y1 + 9.5 * s)
  let BR = (cx + 5 * s, y1 + 9.5 * s)
  line(p(..apex), p(..Rr), p(..BR), p(..BL), p(..L), close: true, stroke: lw)
  M-line(p, L, Rr, lt)
  M-line(p, apex, (cx, BL.at(1)), lt)
  lbl(p, (cx + 3, y1 - 2.9 * s), tsm[5.9 寸], dir: "e", d: 18)
  lbl(p, (cx - 4 * s, y1), tsm[8 寸], dir: "s", d: 11)
  lbl(p, (cx + 4 * s, y1), tsm[8 寸], dir: "s", d: 11)
  lbl(p, (cx + 3, y1 + 4.75 * s), tsm[9.5 寸], dir: "e", d: 20)
  lbl(p, (cx - 2.5 * s, BL.at(1)), tsm[5 寸], dir: "n", d: 8)
  lbl(p, (cx + 2.5 * s, BL.at(1)), tsm[5 寸], dir: "n", d: 8)
})
