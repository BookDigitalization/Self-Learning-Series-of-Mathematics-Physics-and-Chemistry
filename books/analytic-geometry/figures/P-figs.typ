// 段 P 插图：图 4·44–4·57 及习题 4·13~4·18 的小图（原书 p.266–284），读图 150 dpi（页宽 768 像素）。
// 坐标图按方程计算（单位长取原图刻度），轴线整理为水平、竖直；
// 图 4·46（探照灯）、图 4·47（手持铅笔画抛物线）是写实插画，用原扫描裁剪二值化 PNG
//（P-4-46.png 取自 p.267 上部；P-4-47.png 取自 p.267 下部，原图字母已涂掉，用真文字补）。
// 图 4·57（圆锥截线）按几何关系用平行投影重建，不逐线描原图。
#import "/common/geo.typ": *
#let P-k = 0.0196cm
#let P-t(p, pt, body) = { import cetz.draw: *; content(p(..pt), tt(body)) }
// 坐标轴：原点 (ox, oy)，x 轴从 x0 到 x1，y 轴从 y1（下端）到 y0（上端），带箭头和 x、y。
#let P-axes(p, ox, oy, x0, x1, y0, y1) = {
  import cetz.draw: *
  line(p(x0, oy), p(x1, oy), stroke: lt, mark: arw)
  line(p(ox, y1), p(ox, y0), stroke: lt, mark: arw)
  P-t(p, (x1 + 10, oy), $x$)
  P-t(p, (ox, y0 - 10), $y$)
}
// 刻度：原点 (ox, oy)、单位 un，x 轴取 xs 各整数、y 轴取 ys 各整数。
#let P-ticks(p, ox, oy, un, xs, ys, s: 3) = {
  import cetz.draw: *
  for i in xs { if i != 0 { line(p(ox + i * un, oy), p(ox + i * un, oy - s), stroke: lt) } }
  for j in ys { if j != 0 { line(p(ox, oy - j * un), p(ox + s, oy - j * un), stroke: lt) } }
}
// 折线（页面坐标点列）
#let P-pl(p, pts, st: lw) = {
  import cetz.draw: *
  line(..pts.map(q => p(..q)), stroke: st)
}
// 取样：f(t) 返回页面坐标，t 从 a 到 b 取 n 段
#let P-smp(f, a, b, n: 60) = range(n + 1).map(i => f(a + (b - a) * i / n))
#let P-dash = (paint: black, thickness: 0.9pt, dash: "dashed")

// 图 4·44（p.266）：y = ax²，a > 0 实线，a < 0 虚线
#let fig-P-4-44(width: 270 * P-k) = px-canvas(270, 250, origin: (70, 950), width: width, (p, u) => {
  import cetz.draw: *
  P-axes(p, 189, 829, 85, 320, 722, 940)
  P-pl(p, P-smp(x => (x, 829 - 0.0152 * calc.pow(x - 189, 2)), 108, 267))
  P-pl(p, P-smp(x => (x, 829 + 0.0136 * calc.pow(x - 189, 2)), 110, 268), st: P-dash)
  P-t(p, (182, 842), $O$)
  P-t(p, (298, 745), $y = a x^2$)
  P-t(p, (288, 788), $(a > 0)$)
  P-t(p, (288, 866), $(a < 0)$)
})

