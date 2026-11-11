// 图 2·68（原书 p.146）、图 2·69（p.147）、图 2·70、图 2·71（p.149）；页面 200 dpi 坐标。
#import "I-base.typ": *

// 图 2·68 线段 AB 的垂直平分线 MN，P 是 MN 上任意一点
#let fig-I-2-68(width: 330 * k) = px-canvas(330, 315, origin: (540, 575), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, D, P) = ((565, 768), (835, 768), (698, 768), (698, 632))
  seg(p, A, B)
  seg(p, P, A)
  seg(p, P, B)
  seg(p, (698, 603), (698, 858))
  ticks(p, A, D, 1)
  ticks(p, D, B, 1)
  rtmark(p, D, A, P)
  lbl(p, (698, 603), $M$, dir: "n", d: 11)
  lbl(p, P, $P$, dir: "ne", d: 12)
  lbl(p, D, $D$, dir: "ne", d: 12)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, (698, 858), $N$, dir: "s", d: 11)
})

// 图 2·69 PA = PB，MN 用虚线（待证）
#let fig-I-2-69(width: 320 * k) = px-canvas(320, 300, origin: (520, 430), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, D, P) = ((538, 632), (820, 632), (679, 632), (679, 485))
  seg(p, A, B)
  seg(p, P, A)
  seg(p, P, B)
  dseg(p, (679, 458), (679, 702))
  lbl(p, (679, 458), $M$, dir: "n", d: 11)
  lbl(p, P, $P$, dir: "ne", d: 12)
  lbl(p, D, $D$, dir: "ne", d: 12)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, (679, 702), $N$, dir: "s", d: 11)
})

// 图 2·70 铁路线旁的两个工厂 A、B 和仓库 P
#let fig-I-2-70(width: 360 * k) = px-canvas(360, 350, origin: (100, 190), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, D, P) = ((253, 454), (424, 454), (336, 454), (337, 279))
  // 铁路线：黑白相间的带
  let (r0, r1) = ((122, 389), (441, 214))
  let rl = I-len(I-sub(r1, r0))
  let ru = I-mul(I-sub(r1, r0), 1 / rl)
  let rn = (-ru.at(1), ru.at(0))
  let w = 9
  let nseg = 11
  for i in range(nseg) {
    let t0 = rl * i / nseg
    let t1 = rl * (i + 1) / nseg
    let a = I-add(r0, I-mul(ru, t0))
    let b = I-add(r0, I-mul(ru, t1))
    let q = (I-add(a, I-mul(rn, w)), I-add(b, I-mul(rn, w)), I-sub(b, I-mul(rn, w)), I-sub(a, I-mul(rn, w)))
    line(..q.map(t => p(..t)), close: true, stroke: lt, fill: if calc.even(i) { black } else { white })
  }
  content(p(178, 330), angle: dirang(ru.at(0), ru.at(1)), tt(text(weight: "bold")[铁路线]))
  seg(p, (332, 209), (336, 520))
  dseg(p, A, P)
  dseg(p, B, P)
  seg(p, A, B)
  ring(p, A)
  ring(p, B)
  lbl(p, (332, 209), $M$, dir: "n", d: 11)
  lbl(p, P, $P$, dir: "ne", d: 11)
  lbl(p, D, $D$, dir: "ne", d: 11)
  lbl(p, A, $A$, dir: "w", d: 12)
  lbl(p, B, $B$, dir: "e", d: 12)
  lbl(p, (336, 520), $N$, dir: "s", d: 11)
})

// 图 2·71 三角形场地 ABC，O 是 AB、AC 的垂直平分线的交点
#let fig-I-2-71(width: 360 * k) = px-canvas(360, 300, origin: (470, 225), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((481, 456), (828, 449), (634, 256))
  // 外心
  let d = 2 * (A.at(0) * (B.at(1) - C.at(1)) + B.at(0) * (C.at(1) - A.at(1)) + C.at(0) * (A.at(1) - B.at(1)))
  let sq(q) = q.at(0) * q.at(0) + q.at(1) * q.at(1)
  let ox = (sq(A) * (B.at(1) - C.at(1)) + sq(B) * (C.at(1) - A.at(1)) + sq(C) * (A.at(1) - B.at(1))) / d
  let oy = (sq(A) * (C.at(0) - B.at(0)) + sq(B) * (A.at(0) - C.at(0)) + sq(C) * (B.at(0) - A.at(0))) / d
  let O = (ox, oy)
  poly(p, (A, B, C), close: true)
  seg(p, O, A)
  seg(p, O, B)
  seg(p, O, C)
  // MN：AB 的垂直平分线（竖直）；EF：AC 的垂直平分线
  dseg(p, (ox, 330), (ox, 505))
  let mac = I-lerp(A, C, 0.5)
  let dir = I-sub(O, mac)
  let dl = I-len(dir)
  let e = I-sub(mac, I-mul(dir, 85 / dl))
  let f = I-add(O, I-mul(dir, 55 / dl))
  dseg(p, e, f)
  ring(p, O, r: 2.6)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, (ox, 338), $M$, dir: "e", d: 10)
  lbl(p, (ox, 505), $N$, dir: "s", d: 10)
  lbl(p, O, $O$, dir: "ne", d: 11)
  lbl(p, e, $E$, dir: "nw", d: 8)
  lbl(p, f, $F$, dir: "se", d: 8)
})
