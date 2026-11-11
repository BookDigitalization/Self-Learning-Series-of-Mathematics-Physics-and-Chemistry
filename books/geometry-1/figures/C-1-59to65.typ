// 图 1·59（原书 p.39，写实）、图 1·60（p.41）、图 1·61、1·62（p.42）、图 1·63（p.43）、图 1·64（p.44）、图 1·65（p.45）；页面 200 dpi 坐标。
#import "C-base.typ": *

// 图 1·59 用绳子定垂足（写实插画：原扫描二值化；原图里的字母 D 涂去后用真文字补上）
#let fig-C-1-59(width: 352 * k) = px-canvas(352, 294, origin: (510, 138), width: width, (p, u) => {
  import cetz.draw: *
  C-img(p, u, "C-1-59.png", (510, 138, 862, 432))
  lbl(p, (848, 414), $D$, dir: "c", d: 0)
})

// 图 1·60 直角被分成两个角
#let fig-C-1-60(width: 310 * k) = px-canvas(310, 280, origin: (555, 505), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (575, 540), (575, 745))
  seg(p, (575, 745), (826, 745))
  seg(p, (575, 745), (782, 628))
  anglearc(p, (575, 745), (826, 745), (782, 628), 30)
  seg(p, (578, 717), (588, 721), stroke: lt)
  lbl(p, (595, 722), $d$, dir: "c", d: 0)
  lbl(p, (575, 527), $B$, dir: "c", d: 0)
  lbl(p, (800, 623), $C$, dir: "c", d: 0)
  lbl(p, (840, 752), $A$, dir: "c", d: 0)
  lbl(p, (562, 754), $O$, dir: "c", d: 0)
})

// 图 1·61 邻补角
#let fig-C-1-61(width: 520 * k) = px-canvas(520, 275, origin: (230, 325), width: width, (p, u) => {
  import cetz.draw: *
  // 左
  seg(p, (240, 577), (345, 577), stroke: dsh)
  seg(p, (345, 577), (535, 577))
  seg(p, (345, 577), (473, 435))
  C-n(p, 351, 566, $2$)
  C-n(p, 385, 565, $1$)
  // 右
  seg(p, (668, 490), (583, 343))
  seg(p, (668, 490), (630, 585))
  seg(p, (668, 490), (735, 335), stroke: dsh)
  C-n(p, 652, 493, $3$)
  C-n(p, 665, 463, $4$)
})

// 图 1·62 对顶角（虚线是 CO、DO 的部分）
#let fig-C-1-62(width: 440 * k) = px-canvas(440, 230, origin: (270, 890), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (300, 918), (482, 1012), stroke: dsh)
  seg(p, (307, 1098), (482, 1012), stroke: dsh)
  seg(p, (482, 1012), (662, 1103))
  seg(p, (482, 1012), (676, 917))
  anglearc(p, (482, 1012), (676, 917), (662, 1103), 28)
  lbl(p, (293, 912), $C$, dir: "c", d: 0)
  lbl(p, (685, 911), $B$, dir: "c", d: 0)
  lbl(p, (297, 1103), $D$, dir: "c", d: 0)
  lbl(p, (667, 1109), $A$, dir: "c", d: 0)
  lbl(p, (482, 1030), $O$, dir: "c", d: 0)
})

// 图 1·63 ∠AOB = 55°
#let fig-C-1-63(width: 430 * k) = px-canvas(430, 240, origin: (280, 265), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (305, 285), (675, 478))
  seg(p, (300, 478), (688, 285))
  anglearc(p, (490, 383), (688, 285), (675, 478), 28)
  lbl(p, (545, 380), tsm($55°$), dir: "c", d: 0)
  lbl(p, (303, 283), $C$, dir: "c", d: 0)
  lbl(p, (692, 283), $B$, dir: "c", d: 0)
  lbl(p, (298, 479), $D$, dir: "c", d: 0)
  lbl(p, (678, 481), $A$, dir: "c", d: 0)
  lbl(p, (490, 398), $O$, dir: "c", d: 0)
})

// 图 1·64 ∠a 的余角的补角
#let fig-C-1-64(width: 420 * k) = px-canvas(420, 250, origin: (290, 690), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (442, 885), (442, 712))
  seg(p, (442, 885), (683, 884))
  seg(p, (307, 925), (673, 820))
  anglearc(p, (442, 885), (683, 884), (673, 820), 66)
  anglearc(p, (442, 885), (442, 712), (673, 820), 32)
  anglearc(p, (442, 885), (442, 712), (307, 925), 22)
  lbl(p, (552, 870), tsm($a = 15°$), dir: "c", d: 0)
  lbl(p, (470, 846), $b$, dir: "c", d: 0)
  lbl(p, (418, 868), $c$, dir: "c", d: 0)
  lbl(p, (442, 703), $C$, dir: "c", d: 0)
  lbl(p, (687, 818), $B$, dir: "c", d: 0)
  lbl(p, (688, 884), $A$, dir: "c", d: 0)
  lbl(p, (303, 928), $D$, dir: "c", d: 0)
  lbl(p, (446, 898), $O$, dir: "c", d: 0)
})

// 图 1·65 直线 AB、CD 相交于 O，∠AOC = 32°30′
#let fig-C-1-65(width: 460 * k) = px-canvas(460, 160, origin: (270, 150), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (290, 162), (710, 282))
  seg(p, (298, 290), (710, 175))
  anglearc(p, (510, 228), (710, 175), (710, 282), 28)
  lbl(p, (582, 226), tsm($32°30'$), dir: "c", d: 0)
  lbl(p, (287, 161), $B$, dir: "c", d: 0)
  lbl(p, (714, 173), $C$, dir: "c", d: 0)
  lbl(p, (714, 284), $A$, dir: "c", d: 0)
  lbl(p, (296, 292), $D$, dir: "c", d: 0)
  lbl(p, (512, 242), $O$, dir: "c", d: 0)
})
