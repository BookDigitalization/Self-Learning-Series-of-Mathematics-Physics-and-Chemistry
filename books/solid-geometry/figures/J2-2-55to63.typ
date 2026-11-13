// 图 2·55、2·57、2·58、2·59、2·61、2·62、2·63：底本扫描缺页（p.177、179、181、183、185）上的图，
// 据补录本（上海人民出版社第二版，印页码 p.164、167、169、171、172）重绘。
// 坐标取自补录本 300 dpi 页面（页面宽约 736 像素；crop-view.py --offset 10 --dpi 300）。
#import "J-base.typ": *

#let J2k = 0.033cm   // 补录本 300 dpi 页面，1 像素 ≈ 0.033 cm（图约为补录本原图的 1.3 倍）

// 点是否在凸多边形内（页面坐标）
#let J2-inside(pt, pg) = {
  let n = pg.len()
  let s = ()
  for i in range(n) {
    let a = pg.at(i)
    let b = pg.at(calc.rem(i + 1, n))
    s.push((b.at(0) - a.at(0)) * (pt.at(1) - a.at(1)) - (b.at(1) - a.at(1)) * (pt.at(0) - a.at(0)))
  }
  s.all(v => v > 0) or s.all(v => v < 0)
}

// 两平行平面间的几何体的一条线 a→b（高度 ha→hb：0 = 下底面，1 = 上底面）；
// 被高于它的平面遮住的部分画虚线。planes: ((平面高度, 平行四边形四顶点), …)
#let J2-edge(p, a, b, ha, hb, planes, n: 60) = {
  import cetz.draw: *
  let hid(t) = {
    let pt = Jlerp(a, b, t)
    let h = ha + (hb - ha) * t
    planes.any(((hp, pg)) => hp > h + 0.001 and J2-inside(pt, pg))
  }
  let start = 0
  let cur = hid(0.5 / n)
  for i in range(1, n + 1) {
    let st = if i < n { hid((i + 0.5) / n) } else { not cur }
    if st != cur {
      line(p(..Jlerp(a, b, start / n)), p(..Jlerp(a, b, i / n)), stroke: if cur { dsh } else { lw })
      start = i
      cur = st
    }
  }
}

// 平面的后边线：x 在 [x0, x1] 之间（被几何体挡住）画虚线
#let J2-backedge(p, a, b, x0, x1) = {
  let t0 = (x0 - a.at(0)) / (b.at(0) - a.at(0))
  let t1 = (x1 - a.at(0)) / (b.at(0) - a.at(0))
  JS(p, a, Jlerp(a, b, t0))
  JD(p, Jlerp(a, b, t0), Jlerp(a, b, t1))
  JS(p, Jlerp(a, b, t1), b)
}

// 凸多边形内画 "/" 方向的阴影线（x + y = 常数）
#let J2-hatch(p, pts, gap: 3.2) = {
  import cetz.draw: *
  let sums = pts.map(q => q.at(0) + q.at(1))
  let lo = calc.min(..sums)
  let hi = calc.max(..sums)
  let n = pts.len()
  let c = lo + gap / 2
  while c < hi {
    let xs = ()
    for i in range(n) {
      let a = pts.at(i)
      let b = pts.at(calc.rem(i + 1, n))
      let fa = a.at(0) + a.at(1) - c
      let fb = b.at(0) + b.at(1) - c
      if (fa <= 0 and fb > 0) or (fa > 0 and fb <= 0) {
        xs.push(Jlerp(a, b, fa / (fa - fb)))
      }
    }
    if xs.len() >= 2 { line(p(..xs.at(0)), p(..xs.at(1)), stroke: 0.45pt) }
    c += gap
  }
}

// 椭圆（页面坐标）的折线近似
#let J2-ell(c, rx, ry, n: 48) = range(n).map(i => {
  let t = 360deg * i / n
  (c.at(0) + rx * calc.cos(t), c.at(1) + ry * calc.sin(t))
})

#let J2-add(a, b) = (a.at(0) + b.at(0), a.at(1) + b.at(1))

