// 三角 第 5 章 图 5·12–5·19（原书 p.191–200）及复习题五第 7、13 题附图（p.202–203）。页面 200 dpi 坐标。
#import "c5-base.typ": *

// 图 5·12（p.191）b、c 不变，改变角 A：(i) 直角 (ii) 钝角 (iii) 锐角（b = 280、c = 210 像素）
#let fig-c5-5-12(width: 840 * k) = px-canvas(840, 380, origin: (225, 750), width: width, (p, u) => {
  import cetz.draw: *
  let tri(A, B, C, la, lb_, lc, sa) = {
    poly(p, (A, B, C), close: true)
    tickat(p, A, C, c5-lerp(A, C, 0.5), s: 5)
    let m = c5-lerp(A, B, 0.5)
    tickat(p, A, B, (m.at(0) - 2, m.at(1)), s: 5)
    tickat(p, A, B, (m.at(0) + 2, m.at(1)), s: 5)
    lbl(p, c5-lerp(A, C, 0.5), $b$, dir: "w", d: 12)
    lbl(p, m, $c$, dir: "s", d: 13)
    lbl(p, c5-lerp(C, B, 0.5), sa, dir: "ne", d: 11)
    lbl(p, A, la, dir: "s", d: 13)
    lbl(p, B, lb_, dir: "s", d: 13)
    lbl(p, C, lc, dir: "n", d: 12)
  }
  // (i)
  tri((263, 1052), (473, 1052), (263, 772), $A$, $B$, $C$, $a$)
  // (ii)
  let A1 = (566, 1052)
  tri(A1, (776, 1052), (566 + 280 * calc.cos(125deg), 1052 - 280 * calc.sin(125deg)), $A_1$, $B_1$, $C_1$, $a_1$)
  // (iii)
  let A2 = (825, 1052)
  let C2 = (1035, 1052 - calc.sqrt(280 * 280 - 210 * 210))
  poly(p, (A2, (1035, 1052), C2), close: true)
  tickat(p, A2, C2, c5-lerp(A2, C2, 0.5), s: 5)
  tickat(p, A2, (1035, 1052), (928, 1052), s: 5)
  tickat(p, A2, (1035, 1052), (932, 1052), s: 5)
  lbl(p, c5-lerp(A2, C2, 0.5), $b$, dir: "nw", d: 12)
  lbl(p, (930, 1052), $c$, dir: "s", d: 13)
  lbl(p, c5-lerp(C2, (1035, 1052), 0.5), $a_2$, dir: "e", d: 11)
  lbl(p, A2, $A_2$, dir: "s", d: 13)
  lbl(p, (1035, 1052), $B_2$, dir: "s", d: 13)
  lbl(p, C2, $C_2$, dir: "n", d: 12)
  content(p(370, 1115), tt[(i)])
  content(p(670, 1115), tt[(ii)])
  content(p(930, 1115), tt[(iii)])
})

// 图 5·13（p.192）∠A 是锐角，CD ⊥ AB
#let fig-c5-5-13(width: 380 * k) = px-canvas(380, 265, origin: (175, 1195), width: width, (p, u) => {
  import cetz.draw: *
  let A = (189, 1440)
  let B = (542, 1440)
  let C = (428, 1211)
  let D = (428, 1440)
  poly(p, (A, B, C), close: true)
  c5-dseg(p, C, D)
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, B, $B$, dir: "se", d: 10)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, D, $D$, dir: "s", d: 12)
  lbl(p, c5-lerp(A, C, 0.55), $b$, dir: "nw", d: 10)
  lbl(p, c5-lerp(C, B, 0.5), $a$, dir: "ne", d: 10)
  lbl(p, c5-lerp(A, D, 0.55), $c$, dir: "s", d: 11)
})

// 图 5·14（p.192）∠A 是直角
#let fig-c5-5-14(width: 265 * k) = px-canvas(265, 305, origin: (690, 1160), width: width, (p, u) => {
  import cetz.draw: *
  let A = (704, 1455)
  let B = (943, 1455)
  let C = (704, 1173)
  poly(p, (A, B, C), close: true)
  lbl(p, A, $A$, dir: "s", d: 12)
  lbl(p, B, $B$, dir: "s", d: 12)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, c5-lerp(A, C, 0.5), $b$, dir: "w", d: 9)
  lbl(p, c5-lerp(C, B, 0.5), $a$, dir: "ne", d: 10)
  lbl(p, c5-lerp(A, B, 0.5), $c$, dir: "s", d: 11)
})

