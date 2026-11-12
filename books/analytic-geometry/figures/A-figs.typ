// 解析几何 第 1 章 A 段：图 1·1–图 1·15 及练习小图（原书 p.1–13）。
// 读坐标时的页面渲染 200 dpi（页宽 1024 像素）；原图页宽 13 cm，k = 0.014 cm/像素 使图约为原图的 1.1 倍。
// 图 1·1–1·15 都是数轴/直线，位置按扫描量得，刻度按单位长度均匀排。
#import "/common/geo.typ": *
#let k = 0.014cm

// 数轴：x0..x1 在高度 y；arrow 为右端箭头
#let A-ax(p, x0, x1, y, arrow: true) = {
  import cetz.draw: *
  if arrow {
    line(p(x0, y), p(x1, y), stroke: 1pt, mark: (end: "stealth", fill: black, scale: 0.5))
  } else {
    line(p(x0, y), p(x1, y), stroke: 1pt)
  }
}
// 向上的刻度线
#let A-tk(p, x, y, h: 5) = {
  import cetz.draw: *
  line(p(x, y), p(x, y - h), stroke: 0.7pt)
}
// 点：hollow 为空心
#let A-pt(p, x, y, hollow: false) = {
  import cetz.draw: *
  if hollow {
    circle(p(x, y), radius: 2.6, fill: white, stroke: 0.8pt)
  } else {
    circle(p(x, y), radius: 2.6, fill: black, stroke: none)
  }
}
// 在 o + u*i 处依次画刻度（i 取 lo..hi，跳过 skip 中的整数）
#let A-units(p, y, o, u, lo, hi, skip: ()) = {
  for i in range(lo, hi + 1) {
    if i not in skip { A-tk(p, o + u * i, y) }
  }
}
// 文字标注（中心）
#let A-t(p, x, y, body) = lbl(p, (x, y), body, dir: "c", d: 0)

// 图 1·1（p.1）：直线 BA
#let fig-A-1-1(width: 300 * k) = px-canvas(300, 55, origin: (170, 1320), width: width, (p, u) => {
  A-ax(p, 181, 456, 1346, arrow: false)
  A-tk(p, 240, 1346)
  A-tk(p, 398, 1346)
  A-t(p, 240, 1362, $B$)
  A-t(p, 398, 1362, $A$)
})

// 图 1·2（p.1）：(a) 由西到东 (b) 由东到西（原图两线的箭头都画在线的中部）
// 原书作：(a)(b) 两线中部的小箭头形状相同、朝向一致（放大看 (a) 像指向左），与正文“由西到东（图 a）与由东到西（图 b）”不合；
// 数字版按正文画：(a) 指向右（东），(b) 指向左（西）。
#let fig-A-1-2(width: 310 * k) = px-canvas(310, 160, origin: (540, 1240), width: width, (p, u) => {
  import cetz.draw: *
  A-ax(p, 550, 832, 1257, arrow: false)
  line(p(676, 1257), p(690, 1257), stroke: 1pt, mark: (end: "stealth", fill: black, scale: 0.5))
  A-tk(p, 611, 1257)
  A-tk(p, 770, 1257)
  A-t(p, 611, 1272, $B$)
  A-t(p, 770, 1272, $A$)
  A-t(p, 690, 1293, $(a)$)
  A-ax(p, 550, 837, 1347, arrow: false)
  line(p(706, 1347), p(692, 1347), stroke: 1pt, mark: (end: "stealth", fill: black, scale: 0.5))
  A-tk(p, 613, 1347)
  A-tk(p, 772, 1347)
  A-t(p, 613, 1362, $B$)
  A-t(p, 772, 1362, $A$)
  A-t(p, 695, 1380, $(b)$)
})

// 图 1·3（p.2）：用箭头表示有向直线的正方向
#let fig-A-1-3(width: 330 * k) = px-canvas(330, 190, origin: (130, 790), width: width, (p, u) => {
  A-ax(p, 142, 439, 834)
  A-tk(p, 206, 834)
  A-tk(p, 367, 834)
  A-t(p, 206, 849, $B$)
  A-t(p, 367, 849, $A$)
  A-t(p, 290, 870, $(a)$)
  A-ax(p, 140, 437, 925)
  A-t(p, 449, 929, $l$)
  A-t(p, 290, 957, $(b)$)
})

// 图 1·4（p.3）：有向线段，起点 B，终点 A
#let fig-A-1-4(width: 250 * k) = px-canvas(250, 160, origin: (640, 360), width: width, (p, u) => {
  import cetz.draw: *
  line(p(655, 487), p(868, 372), stroke: 1pt, mark: (end: "stealth", fill: black, scale: 0.5))
  line(p(651, 480), p(659, 494), stroke: 0.7pt)
  A-t(p, 660, 507, $B$)
  A-t(p, 880, 385, $A$)
})

