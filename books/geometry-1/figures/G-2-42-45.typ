// 图 2·42（原书 p.112）、图 2·43（p.113）、图 2·44（p.114）、图 2·45（p.115）；页面 200 dpi 坐标。
#import "G-base.typ": *

// 图 2·42 三边对应相等；AC 1 道、BC 2 道、AB 3 道短横
#let fig-G-2-42(width: 610 * k) = px-canvas(610, 350, origin: (170, 430), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, C2) = ((205, 596), (441, 596), (367, 448), (362, 742))
  let (A1, B1, C1) = ((498, 596), (738, 596), (662, 448))
  seg(p, A, B)
  seg(p, A, C)
  seg(p, B, C)
  seg(p, A, C2, stroke: dsh)
  seg(p, B, C2, stroke: dsh)
  seg(p, C, C2, stroke: dsh)
  seg(p, A1, B1)
  seg(p, A1, C1)
  seg(p, B1, C1)
  ticks(p, A, C, 1)
  ticks(p, B, C, 2)
  ticks(p, A, B, 3)
  ticks(p, A1, C1, 1)
  ticks(p, B1, C1, 2)
  ticks(p, A1, B1, 3)
  lbl(p, C, $C$, dir: "n")
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, C2, $C'$, dir: "s")
  lbl(p, C1, $C'$, dir: "n")
  lbl(p, A1, $A'$, dir: "w", d: 12)
  lbl(p, B1, $B'$, dir: "e", d: 12)
})

// 图 2·43 两边及夹角；AC 1 道、AB 2 道短横
#let fig-G-2-43(width: 630 * k) = px-canvas(630, 295, origin: (200, 525), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, C2) = ((240, 667), (477, 667), (419, 547), (419, 783))
  let (A1, B1, C1) = ((537, 667), (775, 667), (716, 547))
  seg(p, A, B)
  seg(p, A, C)
  seg(p, B, C)
  seg(p, A, C2, stroke: dsh)
  seg(p, B, C2, stroke: dsh)
  seg(p, A1, B1)
  seg(p, A1, C1)
  seg(p, B1, C1)
  anglearc(p, A, B, C, 27)
  anglearc(p, A, B, C2, 29)
  anglearc(p, A1, B1, C1, 27)
  ticks(p, A, C, 1)
  ticks(p, A, B, 2)
  ticks(p, A1, C1, 1)
  ticks(p, A1, B1, 2)
  lbl(p, C, $C$, dir: "n")
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, C2, $C'$, dir: "s")
  lbl(p, C1, $C'$, dir: "n")
  lbl(p, A1, $A'$, dir: "w", d: 12)
  lbl(p, B1, $B'$, dir: "e", d: 12)
})

// 图 2·44 两角及夹边；AB、A'B' 各 1 道短横。原图 AC'、BC' 画成细实线（正文说“虚线的位置”），照原图画实线
#let fig-G-2-44(width: 610 * k) = px-canvas(610, 255, origin: (170, 190), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, C2) = ((201, 319), (439, 319), (379, 208), (379, 435))
  let (A1, B1, C1) = ((497, 319), (740, 319), (679, 211))
  seg(p, A, B)
  seg(p, A, C)
  seg(p, B, C)
  seg(p, A, C2, stroke: lt)
  seg(p, B, C2, stroke: lt)
  seg(p, A1, B1)
  seg(p, A1, C1)
  seg(p, B1, C1)
  anglearc(p, A, B, C, 34)
  anglearc(p, A, B, C2, 34)
  for r in (13, 17) {
    anglearc(p, B, A, C, r)
    anglearc(p, B, A, C2, r)
    anglearc(p, B1, A1, C1, r)
  }
  anglearc(p, A1, B1, C1, 32)
  ticks(p, A, B, 1)
  ticks(p, A1, B1, 1)
  lbl(p, C, $C$, dir: "n")
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, C2, $C'$, dir: "s")
  lbl(p, C1, $C'$, dir: "n")
  lbl(p, A1, $A'$, dir: "w", d: 12)
  lbl(p, B1, $B'$, dir: "e", d: 12)
})

// 图 2·45 推论；AC、A'C' 各 1 道短横；B 处 1 道弧，C 处 2 道弧
#let fig-G-2-45(width: 670 * k) = px-canvas(670, 190, origin: (150, 200), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((275, 230), (175, 359), (445, 359))
  let (A1, B1, C1) = ((613, 230), (513, 359), (783, 359))
  for (a, b, c) in ((A, B, C), (A1, B1, C1)) {
    seg(p, a, b)
    seg(p, a, c)
    seg(p, b, c)
    anglearc(p, b, c, a, 26)
    anglearc(p, c, b, a, 20)
    anglearc(p, c, b, a, 25)
    ticks(p, a, c, 1)
  }
  lbl(p, A, $A$, dir: "n")
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
  lbl(p, A1, $A'$, dir: "n")
  lbl(p, B1, $B'$, dir: "w", d: 12)
  lbl(p, C1, $C'$, dir: "e", d: 13)
})
