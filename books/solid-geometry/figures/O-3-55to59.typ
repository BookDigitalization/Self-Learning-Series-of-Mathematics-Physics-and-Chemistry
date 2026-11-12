// 图 3·55（原书 p.265）、3·56、3·57（p.266）、3·58 (1)(2)、3·59（p.267）；页面 200 dpi 坐标。
#import "O-base.typ": *

// 图 3·55 球
#let fig-O-3-55(width: 210 * k) = px-canvas(210, 220, origin: (690, 915), width: width, (p, u) => {
  import cetz.draw: *
  let O = (794, 1022)
  let r = 88
  circ(p, O, r, stroke: lb)
  O-ell(p, (794, 1012), 88, 24)
  let A = (794, 934)
  let B = (794, 1110)
  dseg(p, A, B)
  let C = O-cpt(O, r, 55)
  let D = O-cpt(O, r, 235)
  dseg(p, C, D)
  L(p, 796, 922, $A$)
  L(p, 796, 1124, $B$)
  L(p, 862, 944, $C$)
  L(p, 724, 1100, $D$)
  L(p, 779, 1020, $O$)
})

// 图 3·56 平面过球心
#let fig-O-3-56(width: 395 * k) = px-canvas(395, 185, origin: (100, 1188), width: width, (p, u) => {
  import cetz.draw: *
  let O = (289, 1275)
  let r = 87
  // 球的轮廓：平面内、截面圆以下的部分被平面遮住画虚线
  O-arc(p, O, r, -32.7, 180)
  O-arc(p, O, r, 180, 212.7, st: dsh)
  O-arc(p, O, r, 212.7, 327.3)
  O-arc(p, O, r, 327.3, 360, st: dsh)
  O-ell(p, O, 86, 27)
  // 平面 M：上边在球内的部分虚线
  let TL = (207, 1215)
  let TR = (487, 1215)
  seg(p, TL, (226, 1215))
  dseg(p, (226, 1215), (352, 1215))
  seg(p, (352, 1215), TR)
  poly(p, (TR, (382, 1322), (106, 1322), TL))
  let A = O-ept(O, 86, 27, 120)
  let B = O-ept(O, 86, 27, 228)
  let C = O-ept(O, 86, 27, 300)
  dseg(p, A, O)
  seg(p, O, B)
  dseg(p, O, C)
  L(p, 241, 1256, $A$)
  L(p, 229, 1300, $B$)
  L(p, 337, 1301, $C$)
  L(p, 298, 1264, $O$)
  L(p, 447, 1230, $M$)
})

// 图 3·57 平面不过球心
#let fig-O-3-57(width: 420 * k) = px-canvas(420, 200, origin: (448, 1160), width: width, (p, u) => {
  import cetz.draw: *
  let O = (665, 1261)
  let r = 95
  O-arc(p, O, r, -26, 206)
  O-arc(p, O, r, 206, 238.5, st: dsh)
  O-arc(p, O, r, 238.5, 301.5)
  O-arc(p, O, r, 301.5, 334, st: dsh)
  let O1 = (669, 1301)
  O-ell(p, O1, 80, 29)
  let TL = (561, 1235)
  let TR = (861, 1225)
  let tx(x) = (x, 1235 - 10 * (x - 561) / 300)
  seg(p, TL, tx(575))
  dseg(p, tx(575), tx(755))
  seg(p, tx(755), TR)
  poly(p, (TR, (756, 1340), (455, 1347), TL))
  let A = O-ept(O1, 80, 29, 118)
  let B = O-ept(O1, 80, 29, 228)
  let C = O-ept(O1, 80, 29, 312)
  dseg(p, O, A)
  dseg(p, O, B)
  seg(p, O, C)
  seg(p, O, O1)
  dseg(p, O1, A)
  seg(p, O1, B)
  seg(p, O1, C)
  pdot(p, O, r: 1.6)
  L(p, 665, 1248, $O$)
  L(p, 627, 1268, $A$)
  L(p, 620, 1310, $B$)
  L(p, 727, 1306, $C$)
  L(p, 674, 1318, $O_1$)
  L(p, 822, 1241, $M$)
})