// 图 4·45（p.266）：抛物线形桥拱（砖墙、水面）
#let P-bridge(p, x0, x1, ytop, ybot, crown, rows, bw, ax, ay, afeet, yfoot, gap, wtop, wbot, wstep) = {
  import cetz.draw: *
  // 砖缝（ytop 到 ybot）
  let rh = (ybot - ytop) / rows
  for i in range(rows + 1) {
    let y = ytop + i * rh
    line(p(x0, y), p(x1, y), stroke: 0.5pt)
  }
  for i in range(rows) {
    let y = ytop + i * rh
    let off = if calc.rem(i, 2) == 0 { 0 } else { bw / 2 }
    let x = x0 + off + bw
    while x < x1 - 2 {
      line(p(x, y), p(x, y + rh), stroke: 0.5pt)
      x += bw
    }
  }
  // 拱圈：外线顶点 (ax, ay)，在 yfoot 处半宽 afeet；内线低 0.6gap、窄 gap
  let g6 = gap * 0.6
  let iw = afeet - gap
  let outer = P-smp(x => (x, ay + (yfoot - ay) * calc.pow((x - ax) / afeet, 2)), ax - afeet, ax + afeet)
  let inner = P-smp(x => (x, ay + g6 + (yfoot - ay - g6) * calc.pow((x - ax) / iw, 2)), ax - iw, ax + iw)
  line(..outer.map(q => p(..q)), close: true, fill: white, stroke: none)
  // 水面
  let y = wtop
  while y <= wbot {
    let hw = iw * calc.sqrt((y - ay - g6) / (yfoot - ay - g6))
    line(p(ax - hw + 2, y), p(ax + hw - 2, y), stroke: 0.5pt)
    y += wstep
  }
  P-pl(p, outer)
  P-pl(p, inner)
  // 桥面、两端
  P-pl(p, crown, st: lb)
  line(p(x0, ytop), p(x0, ybot), stroke: 0.5pt)
  line(p(x1, ytop), p(x1, ybot), stroke: 0.5pt)
}
#let fig-P-4-45(width: 285 * P-k) = px-canvas(285, 160, origin: (385, 935), width: width, (p, u) => {
  import cetz.draw: *
  let crown = P-smp(x => (x, 788 + 15 * calc.pow((x - 530) / 135, 2)), 392, 662)
  P-bridge(p, 392, 660, 806, 927, crown, 10, 25, 520, 818, 93, 927, 9, 889, 925, 6)
  line(p(392, 927), p(660, 927), stroke: lb)
})

// 图 4·46（p.267）：探照灯、抛物镜面（写实插画，位图）
#let fig-P-4-46(width: 9.2cm) = image("/books/analytic-geometry/figures/P-4-46.png", width: width)

// 图 4·47（p.267）：画抛物线（写实插画，位图 + 真文字标注）
#let fig-P-4-47(width: 355 * P-k) = px-canvas(355, 228, origin: (335.25, 1040.25), width: width, (p, u) => {
  import cetz.draw: *
  pimg(p, u, "/books/analytic-geometry/figures/P-4-47.png", (335.25, 812.25, 690, 1040.25))
  P-t(p, (462, 955), $Q$)
  P-t(p, (510, 953), $P$)
  P-t(p, (618, 946), $A$)
  P-t(p, (487, 979), $F$)
  P-t(p, (412, 1004), $l$)
})

// 图 4·48（p.269）：y² = 2px 的推导。p/2 = 21 像素
#let fig-P-4-48(width: 265 * P-k) = px-canvas(265, 260, origin: (270, 415), width: width, (p, u) => {
  import cetz.draw: *
  P-axes(p, 352, 312, 302, 505, 180, 405)
  // 准线 x = -p/2
  line(p(330, 197), p(330, 403), stroke: lt)
  // 抛物线 y² = 84x（像素）
  P-pl(p, P-smp(t => (352 + t * t / 84, 312 - t), -102, 100))
  let P = (352 + 91 * 91 / 84, 221)
  line(p(330, 221), p(..P), stroke: lt)
  line(p(..P), p(373, 312), stroke: lt)
  pdot(p, (330, 221)); pdot(p, P); ring(p, (373, 312), r: 2)
  // 两个 p/2
  cetz.decorations.brace(p(330, 307), p(352, 307), amplitude: 4, stroke: 0.5pt)
  cetz.decorations.brace(p(352, 307), p(373, 307), amplitude: 4, stroke: 0.5pt)
  P-t(p, (341, 290), $p/2$)
  P-t(p, (367, 289), $p/2$)
  P-t(p, (298, 219), $Q(-p/2, y)$)
  P-t(p, (497, 232), $P(x, y)$)
  P-t(p, (322, 304), $K$)
  P-t(p, (344, 323), $O$)
  P-t(p, (402, 333), $F(p/2, 0)$)
  P-t(p, (323, 345), $l$)
  P-t(p, (300, 398), $x = -p/2$)
})

// 图 4·49（p.272）：y² = 5x。单位 18.4 像素
#let fig-P-4-49(width: 255 * P-k) = px-canvas(255, 275, origin: (80, 665), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, un) = (151, 532, 18.4)
  P-axes(p, ox, oy, 95, 318, 395, 660)
  P-ticks(p, ox, oy, un, range(-2, 9), range(-6, 8))
  line(p(ox - 1.25 * un, 440), p(ox - 1.25 * un, 625), stroke: lw)
  P-pl(p, P-smp(t => (ox + t * t / 5 * un, oy - t * un), -5.9, 5.9))
  for (x, y) in ((0, 0), (1.25, 2.5), (1.25, -2.5), (3, 3.873), (3, -3.873), (5, 5), (5, -5), (1.25, 0)) {
    pdot(p, (ox + x * un, oy - y * un))
  }
  P-t(p, (141, 545), $O$)
  P-t(p, (197, 551), $F(5/4, 0)$)
  P-t(p, (103, 645), $x = -5/4$)
})

