// 图 3·45（原书 p.254）、3·46（p.255）、3·47、3·48（p.256）、3·49（p.257）；页面 200 dpi 坐标。
#import "N-base.typ": *

// 图 3·45：圆锥及其内接正六棱锥
#let fig-N-3-45(width: 240 * k) = px-canvas(240, 305, origin: (625, 1025), width: width, (p, u) => {
  import cetz.draw: *
  let S = (743, 1050)
  let c = (745, 1258)
  let (rx, ry) = (93, 55)
  // 底面六边形顶点：A、B、C、D（前面）、E、F（后面）
  let (A, B, C, D, E, F) = (180, 239, 304, 0, 64, 119).map(t => N-ept(c, rx, ry, t))
  N-bell(p, c, rx, ry)
  N-tseg(p, A, B)
  N-tseg(p, B, C)
  N-tseg(p, C, D)
  dseg(p, D, E)
  dseg(p, E, F)
  dseg(p, F, A)
  dseg(p, A, D)
  for q in (A, B, C, D) { seg(p, S, q) }
  for q in (E, F) { dseg(p, S, q) }
  N-L(p, 743, 1036, $S$)
  N-L(p, 638, 1259, $A$)
  N-L(p, 692, 1322, $B$)
  N-L(p, 797, 1322, $C$)
})

// 图 3·46：圆锥的轴截面（等腰直角三角形）
#let fig-N-3-46(width: 270 * k) = px-canvas(270, 175, origin: (625, 790), width: width, (p, u) => {
  import cetz.draw: *
  let (S, A, B, O) = ((769, 808), (650, 940), (868, 940), (769, 940))
  poly(p, (S, A, B), close: true)
  seg(p, S, O)
  N-L(p, 769, 795, $S$)
  N-L(p, 637, 942, $A$)
  N-L(p, 881, 944, $B$)
  N-L(p, 769, 956, $O$)
})

// 图 3·47：圆锥的轴截面（母线 l、半径 r、高 h）
#let fig-N-3-47(width: 220 * k) = px-canvas(220, 195, origin: (652, 285), width: width, (p, u) => {
  import cetz.draw: *
  let (S, A, B, O) = ((767, 297), (667, 474), (858, 474), (767, 474))
  poly(p, (S, A, B), close: true)
  seg(p, S, O)
  N-L(p, 706, 390, $l$)
  N-L(p, 777, 416, $h$)
  N-L(p, 722, 464, $r$)
})

// 图 3·48：圆锥，底面圆 O 内的弦 AB
#let fig-N-3-48(width: 225 * k) = px-canvas(225, 260, origin: (650, 888), width: width, (p, u) => {
  import cetz.draw: *
  let S = (760, 912)
  let O = (761, 1088)
  let (rx, ry) = (82, 50)
  let A = N-ept(O, rx, ry, 180)
  let C = N-ept(O, rx, ry, 0)
  let B = N-ept(O, rx, ry, -46)
  let M = N-foot(A, B, O)
  N-ell(p, O, rx, ry)
  seg(p, S, A)
  seg(p, S, C)
  dseg(p, S, O)
  dseg(p, A, O)
  dseg(p, O, B)
  dseg(p, A, B)
  dseg(p, O, M)
  N-L(p, 760, 898, $S$)
  N-L(p, 750, 943, $β$)
  N-L(p, 770, 1035, $h$)
  N-L(p, 666, 1097, $A$)
  N-L(p, 856, 1093, $C$)
  N-L(p, 826, 1140, $B$)
  N-L(p, 773, 1079, $O$)
  N-L(p, 730, 1080, $r$)
  N-L(p, 747, 1124, $M$)
})

// 图 3·49：圆锥被平行于底面的截面所截
#let fig-N-3-49(width: 220 * k) = px-canvas(220, 280, origin: (695, 570), width: width, (p, u) => {
  import cetz.draw: *
  let S = (800, 588)
  let O1 = (800, 675)
  let O = (800, 782)
  let (A, B) = ((720, 782), (880, 782))
  N-ell(p, O1, 37, 23)
  N-bell(p, O, 80, 46)
  seg(p, S, A)
  seg(p, S, B)
  dseg(p, S, O)
  N-tseg(p, A, B)
  N-tseg(p, O1, (837, 675))
  N-L(p, 800, 577, $S$)
  N-L(p, 783, 678, $O_1$)
  N-L(p, 819, 667, $r'$)
  N-L(p, 854, 679, $B_1$)
  N-L(p, 707, 787, $A$)
  N-L(p, 894, 787, $B$)
  N-L(p, 789, 771, $O$)
  N-L(p, 848, 772, $r$)
  N-L(p, 823, 842, $N$)
})
