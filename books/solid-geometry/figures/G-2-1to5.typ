// 图 2·1（原书 p.122）、2·2、2·3（p.123）、2·4（p.124）、2·5（p.125）；页面 200 dpi 坐标。
#import "G-base.typ": *

// 分图并排，下面标 (1)(2)…
#let G1parts(..items) = plainfig(..items.pos().enumerate().map(((i, it)) => (it, [(#(i + 1))])))

#let G1-cube(p, A, B, C, D, E, F, G, H) = {
  // 长方体：前面 ABFE，后面 DCGH；D 处三条棱虚线
  tpoly(p, (A, B, F, E, A))
  tpoly(p, (E, H, G, F))
  tpoly(p, (G, C, B))
  dseg(p, D, A)
  dseg(p, D, C)
  dseg(p, D, H)
}

#let fig-G-2-1a(width: 200 * k) = px-canvas(200, 205, origin: (130, 905), width: width, (p, u) => {
  import cetz.draw: *
  let A = (157, 1087)
  let B = (277, 1087)
  let C = (317, 1045)
  let D = (198, 1045)
  let E = (157, 966)
  let F = (277, 966)
  let G = (317, 924)
  let H = (198, 924)
  G1-cube(p, A, B, C, D, E, F, G, H)
  L(p, 152, 1103, $A$)
  L(p, 282, 1102, $B$)
  L(p, 331, 1040, $C$)
  L(p, 210, 1031, $D$)
  L(p, 141, 970, $E$)
  L(p, 288, 980, $F$)
  L(p, 327, 919, $G$)
  L(p, 199, 911, $H$)
})

#let fig-G-2-1b(width: 150 * k) = px-canvas(150, 170, origin: (360, 910), width: width, (p, u) => {
  import cetz.draw: *
  let V = (432, 918)
  let P = (367, 1041)
  let Q = (469, 1076)
  let R = (502, 1020)
  tpoly(p, (V, P, Q, R, V))
  tseg(p, V, Q)
  dseg(p, P, R)
})

#let fig-G-2-1c(width: 110 * k) = px-canvas(110, 175, origin: (566, 918), width: width, (p, u) => {
  import cetz.draw: *
  let c = (621, 932)
  circle(p(..c), radius: (31, 8.5), stroke: lb)
  catmull(p(591, 934), p(595, 952), p(588, 968), p(578, 985), p(576, 1010), p(578, 1050), p(585, 1077),
    p(598, 1089), p(621, 1091), p(644, 1089), p(657, 1077), p(664, 1050), p(666, 1010), p(664, 985),
    p(654, 968), p(647, 952), p(651, 934), stroke: lb)
})

#let fig-G-2-1d(width: 130 * k) = px-canvas(130, 175, origin: (710, 915), width: width, (p, u) => {
  import cetz.draw: *
  let V = (777, 922)
  let c = (774, 1068)
  let (rx, ry) = (58, 15)
  // 底面椭圆：前半实线、后半虚线
  arc(p(c.at(0) + rx, c.at(1)), start: 0deg, stop: -180deg, radius: (rx, ry), stroke: lb)
  arc(p(c.at(0) + rx, c.at(1)), start: 0deg, stop: 180deg, radius: (rx, ry), stroke: dsh)
  tseg(p, V, (c.at(0) - rx, c.at(1)))
  tseg(p, V, (c.at(0) + rx, c.at(1)))
  dseg(p, V, c)
})

#let fig-G-2-1() = G1parts(fig-G-2-1a(), fig-G-2-1b(), fig-G-2-1c(), fig-G-2-1d())

#let fig-G-2-2a(width: 215 * k) = px-canvas(215, 175, origin: (438, 335), width: width, (p, u) => {
  import cetz.draw: *
  let A = (460, 482)
  let B = (582, 482)
  let C = (630, 437)
  let D = (507, 435)
  let E = (460, 405)
  let F = (582, 405)
  let G = (630, 358)
  let H = (507, 358)
  G1-cube(p, A, B, C, D, E, F, G, H)
  dseg(p, A, G)
  dseg(p, B, H)
  dseg(p, E, C)
  dseg(p, F, D)
  L(p, 452, 500, $A$)
  L(p, 581, 504, $B$)
  L(p, 645, 438, $C$)
  L(p, 492, 427, $D$)
  L(p, 447, 402, $E$)
  L(p, 594, 414, $F$)
  L(p, 638, 347, $G$)
  L(p, 503, 345, $H$)
})

#let fig-G-2-2b(width: 205 * k) = px-canvas(205, 210, origin: (695, 300), width: width, (p, u) => {
  import cetz.draw: *
  let V = (784, 327)
  let A = (737, 486)
  let B = (833, 486)
  let C = (878, 446)
  let D = (787, 419)
  let E = (713, 440)
  tpoly(p, (C, B, A, E))
  for q in (E, A, B, C) { tseg(p, V, q) }
  dseg(p, V, D)
  dseg(p, E, D)
  dseg(p, D, C)
  L(p, 783, 310, $V$)
  L(p, 701, 447, $E$)
  L(p, 737, 503, $A$)
  L(p, 836, 502, $B$)
  L(p, 894, 446, $C$)
  L(p, 790, 433, $D$)
})

#let fig-G-2-2() = G1parts(fig-G-2-2a(), fig-G-2-2b())

