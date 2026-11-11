// 图 4·69（原书 p.275）、图 4·70、图 4·71（p.276）；页面 200 dpi 坐标。
#import "P-base.typ": *

// 图 4·69 跑道、机械零件、鼓风机外壳（直线和弧平滑连接的实例）
#let fig-P-4-69(width: 780 * k) = px-canvas(780, 240, origin: (100, 760), width: width, (p, u) => {
  import cetz.draw: *
  // 跑道
  P-stadium(p, (173, 839), (327, 839), 56)
  P-stadium(p, (175, 839), (326, 839), 42)
  ctext(p, (255, 975), [跑 道])
  // 机械零件
  P-stadium(p, (475, 852), (592, 852), 50)
  circ(p, (475, 852), 22)
  circ(p, (592, 852), 22)
  line(p(410, 852), p(657, 852), stroke: P-dashdot)
  line(p(476, 773), p(476, 925), stroke: P-dashdot)
  line(p(592, 788), p(592, 925), stroke: P-dashdot)
  ctext(p, (545, 977), [机械零件])
  // 鼓风机外壳
  let c0 = (766, 851)
  parc(p, c0, 77, 270, 571.7)
  let e = P-pt(c0, 77, 211.7)
  seg(p, e, (672, 893))
  seg(p, (672, 893), (672, 928))
  seg(p, (672, 928), (766, 928))
  parc(p, c0, 71, 285, 520, st: dotted)
  circ(p, c0, 42)
  circ(p, c0, 28)
  for i in range(8) {
    let a = i * 45 + 20
    line(p(..P-pt(c0, 4, a)), p(..P-pt(c0, 28, a)), stroke: lt)
  }
  circle(p(..c0), radius: 4, fill: white, stroke: lt)
  ctext(p, (740, 978), [鼓风机外壳])
})

// 图 4·70 直线和弧的吻接：AP 垂直于 OA，AP 是弧 AB 在点 A 的切线
#let fig-P-4-70(width: 260 * k) = px-canvas(260, 360, origin: (640, 140), width: width, (p, u) => {
  import cetz.draw: *
  let o = (777, 272)
  parc(p, o, 99, 180, 39)
  dseg(p, (678, 170), (678, 272))
  seg(p, (678, 272), (677, 462))
  dseg(p, (678, 272), o)
  P-cen(p, o, r: 2.5)
  lbl(p, (680, 170), $Q$, dir: "n", d: 9)
  lbl(p, (678, 272), $A$, dir: "w", d: 11)
  lbl(p, o, $O$, dir: "e", d: 10)
  lbl(p, (790, 164), $M$, dir: "c", d: 0)
  lbl(p, P-pt(o, 99, 39), $B$, dir: "e", d: 9)
  lbl(p, (677, 462), $P$, dir: "s", d: 10)
})

// 图 4·71 两弧的公切线吻接：(1) 外公切线，(2) 内公切线
#let fig-P-4-71(width: 780 * k) = px-canvas(780, 235, origin: (110, 670), width: width, (p, u) => {
  import cetz.draw: *
  // (1)
  let o1 = (248, 793)
  let o2 = (460, 781)
  parc(p, o1, 79, 213, 12, st: lb)
  parc(p, o2, 54, 160, -46, st: lb)
  line(p(248, 714), p(460, 727), stroke: lb)
  lbl(p, (160, 762), $M$, dir: "c", d: 0)
  lbl(p, (247, 703), $A$, dir: "c", d: 0)
  lbl(p, (480, 716), $B$, dir: "c", d: 0)
  lbl(p, (527, 760), $N$, dir: "c", d: 0)
  ctext(p, (302, 885), $(1)$)
  // (2)
  let (c3, r3) = P-circ3((552, 748), (610, 697), (662, 778))
  let (c4, r4) = P-circ3((745, 712), (800, 821), (858, 805))
  P-arc3(p, (552, 748), (610, 697), (662, 778), st: lb)
  P-arc3(p, (745, 712), (800, 821), (858, 805), st: lb)
  let (a, b) = P-tan(c3, r3, c4, r4, "in", -1)
  line(p(..a), p(..b), stroke: lb)
  lbl(p, (600, 686), $M$, dir: "c", d: 0)
  lbl(p, (655, 706), $A$, dir: "c", d: 0)
  lbl(p, (767, 813), $B$, dir: "c", d: 0)
  lbl(p, (796, 828), $N$, dir: "c", d: 0)
  ctext(p, (682, 886), $(2)$)
})
