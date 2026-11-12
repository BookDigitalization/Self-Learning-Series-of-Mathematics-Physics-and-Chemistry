// 立体几何 段 A：图 1·5–图 1·8（原书 p.4–6）及习题 1·3 第 3 题插图，读坐标时的页面渲染 200 dpi。
#import "A-base.typ": *

// 图 1·5（p.4）：正方形 ABCD 在水平平面 P 内的表示
#let fig-A-1-5(width: 545 * k) = px-canvas(545, 150, origin: (235, 710), width: width, (p, u) => {
  import cetz.draw: *
  A-poly(p, ((262, 729), (361, 729), (361, 826), (262, 826)), s: lb)
  lbl(p, (250, 724), $D$, dir: "c", d: 0)
  lbl(p, (373, 722), $C$, dir: "c", d: 0)
  lbl(p, (250, 845), $A$, dir: "c", d: 0)
  lbl(p, (362, 845), $B$, dir: "c", d: 0)
  A-poly(p, ((400, 834), (661, 835), (758, 740), (499, 737)), close: true)
  A-poly(p, ((503, 808), (605, 810), (639, 776), (538, 772)), s: lb)
  lbl(p, (541, 762), $D_1$, dir: "c", d: 0)
  lbl(p, (655, 771), $C_1$, dir: "c", d: 0)
  lbl(p, (492, 814), $A_1$, dir: "c", d: 0)
  lbl(p, (622, 823), $B_1$, dir: "c", d: 0)
  lbl(p, (722, 751), $P$, dir: "c", d: 0)
})

// 图 1·6（p.4）：△ABC 在水平平面 P 内的表示
#let fig-A-1-6(width: 520 * k) = px-canvas(520, 140, origin: (240, 1240), width: width, (p, u) => {
  import cetz.draw: *
  A-poly(p, ((277, 1331), (358, 1332), (308, 1252)), s: lb)
  A-seg(p, (308, 1252), (304, 1347), s: lt)
  pdot(p, (304, 1347), r: 1.8)
  lbl(p, (311, 1241), $C$, dir: "c", d: 0)
  lbl(p, (265, 1343), $A$, dir: "c", d: 0)
  lbl(p, (368, 1337), $B$, dir: "c", d: 0)
  lbl(p, (306, 1359), $D$, dir: "c", d: 0)
  A-poly(p, ((417, 1345), (646, 1345), (746, 1256), (505, 1256)), close: true)
  A-poly(p, ((530, 1316), (612, 1315), (588, 1289)), s: lb)
  A-seg(p, (588, 1289), (577, 1316), s: lt)
  lbl(p, (586, 1279), $C_1$, dir: "c", d: 0)
  lbl(p, (520, 1322), $A_1$, dir: "c", d: 0)
  lbl(p, (571, 1332), $D_1$, dir: "c", d: 0)
  lbl(p, (624, 1322), $B_1$, dir: "c", d: 0)
  lbl(p, (707, 1268), $P$, dir: "c", d: 0)
})

// 图 1·7（p.5）：四边形 ABCD 在水平平面 P 内的表示
#let fig-A-1-7(width: 790 * k) = px-canvas(790, 175, origin: (130, 548), width: width, (p, u) => {
  import cetz.draw: *
  // 左：原图
  A-poly(p, ((203, 636), (251, 588), (344, 576), (403, 690)), s: lb)
  A-seg(p, (176, 636), (428, 636), s: lt)
  A-seg(p, (251, 588), (251, 636), s: lt)
  A-seg(p, (344, 576), (344, 636), s: lt)
  A-seg(p, (403, 636), (403, 690), s: lt)
  lbl(p, (162, 635), $M$, dir: "c", d: 0)
  lbl(p, (437, 637), $N$, dir: "c", d: 0)
  lbl(p, (197, 655), $A$, dir: "c", d: 0)
  lbl(p, (262, 622), $E$, dir: "c", d: 0)
  lbl(p, (352, 622), $F$, dir: "c", d: 0)
  lbl(p, (406, 622), $K$, dir: "c", d: 0)
  lbl(p, (248, 573), $D$, dir: "c", d: 0)
  lbl(p, (345, 563), $C$, dir: "c", d: 0)
  lbl(p, (404, 705), $B$, dir: "c", d: 0)
  // 右：平面 P 内
  A-poly(p, ((453, 692), (780, 694), (891, 580), (565, 577)), close: true)
  A-poly(p, ((584, 636), (646, 603), (738, 605), (730, 665)), s: lb)
  A-seg(p, (555, 636), (805, 634), s: lt)
  A-seg(p, (629, 636), (646, 603), s: lt)
  A-seg(p, (703, 636), (738, 605), s: lt)
  A-seg(p, (757, 634), (730, 665), s: lt)
  lbl(p, (634, 592), $D_1$, dir: "c", d: 0)
  lbl(p, (748, 597), $C_1$, dir: "c", d: 0)
  lbl(p, (862, 596), $P$, dir: "c", d: 0)
  lbl(p, (538, 634), $M_1$, dir: "c", d: 0)
  lbl(p, (571, 652), $A_1$, dir: "c", d: 0)
  lbl(p, (644, 643), $E_1$, dir: "c", d: 0)
  lbl(p, (706, 652), $F_1$, dir: "c", d: 0)
  lbl(p, (768, 626), $K_1$, dir: "c", d: 0)
  lbl(p, (802, 640), $N_1$, dir: "c", d: 0)
  lbl(p, (727, 685), $B_1$, dir: "c", d: 0)
})

