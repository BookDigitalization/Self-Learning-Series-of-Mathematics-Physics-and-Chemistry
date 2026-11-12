// 图 3·41、3·42（原书 p.252）、3·43、3·44（p.253）；页面 200 dpi 坐标。
#import "N-base.typ": *

// 图 3·41：圆柱及其内接正六棱柱 AE′
#let fig-N-3-41(width: 200 * k) = px-canvas(200, 250, origin: (660, 260), width: width, (p, u) => {
  import cetz.draw: *
  let ct = (759, 323)
  let cb = (759, 452)
  let (rx, rt, rb) = (79, 47, 42)
  let angs = (0, 63, 117, 180, 243, 297)
  let T = angs.map(a => N-ept(ct, rx, rt, a))
  let B = angs.map(a => N-ept(cb, rx, rb, a))
  // 圆柱
  N-ell(p, ct, rx, rt)
  N-bell(p, cb, rx, rb)
  // 上底六边形（全可见）
  for i in range(6) { N-tseg(p, T.at(i), T.at(calc.rem(i + 1, 6))) }
  // 下底六边形：前面三边实线，后面三边虚线；直径 A—D 虚线
  N-tseg(p, B.at(3), B.at(4))
  N-tseg(p, B.at(4), B.at(5))
  N-tseg(p, B.at(5), B.at(0))
  dseg(p, B.at(0), B.at(1))
  dseg(p, B.at(1), B.at(2))
  dseg(p, B.at(2), B.at(3))
  dseg(p, B.at(3), B.at(0))
  // 侧棱
  for i in (0, 3, 4, 5) { N-tseg(p, T.at(i), B.at(i)) }
  for i in (1, 2) { dseg(p, T.at(i), B.at(i)) }
  N-L(p, 802, 266, $E'$)
  N-L(p, 668, 456, $A$)
})

// 图 3·42：圆柱和它的侧面展开图
#let fig-N-3-42(width: 360 * k) = px-canvas(360, 190, origin: (490, 760), width: width, (p, u) => {
  import cetz.draw: *
  let (cx, rx) = (557, 57)
  N-ell(p, (cx, 800), rx, 22)
  N-bell(p, (cx, 913), rx, 24)
  seg(p, (cx - rx, 800), (cx - rx, 913))
  seg(p, (cx + rx, 787), (cx + rx, 913))
  // 展开图（矩形）与对角线
  poly(p, ((cx + rx, 787), (843, 787), (843, 913), (cx + rx, 913)))
  dseg(p, (cx + rx, 913), (843, 787))
  anglearc(p, (cx + rx, 913), (cx + rx, 850), (843, 787), 34)
  N-L(p, 646, 884, [60°])
  N-L(p, 628, 843, $H$)
  N-L(p, 705, 774, $sqrt(3) H$)
})

// 图 3·43：矩形分别以两边为轴旋转所成的两个圆柱
#let fig-N-3-43(width: 420 * k) = px-canvas(420, 190, origin: (300, 435), width: width, (p, u) => {
  import cetz.draw: *
  // 左：以 a 为轴
  N-ell(p, (390, 474), 60, 27)
  N-bell(p, (390, 590), 60, 30)
  seg(p, (330, 474), (330, 590))
  seg(p, (450, 474), (450, 590))
  N-tseg(p, (390, 474), (450, 474))
  N-tseg(p, (390, 474), (390, 590))
  N-tseg(p, (390, 590), (450, 590))
  N-L(p, 412, 462, $b$)
  N-L(p, 381, 535, $a$)
  N-L(p, 467, 478, $B_1$)
  N-L(p, 316, 601, $A$)
  // 右：以 b 为轴
  N-ell(p, (597, 491), 103, 45)
  N-bell(p, (597, 565), 103, 45)
  seg(p, (494, 491), (494, 565))
  seg(p, (700, 491), (700, 565))
  N-tseg(p, (597, 491), (700, 491))
  N-tseg(p, (597, 491), (597, 565))
  N-tseg(p, (597, 565), (700, 565))
  dseg(p, (494, 491), (597, 491))
  dseg(p, (494, 565), (597, 565))
  N-L(p, 652, 481, $a$)
  N-L(p, 589, 512, $b$)
  N-L(p, 715, 494, $A_1$)
  N-L(p, 484, 568, $B$)
})

// 图 3·44：钢垫圈（外径 56、内径 24）
#let fig-N-3-44(width: 275 * k) = px-canvas(275, 245, origin: (615, 1065), width: width, (p, u) => {
  import cetz.draw: *
  let (co, cb) = ((753, 1193), (753, 1218))
  let (rx, ry) = (125, 83)
  // 外圆柱：上底整个椭圆，下底只见前半
  N-ell(p, co, rx, ry)
  N-earc(p, cb, rx, ry, 180, 360)
  seg(p, (co.at(0) - rx, 1193), (co.at(0) - rx, 1218))
  seg(p, (co.at(0) + rx, 1193), (co.at(0) + rx, 1218))
  // 侧面阴影线
  for t in (186, 190, 194, 198, 202, 206, 210, 214, 219, 224, 230, 246, 252, 289, 295, 311, 317, 322, 327, 331, 335, 339, 343, 347, 351, 355) {
    line(p(..N-ept(co, rx, ry, t)), p(..N-ept(cb, rx, ry, t)), stroke: 0.5pt)
  }
  // 内孔：上口整个椭圆；孔内后壁的下缘（只见孔口以内的部分）及阴影线
  let (ci, ci2) = ((752, 1244), (752, 1269))
  let (ri, si) = (52, 39)
  N-ell(p, ci, ri, si)
  N-earc(p, ci2, ri, si, 19, 161, st: 0.5pt)
  for t in (24, 30, 36, 42, 50, 130, 138, 144, 150, 156) {
    line(p(..N-ept(ci, ri, si, t)), p(..N-ept(ci2, ri, si, t)), stroke: 0.5pt)
  }
  // 尺寸
  line(p(628, 1072), p(628, 1193), stroke: lt)
  line(p(878, 1072), p(878, 1193), stroke: lt)
  dimh(p, 628, 878, 1083, lab: [56])
  line(p(700, 1148), p(700, 1244), stroke: lt)
  line(p(804, 1148), p(804, 1244), stroke: lt)
  dimh(p, 700, 804, 1157, lab: [24])
})
