// 图 3·1（原书 p.162）、图 3·2、图 3·3（p.163）、图 3·4（p.164）、习题 3·1 第 6 题插图（p.165）、图 3·5（p.166）；页面 200 dpi 坐标。
#import "I-base.typ": *

// 图 3·1 四个多边形：四边形、风筝形四边形、六边形、五边形
#let fig-I-3-1(width: 725 * k) = px-canvas(725, 215, origin: (105, 885), width: width, (p, u) => {
  import cetz.draw: *
  poly(p, ((130, 918), (250, 907), (280, 1032), (113, 1017)), close: true)
  poly(p, ((365, 893), (298, 958), (362, 1092), (430, 955)), close: true)
  poly(p, ((492, 910), (582, 910), (625, 978), (580, 1045), (492, 1045), (447, 978)), close: true)
  poly(p, ((722, 900), (810, 958), (780, 1045), (688, 1045), (640, 955)), close: true)
})

// 图 3·2 凸五边形 ABCDE，虚线为延长边 BA（p.163）
#let fig-I-3-2(width: 300 * k) = px-canvas(300, 280, origin: (135, 160), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D, E) = ((190, 265), (243, 368), (380, 375), (425, 275), (330, 175))
  poly(p, (A, B, C, D, E), close: true)
  seg(p, A, C)
  seg(p, A, D)
  // AB 的延长线（两端都延长）
  let u1 = I-sub(B, A)
  let ul = I-len(u1)
  let a2 = I-sub(A, I-mul(u1, 90 / ul))
  let b2 = I-add(B, I-mul(u1, 90 / ul))
  dseg(p, a2, b2)
  lbl(p, E, $E$, dir: "n", d: 10)
  lbl(p, A, $A$, dir: "sw", d: 9)
  lbl(p, D, $D$, dir: "e", d: 11)
  lbl(p, B, $B$, dir: "sw", d: 9)
  lbl(p, C, $C$, dir: "se", d: 10)
})

// 图 3·3 不是凸多边形的五边形 ABCDE，虚线为 DC 的延长线（p.163）
// 原图虚线与 CD 不严格共线，这里按“延长 CD”画成共线（把 D 略向右上调）。
#let fig-I-3-3(width: 310 * k) = px-canvas(310, 245, origin: (535, 185), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D, E) = ((565, 262), (635, 415), (722, 347), (820, 419), (785, 207))
  poly(p, (A, B, C, D, E), close: true)
  let dv = I-sub(C, D)
  let dl = I-len(dv)
  dseg(p, C, I-add(C, I-mul(dv, 190 / dl)))
  lbl(p, E, $E$, dir: "ne", d: 9)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "s", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 11)
  lbl(p, D, $D$, dir: "se", d: 10)
})

// 图 3·4 四边形 ABCD（p.164）
#let fig-I-3-4(width: 290 * k) = px-canvas(290, 245, origin: (570, 380), width: width, (p, u) => {
  import cetz.draw: *
  let (D, C, B, A) = ((592, 477), (840, 397), (845, 610), (650, 600))
  poly(p, (A, B, C, D), close: true)
  lbl(p, D, $D$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "se", d: 10)
  lbl(p, A, $A$, dir: "s", d: 11)
})

// 习题 3·1 第 6 题：直线截三角形的两边得四边形 EBCD（p.165）
#let fig-I-q6(width: 330 * k) = px-canvas(330, 300, origin: (520, 165), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((735, 185), (550, 440), (790, 445))
  let E = I-lerp(A, B, 0.655)
  let D = I-lerp(A, C, 0.519)
  let dv = I-sub(D, E)
  let dl = I-len(dv)
  let e2 = I-sub(E, I-mul(dv, 85 / dl))
  let d2 = I-add(D, I-mul(dv, 70 / dl))
  poly(p, (A, B, C), close: true)
  seg(p, e2, d2)
  pdot(p, e2, r: 2.6)
  pdot(p, d2, r: 2.6)
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "sw", d: 9)
  lbl(p, C, $C$, dir: "se", d: 9)
  lbl(p, E, $E$, dir: "nw", d: 11)
  lbl(p, D, $D$, dir: "ne", d: 11)
})

// 图 3·5 五边形 ABCDE 的外角 ∠1…∠5（p.166）
#let fig-I-3-5(width: 300 * k) = px-canvas(300, 300, origin: (540, 230), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D, E) = ((580, 490), (765, 490), (808, 368), (735, 268), (607, 305))
  poly(p, (A, B, C, D, E), close: true)
  let pts = (A, B, C, D, E)
  let n = 5
  for i in range(n) {
    let prev = pts.at(calc.rem(i + n - 1, n))
    let v = pts.at(i)
    let nxt = pts.at(calc.rem(i + 1, n))
    // 沿 prev→v 方向延长出去的射线
    let dv = I-sub(v, prev)
    let dl = I-len(dv)
    let ext = I-add(v, I-mul(dv, 52 / dl))
    seg(p, v, ext)
    anglearc(p, v, ext, nxt, 13)
    // 外角序号放在角的内侧
    let u1 = I-mul(I-sub(ext, v), 1 / I-len(I-sub(ext, v)))
    let u2 = I-mul(I-sub(nxt, v), 1 / I-len(I-sub(nxt, v)))
    let bis = I-add(u1, u2)
    let bl = I-len(bis)
    let lp = I-add(v, I-mul(bis, 25 / bl))
    lbl(p, lp, tsm($#(i + 1)$), dir: "c", d: 0)
  }
  lbl(p, A, $A$, dir: "w", d: 10)
  lbl(p, B, $B$, dir: "s", d: 10)
  lbl(p, C, $C$, dir: "e", d: 10)
  lbl(p, D, $D$, dir: "e", d: 10)
  lbl(p, E, $E$, dir: "nw", d: 10)
})
