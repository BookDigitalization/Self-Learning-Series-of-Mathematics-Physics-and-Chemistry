// 图 2·36（原书 p.152）、图 2·37（p.153）；页面 200 dpi 坐标。
#import "H-base.typ": *

// 正方体直观图：前下左角 a、棱长 s、斜向偏移 d（向右上）；hidden 为被遮住的顶点（后下左）
#let H-cube(p, a, s, d) = {
  import cetz.draw: *
  let (x, y) = a
  let F = ((x, y), (x + s, y), (x + s, y - s), (x, y - s))
  let Bk = F.map(q => (q.at(0) + d, q.at(1) - d))
  Hbp(p, F, close: true)
  Hbp(p, (F.at(3), Bk.at(3), Bk.at(2), F.at(2)))
  Hbp(p, (Bk.at(2), Bk.at(1), F.at(1)))
  dseg(p, Bk.at(0), F.at(0))
  dseg(p, Bk.at(0), Bk.at(1))
  dseg(p, Bk.at(0), Bk.at(3))
}

// 图 2·36 (1)
#let fig-H-2-36a(width: 270 * k) = px-canvas(270, 210, origin: (192, 198), width: width, (p, u) => {
  import cetz.draw: *
  let O = (362, 392)
  H-cube(p, (262, 392), 100, 37)
  seg(p, O, (212, 392))
  seg(p, O, (362, 215))
  seg(p, O, (445, 309))
  HL(p, 366, 205, $Z$)
  HL(p, 458, 302, $Y$)
  HL(p, 200, 390, $X$)
  HL(p, 358, 409, $O$)
})

// 图 2·36 (2)
#let fig-H-2-36b(width: 215 * k) = px-canvas(215, 210, origin: (538, 205), width: width, (p, u) => {
  import cetz.draw: *
  let O = (560, 400)
  H-cube(p, (560, 400), 100, 37)
  seg(p, O, (560, 222))
  seg(p, O, (735, 400))
  seg(p, O, (645, 315))
  HL(p, 563, 212, $Z$)
  HL(p, 652, 318, $Y$)
  HL(p, 545, 404, $O$)
  HL(p, 745, 404, $X$)
})

// 图 2·37 (1) 底面正方形
#let fig-H-2-37a(width: 190 * k) = px-canvas(190, 220, origin: (232, 388), width: width, (p, u) => {
  import cetz.draw: *
  let O = (405, 585)
  let A = (308, 585)
  let C = (405, 488)
  let D = (308, 488)
  Hbp(p, (A, O, C, D), close: true)
  Hb(p, O, (405, 408))
  Hb(p, A, (255, 585))
  HL(p, 404, 396, $Y$)
  HL(p, 296, 491, $D$)
  HL(p, 416, 490, $C$)
  HL(p, 241, 587, $X$)
  HL(p, 307, 603, $A$)
  HL(p, 403, 601, $O$)
})

// 图 2·37 (2) 直观图的底面
#let fig-H-2-37b(width: 290 * k) = px-canvas(290, 220, origin: (548, 384), width: width, (p, u) => {
  import cetz.draw: *
  let O1 = (720, 578)
  let A1 = (623, 578)
  let C1 = (754, 544)
  let D1 = (657, 544)
  Hbp(p, (A1, O1, C1, D1), close: true)
  Hb(p, O1, (720, 404))
  Hb(p, C1, (806, 492))
  Hb(p, A1, (580, 578))
  HL(p, 720, 393, $Z_1$)
  HL(p, 822, 482, $Y_1$)
  HL(p, 636, 533, $D_1$)
  HL(p, 771, 552, $C_1$)
  HL(p, 562, 581, $X_1$)
  HL(p, 625, 596, $A_1$)
  HL(p, 725, 595, $O_1$)
})

// 图 2·37 (3) 截取各棱
#let fig-H-2-37c(width: 290 * k) = px-canvas(290, 215, origin: (200, 683), width: width, (p, u) => {
  import cetz.draw: *
  let O1 = (384, 869)
  let A1 = (286, 869)
  let C1 = (419, 834)
  let D1 = (321, 834)
  Hbp(p, (A1, O1, C1, D1), close: true)
  Hb(p, A1, (228, 869))
  Hb(p, C1, (478, 775))
  Hb(p, O1, (384, 702))
  Hb(p, A1, (286, 762))
  Hb(p, D1, (321, 726))
  Hb(p, C1, (419, 712))
  Htick(p, (286, 771))
  Htick(p, (384, 771))
  Htick(p, (321, 736))
  Htick(p, (419, 736))
  HL(p, 385, 692, $Z_1$)
  HL(p, 337, 735, $D_2$)
  HL(p, 434, 738, $C_2$)
  HL(p, 270, 772, $A_2$)
  HL(p, 400, 772, $O_2$)
  HL(p, 489, 764, $Y_1$)
  HL(p, 339, 823, $D_1$)
  HL(p, 436, 848, $C_1$)
  HL(p, 213, 874, $X_1$)
  HL(p, 289, 889, $A_1$)
  HL(p, 386, 889, $O_1$)
})

// 图 2·37 (4) 正方体的直观图
#let fig-H-2-37d(width: 190 * k) = px-canvas(190, 185, origin: (600, 710), width: width, (p, u) => {
  import cetz.draw: *
  H-cube(p, (628, 864), 98, 35)
  HL(p, 667, 719, $D_2$)
  HL(p, 768, 722, $C_2$)
  HL(p, 612, 772, $A_2$)
  HL(p, 739, 777, $O_2$)
  HL(p, 681, 820, $D_1$)
  HL(p, 774, 831, $C_1$)
  HL(p, 615, 867, $A_1$)
  HL(p, 726, 882, $O_1$)
})