// 图 1·8（p.6）：圆在水平平面 M 内的表示
#let fig-A-1-8(width: 640 * k) = px-canvas(640, 245, origin: (175, 203), width: width, (p, u) => {
  import cetz.draw: *
  // 左：圆与垂线
  let (cx, cy, r) = (323, 347, 64)
  circle(p(cx, cy), radius: r, stroke: lb)
  for i in range(1, 12) {
    let dx = -r + 2 * r * i / 12
    let h = calc.sqrt(r * r - dx * dx)
    line(p(cx + dx, cy - h), p(cx + dx, cy + h), stroke: lt)
  }
  line(p(183, 347), p(467, 347), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.5))
  line(p(323, 435), p(323, 213), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.5))
  lbl(p, (213, 361), $A$, dir: "c", d: 0)
  lbl(p, (427, 360), $B$, dir: "c", d: 0)
  // 右：平面 M 内
  poly(p, ((460, 395), (700, 393), (800, 295), (558, 299)), close: true)
  let (ex, ey) = (623, 343)
  let c45 = 0.7071
  let pts = range(0, 73).map(i => {
    let t = i * 5deg
    (ex + r * calc.cos(t) + 0.5 * r * calc.sin(t) * c45, ey - 0.5 * r * calc.sin(t) * c45)
  })
  for i in range(1, 12) {
    let dx = -r + 2 * r * i / 12
    let h = calc.sqrt(r * r - dx * dx)
    let o = 0.5 * h * c45
    line(p(ex + dx - o, ey + o), p(ex + dx + o, ey - o), stroke: lt)
  }
  line(..pts.map(q => p(..q)), stroke: lb)
  line(p(533, 346), p(723, 346), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.5))
  line(p(584, 382), p(662, 304), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.5))
  lbl(p, (537, 363), $A_1$, dir: "c", d: 0)
  lbl(p, (693, 365), $B_1$, dir: "c", d: 0)
  lbl(p, (763, 307), $M$, dir: "c", d: 0)
})

// 习题 1·3 第 3 题（p.6）：两个折起的平面，直线穿过
#let A-vee(p, ap, lt_, rt_, lb_, rb_, mid, y, parts, rings) = {
  import cetz.draw: *
  seg(p, ap, lt_)
  seg(p, ap, rt_)
  seg(p, lt_, lb_)
  seg(p, rt_, rb_)
  seg(p, lb_, mid)
  seg(p, mid, rb_)
  seg(p, (ap.at(0) - 1, ap.at(1)), (mid.at(0) + 1, mid.at(1)))
  // 直线分段：(x0, x1, 线型)；两平面外的部分粗实线，被遮住的部分虚线（按原图逐段）
  for (x0, x1, s) in parts { line(p(x0, y), p(x1, y), stroke: s) }
  for c in rings { ring(p, (c, y)) }
}
// 左图：左平面前方实线，穿过左平面（第一个小圈）后到中间折线为虚线，其后实线；
// 右图：从左平面边到第一个小圈为虚线，两小圈之间实线，第二个小圈到右平面边为虚线。
#let fig-A-p6-q3(width: 470 * k) = px-canvas(470, 225, origin: (250, 1130), width: width, (p, u) => {
  import cetz.draw: *
  A-vee(p, (351, 1137), (283, 1187), (420, 1186), (286, 1337), (421, 1332), (355, 1282), 1212,
    ((257, 283, lb), (283, 317, lw), (317, 353, dsh), (353, 421, lw), (421, 447, lb)), (317, 390))
  A-vee(p, (604, 1137), (536, 1185), (672, 1184), (538, 1331), (674, 1330), (604, 1279), 1211,
    ((507, 536, lb), (536, 571, dsh), (571, 636, lw), (636, 672, dsh), (672, 702, lb)), (571, 636))
})
