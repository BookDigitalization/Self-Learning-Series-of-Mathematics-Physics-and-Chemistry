// 图 1·34–图 1·39（原书 p.24–26），读坐标时的页面渲染 200 dpi。
// 量角器（图 1·37–1·39）用 B-lib 的 B-protractor 重画：外沿每度一格，两排度数方向相反。
#import "/books/geometry-1/figures/B-lib.typ": *

// 图 1·34（p.24）：∠AOB = ∠DEF，第三幅是把 ∠DEF 放到 ∠AOB 上
#let fig-B-1-34(width: 710 * k) = px-canvas(710, 215, origin: (180, 592), width: width, (p, u) => {
  import cetz.draw: *
  B-ray(p, (200, 758), (400, 758))
  B-ray(p, (200, 758), (384, 611))
  lbl(p, (200, 758), $O$, dir: "w", d: 11)
  lbl(p, (400, 758), $A$, dir: "e", d: 11)
  lbl(p, (384, 611), $B$, dir: "ne", d: 11)
  B-ray(p, (437, 757), (617, 757))
  B-ray(p, (437, 757), (594, 632))
  lbl(p, (437, 757), $E$, dir: "w", d: 11)
  lbl(p, (617, 757), $D$, dir: "s", d: 11)
  lbl(p, (594, 632), $F$, dir: "ne", d: 11)
  let o = (648, 757)
  B-ray(p, o, (868, 757))
  B-ray(p, o, (832, 610))
  tickat(p, o, (868, 757), (828, 757), s: 4)
  tickat(p, o, (832, 610), (804, 632), s: 4)
  lbl(p, o, $O$, dir: "w", d: 9)
  lbl(p, (648, 780), $(E)$, dir: "c", d: 0)
  lbl(p, (868, 757), $A$, dir: "e", d: 11)
  lbl(p, (832, 610), $B$, dir: "ne", d: 11)
  lbl(p, (794, 626), $F$, dir: "nw", d: 6)
  lbl(p, (830, 777), $D$, dir: "c", d: 0)
})

// 图 1·35（p.24）：∠ABC > ∠DEF
#let fig-B-1-35(width: 700 * k) = px-canvas(700, 225, origin: (190, 1040), width: width, (p, u) => {
  import cetz.draw: *
  B-ray(p, (210, 1210), (385, 1210))
  B-ray(p, (210, 1210), (345, 1073))
  anglearc(p, (210, 1210), (385, 1210), (345, 1073), 42)
  lbl(p, (210, 1210), $B$, dir: "w", d: 11)
  lbl(p, (385, 1210), $A$, dir: "e", d: 11)
  lbl(p, (345, 1073), $C$, dir: "ne", d: 11)
  // ∠DEF
  B-hatch(p, (450, 1210), (635, 1210), (620, 1128), ang: 72, s: 8)
  poly(p, ((450, 1210), (635, 1210), (620, 1128)), close: true)
  anglearc(p, (450, 1210), (635, 1210), (620, 1128), 30)
  lbl(p, (450, 1210), $E$, dir: "w", d: 11)
  lbl(p, (635, 1210), $D$, dir: "s", d: 11)
  lbl(p, (620, 1128), $F$, dir: "ne", d: 11)
  // 重合：E 与 B、ED 与 BA 重合
  B-hatch(p, (660, 1210), (850, 1210), (843, 1126), ang: 72, s: 8)
  poly(p, ((660, 1210), (850, 1210), (843, 1126)), close: true)
  B-ray(p, (660, 1210), (810, 1057))
  anglearc(p, (660, 1210), (850, 1210), (810, 1057), 44)
  anglearc(p, (660, 1210), (850, 1210), (843, 1126), 30)
  lbl(p, (672, 1228), $B$, dir: "c", d: 0)
  lbl(p, (660, 1247), $(E)$, dir: "c", d: 0)
  lbl(p, (862, 1210), $A$, dir: "e", d: 6)
  lbl(p, (860, 1236), $(D)$, dir: "c", d: 0)
  lbl(p, (810, 1057), $C$, dir: "ne", d: 11)
  lbl(p, (843, 1126), $F$, dir: "ne", d: 11)
})

