// 图 3·18、3·19（原书 p.179）、3·20、3·21、3·22（p.180）、3·23、3·24（p.182）；页面 200 dpi 坐标。
// 图 3·18 四幅写实/花纹图保留二值化 PNG（来源 p.179 区域 80,165,810,440），图名文字用真文字。
#import "J-base.typ": *

// 图 3·18：十字花冠、螺旋桨、四叶电扇、设计图样
#let fig-J-3-18(width: 750 * k) = px-canvas(750, 330, origin: (70, 160), width: width, (p, u) => {
  import cetz.draw: *
  content(p(80, 165), image("J-3-18.png", width: 730 * u), anchor: "north-west")
  let cap(x, s) = content(p(x, 462), text(font: fonts.kai, size: 8pt, s))
  cap(183, [十字花冠])
  cap(324, [螺旋桨])
  cap(487, [四叶电扇])
  cap(704, [设计图样])
})

// 图 3·19：平行四边形绕对角线交点 O 旋转 180°，△ODA、△OBC 画阴影线
#let fig-J-3-19(width: 360 * k) = px-canvas(360, 185, origin: (480, 925), width: width, (p, u) => {
  import cetz.draw: *
  let (D, C, B, A) = ((560, 941), (800, 941), (740, 1080), (500, 1080))
  let O = (650, 1010.5)
  J-hatch(p, (D, O, A), 0, 1, 6)
  J-hatch(p, (O, C, B), 0, 1, 6)
  poly(p, (A, B, C, D), close: true)
  seg(p, A, C)
  seg(p, B, D)
  lbl(p, D, $D$, dir: "nw", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 11)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, O, $O$, dir: "n", d: 10)
})

// 图 3·20：B、C 关于点 O 中心对称，OC 绕 O 旋转 180°
#let fig-J-3-20(width: 420 * k) = px-canvas(420, 130, origin: (330, 290), width: width, (p, u) => {
  import cetz.draw: *
  let (B, C, O) = ((371, 390), (699, 321), (535, 356))
  seg(p, B, C, stroke: dsh)
  arc(p(..O), start: 15deg, stop: 188deg, radius: 55, anchor: "origin", stroke: lw, mark: (end: "stealth", fill: black, scale: 0.45))
  J-ring(p, B)
  J-ring(p, C)
  J-ring(p, O, r: 2.5)
  lbl(p, (528, 316), $180°$, dir: "c", d: 0)
  lbl(p, B, $B$, dir: "w", d: 11)
  lbl(p, C, $C$, dir: "e", d: 12)
  lbl(p, O, $O$, dir: "s", d: 11)
})

// 图 3·21：B、C 与 B'、C' 关于点 O 成中心对称
#let fig-J-3-21(width: 360 * k) = px-canvas(360, 195, origin: (560, 590), width: width, (p, u) => {
  import cetz.draw: *
  let (B, C, B1, C1, O) = ((582, 765), (651, 615), (890, 610), (822, 765), (735, 688))
  seg(p, B, C)
  seg(p, B1, C1)
  seg(p, B, B1, stroke: dsh)
  seg(p, C, C1, stroke: dsh)
  J-ring(p, O, r: 2.5)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "sw", d: 11)
  lbl(p, B1, $B'$, dir: "ne", d: 11)
  lbl(p, C1, $C'$, dir: "se", d: 11)
  lbl(p, O, $O$, dir: "n", d: 10)
})

// 图 3·22：△ABC 与 △A'B'C' 关于点 O 成中心对称
#let fig-J-3-22(width: 480 * k) = px-canvas(480, 310, origin: (300, 985), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C) = ((332, 1132), (397, 1270), (401, 1068))
  let (A1, B1, C1) = ((740, 1138), (671, 1008), (669, 1210))
  let O = (535, 1137)
  poly(p, (A, B, C), close: true)
  poly(p, (A1, B1, C1), close: true)
  seg(p, A, A1, stroke: dsh)
  seg(p, B, B1, stroke: dsh)
  seg(p, C, C1, stroke: dsh)
  J-ring(p, O, r: 2.5)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "s", d: 11)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, A1, $A'$, dir: "e", d: 12)
  lbl(p, B1, $B'$, dir: "n", d: 11)
  lbl(p, C1, $C'$, dir: "s", d: 11)
  lbl(p, O, $O$, dir: "n", d: 10)
})

// 图 3·23：矩形 ABCD（对角线；三个三角形分别画横线、竖线、方格）
#let fig-J-3-23(width: 340 * k) = px-canvas(340, 195, origin: (550, 515), width: width, (p, u) => {
  import cetz.draw: *
  let (D, C, B, A) = ((572, 535), (858, 535), (858, 684), (572, 684))
  let O = (715, 609.5)
  J-hatch(p, (D, O, A), 0, 1, 5)
  J-hatch(p, (C, B, O), 1, 0, 5)
  J-hatch(p, (A, B, O), 0, 1, 5)
  J-hatch(p, (A, B, O), 1, 0, 5)
  poly(p, (A, B, C, D), close: true)
  seg(p, A, C)
  seg(p, B, D)
  lbl(p, D, $D$, dir: "nw", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 11)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, A, $A$, dir: "sw", d: 11)
})

// 图 3·24：菱形 ABCD，对角线 AC、BD；D、B 处各 2 道角弧，C、A 处各 1 道
#let fig-J-3-24(width: 260 * k) = px-canvas(260, 400, origin: (640, 850), width: width, (p, u) => {
  import cetz.draw: *
  let (C, D, A, B) = ((771, 875), (678, 1050), (771, 1225), (865, 1050))
  poly(p, (A, B, C, D), close: true)
  seg(p, A, C)
  seg(p, B, D)
  anglearc(p, C, D, B, 24)
  anglearc(p, A, D, B, 24)
  for r in (14, 19) {
    anglearc(p, D, C, A, r)
    anglearc(p, B, C, A, r)
  }
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, A, $A$, dir: "s", d: 11)
  lbl(p, D, $D$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
})
