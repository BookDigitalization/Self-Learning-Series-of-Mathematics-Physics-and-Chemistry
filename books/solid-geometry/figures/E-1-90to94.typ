// 图 1·90（p.80）、1·91（p.80）、1·92（p.81）、1·93（p.82）、1·94（p.83）；页面 200 dpi 坐标。
#import "E-base.typ": *

// 图 1·90 平面 M 过平面 N 的垂线 AB
#let fig-E-1-90(width: 360 * k) = px-canvas(360, 190, origin: (510, 755), width: width, (p, u) => {
  import cetz.draw: *
  // 水平平面 N（画影线）
  let L = (519, 861)
  let T = (648, 800)
  let R = (864, 838)
  let Bt = (733, 903)
  E-hatch(p, L, Bt, R, T, 7)
  seg(p, L, Bt)
  seg(p, Bt, R)
  seg(p, R, (754, 819))
  dseg(p, (754, 819), T)
  dseg(p, T, (619, 814))
  seg(p, (619, 814), L)
  // 竖直平面 M
  let tl = (616, 766)
  let tr = (754, 793)
  let br = (762, 934)
  let bl = (624, 909)
  poly(p, (tl, tr, br, bl), close: true)
  // 交线 CD、垂线 AB、BE
  let C = (620, 839)
  let D = (761, 862)
  let B = (665, 846)
  let A = (661, 777)
  let E = (622, 876)
  E-bold(p, (C, D))
  seg(p, A, B)
  seg(p, B, E)
  lbl(p, A, $A$, dir: "ne", d: 10)
  lbl(p, B, $B$, dir: "ne", d: 12)
  lbl(p, C, $C$, dir: "nw", d: 11)
  lbl(p, D, $D$, dir: "se", d: 12)
  lbl(p, E, $E$, dir: "sw", d: 12)
  lbl(p, (740, 806), $M$, dir: "c", d: 0)
  lbl(p, (826, 846), $N$, dir: "c", d: 0)
})

// 图 1·91 过 AB 的平面 P、Q、R 都垂直于平面 M
#let fig-E-1-91(width: 360 * k) = px-canvas(360, 200, origin: (530, 1170), width: width, (p, u) => {
  import cetz.draw: *
  // 平面 M
  let Ml = (544, 1342)
  let Mt1 = (635, 1252)
  let Mt2 = (856, 1259)
  let Mb = (765, 1348)
  poly(p, (Ml, Mt1))
  E-bold(p, (Ml, Mb, Mt2))
  seg(p, Mt2, (792, 1257))
  dseg(p, (792, 1257), (637, 1253))
  let A = (716, 1205)
  let B = (715, 1300)
  // 平面 Q
  poly(p, ((637, 1224), (791, 1189), (786, 1280), (704, 1296), (635, 1319), (637, 1224)))
  // 平面 R
  poly(p, ((689, 1235), A, (759, 1233), (760, 1324), B, (688, 1326), (689, 1235)))
  // 平面 P
  seg(p, (676, 1181), A)
  seg(p, A, (744, 1176))
  // P 的两条竖边：露在平面 Q 上边以上的一段实线，被 Q 遮住的部分虚线
  seg(p, (676, 1181), (675, 1215))
  dseg(p, (675, 1215), (672, 1275))
  seg(p, (744, 1176), (744, 1200))
  dseg(p, (744, 1200), (745, 1272))
  seg(p, (672, 1275), (688, 1284))
  dseg(p, (745, 1272), (727, 1290))
  seg(p, A, B)
  lbl(p, A, $A$, dir: "ne", d: 9)
  lbl(p, B, $B$, dir: "s", d: 11)
  lbl(p, (685, 1196), $P$, dir: "c", d: 0)
  lbl(p, (646, 1236), $Q$, dir: "c", d: 0)
  lbl(p, (704, 1237), $R$, dir: "c", d: 0)
  lbl(p, (569, 1336), $M$, dir: "c", d: 0)
})