// 图 4·50（p.273）：汽车前灯。单位 10.8 像素
#let fig-P-4-50(width: 280 * P-k) = px-canvas(280, 320, origin: (420, 950), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, un) = (467, 795, 10.8)
  P-axes(p, ox, oy, 432, 672, 642, 942)
  P-ticks(p, ox, oy, un, range(-3, 19), range(-13, 14))
  P-pl(p, P-smp(t => (ox + t * t / 10 * un, oy - t * un), -10, 10))
  circle(p(575, 795), radius: (34, 108), stroke: lw)
  line(p(575, 688), p(575, 932), stroke: lt)
  dimh(p, 467, 575, 920, lab: $10$)
  pdot(p, (ox + 2.5 * un, oy))
  P-t(p, (459, 806), $O$)
  P-t(p, (495, 807), $F$)
  P-t(p, (585, 805), $M$)
  P-t(p, (612, 676), $A(10, 10)$)
  P-t(p, (614, 914), $B(10, -10)$)
})

// 图 4·51（p.274–275）：抛物线的四种位置
#let fig-P-4-51a(width: 205 * P-k) = px-canvas(205, 245, origin: (130, 1045), width: width, (p, u) => {
  import cetz.draw: *
  P-axes(p, 213, 913, 140, 312, 806, 1012)
  line(p(194, 848), p(194, 990), stroke: lt)
  P-pl(p, P-smp(t => (213 + t * t / 70, 913 - t), -70, 70))
  pdot(p, (237, 913))
  P-t(p, (205, 924), $O$)
  P-t(p, (263, 936), $F(p/2, 0)$)
  P-t(p, (280, 872), $y^2 = 2 p x$)
  P-t(p, (276, 890), $(x >= 0)$)
  P-t(p, (175, 1000), $x = -p/2$)
  P-t(p, (215, 1036), [(_a_)])
})
#let fig-P-4-51b(width: 230 * P-k) = px-canvas(230, 245, origin: (408, 1045), width: width, (p, u) => {
  import cetz.draw: *
  P-axes(p, 508, 913, 420, 620, 806, 1012)
  line(p(530, 848), p(530, 990), stroke: lt)
  P-pl(p, P-smp(t => (508 - t * t / 70, 913 - t), -70, 70))
  pdot(p, (485, 913))
  P-t(p, (518, 924), $O$)
  P-t(p, (452, 936), $F(-p/2, 0)$)
  P-t(p, (442, 872), $y^2 = -2 p x$)
  P-t(p, (440, 890), $(x <= 0)$)
  P-t(p, (550, 996), $x = p/2$)
  P-t(p, (511, 1036), [(_b_)])
})
#let fig-P-4-51c(width: 245 * P-k) = px-canvas(245, 240, origin: (115, 1035), width: width, (p, u) => {
  import cetz.draw: *
  P-axes(p, 216, 945, 133, 325, 812, 1012)
  line(p(145, 966), p(308, 966), stroke: lt)
  P-pl(p, P-smp(x => (x, 945 - 96 * calc.pow((x - 216) / 89, 2)), 127, 305))
  pdot(p, (216, 923))
  P-t(p, (207, 957), $O$)
  P-t(p, (175, 905), $F(0, p/2)$)
  P-t(p, (314, 887), $x^2 = 2 p y$)
  P-t(p, (314, 904), $(y >= 0)$)
  P-t(p, (277, 988), $y = -p/2$)
  P-t(p, (216, 1026), [(_c_)])
})
#let fig-P-4-51d(width: 240 * P-k) = px-canvas(240, 240, origin: (420, 1035), width: width, (p, u) => {
  import cetz.draw: *
  P-axes(p, 510, 902, 430, 625, 812, 1000)
  line(p(440, 880), p(590, 880), stroke: lt)
  P-pl(p, P-smp(x => (x, 902 + 85 * calc.pow((x - 510) / 79, 2)), 432, 590))
  pdot(p, (511, 925))
  P-t(p, (500, 893), $O$)
  P-t(p, (610, 879), $y = p/2$)
  rect(p(478, 935), p(545, 960), fill: white, stroke: none)
  P-t(p, (511, 947), $F(0, -p/2)$)
  P-t(p, (588, 998), $x^2 = -2 p y$)
  P-t(p, (588, 1015), $(y <= 0)$)
  P-t(p, (510, 1026), [(_d_)])
})

