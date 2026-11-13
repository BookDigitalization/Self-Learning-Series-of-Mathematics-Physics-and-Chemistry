// 图 2·31（原书 p.147）、图 2·32（p.148）；页面 200 dpi 坐标。
#import "H-base.typ": *

// 图 2·31 例 2 的正六棱台及原棱锥
#let fig-H-2-31(width: 270 * k) = px-canvas(270, 300, origin: (635, 282), width: width, (p, u) => {
  import cetz.draw: *
  let V = (760, 302)
  let A = (655, 532)
  let B = (688, 562)
  let C = (808, 563)
  let D = (878, 537)
  let E = (838, 503)
  let F = (720, 503)
  let O = (765, 533)
  let M = Hlerp(C, D, 0.5)
  let t = 0.49
  let (A1, B1, C1, D1, E1, F1, O1, M1) = (A, B, C, D, E, F, O, M).map(q => Hlerp(V, q, t))
  // H：M1 在下底面上的射影（在 OM 上）
  let H = Hlerp(O, M, t)
  for q in (A, B, C, D) { Hb(p, V, q) }
  Ht(p, V, M)
  Hbp(p, (A, B, C, D))
  Hbp(p, (A1, B1, C1, D1))
  dseg(p, D, E)
  dseg(p, E, F)
  dseg(p, F, A)
  dseg(p, D1, E1)
  dseg(p, E1, F1)
  dseg(p, F1, A1)
  dseg(p, V, E)
  dseg(p, V, F)
  dseg(p, V, O)
  dseg(p, O, M)
  dseg(p, O1, M1)
  dseg(p, M1, H)
  HL(p, 760, 289, $V$)
  HL(p, 683, 413, $A_1$)
  HL(p, 752, 420, $O_1$)
  HL(p, 747, 390, $F_1$)
  HL(p, 830, 392, $E_1$)
  HL(p, 838, 423, $D_1$)
  HL(p, 744, 452, $B_1$)
  HL(p, 776, 446, $C_1$)
  HL(p, 820, 447, $M_1$)
  HL(p, 733, 493, $F$)
  HL(p, 850, 500, $E$)
  HL(p, 817, 526, $H$)
  HL(p, 754, 535, $O$)
  HL(p, 644, 538, $A$)
  HL(p, 688, 580, $B$)
  HL(p, 810, 580, $C$)
  HL(p, 893, 542, $D$)
  HL(p, 856, 567, $M$)
})

// 图 2·32 例 3：棱台的中截面
#let fig-H-2-32(width: 250 * k) = px-canvas(250, 305, origin: (605, 240), width: width, (p, u) => {
  import cetz.draw: *
  let V = (745, 267)
  let A = (615, 513)
  let B = (721, 542)
  let C = (841, 524)
  let D = (790, 486)
  let E = (687, 480)
  let O = (745, 515)
  for t in (0.467, 0.715, 1.0) {
    let (a, b, c, d, e) = (A, B, C, D, E).map(q => Hlerp(V, q, t))
    if t == 1.0 { Hbp(p, (a, b, c)) } else { poly(p, (a, b, c)) }
    dseg(p, c, d)
    dseg(p, d, e)
    dseg(p, e, a)
  }
  for q in (A, B, C) { Hb(p, V, q) }
  dseg(p, V, D)
  dseg(p, V, E)
  dseg(p, V, O)
  HL(p, 745, 252, $V$)
  HL(p, 704, 381, $q$)
  HL(p, 758, 387, $O_1$)
  HL(p, 700, 434, $M$)
  HL(p, 760, 446, $O_2$)
  HL(p, 674, 499, $Q$)
  HL(p, 753, 520, $O$)
})
