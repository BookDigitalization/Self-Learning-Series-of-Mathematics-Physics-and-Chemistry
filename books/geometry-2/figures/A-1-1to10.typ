// 几何第二册 段 A：图 1·1–图 1·10（原书 p.1–16），读坐标时的页面渲染 120 dpi（页宽约 1000 像素）。
#import "/common/geo.typ": *
#let k = 0.0152cm

// 带短横端点的线段（A2 前缀：本段自用）
#let A2-pseg(p, a, b, s: 5) = pseg(p, a, b, s: s)
#let A2-t(p, pt, body) = lbl(p, pt, body, dir: "c", d: 0)
#let A2-arrow = (end: "stealth", fill: black, scale: 0.4)
// 虚线弧（带箭头）：从 a 到 b，控制点 c
#let A2-darc(p, a, b, c, ar: true) = {
  import cetz.draw: *
  if ar {
    bezier(p(..a), p(..b), p(..c), stroke: dsh, mark: A2-arrow)
  } else {
    bezier(p(..a), p(..b), p(..c), stroke: dsh)
  }
}
// 刻度尺：x0..x1，上沿 y0，高 h；n 等分，每 5 格一长刻线
#let A2-ruler(p, x0, x1, y0, h, n, long: 5) = {
  import cetz.draw: *
  line(p(x0, y0), p(x1, y0), p(x1, y0 + h), p(x0, y0 + h), close: true, stroke: lt)
  for i in range(1, n) {
    let x = x0 + (x1 - x0) * i / n
    let l = if calc.rem(i, long) == 0 { h * 0.6 } else { h * 0.35 }
    line(p(x, y0 + h), p(x, y0 + h - l), stroke: lt)
  }
}
// 圆规：顶点 v，两脚尖 l、r
#let A2-compass(p, v, l, r) = {
  import cetz.draw: *
  circle(p(v.at(0), v.at(1) - 9), radius: 6, stroke: lt)
  line(p(..v), p(..l), stroke: lw)
  line(p(..v), p(..r), stroke: lw)
  line(p(v.at(0) - 3, v.at(1) + 14), p(v.at(0) + 3, v.at(1) + 14), stroke: lt)
}

// 图 1·1（p.1）：尺 u 量竹竿 l
#let fig-A-1-1(width: 680 * k) = px-canvas(680, 130, origin: (190, 805), width: width, (p, u) => {
  import cetz.draw: *
  A2-ruler(p, 200, 332, 826, 16, 10)
  A2-t(p, (268, 817), $u$)
  // 竹竿 l
  line(p(198, 872), p(868, 872), stroke: lt)
  line(p(198, 879), p(868, 879), stroke: lt)
  line(p(198, 886), p(868, 886), stroke: lt)
  A2-t(p, (533, 861), $l$)
  // 尺，连续量 5 次
  A2-ruler(p, 200, 868, 892, 16, 50)
  A2-darc(p, (265, 912), (400, 912), (332, 964))
  A2-darc(p, (400, 912), (533, 912), (466, 964))
  A2-darc(p, (533, 912), (667, 912), (600, 964))
  A2-darc(p, (667, 912), (800, 912), (733, 964))
})

// 图 1·2（p.2）：(1) 圆规量取 u  (2) 在 l 上连续截取
#let fig-A-1-2(width: 680 * k) = px-canvas(680, 200, origin: (150, 805), width: width, (p, u) => {
  import cetz.draw: *
  // (1)
  A2-compass(p, (197, 832), (165, 933), (231, 933))
  seg(p, (163, 933), (232, 933))
  A2-t(p, (197, 949), $u$)
  A2-t(p, (201, 984), tt[(1)])
  // (2)
  A2-compass(p, (297, 832), (268, 931), (333, 931))
  seg(p, (266, 933), (795, 921))
  let xs = (266, 335, 398, 465, 532, 599)
  let ys = (933, 932, 929, 929, 928, 926)
  let nm = ($A$, $A_1$, $A_2$, $A_3$, $A_4$, $A_5$)
  for i in range(6) {
    if i > 0 { tickat(p, (0, 0), (1, 0), (xs.at(i), ys.at(i)), s: 5) }
    A2-t(p, (xs.at(i) + if i == 0 { -10 } else { 0 }, ys.at(i) + if i == 0 { 10 } else { 18 }), nm.at(i))
  }
  A2-t(p, (808, 927), $B$)
  // 下方弧
  A2-darc(p, (266, 938), (398, 934), (330, 990))
  A2-darc(p, (398, 934), (532, 934), (465, 990))
  A2-darc(p, (532, 934), (663, 930), (598, 990))
  // 上方弧
  A2-darc(p, (335, 927), (465, 924), (400, 881))
  A2-darc(p, (465, 924), (599, 922), (532, 881))
  A2-t(p, (637, 911), $l$)
  A2-t(p, (545, 984), tt[(2)])
})