#let fig-G-2-3(width: 230 * k) = px-canvas(230, 285, origin: (668, 1025), width: width, (p, u) => {
  import cetz.draw: *
  let A1 = (738, 1120)
  let B1 = (846, 1100)
  let C1 = (866, 1062)
  let D1 = (778, 1050)
  let E1 = (702, 1080)
  let dy = 167
  let (A, B, C, D, E) = (A1, B1, C1, D1, E1).map(q => (q.at(0), q.at(1) + dy))
  tpoly(p, (A1, B1, C1, D1, E1, A1))
  for (t, b) in ((A1, A), (B1, B), (C1, C), (E1, E)) { tseg(p, t, b) }
  tpoly(p, (E, A, B, C))
  dseg(p, D1, D)
  dseg(p, E, D)
  dseg(p, D, C)
  // 高 H₁H
  let H1 = (757, 1083)
  let H = (779, 1250)
  dseg(p, H1, H)
  L(p, 776, 1035, $D_1$)
  L(p, 683, 1071, $E_1$)
  L(p, 886, 1065, $C_1$)
  L(p, 829, 1123, $B_1$)
  L(p, 718, 1137, $A_1$)
  L(p, 738, 1092, $H_1$)
  L(p, 793, 1203, $D$)
  L(p, 883, 1232, $C$)
  L(p, 684, 1250, $E$)
  L(p, 765, 1258, $H$)
  L(p, 856, 1283, $B$)
  L(p, 738, 1303, $A$)
})

#let fig-G-2-4(width: 200 * k) = px-canvas(200, 330, origin: (660, 420), width: width, (p, u) => {
  import cetz.draw: *
  let A1 = (710, 507)
  let B1 = (780, 497)
  let C1 = (818, 447)
  let D1 = (765, 440)
  let E1 = (692, 485)
  let top = (A1, B1, C1, D1, E1)
  let sh(q, d) = (q.at(0) - d * 0.03, q.at(1) + d)
  let (A, B, C, D, E) = top.map(q => sh(q, 214))
  // 两个截面 P、Q：阴影
  // 截面顶点按扫描读（A、B、C、D、E 顺序），原图并非严格平移
  let secs = (
    ((707, 551), (779, 550), (817, 510), (764, 505), (690, 530)),
    ((706, 620), (779, 619), (817, 575), (763, 575), (689, 600)),
  )
  for s in secs {
    ghatch(p, s, gap: 7, deg: 50, th: 0.5pt)
    tpoly(p, (s.at(4), s.at(0), s.at(1), s.at(2)))
    seg(p, s.at(2), s.at(3), stroke: lt)
    seg(p, s.at(3), s.at(4), stroke: lt)
  }
  tpoly(p, (A1, B1, C1, D1, E1, A1))
  for (t, b) in ((A1, A), (B1, B), (C1, C), (E1, E)) { tseg(p, t, b) }
  tpoly(p, (E, A, B, C))
  dseg(p, D1, D)
  dseg(p, E, D)
  dseg(p, D, C)
  L(p, 763, 430, $D_1$)
  L(p, 840, 452, $C_1$)
  L(p, 676, 476, $E_1$)
  L(p, 722, 500, $A_1$)
  L(p, 797, 508, $B_1$)
  L(p, 752, 532, $P$)
  L(p, 745, 600, $Q$)
  L(p, 748, 646, $D$)
  L(p, 838, 666, $C$)
  L(p, 670, 700, $E$)
  L(p, 780, 725, $B$)
  L(p, 706, 745, $A$)
})

#let fig-G-2-5a(width: 190 * k) = px-canvas(190, 210, origin: (240, 298), width: width, (p, u) => {
  import cetz.draw: *
  let T1 = (292, 352)
  let T2 = (376, 303)
  let T3 = (425, 342)
  let d = (-46, 147)
  let (B1, B2, B3) = (T1, T2, T3).map(q => (q.at(0) + d.at(0), q.at(1) + d.at(1)))
  tpoly(p, (T1, T2, T3, T1))
  tseg(p, T1, B1)
  tseg(p, T3, B3)
  tseg(p, B1, B3)
  dseg(p, T2, B2)
  dseg(p, B1, B2)
  dseg(p, B2, B3)
})

#let fig-G-2-5b(width: 145 * k) = px-canvas(145, 210, origin: (455, 295), width: width, (p, u) => {
  import cetz.draw: *
  let tl = (461, 327)
  let tb = (530, 301)
  let tr = (594, 317)
  let tf = (507, 349)
  let dy = 150
  let (bl, bb, br, bf) = (tl, tb, tr, tf).map(q => (q.at(0), q.at(1) + dy))
  tpoly(p, (tl, tb, tr, tf, tl))
  for (t, b) in ((tl, bl), (tf, bf), (tr, br)) { tseg(p, t, b) }
  tpoly(p, (bl, bf, br))
  dseg(p, tb, bb)
  dseg(p, bl, bb)
  dseg(p, bb, br)
})

#let fig-G-2-5c(width: 145 * k) = px-canvas(145, 210, origin: (625, 295), width: width, (p, u) => {
  import cetz.draw: *
  let l = (629, 322)
  let b = (698, 300)
  let r = (767, 320)
  let fr = (740, 351)
  let fl = (656, 351)
  let dy = 147
  let (L1, B1, R1, FR1, FL1) = (l, b, r, fr, fl).map(q => (q.at(0), q.at(1) + dy))
  tpoly(p, (l, b, r, fr, fl, l))
  for (t, q) in ((l, L1), (fl, FL1), (fr, FR1), (r, R1)) { tseg(p, t, q) }
  tpoly(p, (L1, FL1, FR1, R1))
  dseg(p, b, B1)
  dseg(p, L1, B1)
  dseg(p, B1, R1)
})

#let fig-G-2-5() = G1parts(fig-G-2-5a(), fig-G-2-5b(), fig-G-2-5c())
