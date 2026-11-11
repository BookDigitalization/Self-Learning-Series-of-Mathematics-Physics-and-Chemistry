// 段 c1（三角 第 1 章，原书 p.1–40）插图：图 1·1–图 1·23 及复习题一第 6、17、18 题插图。
// 坐标取自 render-pages.py --dpi 200 --grid 100 的页面图（页宽约 1271 像素），网格数字为整页真实像素。
// 写实插画（图 1·17 帆船、图 1·19 山岩与船、图 1·18 的树）用 crop-figure.py 裁剪二值化 PNG，
// 字母标注用 --blank 涂掉后以真文字补上，主要线条再用 CeTZ 描一遍（补上涂白处的缺口）。
#import "/common/geo.typ": *

#let k = 0.012cm   // 1 像素 ≈ 0.012 cm

// 圆弧（按页面像素坐标）：圆心 c、半径 r，数学角 a0 → a1（度，逆时针为正）
#let c1-arc(p, c, r, a0, a1, n: 40, ..style) = {
  import cetz.draw: *
  let pts = range(n + 1).map(i => {
    let t = (a0 + (a1 - a0) * i / n) * 1deg
    p(c.at(0) + r * calc.cos(t), c.at(1) - r * calc.sin(t))
  })
  line(..pts, ..style)
}
// 标单位长的尺寸记号：x0、x1 两处短竖线，外侧箭头指向竖线，中间写 l（图 1·6、图 1·7）
#let c1-unit(p, x0, x1, y, lab: $l$) = {
  import cetz.draw: *
  line(p(x0, y - 8), p(x0, y + 8), stroke: lt)
  line(p(x1, y - 8), p(x1, y + 8), stroke: lt)
  line(p(x0 - 24, y), p(x0, y), stroke: lt, mark: arw)
  line(p(x1 + 24, y), p(x1, y), stroke: lt, mark: arw)
  lbl(p, ((x0 + x1) / 2, y), lab, dir: "c", d: 0)
}
// 两端带短竖线、两头箭头、中间断开写字的尺寸线（第 6、17 题）
#let c1-dim(p, x0, x1, y, lab, gapw: 50) = {
  import cetz.draw: *
  line(p(x0, y - 8), p(x0, y + 8), stroke: lt)
  line(p(x1, y - 8), p(x1, y + 8), stroke: lt)
  dimh(p, x0, x1, y, lab: lab, gapw: gapw)
}

// 图 1·1（p.1）：以 A 为端点的射线 AD、AE，AD 上的点向 AE 作垂线
#let fig-c1-1-1(width: 420 * k) = px-canvas(420, 380, origin: (670, 1070), width: width, (p, u) => {
  import cetz.draw: *
  let A = (700, 1379)
  let D = (1013, 1089)
  let E = (1057, 1379)
  let s = (D.at(1) - A.at(1)) / (D.at(0) - A.at(0))
  seg(p, A, D)
  seg(p, A, E)
  let xs = (878, 918, 968)
  let bn = ($B$, $B'$, $B''$)
  let cn = ($C$, $C'$, $C''$)
  for i in range(3) {
    let x = xs.at(i)
    let b = (x, A.at(1) + s * (x - A.at(0)))
    seg(p, b, (x, A.at(1)))
    lbl(p, b, bn.at(i), dir: "nw", d: 13)
    lbl(p, (x, A.at(1)), cn.at(i), dir: "s", d: 14)
  }
  lbl(p, A, $A$, dir: "s", d: 14)
  lbl(p, E, $E$, dir: "s", d: 14)
  lbl(p, D, $D$, dir: "ne", d: 12)
})

// 图 1·2（p.3）：直角三角形 ABC，边 a、b、c
#let fig-c1-1-2(width: 380 * k) = px-canvas(380, 270, origin: (680, 835), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((703, 1075), (1030, 857), (1030, 1075))
  poly(p, (A, B, C), close: true)
  lbl(p, A, $A$, dir: "s", d: 14)
  lbl(p, B, $B$, dir: "n", d: 12)
  lbl(p, C, $C$, dir: "s", d: 14)
  lbl(p, (862, 960), $c$, dir: "nw", d: 10)
  lbl(p, (1030, 975), $a$, dir: "e", d: 12)
  lbl(p, (870, 1075), $b$, dir: "s", d: 14)
})