// 图 1·3（p.3）：(1) 恰好截尽  (2) 有剩余 r_1
#let fig-A-1-3(width: 640 * k) = px-canvas(640, 250, origin: (265, 345), width: width, (p, u) => {
  import cetz.draw: *
  // (1)
  A2-pseg(p, (323, 372), (455, 372))
  A2-t(p, (388, 361), $u$)
  seg(p, (323, 403), (722, 403))
  for (x, n) in ((323, $A$), (455, $A_1$), (590, $A_2$), (722, $B$)) {
    tickat(p, (0, 0), (1, 0), (x, 403), s: 5)
    A2-t(p, (x, 420), n)
  }
  A2-t(p, (530, 467), tt[(1)])
  // (2)
  A2-pseg(p, (275, 493), (410, 493))
  A2-t(p, (342, 481), $u$)
  seg(p, (277, 527), (778, 527))
  for (x, n) in ((277, $A$), (410, $A_1$), (543, $A_2$), (676, $A_3$), (778, $B$)) {
    tickat(p, (0, 0), (1, 0), (x, 527), s: 5)
    A2-t(p, (x, 546), n)
  }
  line(p(676, 510), p(712, 510), stroke: lt, mark: (start: "|", scale: 0.4))
  line(p(742, 510), p(778, 510), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.4))
  tickat(p, (0, 0), (1, 0), (778, 510), s: 5)
  A2-t(p, (727, 510), $r_1$)
  A2-t(p, (532, 588), tt[(2)])
})

// 图 1·4（p.4）：(1) 第二回截尽  (2) 仍有剩余 r_2
#let fig-A-1-4(width: 540 * k) = px-canvas(540, 430, origin: (195, 340), width: width, (p, u) => {
  import cetz.draw: *
  let one(y0, xs, xb, last, nm) = {
    // y0：AB 所在直线 y；xs：A 点横坐标；xb：B 横坐标
    let ys = y0 - 34
    A2-pseg(p, (216, ys + 4), (229, ys + 4), s: 4)
    A2-pseg(p, (229, ys), (350 + xs - 216, ys), s: 4)
    lbl(p, (222, ys - 22), $frac(1, 10)u$, dir: "c", d: 0)
    lbl(p, (290, ys - 12), $u$, dir: "c", d: 0)
    seg(p, (xs, y0), (xb, y0))
    let pts = (xs, xs + 134, xs + 266, xs + 398)
    let nms = ($A$, $A_1$, $A_2$, $A_3$)
    for i in range(4) {
      tickat(p, (0, 0), (1, 0), (pts.at(i), y0), s: 5)
      A2-t(p, (pts.at(i) + if i == 0 { -2 } else { 0 }, y0 + 18), nms.at(i))
    }
    tickat(p, (0, 0), (1, 0), (xb, y0), s: 5)
    A2-t(p, (xb + 2, y0 + 8), $B$)
    for i in range(1, 8) {
      tickat(p, (0, 0), (1, 0), (xs + 398 + 13.5 * i, y0), s: 4)
    }
  }
  one(555, 216, 710, 0, 0)
  A2-t(p, (460, 606), tt[(1)])
  one(715, 218, 718, 0, 0)
  A2-t(p, (467, 768), tt[(2)])
})

// 图 1·5（p.5，例 1）：用 AB 量 CD，及 1/10 CD 截 AB
#let fig-A-1-5(width: 400 * k) = px-canvas(400, 125, origin: (475, 1070), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (490, 1100), (627, 1100))
  for (x, n, dx) in ((490, $A$, -3), (529, $A_1$, 0), (568, $A_2$, 0), (607, $A_3$, 0), (627, $B$, 0)) {
    tickat(p, (0, 0), (1, 0), (x, 1100), s: 4)
  }
  A2-t(p, (487, 1085), $A$)
  A2-t(p, (625, 1085), $B$)
  A2-t(p, (532, 1117), $A_1$)
  A2-t(p, (572, 1117), $A_2$)
  A2-t(p, (611, 1117), $A_3$)
  seg(p, (490, 1157), (882, 1157))
  for x in (490, 528, 621, 753, 882) {
    tickat(p, (0, 0), (1, 0), (x, 1157), s: 4)
  }
  A2-t(p, (487, 1168), $C$)
  A2-t(p, (510, 1190), $frac(1, 10) C D$)
  A2-t(p, (888, 1176), $D$)
})

