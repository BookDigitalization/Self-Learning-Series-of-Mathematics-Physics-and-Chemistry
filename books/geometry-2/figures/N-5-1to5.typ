// 第 5 章 §5·1 的编号插图：图 5·1–5·5（几何第二册 p.263、p.268、p.270）。页面渲染 dpi：120。
#import "N-base.typ": *

// 图 5·1（p.263）：圆内接正六边形
#let fig-N-5-1(width: 290 * k) = px-canvas(290, 285, origin: (180, 715), width: width, (p, u) => {
  import cetz.draw: *
  let O = (333, 851)
  let R = 124
  let (A3, A4, A5, A6, A1, A2) = range(6).map(i => cpt(O, R, 60 * i))
  circ(p, O, R)
  poly(p, (A1, A2, A3, A4, A5, A6), close: true)
  ring(p, O, r: 2.2)
  lbl(p, O, $O$, dir: "e", d: 12)
  lbl(p, A5, $A_5$, dir: "nw", d: 11)
  lbl(p, A4, $A_4$, dir: "ne", d: 11)
  lbl(p, A3, $A_3$, dir: "e", d: 12)
  lbl(p, A2, $A_2$, dir: "se", d: 11)
  lbl(p, A1, $A_1$, dir: "sw", d: 11)
  lbl(p, A6, $A_6$, dir: "w", d: 12)
})

// 图 5·2（p.263）：圆内接正十二边形（A 为正六边形顶点，B 为各边所对弧的中点）
#let fig-N-5-2(width: 360 * k) = px-canvas(360, 370, origin: (520, 635), width: width, (p, u) => {
  import cetz.draw: *
  let O = (703, 817)
  let R = 158
  circ(p, O, R)
  // 正十二边形：A1 B1 A2 B2 … 依次连接
  let pts = ()
  for i in range(6) { pts.push(cpt(O, R, -150 + 60 * i)); pts.push(cpt(O, R, -120 + 60 * i)) }
  poly(p, pts, close: true)
  // 正六边形（加粗）
  poly(p, range(6).map(i => cpt(O, R, -150 + 60 * i)), close: true, stroke: lb)
  ring(p, O, r: 2.2)
  lbl(p, O, $O$, dir: "e", d: 12)
  lbl(p, cpt(O, R, -150), $A_1$, dir: "sw", d: 11)
  lbl(p, cpt(O, R, -90), $A_2$, dir: "s", d: 11)
  lbl(p, cpt(O, R, -30), $A_3$, dir: "se", d: 11)
  lbl(p, cpt(O, R, 30), $A_4$, dir: "ne", d: 11)
  lbl(p, cpt(O, R, 90), $A_5$, dir: "n", d: 11)
  lbl(p, cpt(O, R, 150), $A_6$, dir: "nw", d: 11)
  lbl(p, cpt(O, R, -120), $B_1$, dir: "sw", d: 12)
  lbl(p, cpt(O, R, -60), $B_2$, dir: "se", d: 12)
  lbl(p, cpt(O, R, 0), $B_3$, dir: "e", d: 12)
  lbl(p, cpt(O, R, 60), $B_4$, dir: "ne", d: 12)
  lbl(p, cpt(O, R, 120), $B_5$, dir: "nw", d: 12)
  lbl(p, cpt(O, R, 180), $B_6$, dir: "w", d: 12)
})