// 图 1·3（p.4）：35° 角的直角三角形
#let fig-c1-1-3(width: 300 * k) = px-canvas(300, 240, origin: (150, 1095), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((172, 1301), (428, 1118), (428, 1301))
  poly(p, (A, B, C), close: true)
  anglearc(p, A, C, B, 45)
  lbl(p, (244, 1288), $35°$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "s", d: 14)
  lbl(p, B, $B$, dir: "n", d: 12)
  lbl(p, C, $C$, dir: "s", d: 14)
  lbl(p, (300, 1210), $c$, dir: "nw", d: 10)
  lbl(p, (428, 1213), $a$, dir: "e", d: 12)
  lbl(p, (305, 1301), $b$, dir: "s", d: 14)
})

// 图 1·4（p.7）：以 B 为圆心、5 厘米为半径作弧交 CD 于 A
#let fig-c1-1-4(width: 360 * k) = px-canvas(360, 400, origin: (710, 305), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((807, 640), (1045, 327), (1045, 640), (730, 640))
  seg(p, D, C)
  seg(p, C, B)
  seg(p, B, A)
  c1-arc(p, B, 393.2, 218.5, 244, stroke: dsh)
  lbl(p, A, $A$, dir: "s", d: 14)
  lbl(p, B, $B$, dir: "n", d: 12)
  lbl(p, C, $C$, dir: "s", d: 14)
  lbl(p, D, $D$, dir: "s", d: 14)
})

// 图 1·5（p.7）：AC = 79 毫米，以 A 为圆心、100 毫米为半径作弧交 CD 于 B
#let fig-c1-1-5(width: 400 * k) = px-canvas(400, 375, origin: (245, 1090), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((267, 1443), (578, 1212), (578, 1443), (578, 1110))
  seg(p, A, C)
  seg(p, C, D)
  seg(p, A, B)
  c1-arc(p, A, 387.4, 24, 49.5, stroke: dsh)
  lbl(p, A, $A$, dir: "s", d: 14)
  lbl(p, B, $B$, dir: "e", d: 14)
  lbl(p, C, $C$, dir: "s", d: 14)
  lbl(p, D, $D$, dir: "e", d: 12)
})

// 图 1·6（p.7）：tan A = 7/3，CB = 7l，CA = 3l
#let fig-c1-1-6(width: 220 * k) = px-canvas(220, 395, origin: (740, 1090), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((775, 1446), (921, 1112), (921, 1446))
  poly(p, (A, B, C), close: true)
  let lv = (C.at(1) - B.at(1)) / 7
  let lh = (C.at(0) - A.at(0)) / 3
  for i in range(1, 7) { line(p(C.at(0) - 5, C.at(1) - lv * i), p(C.at(0) + 5, C.at(1) - lv * i), stroke: lw) }
  for i in range(1, 3) { line(p(A.at(0) + lh * i, C.at(1) - 5), p(A.at(0) + lh * i, C.at(1) + 5), stroke: lw) }
  c1-unit(p, A.at(0), A.at(0) + lh, 1466)
  lbl(p, A, $A$, dir: "w", d: 12)
  lbl(p, B, $B$, dir: "n", d: 12)
  lbl(p, C, $C$, dir: "s", d: 14)
})

// 图 1·7（p.8）：cot A = 7/5，AC = 7l，CB = 5l
#let fig-c1-1-7(width: 380 * k) = px-canvas(380, 300, origin: (165, 560), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((193, 818), (530, 578), (530, 818))
  poly(p, (A, B, C), close: true)
  let lv = (C.at(1) - B.at(1)) / 5
  let lh = (C.at(0) - A.at(0)) / 7
  for i in range(1, 5) { line(p(C.at(0) - 5, C.at(1) - lv * i), p(C.at(0) + 5, C.at(1) - lv * i), stroke: lw) }
  for i in range(1, 7) { line(p(A.at(0) + lh * i, C.at(1) - 5), p(A.at(0) + lh * i, C.at(1) + 5), stroke: lw) }
  c1-unit(p, A.at(0), A.at(0) + lh, 838)
  lbl(p, A, $A$, dir: "nw", d: 12)
  lbl(p, B, $B$, dir: "n", d: 12)
  lbl(p, C, $C$, dir: "s", d: 14)
})

