// 图 3·22（原书 p.234）、3·23（p.235）、3·24、3·25（p.236）、3·26（p.237）；页面 200 dpi 坐标。
// 近似椭圆按正文的作图法计算（菱形在上顶点处的角为 120°，四段圆弧），不是照描。
#import "L-base.typ": *

// 带箭头的轴线
#let L-axis(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: L-sl, mark: (end: "stealth", fill: black, scale: 0.5))
}
// 从 a 出发经过 b、总长为 len 的射线终点
#let L-ray(a, b, len) = {
  let d = L-dist(a, b)
  (a.at(0) + (b.at(0) - a.at(0)) * len / d, a.at(1) + (b.at(1) - a.at(1)) * len / d)
}

#let fig-L-3-22a(width: 220 * k) = px-canvas(220, 230, origin: (135, 730), width: width, (p, u) => {
  import cetz.draw: *
  L-axis(p, (165, 928), (165, 738))
  L-axis(p, (165, 928), (348, 928))
  circle(p(240, 855), radius: 75, stroke: L-ol)
  L-ln(p, (165, 855), (315, 855), L-dl)
  L-t(p, 153, 748, $Y$)
  L-t(p, 153, 853, $A$)
  L-t(p, 328, 855, $B$)
  L-t(p, 152, 930, $O$)
  L-t(p, 337, 943, $X$)
})

#let fig-L-3-22b(width: 350 * k) = px-canvas(350, 200, origin: (460, 732), width: width, (p, u) => {
  import cetz.draw: *
  let r = L-rh((630, 760), 150)
  L-axis(p, r.O, L-ray(r.O, r.A, 185))
  L-axis(p, r.O, L-ray(r.O, r.C, 185))
  L-pl(p, (r.O, r.A, r.B, r.C), L-sl, close: true)
  L-ln(p, r.O, r.N, L-dl)
  L-ln(p, r.O, r.P, L-dl)
  L-ln(p, r.B, r.M, L-dl)
  L-ln(p, r.B, r.Q, L-dl)
  L-rhell(p, r, L-ol)
  L-t(p, 630, 744, $O_1$)
  L-t(p, 555, 787, $M$)
  L-t(p, 706, 786, $Q$)
  L-t(p, 496, 829, $C$)
  L-t(p, 773, 823, $D$)
  L-t(p, 606, 836, $K$)
  L-t(p, 691, 830, $L$)
  L-t(p, 479, 871, $X_1$)
  L-t(p, 796, 866, $Y_1$)
  L-t(p, 557, 891, $N$)
  L-t(p, 711, 885, $P$)
  L-t(p, 634, 927, $E$)
})

#let fig-L-3-23a(width: 290 * k) = px-canvas(290, 345, origin: (298, 858), width: width, (p, u) => {
  import cetz.draw: *
  let r0 = L-rh((447, 1055), 111.5)
  let r1 = L-rh((447, 915), 111.5)
  L-axis(p, (447, 1198), (447, 866))
  L-axis(p, r0.O, L-ray(r0.O, r0.A, 150))
  L-axis(p, r0.O, L-ray(r0.O, r0.C, 150))
  L-ln(p, r1.O, L-ray(r1.O, r1.A, 140), L-sl)
  L-ln(p, r1.O, L-ray(r1.O, r1.C, 140), L-sl)
  for r in (r0, r1) {
    L-pl(p, (r.O, r.A, r.B, r.C), L-sl, close: true)
    L-ln(p, r.A, r.C, L-sl)
    L-rhell(p, r, L-ol)
  }
  L-ln(p, r1.E, r0.E, L-ol)
  L-ln(p, r1.F, r0.F, L-ol)
  L-t(p, 462, 868, $Z$)
  L-t(p, 462, 907, $O_1$)
  L-t(p, 341, 957, $A_1$)
  L-t(p, 404, 959, $E_1$)
  L-t(p, 492, 959, $F_1$)
  L-t(p, 558, 961, $C_1$)
  L-t(p, 462, 986, $D_1$)
  L-t(p, 437, 1046, $O$)
  L-t(p, 469, 1041, $B_1$)
  L-t(p, 337, 1100, $A$)
  L-t(p, 405, 1131, $E$)
  L-t(p, 462, 1131, $D$)
  L-t(p, 493, 1129, $F$)
  L-t(p, 551, 1100, $C$)
  L-t(p, 309, 1149, $X$)
  L-t(p, 572, 1150, $Y$)
  L-t(p, 461, 1181, $B$)
})

#let fig-L-3-23b(width: 150 * k) = px-canvas(150, 230, origin: (617, 915), width: width, (p, u) => {
  import cetz.draw: *
  L-cyl(p, ((692, 958), 64, 34), ((692, 1097), 64, 34))
})

