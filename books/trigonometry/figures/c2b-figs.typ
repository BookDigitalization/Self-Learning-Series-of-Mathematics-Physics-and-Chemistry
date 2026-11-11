// 第 2 章后半（§2·8–§2·12）插图：图 2·25（原书 p.67）、图 2·26（p.78）；页面 200 dpi 坐标。
// 原图手绘，坐标轴略有倾斜；这里按几何关系重建：坐标轴画成水平、竖直，P 与 P1 按对称（图 2·25）或旋转 90°（图 2·26）算出。
#import "/common/geo.typ": *

#let k = 0.0118cm

// 一幅坐标小图：x 轴 (x0..x1, O 的纵坐标)，y 轴 (y0 在下、y1 在上，O 的横坐标)
#let c2b-axes(p, O, x0, x1, y0, y1, xl: none, yl: none) = {
  import cetz.draw: *
  line(p(x0, O.at(1)), p(x1, O.at(1)), stroke: lw, mark: arw)
  line(p(O.at(0), y0), p(O.at(0), y1), stroke: lw, mark: arw)
  if xl != none { content(p(..xl), tt($x$)) }
  if yl != none { content(p(..yl), tt($y$)) }
}
// O 出发、经过 Q 再延长到 t 倍处的射线（终边）
#let c2b-ray(p, O, Q, t) = {
  let E = (O.at(0) + (Q.at(0) - O.at(0)) * t, O.at(1) + (Q.at(1) - O.at(1)) * t)
  seg(p, O, E)
}
#let c2b-txt(p, pt, body) = {
  import cetz.draw: *
  content(p(..pt), tt(body))
}
#let c2b-lb(p, pt, body) = {
  import cetz.draw: *
  content(p(..pt), tt(body), anchor: "west")
}