// 图 1·8（p.9）：直角三角形 ABC，∠A 带角弧
#let fig-c1-1-8(width: 360 * k) = px-canvas(360, 265, origin: (670, 1185), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((687, 1425), (1011, 1201), (1011, 1425))
  poly(p, (A, B, C), close: true)
  anglearc(p, A, C, B, 33)
  lbl(p, A, $A$, dir: "s", d: 14)
  lbl(p, B, $B$, dir: "n", d: 12)
  lbl(p, C, $C$, dir: "s", d: 14)
  lbl(p, (850, 1313), $c$, dir: "nw", d: 10)
  lbl(p, (1011, 1313), $a$, dir: "e", d: 12)
  lbl(p, (849, 1425), $b$, dir: "s", d: 14)
})

// 图 1·9（p.12）：30° 角的直角三角形
#let fig-c1-1-9(width: 320 * k) = px-canvas(320, 220, origin: (165, 425), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((187, 598), (463, 442), (463, 598))
  poly(p, (A, B, C), close: true)
  anglearc(p, A, C, B, 50)
  lbl(p, (262, 585), $30°$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "s", d: 14)
  lbl(p, B, $B$, dir: "n", d: 12)
  lbl(p, C, $C$, dir: "s", d: 14)
  lbl(p, (300, 527), $c = 2a$, dir: "c", d: 0)
  lbl(p, (463, 520), $a$, dir: "e", d: 12)
  lbl(p, (330, 598), $b = sqrt(3) a$, dir: "s", d: 16)
})

// 图 1·10（p.13）：45° 角的直角三角形
#let fig-c1-1-10(width: 270 * k) = px-canvas(270, 300, origin: (755, 260), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((777, 517), (1017, 277), (1017, 517))
  poly(p, (A, B, C), close: true)
  anglearc(p, A, C, B, 45)
  lbl(p, (845, 497), $45°$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "s", d: 14)
  lbl(p, B, $B$, dir: "n", d: 12)
  lbl(p, C, $C$, dir: "s", d: 14)
  lbl(p, (850, 380), $c = sqrt(2) a$, dir: "c", d: 0)
  lbl(p, (1017, 397), $a$, dir: "e", d: 12)
  lbl(p, (897, 517), $b = a$, dir: "s", d: 15)
})

// 图 1·11（p.14）：记 30°、45°、60° 角三角函数值用的三个三角形
#let fig-c1-1-11(width: 720 * k) = px-canvas(720, 250, origin: (235, 1105), width: width, (p, u) => {
  import cetz.draw: *
  let y = 1327
  // 30°
  let (A, B, C) = ((251, y), (449, y - 114), (449, y))
  poly(p, (A, B, C), close: true)
  anglearc(p, A, C, B, 48)
  lbl(p, (322, 1314), $30°$, dir: "c", d: 0)
  lbl(p, (350, 1270), $2$, dir: "nw", d: 6)
  lbl(p, (449, 1270), $1$, dir: "e", d: 10)
  lbl(p, (350, y), $sqrt(3)$, dir: "s", d: 15)
  // 45°
  let (A, B, C) = ((530, y), (728, y - 198), (728, y))
  poly(p, (A, B, C), close: true)
  anglearc(p, A, C, B, 42)
  lbl(p, (590, 1305), $45°$, dir: "c", d: 0)
  lbl(p, (625, 1225), $sqrt(2)$, dir: "nw", d: 12)
  lbl(p, (728, 1225), $1$, dir: "e", d: 10)
  lbl(p, (629, y), $1$, dir: "s", d: 14)
  // 60°
  let (A, B, C) = ((801, y), (918, y - 203), (918, y))
  poly(p, (A, B, C), close: true)
  anglearc(p, A, C, B, 42)
  lbl(p, (857, 1302), $60°$, dir: "c", d: 0)
  lbl(p, (858, 1225), $2$, dir: "nw", d: 10)
  lbl(p, (918, 1230), $sqrt(3)$, dir: "e", d: 18)
  lbl(p, (860, y), $1$, dir: "s", d: 14)
})