// 图 3·58 (1) 经线
#let fig-O-3-58a(width: 290 * k) = px-canvas(290, 300, origin: (170, 578), width: width, (p, u) => {
  import cetz.draw: *
  let c = (313, 730)
  let r = 123
  circ(p, c, r, stroke: lb)
  let lat = 77
  // 两极附近的小纬圈（前半）
  O-earc(p, (313, 730 - r * calc.sin(lat * 1deg)), r * calc.cos(lat * 1deg), 8, 180, 360)
  O-earc(p, (313, 730 + r * calc.sin(lat * 1deg)), r * calc.cos(lat * 1deg), 8, 180, 360)
  // 经线：视角经度 λ 处的前半经线
  for lam in (-80, -63, -45, -28, -10, 8, 25, 43, 60, 78) {
    line(..range(41).map(i => {
      let t = -lat + 2 * lat * i / 40
      p(c.at(0) + r * calc.cos(t * 1deg) * calc.sin(lam * 1deg), c.at(1) - r * calc.sin(t * 1deg))
    }), stroke: lw)
  }
  Ls(p, 217, 726, [20°])
  Ls(p, 248, 742, [0°])
  Ls(p, 271, 756, [20°])
  Ls(p, 297, 768, [40°])
  Ls(p, 328, 770, [60°])
  Ls(p, 356, 745, [80°])
  Ls(p, 382, 724, [100°])
  Ls(p, 407, 701, [120°])
  content(p(302, 591), tt[北极])
  content(p(318, 869), tt[南极])
})

// 图 3·58 (2) 纬线
#let fig-O-3-58b(width: 340 * k) = px-canvas(340, 300, origin: (535, 578), width: width, (p, u) => {
  import cetz.draw: *
  let c = (687, 735)
  let r = 124
  circ(p, c, r, stroke: lb)
  seg(p, (c.at(0) - r, 735), (c.at(0) + r, 735))
  // 纬线：(纬度, 弯曲量)；北半球向下弯，南半球向上弯
  for (phi, s) in ((20, 17), (40, 19), (60, 17), (80, 9)) {
    let y = 735 - r * calc.sin(phi * 1deg)
    O-earc(p, (687, y), r * calc.cos(phi * 1deg), s, 180, 360)
    let y2 = 735 + r * calc.sin(phi * 1deg)
    O-earc(p, (687, y2), r * calc.cos(phi * 1deg), (13, 22, 22, 12).at(int(phi / 20) - 1), 0, 180)
  }
  Ls(p, 647, 601, [80°])
  content(p(692, 600), tt[北极])
  Ls(p, 734, 601, [80°])
  Ls(p, 615, 615, [60°])
  Ls(p, 762, 616, [60°])
  Ls(p, 584, 640, [40°])
  Ls(p, 797, 646, [40°])
  Ls(p, 553, 677, [20°])
  Ls(p, 824, 682, [20°])
  Ls(p, 549, 731, [0°])
  Ls(p, 823, 731, [0°])
  content(p(856, 731), tt[赤道])
  Ls(p, 551, 783, [20°])
  Ls(p, 824, 783, [20°])
  Ls(p, 570, 824, [40°])
  Ls(p, 797, 818, [40°])
  Ls(p, 600, 850, [60°])
  Ls(p, 768, 845, [60°])
  Ls(p, 647, 867, [80°])
  content(p(690, 871), tt[南极])
  Ls(p, 727, 867, [80°])
})

// 图 3·59 切面
#let fig-O-3-59(width: 375 * k) = px-canvas(375, 210, origin: (543, 1093), width: width, (p, u) => {
  import cetz.draw: *
  let O = (730, 1186)
  let r = 88
  circ(p, O, r)
  O-ell(p, (730, 1189), 88, 26)
  let TL = (626, 1148)
  let TR = (912, 1143)
  let ty(x) = 1148 - 5 * (x - 626) / 286
  let dx = calc.sqrt(r * r - (1147 - 1186) * (1147 - 1186))
  seg(p, TL, (730 - dx, ty(730 - dx)))
  dseg(p, (730 - dx, ty(730 - dx)), (730 + dx, ty(730 + dx)))
  seg(p, (730 + dx, ty(730 + dx)), TR)
  seg(p, TR, (832, 1286))
  seg(p, (832, 1286), (747, 1287))
  seg(p, (718, 1288), (547, 1292))
  seg(p, (547, 1292), TL)
  let A = (730, 1274)
  let B = (645, 1275)
  dseg(p, O, A)
  seg(p, B, A)
  // OB：球外部分实线，球内部分虚线
  let X = O-lerp(O, B, r / calc.sqrt((B.at(0) - 730) * (B.at(0) - 730) + (1275 - 1186) * (1275 - 1186)))
  dseg(p, O, X)
  seg(p, X, B)
  L(p, 742, 1180, $O$)
  L(p, 731, 1292, $A$)
  L(p, 630, 1279, $B$)
  L(p, 877, 1162, $M$)
})
