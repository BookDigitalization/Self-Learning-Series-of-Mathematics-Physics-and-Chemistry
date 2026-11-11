// 图 1·1–图 1·11（原书 p.8–12），读坐标时的页面渲染 200 dpi。
#import "/books/geometry-1/figures/A-lib.typ": *

// 图 1·1（p.8）：(1) 直线 AB  (2) 直线 a
#let fig-A-1-1(width: 620 * k) = px-canvas(620, 70, origin: (180, 755), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (187, 784), (460, 784))
  seg(p, (525, 784), (795, 784))
  A-tick(p, (0, 0), (1, 0), (232, 784), s: 4)
  A-tick(p, (0, 0), (1, 0), (428, 784), s: 4)
  lbl(p, (232, 770), $A$, dir: "c", d: 0)
  lbl(p, (428, 770), $B$, dir: "c", d: 0)
  lbl(p, (664, 770), $a$, dir: "c", d: 0)
  A-t(p, (323, 812), [(1)])
  A-t(p, (660, 812), [(2)])
})

// 图 1·2（p.9）：(1) 尺边是直的  (2) 尺边不直
#let fig-A-1-2(width: 600 * k) = px-canvas(600, 115, origin: (180, 245), width: width, (p, u) => {
  import cetz.draw: *
  // (1)
  line(p(226, 316), p(226, 263), p(426, 263), p(426, 316), stroke: lw)
  line(p(226, 316), p(426, 316), stroke: (paint: black, thickness: 0.9pt, dash: "dash-dotted"))
  line(p(192, 292), p(464, 292), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.35))
  // (2)
  bezier(p(557, 262), p(761, 262), p(659, 248), stroke: lw)
  line(p(557, 262), p(557, 316), stroke: lw)
  line(p(761, 262), p(761, 316), stroke: lw)
  bezier(p(557, 289), p(761, 289), p(659, 279), stroke: lw)
  line(p(557, 295), p(761, 293), stroke: dsh)
  bezier(p(557, 316), p(761, 316), p(659, 334), stroke: (paint: black, thickness: 0.9pt, dash: "dash-dotted"))
  A-t(p, (317, 350), [(1)])
  A-t(p, (662, 350), [(2)])
})

// 图 1·3（p.9）：射线 OC
#let fig-A-1-3(width: 300 * k) = px-canvas(300, 40, origin: (340, 725), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (358, 748), (622, 748))
  A-tick(p, (0, 0), (1, 0), (358, 748), s: 5)
  A-tick(p, (0, 0), (1, 0), (545, 748), s: 4)
  lbl(p, (357, 735), $O$, dir: "c", d: 0)
  lbl(p, (545, 735), $C$, dir: "c", d: 0)
})

// 图 1·4（p.9）：(1) 线段 DE  (2) 线段 b
#let fig-A-1-4(width: 610 * k) = px-canvas(610, 70, origin: (190, 1080), width: width, (p, u) => {
  import cetz.draw: *
  A-pseg(p, (212, 1107), (442, 1107))
  A-pseg(p, (547, 1106), (780, 1106))
  lbl(p, (212, 1095), $D$, dir: "c", d: 0)
  lbl(p, (440, 1095), $E$, dir: "c", d: 0)
  lbl(p, (665, 1094), $b$, dir: "c", d: 0)
  A-t(p, (323, 1138), [(1)])
  A-t(p, (660, 1138), [(2)])
})

// 图 1·5（p.10）：线段的延长线（虚线）
#let fig-A-1-5(width: 540 * k) = px-canvas(540, 75, origin: (220, 470), width: width, (p, u) => {
  import cetz.draw: *
  // (1)
  seg(p, (267, 500), (400, 500))
  A-dash(p, (400, 500), (462, 500))
  A-tick(p, (0, 0), (1, 0), (267, 500), s: 4)
  A-tick(p, (0, 0), (1, 0), (400, 500), s: 4)
  lbl(p, (268, 482), $A$, dir: "c", d: 0)
  lbl(p, (400, 482), $B$, dir: "c", d: 0)
  A-t(p, (360, 530), [(1)])
  // (2)
  A-dash(p, (525, 500), (590, 500))
  seg(p, (590, 500), (733, 500))
  A-tick(p, (0, 0), (1, 0), (590, 500), s: 4)
  A-tick(p, (0, 0), (1, 0), (733, 500), s: 4)
  lbl(p, (595, 482), $A$, dir: "c", d: 0)
  lbl(p, (733, 484), $B$, dir: "c", d: 0)
  A-t(p, (630, 530), [(2)])
})