// 图 5·15（p.193）∠A 是钝角，CD ⊥ BA 的延长线
#let fig-c5-5-15(width: 365 * k) = px-canvas(365, 295, origin: (690, 752), width: width, (p, u) => {
  import cetz.draw: *
  let C = (708, 767)
  let D = (708, 1030)
  let A = (813, 1030)
  let B = (1047, 1030)
  poly(p, (A, B, C), close: true)
  c5-dseg(p, C, D)
  c5-dseg(p, D, A)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, D, $D$, dir: "s", d: 12)
  lbl(p, A, $A$, dir: "s", d: 12)
  lbl(p, B, $B$, dir: "s", d: 12)
  lbl(p, c5-lerp(C, A, 0.55), $b$, dir: "e", d: 9)
  lbl(p, c5-lerp(C, B, 0.4), $a$, dir: "ne", d: 10)
  lbl(p, c5-lerp(A, B, 0.4), $c$, dir: "s", d: 11)
})

// 图 5·16（p.195）b = 40.33，c = 32.11，A = 73°40′
#let fig-c5-5-16(width: 470 * k) = px-canvas(470, 310, origin: (395, 830), width: width, (p, u) => {
  import cetz.draw: *
  let A = (472, 1118)
  let B = (553, 847)
  let C = (842, 1118)
  poly(p, (A, B, C), close: true)
  anglearc(p, A, C, B, 22)
  lbl(p, A, $A$, dir: "s", d: 12)
  lbl(p, B, $B$, dir: "n", d: 11)
  lbl(p, C, $C$, dir: "se", d: 10)
  lbl(p, c5-lerp(A, B, 0.5), $c = 32.11$, dir: "w", d: 32)
  lbl(p, c5-lerp(B, C, 0.6), $a$, dir: "ne", d: 10)
  lbl(p, c5-lerp(A, C, 0.55), $b = 40.33$, dir: "s", d: 12)
  content(p(515, 1100), tsm[$73°40'$])
})

// 图 5·17（p.196）A、B 之间隔着一个池（池的等高线示意），∠ACB = 68°42′
#let fig-c5-5-17(width: 360 * k) = px-canvas(360, 400, origin: (200, 1083), width: width, (p, u) => {
  import cetz.draw: *
  let A = (470, 1093)
  let B = (470, 1473)
  let C = (225, 1395)
  seg(p, C, A)
  seg(p, C, B)
  seg(p, A, (470, 1200))
  c5-dseg(p, (470, 1200), (470, 1410))
  seg(p, (470, 1410), B)
  // 池（几道闭合曲线，示意）
  let outer = ((360, 1257), (380, 1230), (427, 1213), (473, 1203), (507, 1223), (523, 1263),
    (525, 1310), (507, 1357), (480, 1407), (460, 1407), (440, 1377), (400, 1357), (373, 1323), (360, 1290))
  let ctr = (450, 1300)
  for f in (1, 0.84, 0.68) {
    let pts = outer.map(q => p(ctr.at(0) + (q.at(0) - ctr.at(0)) * f, ctr.at(1) + (q.at(1) - ctr.at(1)) * f))
    hobby(..pts, close: true, stroke: lw)
  }
  for (c, rx, ry) in (((452, 1258), 26, 22), ((456, 1338), 24, 30)) {
    for f in (1, 0.55) {
      let pts = range(8).map(i => {
        let t = i * 45deg
        let w = 1 + 0.18 * calc.sin(3 * t)
        p(c.at(0) + rx * f * w * calc.cos(t), c.at(1) - ry * f * w * calc.sin(t))
      })
      hobby(..pts, close: true, stroke: lw)
    }
  }
  anglearc(p, C, A, B, 30)
  lbl(p, A, $A$, dir: "n", d: 9)
  lbl(p, B, $B$, dir: "s", d: 10)
  lbl(p, C, $C$, dir: "w", d: 10)
  content(p(278, 1388), tsm[$68°42'$])
})

// 图 5·18（p.198）a = 32，b = 40，c = 66
#let fig-c5-5-18(width: 560 * k) = px-canvas(560, 160, origin: (350, 845), width: width, (p, u) => {
  import cetz.draw: *
  let A = (373, 983)
  let B = (890, 983)
  let C = (667, 865)
  poly(p, (A, B, C), close: true)
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, B, $B$, dir: "se", d: 10)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, c5-lerp(A, C, 0.45), $b = 40$, dir: "nw", d: 14)
  lbl(p, c5-lerp(C, B, 0.55), $a = 32$, dir: "ne", d: 14)
  lbl(p, c5-lerp(A, B, 0.6), $c = 66$, dir: "s", d: 11)
})