// 图 1·5（p.4）：轴 l，上方为单位长度
#let fig-A-1-5(width: 360 * k) = px-canvas(360, 140, origin: (130, 450), width: width, (p, u) => {
  import cetz.draw: *
  line(p(275, 464), p(307, 464), stroke: 1pt)
  line(p(275, 458), p(275, 470), stroke: 1pt)
  line(p(307, 458), p(307, 470), stroke: 1pt)
  A-t(p, 291, 478, $1$)
  A-ax(p, 140, 465, 556)
  A-t(p, 476, 560, $l$)
  A-units(p, 556, 205, 31.7, 0, 6)
  A-t(p, 205, 572, $B$)
  A-t(p, 395, 572, $A$)
})

// 图 1·6（p.4）：轴 l，A C B D（每小格一个单位，A=293, C=389, B=517, D=677）
#let fig-A-1-6(width: 560 * k) = px-canvas(560, 55, origin: (225, 1290), width: width, (p, u) => {
  A-ax(p, 235, 768, 1314)
  A-t(p, 779, 1318, $l$)
  A-units(p, 1314, 293, 32, -1, 14, skip: (0, 3, 7, 12))
  for x in (293, 389, 517, 677) { A-pt(p, x, 1314) }
  A-t(p, 293, 1330, $A$)
  A-t(p, 389, 1330, $C$)
  A-t(p, 517, 1330, $B$)
  A-t(p, 677, 1330, $D$)
})

// 练习第 2 题插图（p.6）：A B C 三点
#let fig-A-p6-q2(width: 380 * k) = px-canvas(380, 110, origin: (110, 520), width: width, (p, u) => {
  import cetz.draw: *
  line(p(272, 535), p(300, 535), stroke: 1pt)
  line(p(272, 530), p(272, 540), stroke: 1pt)
  line(p(300, 530), p(300, 540), stroke: 1pt)
  A-t(p, 286, 548, $1$)
  A-ax(p, 125, 481, 609)
  A-units(p, 609, 179, 27.7, 0, 10, skip: (0, 3, 8))
  for x in (179, 262, 397) { A-pt(p, x, 609) }
  A-t(p, 179, 625, $A$)
  A-t(p, 262, 625, $B$)
  A-t(p, 397, 625, $C$)
})

// 图 1·7（p.7）：轴 l，原点 O、点 P
#let fig-A-1-7(width: 380 * k) = px-canvas(380, 50, origin: (120, 285), width: width, (p, u) => {
  A-ax(p, 129, 475, 307)
  A-t(p, 488, 313, $l$)
  A-tk(p, 222, 307)
  A-pt(p, 191, 307)
  A-pt(p, 381, 307)
  A-t(p, 191, 322, $O$)
  A-t(p, 222, 322, $1$)
  A-t(p, 381, 322, $P$)
})

// 图 1·8（p.7）：P_2(-3)，O，P_1(4)
#let fig-A-1-8(width: 400 * k) = px-canvas(400, 55, origin: (520, 285), width: width, (p, u) => {
  A-ax(p, 532, 905, 307)
  A-units(p, 307, 683, 31.7, -2, 3, skip: (0,))
  for x in (589, 683, 811) { A-pt(p, x, 307) }
  A-t(p, 612, 326, $P_2(-3)$)
  A-t(p, 683, 326, $O$)
  A-t(p, 827, 326, $P_1(4)$)
})

// 图 1·9（p.7）：数轴，C O A B（O 在 467，单位 31）
#let fig-A-1-9(width: 470 * k) = px-canvas(470, 60, origin: (270, 1285), width: width, (p, u) => {
  A-ax(p, 280, 720, 1312)
  A-units(p, 1312, 467, 31, -4, 8, skip: (-4, 0, 2, 5))
  for x in (343, 467, 529, 621) { A-pt(p, x, 1312) }
  A-t(p, 343, 1329, $C$)
  A-t(p, 467, 1329, $O$)
  A-t(p, 529, 1329, $A$)
  A-t(p, 621, 1329, $B$)
})

// 图 1·10（p.8）：数轴上的 A_1 … A_4（O 在 489，单位 39）
#let fig-A-1-10(width: 460 * k) = px-canvas(460, 85, origin: (280, 695), width: width, (p, u) => {
  A-ax(p, 290, 720, 741)
  A-t(p, 731, 745, $x$)
  A-units(p, 741, 489, 39, -4, 3, skip: (0,))
  for (n, x) in ((-4, 333), (-3, 372), (-2, 411), (-1, 450), (0, 489), (1, 528), (2, 567), (3, 606)) {
    A-t(p, x, 761, $#n$)
  }
  A-pt(p, 489, 741)
  A-pt(p, 353, 741, hollow: true)
  A-pt(p, 423, 741, hollow: true)
  A-pt(p, 540, 741, hollow: true)
  A-pt(p, 593, 741)
  A-t(p, 353, 724, $A_1$)
  A-t(p, 423, 724, $A_4$)
  A-t(p, 540, 724, $A_3$)
  A-t(p, 593, 724, $A_2$)
})

// 练习第 5 题插图（p.9）：O 在 196，单位 28
#let fig-A-p9-q5(width: 370 * k) = px-canvas(370, 50, origin: (130, 285), width: width, (p, u) => {
  A-ax(p, 145, 475, 305)
  A-t(p, 487, 308, $x$)
  A-tk(p, 224, 305)
  A-units(p, 305, 196, 28, 3, 6)
  for x in (196, 252, 388) { A-pt(p, x, 305) }
  A-t(p, 196, 321, $O$)
  A-t(p, 224, 321, $1$)
  A-t(p, 252, 321, $A$)
  A-t(p, 388, 321, $B$)
})

