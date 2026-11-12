// 图 2·39（原书 p.156）例 2 正六棱锥的直观图；页面 200 dpi 坐标。
#import "H-base.typ": *

// 底面正六边形（边长 118 像素）各点相对 O 的 (OX 距离, OY 距离)，OX 向右、OY 向上
#let H39s = 118
#let H39a = H39s / 2
#let H39b = H39s * calc.sin(60deg)   // 102.2
#let H39xy = (
  A: (H39a, 0), B: (H39a + H39s, 0), C: (2 * H39s, H39b), D: (H39a + H39s, 2 * H39b),
  E: (H39a, 2 * H39b), F: (0, H39b), G: (2 * H39s, 0), H: (H39s, H39b),
)
// 直观图：OY 取一半、向右上 45°
#let H39pt(o, key) = {
  let (x, y) = H39xy.at(key)
  let r = y / 2 * calc.cos(45deg)
  (o.at(0) + x + r, o.at(1) - r)
}

// (1) 底面
#let fig-H-2-39a(width: 315 * k) = px-canvas(315, 305, origin: (150, 225), width: width, (p, u) => {
  import cetz.draw: *
  let O = (172, 506)
  let q(key) = { let (x, y) = H39xy.at(key); (O.at(0) + x, O.at(1) - y) }
  Hbp(p, ("A", "B", "C", "D", "E", "F").map(q), close: true)
  Hax(p, O, (440, 506))
  Hax(p, O, (172, 245))
  dseg(p, q("E"), q("A"))
  dseg(p, q("D"), q("B"))
  dseg(p, q("C"), q("G"))
  Hdot(p, q("H"))
  HL(p, 170, 234, $Y$)
  HL(p, 232, 289, $E$)
  HL(p, 347, 289, $D$)
  HL(p, 160, 406, $F$)
  HL(p, 420, 403, $C$)
  HL(p, 300, 400, $H$)
  HL(p, 160, 522, $O$)
  HL(p, 231, 522, $A$)
  HL(p, 347, 522, $B$)
  HL(p, 406, 522, $G$)
  HL(p, 456, 507, $X$)
})

// (2) 直观图的底面
#let fig-H-2-39b(width: 345 * k) = px-canvas(345, 205, origin: (475, 325), width: width, (p, u) => {
  import cetz.draw: *
  let O1 = (485, 506)
  let q(key) = H39pt(O1, key)
  Hbp(p, ("A", "B", "C", "D", "E", "F").map(q), close: true)
  Hax(p, O1, (795, 506))
  Hax(p, O1, (650, 341))
  dseg(p, q("E"), q("A"))
  dseg(p, q("D"), q("B"))
  dseg(p, q("C"), q("G"))
  Hdot(p, q("H"))
  HL(p, 667, 335, $Y_1$)
  HL(p, 620, 420, $E_1$)
  HL(p, 746, 423, $D_1$)
  HL(p, 507, 461, $F_1$)
  HL(p, 653, 472, $H_1$)
  HL(p, 775, 478, $C_1$)
  HL(p, 487, 522, $O_1$)
  HL(p, 546, 522, $A_1$)
  HL(p, 665, 522, $B_1$)
  HL(p, 725, 522, $G_1$)
  HL(p, 810, 510, $X_1$)
})

// (3) 过 H1 作 H1S1 ∥ O1Z1
#let fig-H-2-39c(width: 345 * k) = px-canvas(345, 255, origin: (160, 590), width: width, (p, u) => {
  import cetz.draw: *
  let O1 = (174, 811)
  let q(key) = H39pt(O1, key)
  let H1 = q("H")
  Hbp(p, ("A", "B", "C", "D", "E", "F").map(q), close: true)
  Hax(p, O1, (482, 811))
  Hax(p, O1, (174, 605))
  Hax(p, O1, (362, 623))
  seg(p, H1, (H1.at(0), H1.at(1) - 165))
  Hdot(p, H1)
  HL(p, 175, 592, $Z_1$)
  HL(p, 328, 600, $S_1$)
  HL(p, 378, 628, $Y_1$)
  HL(p, 302, 725, $E_1$)
  HL(p, 440, 727, $D_1$)
  HL(p, 199, 767, $F_1$)
  HL(p, 345, 778, $H_1$)
  HL(p, 459, 784, $C_1$)
  HL(p, 175, 835, $O_1$)
  HL(p, 233, 835, $A_1$)
  HL(p, 350, 836, $B_1$)
  HL(p, 498, 818, $X_1$)
})

// (4) 正六棱锥的直观图
#let fig-H-2-39d(width: 270 * k) = px-canvas(270, 250, origin: (518, 593), width: width, (p, u) => {
  import cetz.draw: *
  let O1 = (503, 812)
  let q(key) = H39pt(O1, key)
  let (A, B, C, D, E, F, H) = ("A", "B", "C", "D", "E", "F", "H").map(q)
  let S = (H.at(0), H.at(1) - 157)
  Hbp(p, (F, A, B, C, D))
  for v in (F, A, B, C) { Hb(p, S, v) }
  seg(p, S, D)
  dseg(p, F, E)
  dseg(p, E, D)
  dseg(p, S, E)
  dseg(p, S, H)
  Hdot(p, H)
  HL(p, S.at(0), 603, $S_1$)
  HL(p, 622, 733, $E_1$)
  HL(p, 770, 728, $D_1$)
  HL(p, 527, 782, $F_1$)
  HL(p, 640, 782, $H_1$)
  HL(p, 785, 795, $C_1$)
  HL(p, 560, 833, $A_1$)
  HL(p, 683, 834, $B_1$)
})
