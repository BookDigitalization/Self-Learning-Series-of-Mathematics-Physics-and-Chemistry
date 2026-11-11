// 习题 1·3 的插图（第 4、6、10、11 题，原书 p.17–18）和图 1·23–图 1·25（p.19–20），读坐标时的页面渲染 200 dpi。
#import "/books/geometry-1/figures/A-lib.typ": *

// 习题 1·3 第 4 题（p.17）：线段上的点 A、B、C、D
#let fig-A-ex3-4(width: 520 * k) = px-canvas(520, 45, origin: (260, 1090), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (279, 1123), (759, 1123))
  for (n, x) in (($A$, 279), ($B$, 458), ($C$, 671), ($D$, 759)) {
    A-tick(p, (0, 0), (1, 0), (x, 1123), s: 8)
    lbl(p, (x, 1106), n, dir: "c", d: 0)
  }
})

// 习题 1·3 第 6 题（p.18）：M 是线段 AB 的中点
#let fig-A-ex3-6(width: 310 * k) = px-canvas(310, 45, origin: (320, 372), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (339, 401), (610, 401))
  for (n, x) in (($A$, 339), ($M$, 474), ($B$, 610)) {
    A-tick(p, (0, 0), (1, 0), (x, 401), s: 8)
    lbl(p, (x, 385), n, dir: "c", d: 0)
  }
})

// 习题 1·3 第 10 题（p.18）：AB = CD
#let fig-A-ex3-10(width: 400 * k) = px-canvas(400, 45, origin: (285, 735), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (303, 758), (663, 758))
  for (n, x) in (($A$, 303), ($C$, 394), ($B$, 572), ($D$, 663)) {
    A-tick(p, (0, 0), (1, 0), (x, 758), s: 8)
    lbl(p, (x, 745), n, dir: "c", d: 0)
  }
})

// 习题 1·3 第 11 题（p.18）：M、N、O 分别是 AB、BC、AC 的中点
#let fig-A-ex3-11(width: 450 * k) = px-canvas(450, 50, origin: (250, 940), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (266, 964), (686, 964))
  for (n, x, y) in (($A$, 266, 979), ($M$, 385, 952), ($O$, 475, 952), ($B$, 504, 979), ($N$, 595, 952), ($C$, 686, 979)) {
    A-tick(p, (0, 0), (1, 0), (x, 964), s: 8)
    lbl(p, (x, y), n, dir: "c", d: 0)
  }
})

// 图 1·23（p.19）：射线 OA 绕端点 O 旋转一周得到圆
#let fig-A-1-23(width: 330 * k) = px-canvas(330, 270, origin: (520, 300), width: width, (p, u) => {
  import cetz.draw: *
  let o = (662, 426)
  circ(p, o, 115)
  seg(p, o, (777, 426))
  seg(p, (777, 426), (833, 426))
  seg(p, o, (588, 339))
  seg(p, o, (691, 536))
  A-ring(p, (777, 426))
  let marks = (end: "stealth", fill: black, scale: 0.4)
  arc(p(..o), start: 12deg, stop: 41deg, radius: 131, anchor: "origin", stroke: lw, mark: marks)
  arc(p(..o), start: 179deg, stop: 208deg, radius: 131, anchor: "origin", stroke: lw, mark: marks)
  arc(p(..o), start: 288deg, stop: 317deg, radius: 131, anchor: "origin", stroke: lw, mark: marks)
  lbl(p, (651, 434), $O$, dir: "c", d: 0)
  lbl(p, (787, 414), $A$, dir: "c", d: 0)
  lbl(p, (580, 327), $B$, dir: "c", d: 0)
  lbl(p, (692, 551), $C$, dir: "c", d: 0)
})

// 图 1·24（p.19）：割线 PQ、弦 CD、直径 AB、弧 EmF
#let fig-A-1-24(width: 350 * k) = px-canvas(350, 270, origin: (500, 810), width: width, (p, u) => {
  import cetz.draw: *
  circ(p, (681, 947), 116)
  seg(p, (565, 947), (797, 947))
  A-ring(p, (681, 947), r: 2.5)
  seg(p, (520, 905), (822, 839))
  seg(p, (592, 1016), (740, 1045))
  lbl(p, (522, 917), $P$, dir: "c", d: 0)
  lbl(p, (818, 852), $Q$, dir: "c", d: 0)
  lbl(p, (572, 883), $E$, dir: "c", d: 0)
  lbl(p, (752, 842), $F$, dir: "c", d: 0)
  lbl(p, (640, 826), $m$, dir: "c", d: 0)
  lbl(p, (549, 947), $A$, dir: "c", d: 0)
  lbl(p, (806, 947), $B$, dir: "c", d: 0)
  lbl(p, (681, 960), $O$, dir: "c", d: 0)
  lbl(p, (574, 1018), $C$, dir: "c", d: 0)
  lbl(p, (749, 1058), $D$, dir: "c", d: 0)
})

// 图 1·25（p.20）：圆 M 和圆 N
#let fig-A-1-25(width: 490 * k) = px-canvas(490, 230, origin: (290, 490), width: width, (p, u) => {
  import cetz.draw: *
  circ(p, (407, 600), 96.5)
  circ(p, (634, 608), 97.5)
  for c in ((407, 600), (503, 601), (375, 690), (634, 608), (730, 605), (547, 651), (688, 688)) { A-ring(p, c) }
  lbl(p, (406, 617), $M$, dir: "c", d: 0)
  lbl(p, (516, 602), $B$, dir: "c", d: 0)
  lbl(p, (370, 706), $A$, dir: "c", d: 0)
  lbl(p, (633, 625), $N$, dir: "c", d: 0)
  lbl(p, (743, 606), $E$, dir: "c", d: 0)
  lbl(p, (534, 654), $C$, dir: "c", d: 0)
  lbl(p, (690, 706), $D$, dir: "c", d: 0)
})