// 图 1·12（p.20）：射线每旋转 10° 所成角的终边，截取相等的线段 AB_1、AB_2、…
// 原图 70° 处的点未标字母（照原图）；下标在扫描里模糊，按位置顺序读作 B_1–B_8、C_1–C_8。
#let fig-c1-1-12(width: 370 * k) = px-canvas(370, 370, origin: (180, 255), width: width, (p, u) => {
  import cetz.draw: *
  let A = (205, 598)
  let r = 313
  let pt(d) = (A.at(0) + r * calc.cos(d * 1deg), A.at(1) - r * calc.sin(d * 1deg))
  // 圆弧（虚线）
  c1-arc(p, A, r, 0, 90, n: 60, stroke: (paint: black, thickness: 1.1pt, dash: "dashed"))
  seg(p, A, (A.at(0) + r + 4, A.at(1)))
  seg(p, A, pt(90))
  for i in range(1, 9) {
    let b = pt(10 * i)
    line(p(..A), p(..b), stroke: lt)
    seg(p, b, (b.at(0), A.at(1)))
    lbl(p, (b.at(0), A.at(1)), $C_#i$, dir: "s", d: 14)
    if i != 7 { lbl(p, b, $B_#i$, dir: "ne", d: 14) }
  }
  lbl(p, A, $A$, dir: "s", d: 14)
})

// 图 1·13（p.29）：例 1，c = 287.4，B = 42°6′
#let fig-c1-1-13(width: 330 * k) = px-canvas(330, 320, origin: (770, 1165), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((801, 1453), (1051, 1180), (1051, 1453))
  poly(p, (A, B, C), close: true)
  anglearc(p, B, A, C, 34)
  lbl(p, (1012, 1240), $42°6'$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "s", d: 14)
  lbl(p, B, $B$, dir: "n", d: 12)
  lbl(p, C, $C$, dir: "s", d: 14)
  lbl(p, (870, 1310), $c = 287.4$, dir: "c", d: 0)
  lbl(p, (1051, 1340), $a$, dir: "e", d: 12)
  lbl(p, (937, 1453), $b$, dir: "s", d: 14)
})

// 图 1·14（p.30）：仓库屋顶，倾斜度 30°，椽长 AB = 7.3 米
#let fig-c1-1-14(width: 600 * k) = px-canvas(600, 210, origin: (285, 1035), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, A2) = ((307, 1210), (583, 1053), (583, 1210), (859, 1210))
  poly(p, (A, B, A2), close: true)
  seg(p, B, C)
  anglearc(p, A, C, B, 45)
  lbl(p, (374, 1196), $30°$, dir: "c", d: 0)
  lbl(p, (447, 1110), $7.3$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "s", d: 14)
  lbl(p, B, $B$, dir: "n", d: 12)
  lbl(p, C, $C$, dir: "s", d: 14)
  lbl(p, A2, $A'$, dir: "s", d: 14)
})

// 图 1·15（p.31）：例 3，a = 15.2，A = 13°58′
#let fig-c1-1-15(width: 640 * k) = px-canvas(640, 180, origin: (345, 690), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((355, 838), (855, 703), (855, 838))
  poly(p, (A, B, C), close: true)
  anglearc(p, A, C, B, 70)
  anglearc(p, B, A, C, 22)
  lbl(p, (467, 825), $13°58'$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "s", d: 14)
  lbl(p, B, $B$, dir: "n", d: 12)
  lbl(p, C, $C$, dir: "s", d: 14)
  lbl(p, (604, 770), $c$, dir: "n", d: 8)
  lbl(p, (855, 780), $a = 15.2$, dir: "e", d: 34)
  lbl(p, (632, 838), $b$, dir: "s", d: 16)
})

// 图 1·16（p.31）：例 4，b = 79.79，A = 66°36′
#let fig-c1-1-16(width: 230 * k) = px-canvas(230, 410, origin: (855, 1085), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((880, 1463), (1037, 1103), (1037, 1463))
  poly(p, (A, B, C), close: true)
  anglearc(p, A, C, B, 26)
  lbl(p, (935, 1440), $66°36'$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "sw", d: 12)
  lbl(p, B, $B$, dir: "n", d: 12)
  lbl(p, C, $C$, dir: "s", d: 14)
  lbl(p, (958, 1463), $b = 79.79$, dir: "s", d: 15)
})

// 图 1·17（p.32）：仰角与俯角。帆船为原扫描裁剪的二值化 PNG（p.32），字母、视线、水平线另画。
#let fig-c1-1-17(width: 425 * k) = px-canvas(425, 252, origin: (165, 548), width: width, (p, u) => {
  import cetz.draw: *
  pimg(p, u, "/books/trigonometry/figures/c1-fig1-17.png", (165, 548, 590, 800))
  let (A, O, L, B) = ((309, 562), (538, 688), (190, 690), (350, 737))
  line(p(..A), p(..O), stroke: lb)
  line(p(..L), p(..O), stroke: lb)
  line(p(..O), p(..B), stroke: lw)
  anglearc(p, O, L, A, 52)
  anglearc(p, O, L, B, 70)
  lbl(p, A, $A$, dir: "w", d: 12)
  lbl(p, O, $O$, dir: "e", d: 12)
  lbl(p, L, $L$, dir: "w", d: 10)
  lbl(p, (322, 752), $B$, dir: "c", d: 0)
  lbl(p, (470, 670), $alpha$, dir: "c", d: 0)
  lbl(p, (446, 702), $beta$, dir: "c", d: 0)
})

