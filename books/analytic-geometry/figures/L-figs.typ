// 图 4·1–4·5：原书 p.196、198、199、201，读图 150 dpi。
// 坐标轴整理为水平、铅直；圆及点按原图关系重绘。
#import "/common/geo.typ": *
#let L-t(p, pt, body) = { import cetz.draw: *; content(p(..pt), tt(body)) }
#let L-axes(p, ox, oy, xmin, xmax, ymin, ymax) = {
  import cetz.draw: *
  line(p(xmin, oy), p(xmax, oy), stroke: lt, mark: arw)
  line(p(ox, ymax), p(ox, ymin), stroke: lt, mark: arw)
  L-t(p, (xmax+12, oy), $x$)
  L-t(p, (ox, ymin - 12), $y$)
  L-t(p, (ox - 9, oy+10), $O$)
}
#let fig-L-4-1() = px-canvas(275, 255, origin: (75, 285), width: 5.4cm, (p, u) => {
  import cetz.draw: *
  L-axes(p, 195, 429, 88, 324, 314, 524)
  circ(p, (195, 429), 73)
  seg(p, (195, 429), (244, 375))
  seg(p, (244, 375), (244, 429))
  pdot(p, (195, 429)); pdot(p, (244, 375))
  L-t(p, (278, 372), $P(x, y)$)
  L-t(p, (215, 393), $r$)
  L-t(p, (221, 442), $x$)
  L-t(p, (254, 403), $y$)
})
#let fig-L-4-2() = px-canvas(310, 255, origin: (365, 285), width: 5.4cm, (p, u) => {
  import cetz.draw: *
  L-axes(p, 456, 453, 379, 650, 308, 529)
  circ(p, (504, 428), 74)
  seg(p, (504, 428), (555, 375))
  pdot(p, (504, 428)); pdot(p, (555, 375))
  L-t(p, (588, 372), $P(x, y)$)
  L-t(p, (524, 442), $C(a, b)$)
})
#let fig-L-4-3() = px-canvas(270, 265, origin: (250, 495), width: 5.7cm, (p, u) => {
  import cetz.draw: *
  L-axes(p, 356, 670, 272, 495, 526, 748)
  circ(p, (383, 616), 54)
  for i in (-2, -1, 1, 2, 3, 4) { seg(p, (356+i*27, 670), (356+i*27, 666)) }
  for i in (-2, -1, 1, 2, 3, 4) { seg(p, (356, 670-i*27), (360, 670-i*27)) }
  for pt in ((329, 589), (383, 616), (410, 643)) { pdot(p, pt) }
  L-t(p, (298, 576), $M_1(-1, 3)$)
  L-t(p, (387, 601), $(1, 2)$)
  L-t(p, (405, 628), $M_2(2, 1)$)
})
#let fig-L-4-4() = px-canvas(330, 325, origin: (360, 725), width: 6.2cm, (p, u) => {
  import cetz.draw: *
  L-axes(p, 516, 966, 373, 660, 753, 1037)
  circ(p, (498, 912), 90)
  seg(p, (498, 912), (562, 848))
  pdot(p, (498, 912))
  for i in (-5, -4, -3, -2, -1, 1, 2, 3, 4, 5) {
    seg(p, (516+i*18, 966), (516+i*18, 962))
  }
  for i in (-3, -2, -1, 1, 2, 3, 4, 5) {
    seg(p, (516, 966-i*18), (520, 966-i*18))
  }
  L-t(p, (491, 927), $(-1, 3)$)
  L-t(p, (535, 866), $5$)
})
#let fig-L-4-5() = px-canvas(350, 325, origin: (210, 730), width: 6.2cm, (p, u) => {
  import cetz.draw: *
  L-axes(p, 326, 985, 219, 531, 756, 1048)
  circ(p, (361, 901), 91)
  seg(p, (361, 901), (426, 837))
  pdot(p, (361, 901))
  for i in (-4, -3, -2, -1, 1, 2, 3, 4, 5, 6, 7) {
    seg(p, (326+i*21, 985), (326+i*21, 981))
  }
  for i in (-2, -1, 1, 2, 3, 4, 5, 6, 7) {
    seg(p, (326, 985-i*21), (330, 985-i*21))
  }
  L-t(p, (366, 920), $(5/3, 4)$)
  L-t(p, (397, 862), $13/3$)
  L-t(p, (317, 965), $1$)
  L-t(p, (347, 976), $1$)
})