// 图 5·19（p.200）梯子 BC 靠在斜壁上，壁面和地面所成的角 α（砖墙、地面阴影为示意）
#let fig-c5-5-19(width: 500 * k) = px-canvas(500, 330, origin: (365, 370), width: width, (p, u) => {
  import cetz.draw: *
  let TL = (592, 379)
  let TR = (747, 379)
  let BR = (768, 668)
  let BL = (575, 668)
  let xl(y) = TL.at(0) + (BL.at(0) - TL.at(0)) * (y - TL.at(1)) / (BL.at(1) - TL.at(1))
  let xr(y) = TR.at(0) + (BR.at(0) - TR.at(0)) * (y - TR.at(1)) / (BR.at(1) - TR.at(1))
  // 砖缝
  let n = 17
  let h = (668 - 379) / n
  for i in range(n) {
    let y0 = 379 + i * h
    let y1 = y0 + h
    if i > 0 { line(p(xl(y0), y0), p(xr(y0), y0), stroke: 0.5pt) }
    let x = xl(y1) + (if calc.rem(i, 2) == 0 { 20 } else { 37 })
    while x < xr(y1) - 6 {
      line(p(x, y0), p(x, y1), stroke: 0.5pt)
      x += 34
    }
  }
  line(p(..TL), p(..TR), p(..BR), stroke: lb)
  line(p(..TL), p(..BL), stroke: lb)
  // 地面与阴影
  line(p(375, 668), p(860, 668), stroke: lb)
  let x = 380
  while x <= 860 {
    line(p(x, 668), p(x - 10, 684), stroke: 0.5pt)
    x += 8
  }
  let B = (xl(417), 417)
  let C = (450, 668)
  let A = BL
  seg(p, C, B)
  anglearc(p, A, C, TL, 20)
  lbl(p, B, $B$, dir: "w", d: 10)
  lbl(p, C, $C$, dir: "n", d: 10)
  lbl(p, A, $A$, dir: "s", d: 11)
  content(p(548, 646), tt[$alpha$])
})

// 复习题五 第 7 题附图（p.202）
#let fig-c5-r7(width: 400 * k) = px-canvas(400, 275, origin: (385, 1200), width: width, (p, u) => {
  import cetz.draw: *
  let A = (399, 1457)
  let B = (769, 1457)
  let P = (517, 1217)
  let Q = (668, 1228)
  poly(p, (A, P, Q, B), close: true)
  seg(p, A, Q)
  seg(p, B, P)
  anglearc(p, A, B, P, 20)
  anglearc(p, A, B, Q, 30)
  anglearc(p, B, A, P, 30)
  anglearc(p, B, A, Q, 20)
  let at(v, a, b, r) = {
    let t = (c5-ang(v, a) + c5-ang(v, b)) / 2
    c5-on(v, r, t)
  }
  content(p(..at(A, B, P, 13)), tsm[$alpha$])
  content(p(..at(A, B, Q, 40)), tsm[$beta$])
  content(p(..at(B, A, P, 40)), tsm[$gamma$])
  content(p(..at(B, A, Q, 13)), tsm[$delta$])
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
  lbl(p, P, $P$, dir: "n", d: 10)
  lbl(p, Q, $Q$, dir: "n", d: 10)
  lbl(p, c5-lerp(A, B, 0.5), $a$, dir: "n", d: 10)
})

// 复习题五 第 13 题附图（p.203）A、B、D、C 四点共圆（按圆心 (630, 1180)、半径 133 算出各点）
#let fig-c5-r13(width: 300 * k) = px-canvas(300, 290, origin: (480, 1040), width: width, (p, u) => {
  import cetz.draw: *
  let O = (630, 1180)
  let r = 133
  let A = (630 - calc.sqrt(r * r - 108 * 108), 1288)
  let B = (630 + calc.sqrt(r * r - 108 * 108), 1288)
  let dy = calc.sqrt(r * r - 120 * 120)
  let C = (750, 1180 - dy)
  let D = (750, 1180 + dy)
  let E = (750, 1288)
  circ(p, O, r)
  seg(p, A, E)
  seg(p, C, E)
  seg(p, A, C)
  seg(p, A, D)
  seg(p, B, C)
  seg(p, B, D)
  anglearc(p, A, D, C, 42)
  anglearc(p, A, B, D, 32)
  anglearc(p, B, D, C, 26)
  let at(v, a, b, rr) = {
    let t = (c5-ang(v, a) + c5-ang(v, b)) / 2
    c5-on(v, rr, t)
  }
  content(p(..at(A, D, C, 52)), tsm[$beta$])
  content(p(..at(A, B, D, 42)), tsm[$alpha$])
  content(p(..at(B, D, C, 35)), tsm[$beta$])
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, B, $B$, dir: "s", d: 12)
  lbl(p, C, $C$, dir: "ne", d: 10)
  lbl(p, D, $D$, dir: "e", d: 11)
  lbl(p, E, $E$, dir: "se", d: 10)
})