// ---------------------------------------------------------------------------
// 图 2·55（补录本 p.164）：(1) 棱锥 V—ABC；(2) 两部分拼成的多面体
#let fig-J2-2-55(width: 175 * J2k) = px-canvas(215, 170, origin: (443, 685), width: width, (p, u) => {
  import cetz.draw: *
  // (1)
  let (V, B, A, D, C) = ((498, 705), (458, 759), (529, 758), (482, 773), (507, 787))
  JS(p, V, B)
  JS(p, V, A)
  JS(p, V, D)
  JS(p, V, C)
  JS(p, B, D, C, A)
  JD(p, B, A)
  JD(p, D, A)
  L(p, 497, 695, $V$)
  L(p, 450, 760, $B$)
  L(p, 536, 760, $A$)
  L(p, 476, 782, $D$)
  L(p, 508, 799, $C$)
  // (2)
  let (V1, B1, A1, D1, V2) = ((605, 705), (564, 758), (638, 754), (592, 770), (601, 800))
  JS(p, V1, B1)
  JS(p, V1, A1)
  JS(p, V1, D1)
  JD(p, B1, A1)
  JS(p, B1, D1, A1)
  JS(p, B1, V2, A1)
  JS(p, D1, V2)
  L(p, 605, 694, $V$)
  L(p, 556, 758, $B$)
  L(p, 587, 762, $D$)
  L(p, 646, 756, $A$)
  L(p, 600, 812, $V$)
  ctext(p, (502, 843), tt[(1)])
  ctext(p, (598, 843), tt[(2)])
})

// ---------------------------------------------------------------------------
// 图 2·57（补录本 p.167）：以 A 为公共顶点的三个长方体 Q₁、Q、Q₂
// 长方体：A 为前下右顶点，向左 w、向上 h、向后（右上）d
#let J2-box(p, A, w, h, d) = {
  let B = (A.at(0) - w, A.at(1))
  let At = (A.at(0), A.at(1) - h)
  let Bt = (B.at(0), B.at(1) - h)
  let (Ad, Bd, Atd, Btd) = (J2-add(A, d), J2-add(B, d), J2-add(At, d), J2-add(Bt, d))
  JS(p, B, A, At, Bt, B)
  JS(p, Bt, Btd, Atd, At)
  JS(p, A, Ad, Atd)
  JD(p, B, Bd, Ad)
  JD(p, Bd, Btd)
}

#let fig-J2-2-57(width: 125 * J2k) = px-canvas(125, 135, origin: (540, 112), width: width, (p, u) => {
  import cetz.draw: *
  let A = (620, 232)
  J2-box(p, A, 70, 88, (28.5, -25.5))   // Q₂
  J2-box(p, A, 56.5, 72, (20, -18))     // Q
  J2-box(p, A, 49, 56, (14, -13))       // Q₁
  L(p, 545, 141, $Q_2$)
  L(p, 558, 157, $Q$)
  L(p, 578, 172, $Q_1$)
  L(p, 619, 137, $D_2$)
  L(p, 613, 153, $D$)
  L(p, 612, 170, $D_1$)
  L(p, 548, 241, $B_2$)
  L(p, 562, 241, $B$)
  L(p, 575, 241, $B_1$)
  L(p, 620, 241, $A$)
  L(p, 657, 205, $C_2$)
  L(p, 647, 213, $C$)
  L(p, 641, 223, $C_1$)
})

// ---------------------------------------------------------------------------
// 图 2·58、2·59（补录本 p.169）
#let fig-J2-2-58(width: 125 * J2k) = px-canvas(125, 130, origin: (198, 272), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((215, 382), (278, 382), (308, 352), (247, 352))
  let (A1, B1, C1, D1) = ((215, 319), (278, 319), (308, 289), (247, 289))
  JS(p, A, B, B1, A1, A)
  JS(p, A1, D1, C1, B1)
  JS(p, B, C, C1)
  JD(p, A, D, C)
  JD(p, D, D1)
  JD(p, A1, C)
  L(p, 212, 393, $A$)
  L(p, 279, 392, $B$)
  L(p, 317, 354, $C$)
  L(p, 250, 362, $D$)
  L(p, 205, 315, $A_1$)
  L(p, 288, 327, $B_1$)
  L(p, 317, 292, $C_1$)
  L(p, 248, 280, $D_1$)
  L(p, 262, 331, $l$)
})

