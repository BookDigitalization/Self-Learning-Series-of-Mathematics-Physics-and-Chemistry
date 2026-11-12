// 图 2·40（原书 p.157）例 3 正四棱台的直观图；页面 200 dpi 坐标。
#import "H-base.typ": *

// 下底面边长 238 像素（30 cm，1:10），上底面在下底面内的射影边长 159 像素，四周各缩进 40 像素；高 79 像素。
#let H40S = 238
#let H40s = 159
#let H40m = 39.5
#let H40h = 79
// 直观图中：OX 向右，OY 取一半、向右上 45°
#let H40pt(o, x, y) = {
  let r = y / 2 * calc.cos(45deg)
  (o.at(0) + x + r, o.at(1) - r)
}
// 直观图里的下底面四点 O1 A1 B1 C1 与射影四点 O1' A1' B1' C1'
#let H40base(o) = {
  let outer = ((0, 0), (H40S, 0), (H40S, H40S), (0, H40S)).map(((x, y)) => H40pt(o, x, y))
  let inner = ((H40m, H40m), (H40m + H40s, H40m), (H40m + H40s, H40m + H40s), (H40m, H40m + H40s)).map(((x, y)) => H40pt(o, x, y))
  (outer, inner)
}

// (1) 下底面正方形与上底面的射影
#let fig-H-2-40a(width: 320 * k) = px-canvas(320, 360, origin: (165, 640), width: width, (p, u) => {
  import cetz.draw: *
  let O = (188, 971)
  let q(x, y) = (O.at(0) + x, O.at(1) - y)
  let outer = ((0, 0), (H40S, 0), (H40S, H40S), (0, H40S)).map(((x, y)) => q(x, y))
  let inner = ((H40m, H40m), (H40m + H40s, H40m), (H40m + H40s, H40m + H40s), (H40m, H40m + H40s)).map(((x, y)) => q(x, y))
  Hbp(p, outer, close: true)
  Hbp(p, inner, close: true)
  Ht(p, outer.at(0), outer.at(2))
  Ht(p, outer.at(1), outer.at(3))
  Hax(p, outer.at(3), (188, 655))
  Hax(p, outer.at(1), (482, 971))
  HL(p, 183, 657, $Y$)
  HL(p, 172, 731, $C$)
  HL(p, 440, 729, $B$)
  HL(p, 212, 787, $C'$)
  HL(p, 403, 782, $B'$)
  HL(p, 236, 947, $O'$)
  HL(p, 372, 944, $A'$)
  HL(p, 181, 986, $O$)
  HL(p, 423, 986, $A$)
  HL(p, 471, 990, $X$)
})

// (2) 直观图中的对应图形
#let fig-H-2-40b(width: 355 * k) = px-canvas(355, 205, origin: (515, 795), width: width, (p, u) => {
  import cetz.draw: *
  let O1 = (525, 967)
  let (outer, inner) = H40base(O1)
  Hbp(p, outer, close: true)
  Hbp(p, inner, close: true)
  Ht(p, outer.at(0), outer.at(2))
  Ht(p, outer.at(1), outer.at(3))
  Hax(p, outer.at(1), (857, 967))
  Hax(p, outer.at(3), (690, 802))
  HL(p, 694, 808, $Y_1$)
  HL(p, 597, 867, $C_1$)
  HL(p, 862, 882, $B_1$)
  HL(p, 617, 904, $C'_1$)
  HL(p, 803, 908, $B'_1$)
  HL(p, 568, 942, $O'_1$)
  HL(p, 760, 946, $A'_1$)
  HL(p, 535, 990, $O_1$)
  HL(p, 768, 991, $A_1$)
  HL(p, 846, 992, $X_1$)
})

// (3) 引平行于 O1Z1 轴的线段，截取高
#let fig-H-2-40c(width: 355 * k) = px-canvas(355, 250, origin: (175, 1060), width: width, (p, u) => {
  import cetz.draw: *
  let O1 = (190, 1282)
  let (outer, inner) = H40base(O1)
  let up(pt) = (pt.at(0), pt.at(1) - H40h)
  let top = inner.map(up)
  Hbp(p, outer, close: true)
  Hbp(p, inner, close: true)
  Ht(p, outer.at(0), outer.at(2))
  Ht(p, outer.at(1), outer.at(3))
  Hbp(p, top, close: true)
  for i in range(4) { Hb(p, inner.at(i), top.at(i)) }
  Hax(p, outer.at(1), (513, 1282))
  Hax(p, O1, (190, 1085))
  Hax(p, outer.at(3), (322, 1146))
  HL(p, 191, 1068, $Z_1$)
  HL(p, 283, 1115, $C_2$)
  HL(p, 474, 1130, $B_2$)
  HL(p, 339, 1150, $Y_1$)
  HL(p, 228, 1182, $O_2$)
  HL(p, 414, 1184, $A_2$)
  HL(p, 528, 1199, $B_1$)
  HL(p, 278, 1210, $C_1$)
  HL(p, 302, 1236, $C'_1$)
  HL(p, 468, 1229, $B'_1$)
  HL(p, 230, 1264, $O'_1$)
  HL(p, 414, 1263, $A'_1$)
  HL(p, 190, 1298, $O_1$)
  HL(p, 431, 1304, $A_1$)
  HL(p, 501, 1304, $X_1$)
})

// (4) 正四棱台的直观图
#let fig-H-2-40d(width: 360 * k) = px-canvas(360, 205, origin: (545, 1105), width: width, (p, u) => {
  import cetz.draw: *
  let O1 = (555, 1282)
  let (outer, inner) = H40base(O1)
  let up(pt) = (pt.at(0), pt.at(1) - H40h)
  let top = inner.map(up)
  let (Ob, Ab, Bb, Cb) = outer
  let (O2, A2, B2, C2) = top
  Hbp(p, top, close: true)
  Hbp(p, (O2, Ob, Ab, Bb, B2))
  Hb(p, Ab, A2)
  dseg(p, Ob, Cb)
  dseg(p, Cb, Bb)
  dseg(p, Cb, C2)
  HL(p, 650, 1115, $C_2$)
  HL(p, 838, 1122, $B_2$)
  HL(p, 590, 1180, $O_2$)
  HL(p, 753, 1177, $A_2$)
  HL(p, 646, 1212, $C_1$)
  HL(p, 562, 1302, $O_1$)
  HL(p, 790, 1302, $A_1$)
  HL(p, 892, 1200, $B_1$)
})
