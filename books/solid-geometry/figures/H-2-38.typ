// 图 2·38（原书 p.154）例 1 正五棱柱的直观图；页面 200 dpi 坐标。
#import "H-base.typ": *

// 底面正五边形（边长 126 像素，AB 在 OX 轴上）
#let H38s = 126
#let H38c = calc.cos(72deg) * H38s   // 38.9
#let H38h = calc.sin(72deg) * H38s   // 119.8
#let H38d = calc.sin(36deg) * H38s   // 74.1
// 各点到 O 的 (OX 方向距离, OY 方向距离)，OX 向左为正
#let H38xy = (
  A: (165, 0), B: (39, 0), C: (39 - H38c, H38h), D: (102, H38h + H38d), E: (165 + H38c, H38h),
  H: (165 + H38c, 0), G: (102, 0), F: (39 - H38c, H38h + H38d),
)
// 直观图中的位置：O1 为原点，OX 向左，OY 取一半、向左上 45°
#let H38pt(o, key) = {
  let (x, y) = H38xy.at(key)
  let r = y / 2 * calc.cos(45deg)
  (o.at(0) - x - r, o.at(1) - r)
}

// (1) 底面
#let fig-H-2-38a(width: 280 * k) = px-canvas(280, 290, origin: (165, 622), width: width, (p, u) => {
  import cetz.draw: *
  let O = (420, 889)
  let q(key) = { let (x, y) = H38xy.at(key); (O.at(0) - x, O.at(1) - y) }
  Hbp(p, (q("A"), q("B"), q("C"), q("D"), q("E")), close: true)
  Hax(p, O, (172, 889))
  Hax(p, O, (420, 648))
  dseg(p, q("E"), q("H"))
  dseg(p, q("D"), q("G"))
  dseg(p, q("E"), q("C"))
  dseg(p, q("D"), q("F"))
  HL(p, 422, 633, $Y$)
  HL(p, 320, 680, $D$)
  HL(p, 435, 695, $F$)
  HL(p, 204, 767, $E$)
  HL(p, 433, 767, $C$)
  HL(p, 213, 903, $H$)
  HL(p, 253, 903, $A$)
  HL(p, 318, 903, $G$)
  HL(p, 375, 903, $B$)
  HL(p, 430, 902, $O$)
})

// (2) 直观图的底面
#let fig-H-2-38b(width: 310 * k) = px-canvas(310, 210, origin: (530, 695), width: width, (p, u) => {
  import cetz.draw: *
  let O1 = (834, 876)
  let q(key) = H38pt(O1, key)
  Hbp(p, (q("A"), q("B"), q("C"), q("D"), q("E")), close: true)
  Hax(p, O1, (552, 876))
  Hax(p, O1, (693, 735))
  dseg(p, q("E"), q("H"))
  dseg(p, q("D"), q("G"))
  dseg(p, q("E"), q("C"))
  dseg(p, q("D"), q("F"))
  HL(p, 690, 708, $Y_1$)
  HL(p, 665, 790, $D_1$)
  HL(p, 778, 795, $F_1$)
  HL(p, 570, 822, $E_1$)
  HL(p, 806, 834, $C_1$)
  HL(p, 538, 866, $X_1$)
  HL(p, 630, 892, $H_1$)
  HL(p, 671, 892, $A_1$)
  HL(p, 735, 892, $G_1$)
  HL(p, 795, 892, $B_1$)
  HL(p, 835, 892, $O_1$)
})

// (3) 引平行于 O1Z1 轴的直线，截取各侧棱
#let fig-H-2-38c(width: 320 * k) = px-canvas(320, 345, origin: (180, 970), width: width, (p, u) => {
  import cetz.draw: *
  let O1 = (482, 1297)
  let q(key) = H38pt(O1, key)
  let h = 220
  Hbp(p, (q("A"), q("B"), q("C"), q("D"), q("E")), close: true)
  Hax(p, O1, (200, 1297))
  Hax(p, O1, (482, 980))
  Hax(p, O1, (340, 1155))
  // 各侧棱：画得比截取的高稍长，在截取处加短横
  for (key, top) in (("E", 1012), ("D", 992), ("A", 1055), ("C", 1017), ("B", 1062)) {
    let b = q(key)
    Hb(p, b, (b.at(0), top))
    Htick(p, (b.at(0), b.at(1) - h))
  }
  HL(p, 216, 1031, $E_2$)
  HL(p, 330, 1012, $D_2$)
  HL(p, 345, 1083, $A_2$)
  HL(p, 456, 1035, $C_2$)
  HL(p, 466, 1086, $B_2$)
  HL(p, 489, 975, $Z_1$)
  HL(p, 345, 1143, $Y_1$)
  HL(p, 298, 1216, $D_1$)
  HL(p, 219, 1256, $E_1$)
  HL(p, 424, 1238, $C_1$)
  HL(p, 188, 1300, $X_1$)
  HL(p, 324, 1313, $A_1$)
  HL(p, 446, 1313, $B_1$)
  HL(p, 485, 1313, $O_1$)
})

// (4) 正五棱柱的直观图
#let fig-H-2-38d(width: 270 * k) = px-canvas(270, 345, origin: (548, 975), width: width, (p, u) => {
  import cetz.draw: *
  let O1 = (825, 1292)
  let q(key) = H38pt(O1, key)
  let h = 220
  let up(pt) = (pt.at(0), pt.at(1) - h)
  let (A, B, C, D, E) = ("A", "B", "C", "D", "E").map(q)
  Hbp(p, (A, B, C, D, E).map(up), close: true)
  Hbp(p, (up(E), E, A, B, up(B)))
  Hb(p, A, up(A))
  dseg(p, E, D)
  dseg(p, D, C)
  dseg(p, C, B)
  dseg(p, D, up(D))
  dseg(p, C, up(C))
  HL(p, 645, 987, $D_2$)
  HL(p, 779, 1015, $C_2$)
  HL(p, 560, 1035, $E_2$)
  HL(p, 803, 1077, $B_2$)
  HL(p, 675, 1094, $A_2$)
  HL(p, 632, 1210, $D_1$)
  HL(p, 763, 1225, $C_1$)
  HL(p, 562, 1258, $E_1$)
  HL(p, 660, 1310, $A_1$)
  HL(p, 788, 1311, $B_1$)
})