// 图 4·52（p.278）：例 5 的两条抛物线。单位 24 像素
#let fig-P-4-52(width: 270 * P-k) = px-canvas(270, 310, origin: (95, 555), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, un) = (195, 384, 24)
  P-axes(p, ox, oy, 102, 340, 252, 552)
  P-ticks(p, ox, oy, un, range(-3, 7), range(-6, 6))
  line(p(243, 270), p(243, 525), stroke: lt)
  line(p(125, 378), p(300, 378), stroke: lt)
  // I：y² = -8x
  P-pl(p, P-smp(t => (ox - t * t / 8 * un, oy - t * un), -5.6, 5.0))
  // II：x² = -y
  P-pl(p, P-smp(t => (ox + t * un, oy + t * t * un), -2.35, 2.3))
  pdot(p, (147, 384)); pdot(p, (147, 480)); ring(p, (195, 390), r: 2)
  line(p(197, 392), p(250, 410), stroke: 0.5pt)
  P-t(p, (126, 262), [I])
  P-t(p, (252, 537), [II])
  P-t(p, (260, 298), $x = 2$)
  P-t(p, (153, 360), $y = 1/4$)
  P-t(p, (118, 397), $F(-2, 0)$)
  P-t(p, (205, 376), $O$)
  P-t(p, (290, 418), $F'(0, -1/4)$)
  P-t(p, (192, 496), $P(-2, -4)$)
})

// 图 4·53（p.278）：y = x² + 4x + 5。单位 27.5 像素
#let fig-P-4-53(width: 270 * P-k) = px-canvas(270, 320, origin: (418, 1045), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, un) = (553, 937, 27.5)
  P-axes(p, ox, oy, 420, 668, 738, 1042)
  P-ticks(p, ox, oy, un, range(-4, 5), range(-3, 7))
  line(p(498, 790), p(498, 1013), stroke: lt)
  P-pl(p, P-smp(t => (ox + t * un, oy - ((t + 2) * (t + 2) + 1) * un), -3.9, 0.05))
  ring(p, (498, 909.5), r: 2.5)
  P-t(p, (468, 920), $(-2, 1)$)
  P-t(p, (543, 948), $O$)
  P-t(p, (506, 1027), $x = -2$)
})

