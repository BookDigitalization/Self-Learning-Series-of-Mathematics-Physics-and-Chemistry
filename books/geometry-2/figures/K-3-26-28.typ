// 图 3·26（原书 p.200）、图 3·27（p.201）、图 3·28（p.203）；页面 120 dpi 坐标。
#import "K-base.typ": *

// 图 3·26 例 2：AC 五等分，AP = AC/5；过 A 作辅助线 AT，等分点处引平行于 AB 的虚线（作图痕迹）
#let fig-K-3-26(width: 380 * k) = px-canvas(380, 260, origin: (285, 340), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, E) = ((305, 578), (653, 577), (558, 361), (401, 578))
  let T = (395, 361)
  let D = K-lerp(A, C, 0.7)   // 原图 D 在 AC 上（约 0.7 处）
  let P = K-lerp(A, C, 0.2)
  seg(p, A, T, stroke: dsh)
  seg(p, T, C, stroke: dsh)
  for i in (1, 2, 3, 4) {
    let q = K-lerp(A, C, i / 5)
    let y = q.at(1)
    let x0 = A.at(0) + (T.at(0) - A.at(0)) * (A.at(1) - y) / (A.at(1) - T.at(1))
    seg(p, (x0, y), q, stroke: dsh)
  }
  seg(p, A, B)
  seg(p, A, C)
  seg(p, B, C)
  seg(p, E, D)
  seg(p, D, B, stroke: dsh)
  seg(p, P, E, stroke: dsh)
  lbl(p, C, $C$, dir: "n", d: 10)
  lbl(p, D, $D$, dir: "nw", d: 13)
  lbl(p, P, $P$, dir: "n", d: 10)
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, E, $E$, dir: "s", d: 11)
  lbl(p, B, $B$, dir: "se", d: 10)
})

// 图 3·27 相似五边形 ABCDE、A'B'C'D'E'，对角线 AC、AD 与 A'C'、A'D'（虚线）
#let fig-K-3-27(width: 500 * k) = px-canvas(500, 215, origin: (300, 895), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D, E) = ((369, 1090), (518, 1088), (555, 975), (398, 913), (334, 997))
  let (A1, B1, C1, D1, E1) = ((629, 1088), (723, 1088), (745, 1016), (646, 975), (605, 1023))
  poly(p, (A, B, C, D, E), close: true)
  seg(p, A, C, stroke: dsh)
  seg(p, A, D, stroke: dsh)
  poly(p, (A1, B1, C1, D1, E1), close: true)
  seg(p, A1, C1, stroke: dsh)
  seg(p, A1, D1, stroke: dsh)
  lbl(p, D, $D$, dir: "n", d: 10)
  lbl(p, C, $C$, dir: "e", d: 10)
  lbl(p, E, $E$, dir: "w", d: 10)
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, B, $B$, dir: "s", d: 11)
  lbl(p, D1, $D'$, dir: "n", d: 10)
  lbl(p, C1, $C'$, dir: "e", d: 11)
  lbl(p, E1, $E'$, dir: "w", d: 11)
  lbl(p, A1, $A'$, dir: "sw", d: 10)
  lbl(p, B1, $B'$, dir: "s", d: 11)
})

// 图 3·28 例 3：直角三角形 ABC（直角在 C），以 BC、CA、AB 为对应边作相似多边形 P、Q、R
#let fig-K-3-28(width: 330 * k) = px-canvas(330, 305, origin: (570, 215), width: width, (p, u) => {
  import cetz.draw: *
  let (B, C, A) = ((713, 297), (706, 429), (779, 431))
  poly(p, (B, C, A), close: true)
  rtmark(p, C, B, A, s: 8)
  poly(p, (B, (633, 272), (585, 334), (642, 452), C), close: true)
  poly(p, (B, (779, 226), (865, 272), (866, 415), A), close: true)
  poly(p, (C, (692, 473), (725, 510), (815, 472), A), close: true)
  lbl(p, B, $B$, dir: "n", d: 14)
  lbl(p, C, $C$, dir: "se", d: 11)
  lbl(p, A, $A$, dir: "sw", d: 12)
  content(p(647, 353), tt($P$))
  content(p(807, 329), tt($R$))
  content(p(739, 467), tt($Q$))
  content(p(701, 373), K-sm($a$))
  content(p(741, 421), K-sm($b$))
  content(p(755, 359), K-sm($c$))
})