#let fig-J2-2-59(width: 165 * J2k) = px-canvas(165, 130, origin: (425, 272), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((480, 349), (443, 382), (539, 384), (576, 353))
  let (A1, B1, C1, D1) = ((480, 290), (443, 321), (539, 321), (576, 291))
  JS(p, B, C, C1, B1, B)
  JS(p, B1, A1, D1, C1)
  JS(p, C, D, D1)
  JD(p, B, A, D)
  JD(p, A, A1)
  JD(p, A1, C)
  JD(p, A, C)
  JS(p, B1, C)
  JS(p, D1, C)
  L(p, 481, 280, $A_1$)
  L(p, 587, 286, $D_1$)
  L(p, 432, 321, $B_1$)
  L(p, 551, 330, $C_1$)
  L(p, 474, 344, $A$)
  L(p, 588, 357, $D$)
  L(p, 431, 392, $B$)
  L(p, 540, 395, $C$)
  L(p, 516, 336, $l$)
})

// ---------------------------------------------------------------------------
// 图 2·61（补录本 p.171）：夹在两平行平面间的圆柱与斜棱柱，中间平面截得的截面（阴影）
#let fig-J2-2-61(width: 185 * J2k) = px-canvas(185, 140, origin: (475, 113), width: width, (p, u) => {
  import cetz.draw: *
  let top = ((515, 118), (655, 118), (633, 154), (495, 155))
  let mid = ((505, 165), (656, 164), (633, 204), (482, 205))
  let bot = ((498, 214), (645, 213), (625, 249), (478, 250))
  let hs = 0.48   // 截面的高度
  let planes = ((1, top), (hs, mid), (0, bot))
  // 平面
  JS(p, ..top, top.at(0))
  JS(p, mid.at(1), mid.at(2), mid.at(3), mid.at(0))
  J2-backedge(p, mid.at(0), mid.at(1), 513, 630)
  JS(p, bot.at(1), bot.at(2), bot.at(3), bot.at(0))
  J2-backedge(p, bot.at(0), bot.at(1), 513, 620)
  // 圆柱
  let (rx, ry) = (22, 10)
  let (ct, cb) = ((535, 137), (535, 229))
  let cs = Jlerp(cb, ct, hs)
  poly(p, J2-ell(ct, rx, ry), close: true)
  let es = J2-ell(cs, rx, ry)
  J2-hatch(p, es)
  poly(p, es, close: true)
  let eb = J2-ell(cb, rx, ry)
  JS(p, ..eb.slice(0, 25))
  JD(p, ..eb.slice(24), eb.at(0))
  for dx in (-rx, rx) {
    J2-edge(p, (cb.at(0) + dx, cb.at(1)), (ct.at(0) + dx, ct.at(1)), 0, 1, planes)
  }
  // 斜五棱柱：上底 T、下底 Bt（Bt = T + 平移）
  let T = ((584, 136), (596, 130), (623, 130), (631, 147), (602, 148))
  let sh = (-14, 91)
  let Bt = T.map(q => J2-add(q, sh))
  JS(p, ..T, T.at(0))
  for i in (0, 4, 3) { J2-edge(p, Bt.at(i), T.at(i), 0, 1, planes) }
  for i in (1, 2) { JD(p, Bt.at(i), T.at(i)) }
  JS(p, Bt.at(0), Bt.at(4), Bt.at(3))
  JD(p, Bt.at(3), Bt.at(2), Bt.at(1), Bt.at(0))
  let S = range(5).map(i => Jlerp(Bt.at(i), T.at(i), hs))
  J2-hatch(p, S)
  JS(p, ..S, S.at(0))
})

// ---------------------------------------------------------------------------
// 图 2·62（补录本 p.171）：长方体 ABCD—A₁B₁C₁D₁ 及对角面 BD₁，截面 A₂B₂C₂D₂
#let fig-J2-2-62(width: 115 * J2k) = px-canvas(115, 145, origin: (543, 390), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((561, 519), (625, 519), (642, 487), (579, 487))
  let (A1, B1, C1, D1) = ((561, 436), (625, 436), (642, 405), (579, 405))
  let (A2, B2, C2, D2) = ((561, 477), (625, 477), (642, 445), (579, 445))
  JS(p, A, B, B1, A1, A)
  JS(p, A1, D1, C1, B1)
  JS(p, B, C, C1)
  JD(p, A, D, C)
  JD(p, D, D1)
  JS(p, D1, B1)
  JD(p, D, B)
  JS(p, A2, B2, C2)
  JD(p, A2, D2, C2)
  JS(p, D2, B2)
  L(p, 579, 396, $D_1$)
  L(p, 650, 400, $C_1$)
  L(p, 551, 437, $A_1$)
  L(p, 634, 441, $B_1$)
  L(p, 571, 445, $D_2$)
  L(p, 651, 447, $C_2$)
  L(p, 552, 479, $A_2$)
  L(p, 634, 480, $B_2$)
  L(p, 572, 486, $D$)
  L(p, 650, 486, $C$)
  L(p, 559, 527, $A$)
  L(p, 631, 523, $B$)
})