// 图 4·54（p.280）：用圆规和直尺作抛物线上的点。K、O、F 等距（26 像素），y² = 104x（像素）
#let fig-P-4-54(width: 220 * P-k) = px-canvas(220, 285, origin: (92, 497), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy) = (139, 357)
  P-axes(p, ox, oy, 98, 300, 228, 492)
  line(p(113, 262), p(113, 452), stroke: lt)
  P-pl(p, P-smp(t => (ox + t * t / 104, oy - t), -110, 110))
  let F = (165, 357)
  for ax in (152, 196, 228) {
    let yy = calc.sqrt(104 * (ax - ox))
    line(p(ax, oy - yy), p(ax, oy + yy), stroke: dsh)
    for s in (-1, 1) {
      let q = (ax, oy + s * yy)
      // 以 F 为圆心、KA 为半径的短弧
      let rr = ax - 113
      let ang = calc.atan2(q.at(0) - F.at(0), F.at(1) - q.at(1))
      arc(p(F.at(0) + rr * calc.cos(ang - 7deg), F.at(1) - rr * calc.sin(ang - 7deg)), start: ang - 7deg, stop: ang + 7deg, radius: rr, stroke: 0.5pt)
      pdot(p, q)
    }
    pdot(p, (ax, oy))
  }
  let P1 = (152, oy - calc.sqrt(104 * 13))
  line(p(113, P1.at(1)), p(..P1), stroke: dsh)
  line(p(..P1), p(..F), stroke: dsh)
  pdot(p, (ox, oy)); pdot(p, F); pdot(p, (139, 457))
  P-t(p, (128, 368), $O$)
  P-t(p, (104, 368), $K$)
  P-t(p, (102, 323), $Q$)
  P-t(p, (106, 418), $l$)
  P-t(p, (170, 371), $F$)
  P-t(p, (145, 348), $A_1$)
  P-t(p, (205, 348), $A_2$)
  P-t(p, (237, 348), $A_3$)
  P-t(p, (146, 306), $P_1$)
  P-t(p, (190, 268), $P_2$)
  P-t(p, (222, 250), $P_3$)
  P-t(p, (149, 410), $P'_1$)
  P-t(p, (186, 446), $P'_2$)
  P-t(p, (219, 469), $P'_3$)
})

// 图 4·55（p.280）：拱形的画法。a = 165，h = 124 像素，五等分
#let fig-P-4-55(width: 435 * P-k) = px-canvas(435, 240, origin: (160, 1005), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, a, h) = (353, 853, 165, 124)
  P-axes(p, ox, oy, 188, 580, 778, 1000)
  line(p(188, 853), p(188, 977), stroke: lt)
  line(p(188, 977), p(518, 977), stroke: lt)
  line(p(518, 977), p(518, 853), stroke: lt)
  for i in range(1, 5) {
    line(p(188 + 33 * i, 853), p(188 + 33 * i, 977), stroke: lt)
    line(p(353 + 33 * i, 853), p(353 + 33 * i, 977), stroke: lt)
    let x = 188 + 33 * i
    let yP = oy + h * calc.pow((x - ox) / a, 2)
    let yB = 977 - h / 5 * i
    line(p(188, yB), p(ox, oy), stroke: lt)
    pdot(p, (x, yP))
  }
  P-pl(p, P-smp(x => (x, oy + h * calc.pow((x - ox) / a, 2)), 188, 518))
  P-t(p, (178, 843), $D$)
  for i in range(1, 5) {
    P-t(p, (188 + 33 * i, 842), $A'_#i$)
    P-t(p, (188 + 33 * i, 991), $A_#i$)
    P-t(p, (175, 977 - 24.8 * i), $B_#i$)
  }
  P-t(p, (363, 843), $O$)
  P-t(p, (520, 842), $C$)
  P-t(p, (188, 991), $A$)
  P-t(p, (363, 991), $K$)
  P-t(p, (520, 991), $B$)
  P-t(p, (212, 924), $P_1$)
  P-t(p, (239, 887), $P_2$)
  P-t(p, (276, 865), $P_3$)
  P-t(p, (329, 867), $P_4$)
})

// 图 4·56（p.281）：证明 P₁ 在抛物线上。a = 106，h = 120 像素
#let fig-P-4-56(width: 290 * P-k) = px-canvas(290, 210, origin: (365, 870), width: width, (p, u) => {
  import cetz.draw: *
  let (ox, oy, a, h) = (500, 712, 106, 120)
  P-axes(p, ox, oy, 372, 645, 668, 868)
  line(p(394, 712), p(394, 832), stroke: lt)
  line(p(394, 832), p(610, 832), stroke: lt)
  line(p(610, 832), p(610, 712), stroke: lt)
  line(p(418, 712), p(418, 832), stroke: lt)
  P-pl(p, P-smp(x => (x, oy + h * calc.pow((x - ox) / a, 2)), 394, 606), st: P-dash)
  let P1 = (418, oy + h * calc.pow(82 / a, 2))
  let yB = oy + (P1.at(1) - oy) * a / 82
  line(p(394, yB), p(ox, oy), stroke: lt)
  pdot(p, P1)
  P-t(p, (396, 703), $D$)
  P-t(p, (420, 702), $A'_1$)
  P-t(p, (512, 704), $O$)
  P-t(p, (613, 703), $C$)
  P-t(p, (383, yB - 2), $B_1$)
  P-t(p, (458, 785), $P_1(x_1, y_1)$)
  P-t(p, (428, 823), $A_1$)
  P-t(p, (428, 843), $A(-a, -h)$)
  P-t(p, (512, 843), $K$)
  P-t(p, (610, 843), $B$)
})

// 图 4·57（p.283）：用平面截圆锥。按几何关系重建：
// 圆锥轴竖直、半顶角 tan α = 0.7；平面 1 与轴斜交只截下半锥（椭圆），
// 平面 2 平行于一条母线（抛物线），平面 3 平行于轴、截上下两半锥（双曲线两支）。
// 平行投影：先绕轴转 psi，再俯视 phi。截线在前半（朝向读者）画实线，后半画虚线。
#let P-proj(X, Y, Z) = {
  let (c, s) = (calc.cos(28deg), calc.sin(28deg))
  let D = -X * s + Y * c
  (505 + X * c + Y * s, 560 - (Z * 0.94 + D * 0.34), D)
}
#let P-run(p, pts, st-front, st-back) = {
  // pts: (u, v, D) 列表，按 D 的正负切成实线段 / 虚线段
  import cetz.draw: *
  let cur = ()
  let front = none
  for q in pts {
    let f = q.at(2) <= 0
    if front == none { front = f }
    if f != front {
      cur.push(q)
      if cur.len() > 1 { line(..cur.map(r => p(r.at(0), r.at(1))), stroke: if front { st-front } else { st-back }) }
      cur = (q,)
      front = f
    } else { cur.push(q) }
  }
  if cur.len() > 1 { line(..cur.map(r => p(r.at(0), r.at(1))), stroke: if front { st-front } else { st-back }) }
}
#let fig-P-4-57(width: 300 * P-k) = px-canvas(300, 330, origin: (360, 755), width: width, (p, u) => {
  import cetz.draw: *
  let t = 0.7
  let (H1, H2) = (106, 160)
  let q2 = (a) => { let r = P-proj(..a); (r.at(0), r.at(1)) }
  let thin = 0.5pt
  let back = (paint: black, thickness: 0.5pt, dash: "dashed")
  let curb = (paint: black, thickness: 1.1pt, dash: "dashed")
  // 平面 1：Z = -45 + 0.3X
  let pl1 = ((-130, -90), (130, -90), (130, 90), (-130, 90)).map(((x, y)) => q2((x, y, -45 + 0.3 * x)))
  line(..pl1.map(q => p(..q)), close: true, stroke: thin)
  // 平面 2：X = 110 + 0.7Z
  let pl2 = ((-125, -172), (125, -172), (125, 40), (-125, 40)).map(((y, z)) => q2((110 + t * z, y, z)))
  line(..pl2.map(q => p(..q)), close: true, stroke: thin)
  // 平面 3：竖直，在轴的左侧，到轴的距离 30
  let b = 28deg + 40deg
  let e = (calc.cos(b), calc.sin(b))
  let n = (-calc.sin(b), calc.cos(b))
  let d1 = 30
  let P3 = (w, z) => (d1 * n.at(0) + w * e.at(0), d1 * n.at(1) + w * e.at(1), z)
  let pl3 = ((-110, -172), (110, -172), (110, 118), (-110, 118)).map(((w, z)) => q2(P3(w, z)))
  line(..pl3.map(q => p(..q)), close: true, stroke: thin)
  // 圆锥：上底圆、下底圆、外形母线
  P-pl(p, range(73).map(i => q2((H1 * t * calc.cos(i * 5deg), H1 * t * calc.sin(i * 5deg), H1))))
  P-run(p, range(73).map(i => P-proj(H2 * t * calc.cos(i * 5deg), H2 * t * calc.sin(i * 5deg), -H2)), lw, back)
  let apex = q2((0, 0, 0))
  for sgn in (-1, 1) {
    let (c, s) = (calc.cos(28deg), calc.sin(28deg))
    line(p(..apex), p(..q2((sgn * H1 * t * c, sgn * H1 * t * s, H1))), stroke: lw)
    line(p(..apex), p(..q2((sgn * H2 * t * c, sgn * H2 * t * s, -H2))), stroke: lw)
  }
  // 椭圆：r = 45 / (1/t + 0.3 cos θ)
  P-run(p, range(73).map(i => {
    let th = i * 5deg
    let r = 45 / (1 / t + 0.3 * calc.cos(th))
    P-proj(r * calc.cos(th), r * calc.sin(th), -r / t)
  }), lb, curb)
  // 抛物线：X = d - zt，Y² = 2ztd - d²，Z = -z（d = 110，顶点 z = d/2t）
  P-run(p, P-smp(s => {
    let z = 110 / 1.4 + s * s
    let sg = if s < 0 { -1 } else { 1 }
    let yy = sg * calc.sqrt(calc.max(0, 2 * z * t * 110 - 12100))
    P-proj(110 - z * t, yy, -z)
  }, -calc.sqrt(160 - 110 / 1.4), calc.sqrt(160 - 110 / 1.4), n: 80), lb, curb)
  // 双曲线两支：w² + d1² = (Zt)²
  for sgn in (1, -1) {
    let H = if sgn > 0 { H1 } else { H2 }
    let wm = calc.min(110, calc.sqrt(calc.pow(H * t, 2) - d1 * d1))
    P-run(p, P-smp(w => {
      let z = sgn * calc.sqrt(w * w + d1 * d1) / t
      P-proj(..P3(w, z))
    }, -wm, wm), lb, curb)
  }
})