// 练习第 6 题插图（p.9）：P O Q（O 在 649，单位 28）
#let fig-A-p9-q6(width: 380 * k) = px-canvas(380, 50, origin: (500, 285), width: width, (p, u) => {
  A-ax(p, 512, 870, 310)
  A-units(p, 310, 649, 28, -2, 4, skip: (0, 1))
  A-tk(p, 678, 310)
  for x in (568, 649, 787) { A-pt(p, x, 310) }
  A-t(p, 568, 326, $P$)
  A-t(p, 649, 326, $O$)
  A-t(p, 678, 326, $1$)
  A-t(p, 787, 326, $Q$)
})

// 图 1·11（p.9）：(a) 轴上 A(x_1)、B(x_2)；(b) 六种位置
#let fig-A-1-11(width: 780 * k) = px-canvas(780, 250, origin: (120, 890), width: width, (p, u) => {
  A-ax(p, 137, 477, 1011)
  A-t(p, 498, 1014, $x$)
  A-units(p, 1011, 181, 27.3, 1, 9, skip: (3, 8))
  for x in (181, 262, 399) { A-pt(p, x, 1011) }
  A-t(p, 181, 1027, $O$)
  A-t(p, 277, 1027, $A(x_1)$)
  A-t(p, 420, 1027, $B(x_2)$)
  A-t(p, 327, 1123, $(a)$)
  let rows = (917, 990, 1063)
  let left = (($O$, $A$, $B$), ($A$, $B$, $O$), ($A$, $O$, $B$))
  let right = (($O$, $B$, $A$), ($B$, $A$, $O$), ($B$, $O$, $A$))
  for (i, y) in rows.enumerate() {
    A-ax(p, 523, 667, y)
    A-t(p, 678, y + 3, $x$)
    for (j, x) in (551, 580, 607).enumerate() {
      A-pt(p, x, y)
      A-t(p, x, y + 15, left.at(i).at(j))
    }
    A-ax(p, 717, 850, y)
    A-t(p, 868, y + 3, $x$)
    for (j, x) in (743, 771, 800).enumerate() {
      A-pt(p, x, y)
      A-t(p, x, y + 15, right.at(i).at(j))
    }
  }
  A-t(p, 710, 1123, $(b)$)
})

// 图 1·12（p.10）：B O A（O 在 522，单位 28）
#let fig-A-1-12(width: 360 * k) = px-canvas(360, 50, origin: (330, 950), width: width, (p, u) => {
  A-ax(p, 337, 670, 975)
  A-units(p, 975, 522, 28, -6, 4, skip: (-5, 0, 3))
  for x in (382, 522, 606) { A-pt(p, x, 975) }
  A-t(p, 382, 991, $B$)
  A-t(p, 522, 991, $O$)
  A-t(p, 606, 991, $A$)
})

// 图 1·13（p.11）：P(-5)，O，Q(6)，R(9)（O 在 425，单位 27.5）
#let fig-A-1-13(width: 540 * k) = px-canvas(540, 60, origin: (230, 1115), width: width, (p, u) => {
  A-ax(p, 240, 760, 1142)
  A-t(p, 771, 1146, $x$)
  A-units(p, 1142, 425, 27.5, -6, 12, skip: (-5, 0, 6, 9))
  for x in (287, 425, 590, 672) { A-pt(p, x, 1142) }
  A-t(p, 300, 1160, $P(-5)$)
  A-t(p, 425, 1160, $O$)
  A-t(p, 452, 1160, $1$)
  A-t(p, 592, 1160, $Q(6)$)
  A-t(p, 680, 1160, $R(9)$)
})

// 图 1·14（p.12）：B O A（O 在 490，单位 29）
#let fig-A-1-14(width: 380 * k) = px-canvas(380, 45, origin: (330, 240), width: width, (p, u) => {
  A-ax(p, 350, 680, 262)
  A-t(p, 700, 265, $x$)
  A-units(p, 262, 490, 29, -3, 4, skip: (-3, 0, 4))
  for x in (403, 490, 606) { A-pt(p, x, 262) }
  A-t(p, 403, 278, $B$)
  A-t(p, 490, 278, $O$)
  A-t(p, 519, 278, $1$)
  A-t(p, 606, 278, $A$)
})

// 图 1·15（p.13）：B(b) A(a) O C(c)
#let fig-A-1-15(width: 330 * k) = px-canvas(330, 50, origin: (390, 205), width: width, (p, u) => {
  A-ax(p, 395, 690, 230)
  A-t(p, 703, 230, $x$)
  for x in (449, 507, 559, 617) { A-pt(p, x, 230) }
  A-t(p, 460, 244, $B(b)$)
  A-t(p, 515, 244, $A(a)$)
  A-t(p, 560, 244, $O$)
  A-t(p, 628, 244, $C(c)$)
})