// 图 1·6（p.7，例 2）：等腰直角三角形 ABC
#let fig-A-1-6(width: 640 * k) = px-canvas(640, 250, origin: (200, 195), width: width, (p, u) => {
  import cetz.draw: *
  // (1)
  let a = (230, 371)
  let b = (498, 375)
  let c = (365, 233)
  let d = (365, 373)
  poly(p, (a, b, c), close: true)
  seg(p, c, d)
  rtmark(p, d, c, b, s: 9)
  A2-t(p, (216, 371), $A$)
  A2-t(p, (509, 377), $B$)
  A2-t(p, (365, 222), $C$)
  A2-t(p, (365, 388), $D$)
  line(p(348, 238), p(348, 302), stroke: lt)
  line(p(348, 330), p(348, 368), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.4))
  tickat(p, (1, 0), (0, 0), (348, 238), s: 4)
  A2-t(p, (326, 318), $frac(1, 2) c "寸"$)
  dimh(p, 230, 497, 417, lab: $c "寸"$, labx: 362, gapw: 46)
  tickat(p, (0, 0), (1, 0), (230, 417), s: 4)
  tickat(p, (0, 0), (1, 0), (497, 417), s: 4)
  A2-t(p, (362, 458), tt[(1)])
  // (2)
  let b2 = (618, 205)
  let c2 = (618, 407)
  let a2 = (810, 407)
  poly(p, (b2, c2, a2), close: true)
  rtmark(p, c2, b2, a2, s: 9)
  A2-t(p, (620, 193), $B$)
  A2-t(p, (607, 420), $C$)
  A2-t(p, (826, 405), $A$)
  line(p(605, 208), p(605, 280), stroke: lt, mark: (start: "stealth", fill: black, scale: 0.4))
  line(p(605, 312), p(605, 405), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.4))
  A2-t(p, (590, 296), $1 "寸"$)
  line(p(623, 421), p(690, 421), stroke: lt)
  line(p(742, 421), p(810, 421), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.4))
  tickat(p, (0, 0), (1, 0), (810, 421), s: 4)
  A2-t(p, (716, 421), $1 "寸"$)
  A2-t(p, (697, 458), tt[(2)])
})

// 图 1·7（p.9）：长度单位 EF，线段 AA'、BB'
#let fig-A-1-7(width: 700 * k) = px-canvas(700, 100, origin: (175, 262), width: width, (p, u) => {
  import cetz.draw: *
  A2-pseg(p, (200, 281), (258, 281), s: 4)
  A2-t(p, (188, 270), $E$)
  A2-t(p, (266, 281), $F$)
  seg(p, (200, 310), (555, 310))
  seg(p, (200, 344), (850, 344))
  for i in range(7) {
    tickat(p, (0, 0), (1, 0), (200 + 355 * i / 6, 310), s: 4)
  }
  for i in range(12) {
    tickat(p, (0, 0), (1, 0), (200 + 650 * i / 11, 344), s: 4)
  }
  A2-t(p, (188, 311), $A$)
  A2-t(p, (566, 311), $A'$)
  A2-t(p, (188, 344), $B$)
  A2-t(p, (861, 344), $B'$)
})

// 图 1·8（p.11）：成比例的线段 a、b、c、d
#let fig-A-1-8(width: 640 * k) = px-canvas(640, 120, origin: (225, 1140), width: width, (p, u) => {
  import cetz.draw: *
  let row(y, x1, n, nm) = {
    seg(p, (245, y), (x1, y))
    for i in range(n + 1) {
      tickat(p, (0, 0), (1, 0), (245 + (x1 - 245) * i / n, y), s: 5)
    }
    A2-t(p, (235, y), nm)
  }
  row(1157, 510, 4, $a$)
  row(1187, 710, 7, $b$)
  row(1224, 592, 4, $c$)
  row(1255, 850, 7, $d$)
})

// 图 1·9（p.12，例 1）：△ABC 与 △A'B'C' 的中位线
#let fig-A-1-9(width: 600 * k) = px-canvas(600, 220, origin: (170, 385), width: width, (p, u) => {
  import cetz.draw: *
  let a = (327, 448)
  let b = (200, 584)
  let c = (473, 580)
  poly(p, (a, b, c), close: true)
  seg(p, (263.5, 516), (400, 514))
  A2-t(p, (327, 437), $A$)
  A2-t(p, (249, 512), $D$)
  A2-t(p, (412, 512), $E$)
  A2-t(p, (188, 590), $B$)
  A2-t(p, (484, 580), $C$)
  let a2 = (583, 408)
  let b2 = (560, 577)
  let c2 = (753, 574)
  poly(p, (a2, b2, c2), close: true)
  seg(p, (571.5, 492), (668, 491))
  A2-t(p, (583, 397), $A'$)
  A2-t(p, (554, 494), $D'$)
  A2-t(p, (684, 487), $E'$)
  A2-t(p, (546, 583), $B'$)
  A2-t(p, (766, 577), $C'$)
})

// 图 1·10（p.16，例 4）：△ABC，D 在 BC 上
#let fig-A-1-10(width: 420 * k) = px-canvas(420, 230, origin: (425, 330), width: width, (p, u) => {
  import cetz.draw: *
  let a = (532, 350)
  let b = (450, 537)
  let c = (822, 530)
  let d = (590, 535)
  poly(p, (a, b, c), close: true)
  seg(p, a, d)
  A2-t(p, (530, 340), $A$)
  A2-t(p, (437, 538), $B$)
  A2-t(p, (832, 530), $C$)
  A2-t(p, (590, 550), $D$)
})
