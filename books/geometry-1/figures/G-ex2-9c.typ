// 习题 2·9 第 22、23、24 题的插图（原书 p.124）；页面 200 dpi 坐标。
// 第 22 题的河流、树只求大致相似（水纹为示意）。
#import "G-base.typ": *

// 小树（三层三角形加树干）
#let G-tree(p, x, y) = {
  import cetz.draw: *
  for (dy, w) in ((0, 9), (9, 12), (18, 15)) {
    line(p(x - w, y - dy + 12), p(x + w, y - dy + 12), p(x, y - dy - 2), close: true, fill: black, stroke: none)
  }
}

// 第 22 题 测量河对岸 A、B 间的距离（p.124）
#let fig-G-q22(width: 480 * k) = px-canvas(480, 280, origin: (255, 280), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, E, F, G) = ((300, 313), (503, 313), (583, 313), (438, 516), (503, 516))
  let D = G-meet(E, F, B, G)
  let H = (A.at(0) + (D.at(0) - A.at(0)) * (516 - A.at(1)) / (D.at(1) - A.at(1)), 516)
  // 河流：两岸之间画若干条竖向波浪虚线
  let left = ((328, 286), (320, 340), (314, 389), (300, 440), (283, 494), (267, 539), (262, 558))
  let right = ((447, 292), (440, 330), (433, 361), (425, 420), (417, 472), (400, 520), (380, 558))
  line(..left.map(t => p(..t)), stroke: lw)
  line(..right.map(t => p(..t)), stroke: lw)
  for i in range(1, 10) {
    let s = i / 10
    let pts = range(left.len()).map(j => (left.at(j).at(0) + s * (right.at(j).at(0) - left.at(j).at(0)), left.at(j).at(1) + s * (right.at(j).at(1) - left.at(j).at(1))))
    line(..pts.map(t => p(..t)), stroke: (paint: black, thickness: 0.8pt, dash: (3pt, 2.4pt)))
  }
  rect(p(328, 432), p(364, 456), fill: white, stroke: none)
  content(p(346, 444), tsm[河流])
  G-tree(p, 300, 292)
  G-tree(p, 503, 290)
  // 测量线
  seg(p, A, B, stroke: dsh)
  seg(p, B, E, stroke: dsh)
  seg(p, A, H, stroke: dsh)
  seg(p, B, G)
  seg(p, E, F)
  seg(p, F, H)
  ticks(p, B, D, 1)
  ticks(p, D, G, 1)
  ticks(p, E, D, 1)
  ticks(p, D, F, 1)
  lbl(p, A, $A$, dir: "sw", d: 10)
  content(p(514, 309), tt($B$))
  lbl(p, E, $E$, dir: "e", d: 11)
  lbl(p, D, $D$, dir: "e", d: 12)
  lbl(p, G, $G$, dir: "s", d: 11)
  lbl(p, F, $F$, dir: "sw", d: 10)
  lbl(p, H, $H$, dir: "e", d: 11)
})

// 第 23 题（p.124）：等边三角形 ABC，AF=BD=CE。原图量得 AF≈BD≈CE≈0.41 AB，按此取点
#let fig-G-q23(width: 360 * k) = px-canvas(360, 320, origin: (145, 865), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((175, 1146), (477, 1146), (326, 884))
  let s = 125
  let F = G-go(A, B, s)
  let D = G-go(B, C, s)
  let E = G-go(C, A, s)
  poly(p, (A, B, C), close: true)
  poly(p, (D, E, F), close: true)
  ticks(p, A, F, 1)
  ticks(p, B, D, 1)
  ticks(p, C, E, 1)
  lbl(p, C, $C$, dir: "n", d: 10)
  lbl(p, A, $A$, dir: "sw", d: 10)
  lbl(p, B, $B$, dir: "se", d: 10)
  lbl(p, E, $E$, dir: "nw", d: 11)
  lbl(p, D, $D$, dir: "e", d: 11)
  lbl(p, F, $F$, dir: "s", d: 11)
})

// 第 24 题（p.124）：AB=AC，DB=DC，E 在 AD 延长线上
#let fig-G-q24(width: 265 * k) = px-canvas(265, 280, origin: (565, 885), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D, E) = ((690, 902), (591, 1002), (790, 1002), (690, 968), (690, 1148))
  seg(p, A, B)
  seg(p, A, C)
  seg(p, D, B)
  seg(p, D, C)
  seg(p, A, E)
  seg(p, E, B)
  seg(p, E, C)
  lbl(p, A, $A$, dir: "n", d: 10)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 11)
  content(p(704, 957), tt($D$))
  lbl(p, E, $E$, dir: "s", d: 10)
})
