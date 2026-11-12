// 习题 3·10 的插图：第 3 题（原书 p.263）、第 7 题（p.264）、第 14 题（p.265）；页面 200 dpi 坐标。
#import "N-base.typ": *

// 习题 3·10 第 3 题：圆台 + 截去的圆锥，截面圆 O2
#let fig-N-ex10-3(width: 225 * k) = px-canvas(225, 240, origin: (665, 1005), width: width, (p, u) => {
  import cetz.draw: *
  let V = (768, 1022)
  let (c1, c2, c) = ((768, 1100), (768, 1157), (768, 1213))
  N-ell(p, c1, 37, 14)
  N-bell(p, c2, 64, 20)
  N-bell(p, c, 90, 28)
  seg(p, V, (678, 1213))
  seg(p, V, (858, 1213))
  dseg(p, V, c)
  dseg(p, c1, (805, 1100))
  dseg(p, c2, (832, 1157))
  dseg(p, (678, 1213), (858, 1213))
  N-L(p, 768, 1009, $V$)
  N-L(p, 755, 1101, $O_1$)
  N-L(p, 833, 1097, $A_1$)
  N-L(p, 752, 1161, $O_2$)
  N-L(p, 788, 1148, $x$)
  N-L(p, 852, 1155, $A_2$)
  N-L(p, 768, 1228, $O$)
  N-L(p, 875, 1210, $A$)
})

// 习题 3·10 第 7 题：熔矿炉的纵断面（炉壁画斜线；尺寸单位：米）
#let fig-N-ex10-7(width: 180 * k) = px-canvas(180, 365, origin: (700, 508), width: width, (p, u) => {
  import cetz.draw: *
  let lo = ((727, 532), (712, 788), (725, 845))   // 左壁外缘
  let li = ((742, 532), (726, 788), (737, 845))   // 左壁内缘
  let ri = ((785, 532), (790, 788), (780, 845))   // 右壁内缘
  let ro = ((800, 532), (806, 788), (795, 845))   // 右壁外缘
  // 炉壁斜线：在内外缘之间，按高度取点连线
  let at(path, y) = {
    let (a, b) = if y <= 788 { (path.at(0), path.at(1)) } else { (path.at(1), path.at(2)) }
    let t = (y - a.at(1)) / (b.at(1) - a.at(1))
    (a.at(0) + (b.at(0) - a.at(0)) * t, y)
  }
  for i in range(0, 38) {
    let y = 540 + i * 8
    line(p(..at(li, y)), p(..at(lo, y - 8)), stroke: 0.5pt)
    line(p(..at(ri, y)), p(..at(ro, y - 8)), stroke: 0.5pt)
  }
  for path in (lo, li, ri, ro) { line(..path.map(q => p(..q)), stroke: lw) }
  line(p(727, 532), p(800, 532), stroke: lw)
  line(p(725, 845), p(795, 845), stroke: lw)
  let one = (end: "stealth", fill: black, scale: 0.45)
  // 上口 φ2.4
  line(p(742, 512), p(742, 532), stroke: lt)
  line(p(785, 512), p(785, 532), stroke: lt)
  line(p(714, 520), p(742, 520), stroke: lt, mark: one)
  line(p(818, 520), p(785, 520), stroke: lt, mark: one)
  content(p(842, 519), tt($phi 2.4$))
  // 中部 φ4.0
  line(p(726, 788), p(790, 788), stroke: lt, mark: arw2)
  line(p(806, 788), p(836, 788), stroke: lt)
  content(p(757, 774), tt($phi 4.0$))
  // 下口 φ2.5
  line(p(737, 845), p(737, 868), stroke: lt)
  line(p(780, 845), p(780, 868), stroke: lt)
  line(p(713, 860), p(737, 860), stroke: lt, mark: one)
  line(p(806, 860), p(780, 860), stroke: lt, mark: one)
  content(p(842, 860), tt($phi 2.5$))
  // 高度 13.7、3.1
  line(p(800, 532), p(832, 532), stroke: lt)
  line(p(795, 845), p(832, 845), stroke: lt)
  line(p(822, 532), p(822, 640), stroke: lt, mark: (start: "stealth", fill: black, scale: 0.45))
  line(p(822, 690), p(822, 788), stroke: lt, mark: one)
  content(p(823, 665), tt[13.7], angle: -90deg)
  line(p(822, 788), p(822, 845), stroke: lt, mark: arw2)
  content(p(832, 817), tt[3.1], angle: -90deg)
})

// 习题 3·10 第 14 题：梯形 ABCD 以腰 AB 为轴
#let fig-N-ex10-14(width: 175 * k) = px-canvas(175, 160, origin: (715, 232), width: width, (p, u) => {
  import cetz.draw: *
  let (E, D, A, F, C, B) = ((745, 256), (787, 257), (745, 278), (745, 305), (858, 303), (745, 365))
  N-ddseg(p, (745, 236), (745, 390))
  seg(p, A, B)
  seg(p, E, A)
  seg(p, E, D)
  N-tseg(p, A, D)
  seg(p, D, C)
  seg(p, F, C)
  seg(p, C, B)
  // △ADE 内的斜线
  for t in (0.2, 0.4, 0.6, 0.8) {
    let q = N-lerp(A, D, t)
    let y0 = 256.5
    line(p(..q), p(q.at(0) + (q.at(1) - y0) * 0.9, y0), stroke: 0.5pt)
  }
  anglearc(p, B, A, C, 22)
  N-L(p, 733, 259, $E$)
  N-L(p, 793, 244, $D$)
  N-L(p, 733, 282, $A$)
  N-L(p, 731, 306, $F$)
  N-L(p, 873, 306, $C$)
  N-L(p, 731, 368, $B$)
  N-L(p, 758, 338, $α$)
})