// 图 2·25：α 与 −α 的终边关于 x 轴对称（四幅）
#let fig-c2b-2-25(width: 830 * k) = px-canvas(830, 950, origin: (245, 265), width: width, (p, u) => {
  import cetz.draw: *
  // 左上：α 在第一象限
  {
    let O = (305, 515)
    let P = (487, 393)
    let P1 = (487, 637)
    let M = (487, 515)
    c2b-axes(p, O, 255, 560, 675, 295, xl: (575, 515), yl: (305, 282))
    c2b-ray(p, O, P, 1.21)
    c2b-ray(p, O, P1, 1.21)
    seg(p, P, P1, stroke: lb)
    c2b-txt(p, (290, 528), $O$)
    c2b-txt(p, (473, 380), $P$)
    c2b-txt(p, (473, 652), $P_1$)
    c2b-lb(p, (494, 503), $M (M_1)$)
    c2b-txt(p, (410, 527), $x$)
    c2b-txt(p, (500, 453), $y$)
    c2b-txt(p, (507, 573), $-y$)
    c2b-txt(p, (405, 441), $r$)
    c2b-txt(p, (405, 590), $r$)
    c2b-txt(p, (470, 360), [$alpha$的终边])
    c2b-txt(p, (485, 685), [$-alpha$的终边])
  }
  // 右上：α 在第二象限
  {
    let O = (930, 515)
    let P = (752, 390)
    let P1 = (752, 640)
    let M = (752, 515)
    c2b-axes(p, O, 615, 1060, 680, 300, xl: (1070, 515), yl: (945, 290))
    c2b-ray(p, O, P, 1.2)
    c2b-ray(p, O, P1, 1.2)
    seg(p, P, P1, stroke: lb)
    c2b-txt(p, (946, 530), $O$)
    c2b-txt(p, (790, 373), $P$)
    c2b-txt(p, (770, 655), $P_1$)
    c2b-txt(p, (712, 503), $M (M_1)$)
    c2b-txt(p, (870, 527), $x$)
    c2b-txt(p, (765, 455), $y$)
    c2b-txt(p, (775, 570), $-y$)
    c2b-txt(p, (878, 437), $r$)
    c2b-txt(p, (878, 597), $r$)
    c2b-txt(p, (725, 342), [$alpha$的终边])
    c2b-txt(p, (725, 680), [$-alpha$的终边])
  }
  // 左下：α 在第三象限
  {
    let O = (543, 1036)
    let P = (362, 1154)
    let P1 = (362, 918)
    c2b-axes(p, O, 270, 660, 1195, 832, xl: (672, 1036), yl: (543, 818))
    c2b-ray(p, O, P, 1.2)
    c2b-ray(p, O, P1, 1.2)
    seg(p, P, P1, stroke: lb)
    c2b-txt(p, (556, 1049), $O$)
    c2b-txt(p, (373, 1170), $P$)
    c2b-txt(p, (375, 905), $P_1$)
    c2b-txt(p, (318, 1024), $M (M_1)$)
    c2b-txt(p, (444, 1049), $x$)
    c2b-txt(p, (374, 1093), $y$)
    c2b-txt(p, (382, 987), $-y$)
    c2b-txt(p, (448, 962), $r$)
    c2b-txt(p, (450, 1117), $r$)
    c2b-txt(p, (318, 878), [$-alpha$的终边])
    c2b-txt(p, (318, 1196), [$alpha$的终边])
  }
  // 右下：α 在第四象限
  {
    let O = (750, 1040)
    let P = (930, 1158)
    let P1 = (930, 922)
    c2b-axes(p, O, 702, 1046, 1205, 822, xl: (1058, 1040), yl: (740, 810))
    c2b-ray(p, O, P, 1.2)
    c2b-ray(p, O, P1, 1.2)
    seg(p, P, P1, stroke: lb)
    c2b-txt(p, (738, 1054), $O$)
    c2b-txt(p, (920, 1172), $P$)
    c2b-txt(p, (914, 905), $P_1$)
    c2b-lb(p, (937, 1027), $M (M_1)$)
    c2b-txt(p, (847, 1052), $x$)
    c2b-txt(p, (943, 1093), $y$)
    c2b-txt(p, (946, 977), $-y$)
    c2b-txt(p, (850, 955), $r$)
    c2b-txt(p, (850, 1121), $r$)
    c2b-txt(p, (975, 878), [$-alpha$的终边])
    c2b-txt(p, (982, 1194), [$alpha$的终边])
  }
})