// 图 1·6（p.10）：直线和线段能相交吗
#let fig-A-1-6(width: 530 * k) = px-canvas(530, 195, origin: (230, 810), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (248, 884), (421, 892))
  A-pseg(p, (384, 964), (500, 841), s: 6)
  seg(p, (543, 951), (731, 957))
  A-pseg(p, (634, 933), (740, 825), s: 6)
  A-t(p, (349, 991), [(1)])
  A-t(p, (627, 992), [(2)])
})

// 图 1·7（p.10）：射线和线段能相交吗（斜线为射线，下端为端点）
#let fig-A-1-7(width: 600 * k) = px-canvas(600, 180, origin: (200, 1100), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (212, 1236), (328, 1113))
  A-tick(p, (212, 1236), (328, 1113), (212, 1236), s: 6)
  A-pseg(p, (298, 1183), (458, 1182))
  seg(p, (522, 1239), (632, 1107))
  A-tick(p, (522, 1239), (632, 1107), (522, 1239), s: 6)
  A-pseg(p, (587, 1189), (780, 1187))
  A-t(p, (336, 1262), [(1)])
  A-t(p, (651, 1263), [(2)])
})

// 图 1·8（p.11）：射线和直线能相交吗
#let fig-A-1-8(width: 495 * k) = px-canvas(495, 200, origin: (255, 185), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (275, 202), (475, 199))
  seg(p, (274, 336), (377, 221))
  A-tick(p, (274, 336), (377, 221), (274, 336), s: 6)
  seg(p, (624, 314), (730, 196))
  A-tick(p, (624, 314), (730, 196), (624, 314), s: 6)
  seg(p, (522, 337), (722, 337))
  A-t(p, (370, 368), [(1)])
  A-t(p, (645, 368), [(2)])
})

// 图 1·9（p.12）：线段 PQ 与 RS 相等（P 与 R、Q 与 S 重合）
#let fig-A-1-9(width: 650 * k) = px-canvas(650, 65, origin: (150, 275), width: width, (p, u) => {
  import cetz.draw: *
  A-pseg(p, (170, 308), (440, 308))
  lbl(p, (170, 291), $P$, dir: "c", d: 0)
  lbl(p, (437, 291), $Q$, dir: "c", d: 0)
  A-pseg(p, (508, 308), (768, 308))
  lbl(p, (508, 291), $R$, dir: "c", d: 0)
  lbl(p, (508, 324), $P$, dir: "c", d: 0)
  lbl(p, (770, 291), $S$, dir: "c", d: 0)
  lbl(p, (770, 326), $Q$, dir: "c", d: 0)
})

// 图 1·10（p.12）：PQ < RS（Q 落在 R、S 之间）
#let fig-A-1-10(width: 650 * k) = px-canvas(650, 75, origin: (150, 540), width: width, (p, u) => {
  import cetz.draw: *
  A-pseg(p, (172, 573), (372, 573))
  lbl(p, (170, 555), $P$, dir: "c", d: 0)
  lbl(p, (372, 555), $Q$, dir: "c", d: 0)
  A-pseg(p, (508, 575), (778, 575))
  A-tick(p, (0, 0), (1, 0), (708, 575), s: 5)
  lbl(p, (503, 557), $R$, dir: "c", d: 0)
  lbl(p, (775, 560), $S$, dir: "c", d: 0)
  lbl(p, (508, 592), $P$, dir: "c", d: 0)
  lbl(p, (708, 595), $Q$, dir: "c", d: 0)
})

// 图 1·11（p.12）：PQ > RS（Q 落在 RS 的延长线上）
#let fig-A-1-11(width: 650 * k) = px-canvas(650, 65, origin: (150, 800), width: width, (p, u) => {
  import cetz.draw: *
  A-pseg(p, (170, 832), (437, 832))
  lbl(p, (167, 815), $P$, dir: "c", d: 0)
  lbl(p, (435, 815), $Q$, dir: "c", d: 0)
  seg(p, (510, 835), (679, 835))
  A-dash(p, (679, 835), (770, 835))
  A-tick(p, (0, 0), (1, 0), (510, 835), s: 5)
  A-tick(p, (0, 0), (1, 0), (679, 835), s: 5)
  A-tick(p, (0, 0), (1, 0), (770, 835), s: 5)
  lbl(p, (500, 818), $R$, dir: "c", d: 0)
  lbl(p, (503, 846), $P$, dir: "c", d: 0)
  lbl(p, (679, 815), $S$, dir: "c", d: 0)
  lbl(p, (770, 848), $Q$, dir: "c", d: 0)
})
