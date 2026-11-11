// 图 2·19–2·21（原书 p.90）、图 2·22（p.91）、图 2·23（p.93）、图 2·24（p.93）；页面 200 dpi 坐标。
// 图 2·19（鼓的花纹）、图 2·21（蝴蝶、枫叶、钢架、扇面）是写实插画，保留原扫描裁剪的二值化 PNG；图中无文字。
#import "F-base.typ": *

// 图 2·19：纸上的花纹（原书 p.90）
#let fig-F-2-19(width: 290 * k) = px-canvas(290, 220, origin: (142, 192), width: width, (p, u) => {
  import cetz.draw: *
  F-img(p, u, "F-2-19.png", (148, 195, 430, 410))
})

// 图 2·20：折痕与两个对称三角形（p.90）
#let fig-F-2-20(width: 400 * k) = px-canvas(400, 280, origin: (450, 150), width: width, (p, u) => {
  import cetz.draw: *
  let (A, A2, B, B2, C, C2) = ((520, 203), (796, 203), (487, 370), (822, 370), (558, 303), (757, 303))
  line(p(657, 160), p(657, 420), stroke: dsh)
  dseg(p, A, A2)
  dseg(p, C, C2)
  dseg(p, B, B2)
  poly(p, (A, B, C), close: true)
  poly(p, (A2, B2, C2), close: true)
  for t in (A, A2, B, B2, C, C2) { ring(p, t, r: 3) }
  content(p(657, 185), box(fill: white, inset: 1.5pt, tt[折痕]))
  lbl(p, A, $A$, dir: "nw", d: 12)
  lbl(p, A2, $A'$, dir: "ne", d: 12)
  lbl(p, B, $B$, dir: "sw", d: 12)
  lbl(p, B2, $B'$, dir: "se", d: 12)
  lbl(p, C, $C$, dir: "se", d: 12)
  lbl(p, C2, $C'$, dir: "sw", d: 12)
})

// 图 2·21：轴对称图形的例子（蝴蝶、枫叶、钢架、扇面），整幅位图（p.90）
#let fig-F-2-21(width: 520 * k) = px-canvas(520, 600, origin: (250, 670), width: width, (p, u) => {
  import cetz.draw: *
  F-img(p, u, "F-2-21.png", (255, 672, 765, 1258))
})

// 图 2·22：等腰三角形的折痕（p.91）。AB=AC，D 是 BC 中点，AD⊥BC
#let fig-F-2-22(width: 280 * k) = px-canvas(280, 310, origin: (570, 735), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((720, 787), (620, 983), (820, 983), (720, 983))
  line(p(720, 745), p(720, 1040), stroke: dsh)
  poly(p, (A, B, C), close: true)
  seg(p, A, D)
  ticks(p, A, B, 1)
  ticks(p, A, C, 1)
  ticks(p, B, D, 1)
  ticks(p, D, C, 1)
  rtmark(p, D, C, A, s: 8)
  anglearc(p, A, B, D, 20)
  anglearc(p, A, D, C, 20)
  lbl(p, A, $A$, dir: "ne", d: 11)
  lbl(p, B, $B$, dir: "sw", d: 11)
  lbl(p, C, $C$, dir: "se", d: 11)
  lbl(p, D, $D$, dir: "s", d: 12)
})

// 图 2·23：两个有公共底边的等腰三角形（p.93）。左：A、A′ 在 BC 两侧；右：A′ 在 △ABC 内
#let fig-F-2-23(width: 470 * k) = px-canvas(470, 350, origin: (275, 140), width: width, (p, u) => {
  import cetz.draw: *
  // 左
  let (A, B, C, M, A2) = ((398, 178), (310, 356), (487, 356), (398, 356), (398, 448))
  line(p(398, 148), p(398, 482), stroke: lb)
  poly(p, (A, B, A2, C), close: true)
  seg(p, B, C)
  lbl(p, A, $A$, dir: "ne", d: 11)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, M, $M$, dir: "ne", d: 11)
  lbl(p, A2, $A'$, dir: "se", d: 11)
  // 右
  let (A, B, C, M, A2) = ((640, 178), (548, 356), (724, 356), (640, 356), (640, 268))
  line(p(640, 148), p(640, 420), stroke: lb)
  poly(p, (A, B, C), close: true)
  seg(p, A2, B)
  seg(p, A2, C)
  lbl(p, A, $A$, dir: "ne", d: 11)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, M, $M$, dir: "ne", d: 11)
  lbl(p, A2, $A'$, dir: "e", d: 12)
})

// 图 2·24：等边三角形，三边各 1 道短横（p.93）
#let fig-F-2-24(width: 320 * k) = px-canvas(320, 270, origin: (555, 960), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((722, 983), (582, 1218), (860, 1218))
  poly(p, (A, B, C), close: true)
  ticks(p, A, B, 1)
  ticks(p, A, C, 1)
  ticks(p, B, C, 1)
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "sw", d: 11)
  lbl(p, C, $C$, dir: "se", d: 11)
})