#let fig-L-3-24a(width: 275 * k) = px-canvas(275, 300, origin: (452, 285), width: width, (p, u) => {
  import cetz.draw: *
  let r = L-rh((590, 438), 107)
  let S = (590, 331.5)
  L-axis(p, (590, 580), (590, 290))
  L-axis(p, r.O, L-ray(r.O, r.A, 140))
  L-axis(p, r.O, L-ray(r.O, r.C, 140))
  L-pl(p, (r.O, r.A, r.B, r.C), L-sl, close: true)
  L-ln(p, r.A, r.C, L-sl)
  L-rhell(p, r, L-ol)
  L-ln(p, S, r.E, L-ol)
  L-ln(p, S, r.F, L-ol)
  L-t(p, 604, 297, $Z$)
  L-t(p, 602, 325, $S$)
  L-t(p, 601, 428, $O$)
  L-t(p, 487, 483, $A$)
  L-t(p, 549, 481, $E$)
  L-t(p, 627, 481, $F$)
  L-t(p, 690, 483, $C$)
  L-t(p, 601, 512, $D$)
  L-t(p, 460, 522, $X$)
  L-t(p, 718, 521, $Y$)
  L-t(p, 601, 561, $B$)
})

#let fig-L-3-24b(width: 140 * k) = px-canvas(140, 220, origin: (725, 315), width: width, (p, u) => {
  import cetz.draw: *
  L-cone(p, (795, 330), ((795, 490), 63, 37))
})

#let fig-L-3-25a(width: 385 * k) = px-canvas(385, 390, origin: (138, 800), width: width, (p, u) => {
  import cetz.draw: *
  let s = 165
  let r0 = L-rh((340, 980), s)
  let D1 = (340, r0.D.at(1) - 150)
  let Cp = L-lerp(r0.O, r0.C, 0.6)
  let r1 = L-rh((340, D1.at(1) - 0.6 * s / 2), 0.6 * s)
  L-axis(p, (340, 1185), (340, 806))
  L-axis(p, r0.O, L-ray(r0.O, r0.A, 225))
  L-axis(p, r0.O, L-ray(r0.O, r0.C, 225))
  L-ln(p, (192, D1.at(1)), (478, D1.at(1)), L-sl)
  pdot(p, (192, D1.at(1)), r: 2)
  pdot(p, (478, D1.at(1)), r: 2)
  L-ln(p, r1.O, L-ray(r1.O, r1.A, 0.6 * s * 1.25), L-sl)
  L-ln(p, r1.O, L-ray(r1.O, r1.C, 0.6 * s * 1.25), L-sl)
  L-ln(p, Cp, r1.C, L-dl)
  L-ln(p, r0.A, r0.C, L-sl)
  for r in (r0, r1) {
    L-pl(p, (r.O, r.A, r.B, r.C), L-sl, close: true)
    L-rhell(p, r, L-ol)
  }
  L-ln(p, r1.E, r0.E, L-ol)
  L-ln(p, r1.F, r0.F, L-ol)
  L-t(p, 320, 818, $Z$)
  L-t(p, 351, 853, $O_1$)
  L-t(p, 244, 894, $A_1$)
  L-t(p, 298, 902, $E_1$)
  L-t(p, 369, 902, $F_1$)
  L-t(p, 420, 895, $C_1$)
  L-t(p, 467, 896, $l$)
  L-t(p, 351, 928, $D_1$)
  L-t(p, 322, 965, $B_1$)
  L-t(p, 351, 979, $O$)
  L-t(p, 441, 1021, $C'_1$)
  L-t(p, 188, 1053, $A$)
  L-t(p, 266, 1056, $E$)
  L-t(p, 350, 1056, $D$)
  L-t(p, 409, 1056, $F$)
  L-t(p, 479, 1056, $C$)
  L-t(p, 150, 1107, $X$)
  L-t(p, 522, 1104, $Y$)
  L-t(p, 352, 1162, $B$)
})

#let fig-L-3-25b(width: 200 * k) = px-canvas(200, 275, origin: (618, 860), width: width, (p, u) => {
  import cetz.draw: *
  L-frustum(p, ((713, 905), 57, 37), ((718, 1065), 90, 60))
})

#let fig-L-3-26a(width: 140 * k) = px-canvas(140, 190, origin: (170, 610), width: width, (p, u) => {
  import cetz.draw: *
  let S = (237, 628)
  let e = ((242, 768), 47, 33)
  L-ellh(p, e)
  L-ln(p, S, (195, 768), L-ol)
  L-ln(p, S, (289, 768), L-ol)
  L-t(p, 237, 614, $S$)
  L-t(p, 181, 777, $E$)
  L-t(p, 302, 770, $F$)
})

#let fig-L-3-26b(width: 140 * k) = px-canvas(140, 190, origin: (355, 610), width: width, (p, u) => {
  import cetz.draw: *
  L-cone(p, (418, 628), ((423, 768), 47, 33))
})

#let fig-L-3-26c(width: 180 * k) = px-canvas(180, 190, origin: (510, 610), width: width, (p, u) => {
  import cetz.draw: *
  let e1 = ((597, 648), 43, 25)
  let e2 = ((605, 750), 75, 42)
  L-ell(p, e1, L-ol)
  L-ellh(p, e2)
  L-ln(p, (554, 648), (530, 750), L-ol)
  L-ln(p, (640, 648), (680, 750), L-ol)
  L-t(p, 540, 640, $E_1$)
  L-t(p, 661, 642, $F_1$)
  L-t(p, 517, 763, $E$)
  L-t(p, 691, 760, $F$)
})

#let fig-L-3-26d(width: 175 * k) = px-canvas(175, 200, origin: (718, 605), width: width, (p, u) => {
  import cetz.draw: *
  L-frustum(p, ((805, 640), 45, 25), ((805, 740), 75, 45))
})