// 图 1·18（p.32）：测树高。树为原扫描裁剪的二值化 PNG（p.32），其余 CeTZ 重绘。
#let fig-c1-1-18(width: 540 * k) = px-canvas(540, 200, origin: (460, 1125), width: width, (p, u) => {
  import cetz.draw: *
  pimg(p, u, "/books/trigonometry/figures/c1-tree1-18.png", (842, 1158, 975, 1277))
  let (A, B, C, D, E) = ((895, 1146), (529, 1285), (895, 1285), (529, 1302), (895, 1302))
  seg(p, B, A)
  seg(p, B, C)
  line(p(..A), p(..E), stroke: lb)
  line(p(..B), p(..D), stroke: 2.4pt)
  // 地面与剖面线
  line(p(470, 1302), p(990, 1302), stroke: lw)
  for x in range(474, 990, step: 9) { line(p(x, 1314), p(x + 9, 1303), stroke: lt) }
  lbl(p, B, $B$, dir: "nw", d: 13)
  lbl(p, D, $D$, dir: "s", d: 18)
  lbl(p, C, $C$, dir: "e", d: 12)
  lbl(p, E, $E$, dir: "s", d: 18)
  lbl(p, A, $A$, dir: "n", d: 12)
})

// 图 1·19（p.33）：从山岩上的点 A 观测船 B 的俯角 α。山岩、船、海面为原扫描裁剪的二值化 PNG（p.33）。
#let fig-c1-1-19(width: 825 * k) = px-canvas(825, 217, origin: (215, 548), width: width, (p, u) => {
  import cetz.draw: *
  pimg(p, u, "/books/trigonometry/figures/c1-fig1-19.png", (215, 548, 1040, 765))
  let (A, C, B) = ((272, 578), (272, 682), (898, 685))
  line(p(..A), p(436, 578), stroke: lw)
  line(p(..A), p(..B), stroke: lw)
  line(p(..A), p(..C), stroke: lw)
  line(p(..C), p(..B), stroke: lw)
  anglearc(p, A, (436, 578), B, 105)
  lbl(p, A, $A$, dir: "nw", d: 11)
  lbl(p, (392, 591), $alpha$, dir: "c", d: 0)
  lbl(p, C, $C$, dir: "sw", d: 12)
  lbl(p, B, $B$, dir: "s", d: 14)
})

// 习题 1·8(2) 第 6 题（p.34）插图：两个建筑物 AB、CD
#let fig-c1-q6(width: 340 * k) = px-canvas(340, 300, origin: (200, 225), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((225, 247), (225, 495), (520, 453), (520, 495))
  poly(p, (A, B, D, C))
  seg(p, A, C)
  seg(p, A, D)
  line(p(..A), p(400, 247), stroke: lw, mark: arw)
  anglearc(p, A, (400, 247), D, 40)
  anglearc(p, A, (400, 247), C, 100)
  lbl(p, (257, 260), $40°$, dir: "c", d: 0)
  lbl(p, (297, 268), $35°$, dir: "c", d: 0)
  c1-dim(p, 225, 520, 513, $72.6 "m"$, gapw: 70)
  lbl(p, A, $A$, dir: "nw", d: 11)
  lbl(p, B, $B$, dir: "w", d: 12)
  lbl(p, C, $C$, dir: "e", d: 12)
  lbl(p, D, $D$, dir: "e", d: 12)
})

// 图 1·20（p.34）：例 7，b = 35.47，c = 45.93
#let fig-c1-1-20(width: 310 * k) = px-canvas(310, 260, origin: (730, 755), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((747, 997), (1028, 773), (1028, 997))
  poly(p, (A, B, C), close: true)
  anglearc(p, A, C, B, 33)
  rtmark(p, C, A, B, s: 14)
  lbl(p, A, $A$, dir: "s", d: 14)
  lbl(p, B, $B$, dir: "n", d: 12)
  lbl(p, C, $C$, dir: "s", d: 14)
  lbl(p, (850, 868), $c = 45.93$, dir: "c", d: 0)
  lbl(p, (885, 997), $b = 35.47$, dir: "s", d: 15)
})