// 图 1·92 圆 O 的直径 AB，PA 垂直于圆所在平面
#let fig-E-1-92(width: 250 * k) = px-canvas(250, 170, origin: (700, 450), width: width, (p, u) => {
  import cetz.draw: *
  let A = (724, 554)
  let B = (874, 554)
  let C = (782, 531)
  let P = (724, 464)
  let O = (799, 554)
  // 画影线的三角形 ABC
  let top(x) = if x <= 782 { 554 - (x - 724) * 23 / 58 } else { 531 + (x - 782) * 23 / 92 }
  for i in range(0, 24) {
    let x0 = 728 + i * 6
    if x0 < 872 {
      let h = 0
      let hh = 0
      while hh < 40 {
        let xe = x0 + hh * 0.8
        if xe > 872 or 554 - hh < top(xe) { break }
        h = hh
        hh += 0.5
      }
      line(p(x0, 554), p(x0 + h * 0.8, 554 - h), stroke: 0.4pt)
    }
  }
  // 圆（画成椭圆）：前半实线，后半虚线
  arc(p(..O), start: 180deg, stop: 360deg, radius: (75 * 1, 26 * 1), anchor: "origin", stroke: lw)
  arc(p(..O), start: 0deg, stop: 180deg, radius: (75, 26), anchor: "origin", stroke: dsh)
  E-bold(p, (P, A, B))
  seg(p, P, C)
  seg(p, P, B)
  E-bold(p, (A, C, B))
  lbl(p, P, $P$, dir: "n", d: 10)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, C, $C$, dir: "n", d: 10)
  lbl(p, (798, 570), $O$, dir: "c", d: 0)
})

// 图 1·93 直线 a 平行于平面 M，平面 N 垂直于 a
#let fig-E-1-93(width: 320 * k) = px-canvas(320, 220, origin: (560, 275), width: width, (p, u) => {
  import cetz.draw: *
  // 平面 M
  let Ml = (572, 472)
  let Mr = (775, 475)
  let Mt1 = (657, 401)
  let Mt2 = (861, 402)
  E-bold(p, (Ml, Mr))
  seg(p, Mr, Mt2)
  seg(p, Ml, (619, 432))
  dseg(p, (619, 432), Mt1)
  dseg(p, Mt1, (838, 402))
  seg(p, (838, 402), Mt2)
  // 平面 P（过 a）
  seg(p, (619, 432), (650, 362))
  // P 右边：M 后边以上实线，以下虚线（原图如此）
  seg(p, (852, 364), (838, 400))
  dseg(p, (838, 400), (825, 435))
  // 交线 b：原图全段实线
  seg(p, (619, 432), (825, 435))
  // 直线 a
  dseg(p, (685, 362), (725, 362))
  seg(p, (650, 362), (685, 362))
  E-bold(p, (725, 362), (852, 364))
  // 平面 N
  seg(p, (682, 475), (684, 360))
  seg(p, (684, 360), (762, 285))
  seg(p, (762, 285), (760, 402))
  seg(p, (682, 475), (725, 435))
  dseg(p, (725, 435), (760, 402))
  seg(p, (725, 362), (725, 435))
  lbl(p, (595, 463), $M$, dir: "c", d: 0)
  lbl(p, (751, 322), $N$, dir: "c", d: 0)
  lbl(p, (807, 351), $a$, dir: "c", d: 0)
  lbl(p, (782, 420), $b$, dir: "c", d: 0)
  lbl(p, (837, 383), $P$, dir: "c", d: 0)
})

// 图 1·94 性质定理 1
#let fig-E-1-94(width: 380 * k) = px-canvas(380, 200, origin: (570, 1155), width: width, (p, u) => {
  import cetz.draw: *
  let L = (586, 1251)
  let T = (712, 1197)
  let R = (920, 1244)
  let Bt = (789, 1304)
  E-hatch(p, L, Bt, R, T, 7)
  seg(p, L, Bt)
  seg(p, Bt, R)
  seg(p, R, (816, 1222))
  dseg(p, (816, 1222), T)
  dseg(p, T, (680, 1213))
  seg(p, (680, 1213), L)
  poly(p, ((678, 1161), (815, 1192), (819, 1337), (681, 1306)), close: true)
  let C = (680, 1237)
  let D = (817, 1267)
  let A = (751, 1170)
  let B = (752, 1247)
  let E = (685, 1281)
  E-bold(p, (C, D))
  seg(p, A, B)
  E-bold(p, (B, E))
  lbl(p, A, $A$, dir: "ne", d: 10)
  lbl(p, B, $B$, dir: "ne", d: 12)
  lbl(p, C, $C$, dir: "nw", d: 11)
  lbl(p, D, $D$, dir: "se", d: 12)
  lbl(p, E, $E$, dir: "sw", d: 12)
  lbl(p, (694, 1181), $M$, dir: "c", d: 0)
  lbl(p, (876, 1249), $N$, dir: "c", d: 0)
})
