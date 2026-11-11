// 习题 3·5 第 4 题（原书 p.196）、习题 3·6 第 15 题（p.205）的插图；页面 120 dpi 坐标。
#import "K-base.typ": *

// 习题 3·5 第 4 题：K、M 为两腰 BC、AD 的中点，DE ⊥ AB 交 MK 于 F
#let fig-K-q5-4(width: 330 * k) = px-canvas(330, 170, origin: (315, 922), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((335, 1072), (625, 1072), (527, 938), (380, 938))
  let M = K-lerp(A, D, 0.5)
  let K = K-lerp(B, C, 0.5)
  let (E, F) = ((380, 1072), (380, M.at(1)))
  poly(p, (A, B, C, D), close: true)
  seg(p, D, K)
  seg(p, A, K)
  seg(p, M, K, stroke: lt)
  seg(p, D, E, stroke: dsh)
  rtmark(p, E, D, B, s: 8)
  rtmark(p, F, D, K, s: 8)
  lbl(p, D, $D$, dir: "nw", d: 9)
  lbl(p, C, $C$, dir: "ne", d: 9)
  lbl(p, M, $M$, dir: "w", d: 11)
  lbl(p, K, $K$, dir: "e", d: 11)
  lbl(p, F, $F$, dir: "se", d: 11)
  lbl(p, E, $E$, dir: "s", d: 11)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, B, $B$, dir: "se", d: 9)
})

// 习题 3·6 第 15 题：P 为 △ABC 内一点，EF ∥ AB，GH ∥ CA，MN ∥ BC，S₁、S₂、S₃ 为三个小三角形的面积
#let fig-K-q6-15(width: 340 * k) = px-canvas(340, 250, origin: (540, 620), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((766, 640), (562, 845), (860, 845))
  let P = (761, 772)
  let N = (A.at(0) + (B.at(0) - A.at(0)) * (P.at(1) - A.at(1)) / (B.at(1) - A.at(1)), P.at(1))
  let M = (A.at(0) + (C.at(0) - A.at(0)) * (P.at(1) - A.at(1)) / (C.at(1) - A.at(1)), P.at(1))
  // EF ∥ AB：P + t (-1, 1)·(AB 方向)；F 在 BC 上，E 在 AC 上
  let ab = (B.at(0) - A.at(0), B.at(1) - A.at(1))
  let F = (P.at(0) + ab.at(0) * (845 - P.at(1)) / ab.at(1), 845)
  // E：直线 P + s·ab 与 AC 的交点
  let ac = (C.at(0) - A.at(0), C.at(1) - A.at(1))
  let den = ab.at(0) * ac.at(1) - ab.at(1) * ac.at(0)
  let s = ((A.at(0) - P.at(0)) * ac.at(1) - (A.at(1) - P.at(1)) * ac.at(0)) / den
  let E = (P.at(0) + s * ab.at(0), P.at(1) + s * ab.at(1))
  // GH ∥ CA：G 在 BC 上，H 在 AB 上
  let G = (P.at(0) + ac.at(0) * (845 - P.at(1)) / ac.at(1), 845)
  let den2 = ac.at(0) * ab.at(1) - ac.at(1) * ab.at(0)
  let s2 = ((A.at(0) - P.at(0)) * ab.at(1) - (A.at(1) - P.at(1)) * ab.at(0)) / den2
  let H = (P.at(0) + s2 * ac.at(0), P.at(1) + s2 * ac.at(1))
  poly(p, (A, B, C), close: true)
  seg(p, E, F)
  seg(p, G, H)
  seg(p, N, M)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "sw", d: 10)
  lbl(p, C, $C$, dir: "se", d: 10)
  lbl(p, E, $E$, dir: "e", d: 10)
  lbl(p, M, $M$, dir: "e", d: 10)
  lbl(p, F, $F$, dir: "s", d: 10)
  lbl(p, G, $G$, dir: "s", d: 10)
  lbl(p, N, $N$, dir: "w", d: 10)
  lbl(p, H, $H$, dir: "nw", d: 10)
  lbl(p, P, $P$, dir: "n", d: 10)
  content(p(800, 762), K-sm($S_1$))
  content(p(706, 746), K-sm($S_3$))
  content(p(752, 818), K-sm($S_2$))
})