// 图 1·21（p.35）：例 8，木板 AB = 21 尺，CB = 10.3 尺
#let fig-c1-1-21(width: 360 * k) = px-canvas(360, 210, origin: (450, 210), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((465, 400), (757, 228), (757, 400))
  poly(p, (A, B, C), close: true)
  lbl(p, A, $A$, dir: "s", d: 14)
  lbl(p, B, $B$, dir: "n", d: 12)
  lbl(p, C, $C$, dir: "s", d: 14)
  lbl(p, (590, 300), $21$, dir: "nw", d: 8)
  lbl(p, (757, 315), $10.3$, dir: "e", d: 22)
})

// 图 1·22（p.35）：例 9，a = 104.0，b = 20.49
#let fig-c1-1-22(width: 200 * k) = px-canvas(200, 440, origin: (850, 1020), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((884, 1437), (981, 1039), (981, 1437))
  poly(p, (A, B, C), close: true)
  anglearc(p, A, C, B, 14)
  lbl(p, A, $A$, dir: "w", d: 12)
  lbl(p, B, $B$, dir: "n", d: 12)
  lbl(p, C, $C$, dir: "e", d: 12)
  lbl(p, (981, 1270), $a = 104$, dir: "e", d: 30)
  lbl(p, (932, 1437), $b = 20.49$, dir: "s", d: 14)
})

// 图 1·23（p.36）：本章提要中的直角三角形 ABC
#let fig-c1-1-23(width: 350 * k) = px-canvas(350, 280, origin: (175, 1185), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((190, 1445), (507, 1203), (507, 1445))
  poly(p, (A, B, C), close: true)
  rtmark(p, C, A, B, s: 18)
  lbl(p, A, $A$, dir: "s", d: 14)
  lbl(p, B, $B$, dir: "n", d: 12)
  lbl(p, C, $C$, dir: "s", d: 14)
  lbl(p, (343, 1320), $c$, dir: "nw", d: 8)
  lbl(p, (507, 1330), $a$, dir: "e", d: 10)
  lbl(p, (355, 1445), $b$, dir: "s", d: 14)
})

// 复习题一第 17 题插图（p.39）：塔高 PM = x
#let fig-c1-q17(width: 360 * k) = px-canvas(360, 370, origin: (265, 1075), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, M, P) = ((287, 1400), (413, 1400), (598, 1400), (598, 1095))
  poly(p, (A, M, P), close: true)
  seg(p, B, P)
  anglearc(p, A, M, P, 40)
  anglearc(p, B, M, P, 40)
  lbl(p, (343, 1385), $45°$, dir: "c", d: 0)
  lbl(p, (455, 1385), $60°$, dir: "c", d: 0)
  c1-dim(p, 287, 413, 1430, $100 "m"$, gapw: 56)
  lbl(p, A, $A$, dir: "s", d: 13)
  lbl(p, B, $B$, dir: "s", d: 13)
  lbl(p, M, $M$, dir: "s", d: 13)
  lbl(p, P, $P$, dir: "n", d: 12)
  lbl(p, (598, 1240), $x$, dir: "e", d: 10)
})

// 复习题一第 18 题插图（p.39）：峭壁 AB = 200 m，塔 CD = x
#let fig-c1-q18(width: 290 * k) = px-canvas(290, 380, origin: (745, 1070), width: width, (p, u) => {
  import cetz.draw: *
  let (E, A, C, D, B) = ((782, 1091), (971, 1091), (782, 1203), (782, 1420), (971, 1420))
  line(p(..E), p(..A), stroke: dsh)
  line(p(..E), p(..C), stroke: dsh)
  line(p(..C), p(..D), stroke: lb)
  poly(p, (D, B, A))
  seg(p, A, C)
  seg(p, A, D)
  anglearc(p, A, E, C, 52)
  anglearc(p, A, E, D, 72)
  lbl(p, (893, 1107), $30°$, dir: "c", d: 0)
  lbl(p, (918, 1133), $60°$, dir: "c", d: 0)
  lbl(p, E, $E$, dir: "n", d: 12)
  lbl(p, A, $A$, dir: "n", d: 12)
  lbl(p, C, $C$, dir: "w", d: 12)
  lbl(p, D, $D$, dir: "sw", d: 12)
  lbl(p, B, $B$, dir: "s", d: 14)
  lbl(p, (782, 1305), $x$, dir: "w", d: 12)
  lbl(p, (971, 1262), $200 "m"$, dir: "e", d: 28)
})