// 习题 4·13~4·18 第 2 题（p.284）
#let fig-P-q2(width: 215 * P-k) = px-canvas(215, 240, origin: (275, 460), width: width, (p, u) => {
  import cetz.draw: *
  P-axes(p, 375, 307, 285, 478, 235, 455)
  P-pl(p, P-smp(x => (x, 307 + 105 * calc.pow((x - 375) / 52, 2)), 323, 427))
  line(p(323, 412), p(427, 412), stroke: dsh)
  P-t(p, (367, 297), $O$)
  P-t(p, (303, 425), $(-1, y)$)
  P-t(p, (425, 425), $(1, y)$)
})
// 第 3 题 (a)(b)(c)
#let fig-P-q3a(width: 200 * P-k) = px-canvas(200, 190, origin: (90, 790), width: width, (p, u) => {
  import cetz.draw: *
  P-axes(p, 165, 732, 95, 270, 615, 772)
  P-pl(p, P-smp(x => (x, 647 + 85 * calc.pow((x - 165) / 56, 2)), 109, 221))
  P-t(p, (186, 637), $(0, 12)$)
  P-t(p, (104, 745), $(-8, 0)$)
  P-t(p, (159, 745), $O$)
  P-t(p, (222, 745), $(8, 0)$)
  P-t(p, (165, 782), [(_a_)])
})
#let fig-P-q3b(width: 190 * P-k) = px-canvas(190, 190, origin: (300, 790), width: width, (p, u) => {
  import cetz.draw: *
  P-axes(p, 380, 645, 305, 468, 615, 772)
  P-pl(p, P-smp(x => (x, 645 + 87 * calc.pow((x - 380) / 58, 2)), 322, 438))
  P-t(p, (372, 636), $O$)
  P-t(p, (333, 745), $(-8, -12)$)
  P-t(p, (432, 745), $(8, -12)$)
  P-t(p, (379, 782), [(_b_)])
})
#let fig-P-q3c(width: 175 * P-k) = px-canvas(175, 190, origin: (488, 790), width: width, (p, u) => {
  import cetz.draw: *
  P-axes(p, 498, 732, 490, 650, 615, 772)
  P-pl(p, P-smp(x => (x, 647 + 85 * calc.pow((x - 556) / 57.5, 2)), 498, 613))
  line(p(556, 647), p(556, 732), stroke: dsh)
  P-t(p, (562, 637), $(8, 12)$)
  // 扫描不清（像 C），按此处为坐标原点（另两幅同位置均印 O）判读为 O
  content(p(491, 743), tt[$O$])
  P-t(p, (615, 745), $(16, 0)$)
  P-t(p, (557, 782), [(_c_)])
})
// 第 4 题：抛物线形拱桥
#let fig-P-q4(width: 265 * P-k) = px-canvas(265, 155, origin: (243, 1050), width: width, (p, u) => {
  import cetz.draw: *
  let crown = P-smp(x => (x, 898 + 15 * calc.pow((x - 362) / 125, 2)), 246, 506)
  P-bridge(p, 245, 505, 915, 1000, crown, 7, 22, 370, 930, 92, 1045, 9, 1006, 1042, 6)
  // 水线以下：两侧岸、水线、底线
  line(p(245, 1000), p(505, 1000), stroke: lw)
  line(p(245, 1045), p(505, 1045), stroke: lb)
  line(p(265, 1000), p(265, 1045), stroke: lt)
  line(p(495, 1000), p(495, 1045), stroke: lt)
  // 尺寸
  line(p(370, 937), p(370, 1000), stroke: lt, mark: arw2)
  line(p(370, 1000), p(370, 1035), stroke: lt, mark: arw2)
  P-t(p, (388, 968), [2 米])
  P-t(p, (340, 991), [$l = 4$ 米])
  content(p(388, 1020), box(fill: white, inset: 1pt, tt[1 米]))
})