// 图 2·26：α 与 90° + α 的终边（OP1 由 OP 绕 O 逆时针旋转 90° 得到，四幅）
#let fig-c2b-2-26(width: 860 * k) = px-canvas(860, 1290, origin: (190, 220), width: width, (p, u) => {
  import cetz.draw: *
  // 上：α 在第一象限
  {
    let O = (559, 507)
    let P = (738, 386)
    let P1 = (438, 328)
    let M = (738, 507)
    let M1 = (438, 507)
    c2b-axes(p, O, 342, 870, 557, 245, xl: (882, 507), yl: (556, 233))
    c2b-ray(p, O, P, 1.24)
    c2b-ray(p, O, P1, 1.24)
    seg(p, P, M, stroke: lb)
    seg(p, P1, M1, stroke: lb)
    rtmark(p, M, O, P, s: 9)
    rtmark(p, M1, P1, O, s: 9)
    // 相等的角：∠OPM 与 ∠P1OM1
    anglearc(p, P, O, M, 16)
    anglearc(p, O, M1, P1, 16)
    c2b-txt(p, (566, 520), $O$)
    c2b-txt(p, (730, 371), $P$)
    c2b-txt(p, (449, 313), $P_1$)
    c2b-txt(p, (738, 522), $M$)
    c2b-txt(p, (432, 522), $M_1$)
    c2b-txt(p, (423, 432), $x$)
    c2b-txt(p, (492, 520), $-y$)
    c2b-txt(p, (498, 402), $r$)
    c2b-txt(p, (658, 519), $x$)
    c2b-txt(p, (750, 445), $y$)
    c2b-txt(p, (642, 438), $r$)
    c2b-txt(p, (782, 342), [$alpha$的终边])
    c2b-txt(p, (412, 280), [$90° + alpha$的终边])
  }
  // 中：α 在第二象限
  {
    let O = (665, 812)
    let P = (487, 702)
    let P1 = (555, 990)
    let M = (487, 812)
    let M1 = (555, 812)
    c2b-axes(p, O, 423, 790, 1011, 582, xl: (802, 812), yl: (660, 568))
    c2b-ray(p, O, P, 1.12)
    c2b-ray(p, O, P1, 1.12)
    seg(p, P, M, stroke: lb)
    seg(p, P1, M1, stroke: lb)
    c2b-txt(p, (678, 828), $O$)
    c2b-txt(p, (495, 689), $P$)
    c2b-txt(p, (567, 1006), $P_1$)
    c2b-txt(p, (491, 829), $M$)
    c2b-txt(p, (566, 829), $M_1$)
    c2b-txt(p, (558, 801), $x$)
    c2b-txt(p, (615, 826), $-y$)
    c2b-txt(p, (477, 763), $y$)
    c2b-txt(p, (578, 744), $r$)
    c2b-txt(p, (540, 902), $x$)
    c2b-txt(p, (610, 918), $r$)
    c2b-txt(p, (467, 668), [$alpha$的终边])
    c2b-txt(p, (515, 1031), [$90° + alpha$的终边])
  }
  // 左下：α 在第三象限
  {
    let O = (434, 1232)
    let P = (256, 1354)
    let P1 = (556, 1410)
    let M = (256, 1232)
    let M1 = (556, 1232)
    c2b-axes(p, O, 196, 668, 1472, 1128, xl: (680, 1232), yl: (434, 1115))
    c2b-ray(p, O, P, 1.18)
    c2b-ray(p, O, P1, 1.18)
    seg(p, P, M, stroke: lb)
    seg(p, P1, M1, stroke: lb)
    c2b-txt(p, (446, 1219), $O$)
    c2b-txt(p, (281, 1366), $P$)
    c2b-txt(p, (547, 1430), $P_1$)
    c2b-txt(p, (256, 1219), $M$)
    c2b-txt(p, (556, 1219), $M_1$)
    c2b-txt(p, (338, 1222), $x$)
    c2b-txt(p, (500, 1221), $-y$)
    c2b-txt(p, (246, 1292), $y$)
    c2b-txt(p, (344, 1311), $r$)
    c2b-txt(p, (494, 1337), $r$)
    c2b-txt(p, (570, 1315), $x$)
    c2b-txt(p, (228, 1392), [$alpha$的终边])
    c2b-txt(p, (592, 1465), [$90° + alpha$的终边])
  }
  // 右下：α 在第四象限
  {
    let O = (716, 1320)
    let P = (898, 1434)
    let P1 = (830, 1138)
    let M = (898, 1320)
    let M1 = (830, 1320)
    c2b-axes(p, O, 690, 1016, 1484, 1092, xl: (1028, 1320), yl: (704, 1084))
    c2b-ray(p, O, P, 1.23)
    c2b-ray(p, O, P1, 1.16)
    seg(p, P, M, stroke: lb)
    seg(p, P1, M1, stroke: lb)
    c2b-txt(p, (706, 1336), $O$)
    c2b-txt(p, (888, 1447), $P$)
    c2b-txt(p, (818, 1124), $P_1$)
    c2b-txt(p, (890, 1305), $M$)
    c2b-txt(p, (818, 1305), $M_1$)
    c2b-txt(p, (768, 1307), $-y$)
    c2b-txt(p, (832, 1331), $x$)
    c2b-txt(p, (843, 1232), $x$)
    c2b-txt(p, (773, 1212), $r$)
    c2b-txt(p, (907, 1374), $y$)
    c2b-txt(p, (808, 1392), $r$)
    c2b-txt(p, (945, 1479), [$alpha$的终边])
    c2b-txt(p, (858, 1096), [$90° + alpha$的终边])
  }
})