// ---------------------------------------------------------------------------
// 图 2·63（补录本 p.172）：棱柱 A₁B₁C₁D₁E₁—ABCDE 与等底等高的长方体，夹在平面 M、N 之间，平面 P 截得 F₁、F₂
#let fig-J2-2-63(width: 215 * J2k) = px-canvas(215, 140, origin: (432, 770), width: width, (p, u) => {
  import cetz.draw: *
  let N = ((481, 775), (641, 775), (604, 813), (447, 813))
  let P = ((470, 823), (633, 824), (599, 859), (438, 858))
  let M = ((471, 869), (630, 869), (596, 904), (439, 904))
  let planes = ((1, N), (0.5, P), (0, M))
  JS(p, ..N, N.at(0))
  JS(p, P.at(1), P.at(2), P.at(3), P.at(0))
  J2-backedge(p, P.at(0), P.at(1), 478, 594)
  JS(p, M.at(1), M.at(2), M.at(3), M.at(0))
  J2-backedge(p, M.at(0), M.at(1), 478, 594)
  let up(q, h) = (q.at(0), q.at(1) - 91 * h)
  // 长方体：下底 A₂B₂C₂D₂
  let R = ((478, 894), (513, 894), (530, 879), (494, 879))
  JS(p, ..R.map(q => up(q, 1)), up(R.at(0), 1))
  for i in (0, 1, 2) { J2-edge(p, R.at(i), up(R.at(i), 1), 0, 1, planes) }
  JD(p, R.at(3), up(R.at(3), 1))
  J2-edge(p, R.at(0), R.at(1), 0, 0, planes)
  J2-edge(p, R.at(1), R.at(2), 0, 0, planes)
  JD(p, R.at(2), R.at(3), R.at(0))
  let RS = R.map(q => up(q, 0.5))
  JS(p, RS.at(0), RS.at(1), RS.at(2))
  JD(p, RS.at(2), RS.at(3), RS.at(0))
  // 五棱柱：下底 ABCDE
  let G = ((544, 884), (552, 894), (578, 893), (594, 886), (568, 875))
  JS(p, ..G.map(q => up(q, 1)), up(G.at(0), 1))
  for i in (0, 1, 2, 3) { J2-edge(p, G.at(i), up(G.at(i), 1), 0, 1, planes) }
  JD(p, G.at(4), up(G.at(4), 1))
  for i in (0, 1, 2) { J2-edge(p, G.at(i), G.at(i + 1), 0, 0, planes) }
  JD(p, G.at(3), G.at(4), G.at(0))
  let GS = G.map(q => up(q, 0.5))
  JS(p, GS.at(0), GS.at(1), GS.at(2), GS.at(3))
  JD(p, GS.at(3), GS.at(4), GS.at(0))
  // 标注
  L(p, 622, 783, $N$)
  L(p, 617, 831, $P$)
  L(p, 613, 875, $M$)
  L(p, 503, 841, $F_2$)
  L(p, 563, 838, $F_1$)
  L(p, 540, 784, $A_1$)
  L(p, 575, 780, $E_1$)
  L(p, 604, 798, $D_1$)
  L(p, 560, 796, $B_1$)
  L(p, 589, 808, $C_1$)
  L(p, 488, 872, $D_2$)
  L(p, 473, 899, $A_2$)
  L(p, 520, 901, $B_2$)
  L(p, 537, 879, $C_2$)
  L(p, 548, 878, $A$)
  L(p, 572, 871, $E$)
  L(p, 600, 890, $D$)
  L(p, 549, 902, $B$)
  L(p, 578, 902, $C$)
})
