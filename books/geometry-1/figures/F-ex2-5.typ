// 习题 2·5 各题插图（原书 p.97–98）：第 3、12、16、17、18 题；页面 200 dpi 坐标。
#import "F-base.typ": *

// 第 3 题（p.97）：钢板上的三个眼 A、B、C
#let fig-F-q3(width: 315 * k) = px-canvas(315, 190, origin: (538, 198), width: width, (p, u) => {
  import cetz.draw: *
  poly(p, ((542, 203), (845, 203), (845, 383), (542, 383)), close: true)
  line(p(694, 222), p(694, 367), stroke: lb)
  pdot(p, (694, 222), r: 3)
  pdot(p, (694, 367), r: 3)
  pdot(p, (606, 308), r: 3)
  lbl(p, (694, 222), $A$, dir: "nw", d: 11)
  lbl(p, (694, 367), $B$, dir: "se", d: 11)
  lbl(p, (606, 308), $C$, dir: "w", d: 11)
})

// 第 12 题（p.97）：屋架，屋椽 AB、AC（双线），BC 为水平虚线，下有两对立柱
#let fig-F-q12(width: 340 * k) = px-canvas(340, 170, origin: (130, 1030), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((306, 1040), (148, 1141), (466, 1143))
  let (A2, B2, C2) = ((306, 1054), (172, 1140), (440, 1140))
  seg(p, A, B)
  seg(p, A, C)
  seg(p, A2, B2)
  seg(p, A2, C2)
  seg(p, A, A2)
  seg(p, B, B2)
  seg(p, C, C2)
  dseg(p, (148, 1142), (466, 1142))
  // 立柱与柱头小方块
  poly(p, ((193, 1118), (207, 1118), (207, 1127), (193, 1127)), close: true)
  poly(p, ((405, 1119), (421, 1119), (421, 1129), (405, 1129)), close: true)
  seg(p, (180, 1141), (180, 1184))
  seg(p, (209, 1127), (209, 1184))
  seg(p, (403, 1129), (403, 1184))
  seg(p, (433, 1141), (433, 1184))
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
})

// 第 16 题（p.97）：AB=AC，DE 为一直线，AB、AC 的延长线过 DE 到下方
#let fig-F-q16(width: 340 * k) = px-canvas(340, 260, origin: (505, 940), width: width, (p, u) => {
  import cetz.draw: *
  let A = (681, 958)
  let (B, C) = ((586, 1143), (776, 1143))
  seg(p, A, (562, 1192))
  seg(p, A, (800, 1192))
  seg(p, (520, 1143), (840, 1143))
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, (520, 1143), $D$, dir: "w", d: 11)
  lbl(p, (840, 1143), $E$, dir: "e", d: 11)
  lbl(p, B, $B$, dir: "ne", d: 11)
  lbl(p, C, $C$, dir: "nw", d: 11)
  F-num(p, 568, 1160, $1$)
  F-num(p, 790, 1160, $2$)
})

// 第 17 题（p.98）：AB=AC，EB=EC
#let fig-F-q17(width: 230 * k) = px-canvas(230, 380, origin: (150, 430), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, E) = ((274, 452), (176, 563), (372, 563), (272, 770))
  poly(p, (A, B, E, C), close: true)
  seg(p, B, C)
  ticks(p, A, B, 1)
  ticks(p, A, C, 1)
  ticks(p, B, E, 2)
  ticks(p, C, E, 2)
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, E, $E$, dir: "s", d: 11)
})

// 第 18 题（p.98）：屋梁（带木纹）上放等腰直角三角板，板上标记 M，悬一铅锤
#let fig-F-q18(width: 420 * k) = px-canvas(420, 290, origin: (440, 505), width: width, (p, u) => {
  import cetz.draw: *
  // 屋梁
  poly(p, ((469, 605), (843, 605), (843, 675), (469, 675)), close: true)
  // 木纹：几条示意曲线
  let grain(a, c1, c2, b) = bezier(p(..a), p(..b), p(..c1), p(..c2), stroke: lt)
  grain((476, 620), (560, 610), (640, 625), (730, 612))
  grain((476, 636), (560, 625), (620, 650), (720, 638))
  grain((476, 650), (540, 640), (600, 665), (700, 652))
  grain((520, 668), (600, 655), (700, 668), (820, 660))
  grain((620, 626), (700, 618), (760, 640), (838, 626))
  grain((700, 646), (760, 636), (800, 656), (838, 646))
  bezier(p(560, 645), p(640, 645), p(580, 632), p(630, 632), stroke: lt)
  bezier(p(560, 645), p(640, 645), p(580, 658), p(630, 658), stroke: lt)
  // 三角板：外框、内框（挖空的小三角），悬线
  let T = (660, 524)
  poly(p, ((578, 605), T, (742, 605)))
  poly(p, ((629, 585), (660, 556), (692, 585)), close: true)
  line(p(660, 524), p(660, 740), stroke: lw)
  rect(p(648, 765), p(672, 740), fill: black, stroke: none)
  lbl(p, (674, 594), $M$, dir: "c", d: 0)
  content(p(453, 632), tt[屋])
  content(p(453, 650), tt[梁])
})
