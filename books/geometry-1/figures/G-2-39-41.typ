// 图 2·39（原书 p.109）、图 2·40（p.110）、图 2·41（p.111）；页面 200 dpi 坐标。
#import "G-base.typ": *

// 图 2·39 两个全等三角形
#let fig-G-2-39(width: 690 * k) = px-canvas(690, 190, origin: (200, 865), width: width, (p, u) => {
  import cetz.draw: *
  poly(p, ((333, 900), (232, 1030), (500, 1032)), close: true)
  poly(p, ((672, 900), (567, 1033), (838, 1036)), close: true)
  lbl(p, (333, 900), $A$, dir: "n")
  lbl(p, (232, 1030), $B$, dir: "w", d: 11)
  lbl(p, (500, 1032), $C$, dir: "e", d: 11)
  lbl(p, (672, 900), $A'$, dir: "n")
  lbl(p, (567, 1033), $B'$, dir: "w", d: 12)
  lbl(p, (838, 1036), $C'$, dir: "e", d: 13)
})

// 图 2·40 三根硬纸条构成的三角形（纸条画成白底矩形，小孔处穿结）
#let fig-G-2-40(width: 440 * k) = px-canvas(440, 255, origin: (395, 845), width: width, (p, u) => {
  import cetz.draw: *
  line(p(398, 1018), p(825, 1018), p(825, 1042), p(398, 1042), close: true, stroke: lw, fill: white)
  G-bar(p, (603, 853), (432, 1080), 20)
  G-bar(p, (517, 863), (808, 1072), 21)
  G-hole(p, (566, 898))
  G-hole(p, (464, 1028))
  G-hole(p, (749, 1031))
})

// 图 2·41 两根纸条 l1、l2 的一头穿结（斜纹为纸条）
// 原图三处字母下标看不清（顶部像 l1，中间像 l2，右下像 l2 或 l3）：顶部、中间照文中的 l1、l2，右下用 unclear 标出。
#let fig-G-2-41(width: 440 * k) = px-canvas(440, 360, origin: (440, 350), width: width, (p, u) => {
  import cetz.draw: *
  G-bar(p, (568, 383), (508, 704), 22, hatch: true)
  G-bar(p, (746, 524), (462, 681), 22, hatch: true)
  line(p(455, 638), p(822, 638), p(822, 661), p(455, 661), close: true, stroke: lw, fill: white)
  G-hole(p, (517, 650))
  G-hole(p, (797, 650))
  G-hole(p, (565, 405))
  G-hole(p, (728, 535))
  // 虚线表示第三边
  seg(p, (565, 405), (797, 650), stroke: dsh)
  seg(p, (728, 535), (797, 650), stroke: dsh)
  // ∠1
  anglearc(p, (517, 650), (600, 650), (535, 597), 56)
  content(p(598, 630), tsm($1$))
  content(p(575, 363), tt($l_1$))
  content(p(768, 513), tt($l_2$))
  content(p(843, 650), box(fill: rgb("#ffe58f"), inset: (x: 1pt, y: 1.5pt), tt($l_3$)))   // TODO 原图看不清下标
})