// 图 5·3（p.268）：环形，外圆 C₂、内圆 C₁，半径 r₂、r₁，宽 d；环内横线阴影
#let fig-N-5-3(width: 300 * k) = px-canvas(300, 300, origin: (540, 390), width: width, (p, u) => {
  import cetz.draw: *
  let O = (690, 546)
  let (R, r) = (135, 78)
  // 阴影：每隔 6 像素一条水平线
  for i in range(-21, 22) {
    let dy = 6.4 * i
    let xo = calc.sqrt(R * R - dy * dy)
    if calc.abs(dy) < r {
      let xi = calc.sqrt(r * r - dy * dy)
      line(p(O.at(0) - xo, O.at(1) + dy), p(O.at(0) - xi, O.at(1) + dy), stroke: 0.4pt)
      line(p(O.at(0) + xi, O.at(1) + dy), p(O.at(0) + xo, O.at(1) + dy), stroke: 0.4pt)
    } else {
      line(p(O.at(0) - xo, O.at(1) + dy), p(O.at(0) + xo, O.at(1) + dy), stroke: 0.4pt)
    }
  }
  circ(p, O, R, stroke: lb)
  circ(p, O, r, stroke: lb)
  // r2、r1 半径
  line(p(..O), p(O.at(0) + R, O.at(1)), stroke: lt, mark: arw)
  let t = (O.at(0) + r * calc.cos(-24deg), O.at(1) - r * calc.sin(-24deg))
  line(p(..O), p(..t), stroke: lt, mark: arw)
  wl(p, (742, 546), $r_2$)
  wl(p, (719, 566), $r_1$)
  ring(p, O, r: 2.2)
  // 宽 d
  let a = (O.at(0) + r * calc.cos(-65deg), O.at(1) - r * calc.sin(-65deg))
  let b = (O.at(0) + R * calc.cos(-65deg), O.at(1) - R * calc.sin(-65deg))
  line(p(..a), p(..b), stroke: lt, mark: arw2)
  wl(p, (741, 649), $d$)
  lbl(p, O, $O$, dir: "w", d: 10)
  lbl(p, (690, 402), $C_2$, dir: "n", d: 0)
  wl(p, (703, 459), $C_1$)
})

// 图 5·4（p.268）：顶角 A = 120° 的等腰三角形及其内切圆
#let fig-N-5-4(width: 640 * k) = px-canvas(640, 220, origin: (170, 930), width: width, (p, u) => {
  import cetz.draw: *
  let (A, D) = ((485, 949), (485, 1120))
  let B = (189, 1120)
  let C = (781, 1120)
  let O = (485, 1041)
  let r = 79
  poly(p, (A, B, C), close: true, stroke: lb)
  seg(p, A, D, stroke: lb)
  circ(p, O, r)
  seg(p, B, O, stroke: dsh)
  anglearc(p, B, C, O, 52)
  rtmark(p, D, A, C, s: 8)
  ring(p, O, r: 2.2)
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, D, $D$, dir: "s", d: 11)
  lbl(p, O, $O$, dir: "e", d: 11)
  lbl(p, (274, 1108), $30°$, dir: "c", d: 0)
})

// 图 5·5（p.270）：圆 O 的直径 AB，弦 AC = OA，OD ⊥ AC，PQ 切圆于 A，DE = 3·OA
#let fig-N-5-5(width: 460 * k) = px-canvas(460, 250, origin: (240, 170), width: width, (p, u) => {
  import cetz.draw: *
  let O = (437, 295)
  let R = 95
  let A = (437, 390)
  let B = (437, 200)
  let D = (382, 390)
  let E = (662, 390)
  let C = cpt(O, R, -150)
  circ(p, O, R, stroke: lb)
  seg(p, (258, 390), (697, 390), stroke: dsh)
  seg(p, B, A, stroke: dsh)
  seg(p, O, D, stroke: dsh)
  seg(p, A, C, stroke: dsh)
  seg(p, B, E, stroke: lb)
  anglearc(p, O, A, D, 24)
  ring(p, O, r: 2.4)
  lbl(p, B, $B$, dir: "n", d: 11)
  lbl(p, O, $O$, dir: "e", d: 12)
  lbl(p, A, $A$, dir: "s", d: 12)
  lbl(p, D, $D$, dir: "s", d: 12)
  lbl(p, E, $E$, dir: "s", d: 12)
  lbl(p, C, $C$, dir: "w", d: 11)
  lbl(p, (257, 390), $P$, dir: "w", d: 10)
  lbl(p, (697, 390), $Q$, dir: "e", d: 10)
  lbl(p, (465, 325), $30°$, dir: "c", d: 0)
})