// 图 1·36（p.25）：∠ABC < ∠DEF
#let fig-B-1-36(width: 760 * k) = px-canvas(760, 215, origin: (100, 435), width: width, (p, u) => {
  import cetz.draw: *
  B-ray(p, (140, 598), (298, 598))
  B-ray(p, (140, 598), (318, 515))
  anglearc(p, (140, 598), (298, 598), (318, 515), 45)
  lbl(p, (140, 598), $B$, dir: "w", d: 11)
  lbl(p, (298, 598), $A$, dir: "se", d: 11)
  lbl(p, (318, 515), $C$, dir: "ne", d: 11)
  B-hatch(p, (345, 604), (565, 604), (508, 446), ang: 77, s: 9)
  poly(p, ((345, 604), (565, 604), (508, 446)), close: true)
  anglearc(p, (345, 604), (565, 604), (508, 446), 32)
  lbl(p, (345, 604), $E$, dir: "w", d: 11)
  lbl(p, (565, 604), $D$, dir: "s", d: 11)
  lbl(p, (508, 446), $F$, dir: "ne", d: 11)
  B-hatch(p, (580, 603), (800, 603), (743, 447), ang: 77, s: 9)
  poly(p, ((580, 603), (800, 603), (743, 447)), close: true)
  B-ray(p, (580, 603), (777, 503))
  anglearc(p, (580, 603), (800, 603), (743, 447), 34)
  anglearc(p, (580, 603), (800, 603), (777, 503), 44)
  lbl(p, (594, 616), $B$, dir: "c", d: 0)
  lbl(p, (580, 638), $(E)$, dir: "c", d: 0)
  lbl(p, (810, 603), $A$, dir: "e", d: 6)
  lbl(p, (810, 624), $(D)$, dir: "c", d: 0)
  lbl(p, (777, 503), $C$, dir: "ne", d: 11)
  lbl(p, (743, 447), $F$, dir: "ne", d: 11)
})

// 图 1·37（p.25）：量角器
#let fig-B-1-37(width: 470 * k) = px-canvas(470, 265, origin: (255, 1008), width: width, (p, u) => {
  import cetz.draw: *
  B-protractor(p, (490, 1238))
  lbl(p, (480, 1224), $O$, dir: "c", d: 0)
})

// 图 1·38（p.26）：∠ABC = 60°，量角器圆心与顶点 B 重合，BA 与 0° 刻线重合
#let fig-B-1-38(width: 530 * k) = px-canvas(530, 285, origin: (255, 320), width: width, (p, u) => {
  import cetz.draw: *
  B-protractor(p, (490, 567))
  B-ray(p, (710, 565), (762, 565))
  B-ray(p, B-pt((490, 565), 60, 222), B-pt((490, 565), 60, 272))
  lbl(p, (480, 553), $O$, dir: "c", d: 0)
  lbl(p, (490, 580), $(B)$, dir: "c", d: 0)
  lbl(p, (772, 565), $A$, dir: "c", d: 0)
  lbl(p, B-pt((490, 565), 60, 285), $C$, dir: "c", d: 0)
})

// 图 1·39（p.26）：画 35° 角
#let fig-B-1-39(width: 530 * k) = px-canvas(530, 265, origin: (255, 1008), width: width, (p, u) => {
  import cetz.draw: *
  B-protractor(p, (490, 1233))
  B-ray(p, (710, 1231), (762, 1231))
  B-ray(p, B-pt((490, 1231), 35, 222), B-pt((490, 1231), 35, 288))
  B-ray(p, (490, 1231), B-pt((490, 1231), 35, 33))
  lbl(p, (480, 1219), $O$, dir: "c", d: 0)
  lbl(p, (775, 1231), $E$, dir: "c", d: 0)
  lbl(p, B-pt((490, 1231), 35, 302), $F$, dir: "c", d: 0)
})
