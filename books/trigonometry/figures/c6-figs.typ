// 段 c6（三角 第 6 章 利用对数解三角形，原书 p.204–240）插图：图 6·1–6·12，复习题六第 13、16 题。
// 坐标取自 crop-view.py 按 --dpi 200 渲染的整页像素（页宽约 1271 像素，offset 7）。
#import "/common/geo.typ": *

#let k = 0.012cm   // 1 像素（200 dpi）≈ 0.012 cm

#let c6-lerp(a, b, t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)
// 沿线段 a→b 方向的文字（旋转与线平行），pt 为中心
#let c6-along(p, a, b, pt, body) = {
  import cetz.draw: *
  content(p(..pt), angle: dirang(b.at(0) - a.at(0), b.at(1) - a.at(1)), tt(body))
}

// 图 6·1（p.210）塔高：A=14°36′，AC=50.68 m
#let fig-c6-6-1(width: 520 * k) = px-canvas(520, 190, origin: (330, 790), width: width, (p, u) => {
  import cetz.draw: *
  let A = (350, 948)
  let B = (820, 818)
  let C = (820, 948)
  poly(p, (A, B, C), close: true)
  rtmark(p, C, A, B, s: 10)
  anglearc(p, A, C, B, 30)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, B, $B$, dir: "ne", d: 11)
  lbl(p, C, $C$, dir: "se", d: 11)
  content(p(425, 935), tt[$14°36'$])
  content(p(600, 968), tt[50.68 m])
})

// 图 6·2（p.211）圆内的弦
#let fig-c6-6-2(width: 290 * k) = px-canvas(290, 320, origin: (755, 235), width: width, (p, u) => {
  import cetz.draw: *
  let O = (897, 385)
  let A = (802, 483)
  let B = (997, 478)
  let D = (900, 480)
  circ(p, O, 136)
  seg(p, A, B)
  seg(p, O, A)
  seg(p, O, B)
  seg(p, O, D)
  anglearc(p, O, A, B, 22)
  line(p(900, 440), p(948, 410), stroke: lt)
  lbl(p, O, $O$, dir: "n", d: 12)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, D, $D$, dir: "ne", d: 12)
  lbl(p, c6-lerp(O, A, 0.5), $x$, dir: "nw", d: 10)
  content(p(968, 404), tt[9.003 cm])
  content(p(900, 497), tt[18.32 cm])
})

// 图 6·3（p.213）船 C 与岸上 A、B
#let fig-c6-6-3(width: 300 * k) = px-canvas(300, 420, origin: (780, 900), width: width, (p, u) => {
  import cetz.draw: *
  let A = (805, 1272)
  let B = (1030, 1272)
  let C = (938, 925)
  // 水波
  for i in range(8) {
    let y = 975 + i * 33
    let t = (y - C.at(1)) / (A.at(1) - C.at(1))
    let xl = C.at(0) + (A.at(0) - C.at(0)) * t - 40
    let xr = C.at(0) + (B.at(0) - C.at(0)) * t + 40
    let pts = range(0, 21).map(j => {
      let x = xl + (xr - xl) * j / 20
      (x, y + 5 * calc.sin(j * 1.0 * 180deg / 3 * 1 + i * 40deg))
    })
    line(..pts.map(q => p(..q)), stroke: lt)
  }
  poly(p, (A, B, C), close: true)
  line(p(..C), p(915, 1215), stroke: dsh)
  anglearc(p, A, B, C, 26)
  anglearc(p, B, A, C, 26)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, C, $C$, dir: "n", d: 11)
  content(p(852, 1258), tt[$67°43'$])
  content(p(980, 1258), tt[$74°21'$])
  content(p(918, 1292), tt[96.13 m])
})

// 图 6·4（p.216）
#let fig-c6-6-4(width: 520 * k) = px-canvas(520, 190, origin: (340, 975), width: width, (p, u) => {
  import cetz.draw: *
  let B = (385, 1130)
  let A = (822, 1135)
  let C = (608, 953)
  poly(p, (B, A, C), close: true)
  anglearc(p, B, A, C, 28)
  lbl(p, B, $B$, dir: "sw", d: 11)
  lbl(p, A, $A$, dir: "se", d: 11)
  lbl(p, C, $C$, dir: "n", d: 11)
  content(p(443, 1114), tt[$41°10'$])
  c6-along(p, B, C, (468, 1028), [145.3 m])
  c6-along(p, C, A, (738, 1018), [178.2 m])
  lbl(p, (600, 1150), $x$, dir: "c", d: 0)
})

// 图 6·5（p.221）
#let fig-c6-6-5(width: 480 * k) = px-canvas(480, 215, origin: (410, 250), width: width, (p, u) => {
  import cetz.draw: *
  let A = (432, 432)
  let B = (740, 436)
  let C = (870, 268)
  poly(p, (A, B, C), close: true)
  anglearc(p, C, A, B, 36)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, B, $B$, dir: "s", d: 12)
  lbl(p, C, $C$, dir: "ne", d: 11)
  c6-along(p, A, C, (558, 338), [6.933 km])
  c6-along(p, B, C, (826, 372), [3 km])
  content(p(810, 292), tt[$33°56'$])
})

// 图 6·6（p.228）∠A 是锐角，作高 CD
#let fig-c6-6-6(width: 440 * k) = px-canvas(440, 215, origin: (160, 1130), width: width, (p, u) => {
  import cetz.draw: *
  let A = (190, 1328)
  let B = (580, 1328)
  let C = (350, 1148)
  let D = (350, 1328)
  poly(p, (A, B, C), close: true)
  line(p(..C), p(..D), stroke: dsh)
  anglearc(p, A, B, C, 30)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, D, $D$, dir: "s", d: 12)
  lbl(p, c6-lerp(A, C, 0.5), $b$, dir: "nw", d: 10)
  lbl(p, c6-lerp(D, B, 0.5), $c$, dir: "s", d: 12)
})

// 图 6·7（p.228）∠A 是直角
#let fig-c6-6-7(width: 290 * k) = px-canvas(290, 215, origin: (680, 1130), width: width, (p, u) => {
  import cetz.draw: *
  let A = (710, 1328)
  let B = (930, 1328)
  let C = (710, 1178)
  poly(p, (A, B, C), close: true)
  rtmark(p, A, B, C, s: 10)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, C, $C$, dir: "nw", d: 11)
  lbl(p, c6-lerp(A, C, 0.5), $b$, dir: "w", d: 10)
  lbl(p, c6-lerp(A, B, 0.5), $c$, dir: "s", d: 12)
})

// 图 6·8（p.229）∠A 是钝角，作高 CD 交 c 边的延长线于 D
#let fig-c6-6-8(width: 480 * k) = px-canvas(480, 240, origin: (440, 650), width: width, (p, u) => {
  import cetz.draw: *
  let A = (655, 851)
  let B = (880, 851)
  let C = (490, 675)
  let D = (490, 851)
  poly(p, (A, B, C), close: true)
  line(p(..C), p(..D), stroke: dsh)
  line(p(..D), p(..A), stroke: dsh)
  anglearc(p, A, B, C, 28)
  lbl(p, A, $A$, dir: "s", d: 12)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, D, $D$, dir: "s", d: 12)
  lbl(p, c6-lerp(A, C, 0.5), $b$, dir: "ne", d: 10)
  lbl(p, c6-lerp(A, B, 0.5), $c$, dir: "s", d: 12)
})

// 图 6·9（p.232）∠A 是锐角：外接圆直径 CD
#let fig-c6-6-9(width: 290 * k) = px-canvas(290, 320, origin: (165, 1015), width: width, (p, u) => {
  import cetz.draw: *
  let O = (312, 1171)
  let A = (340, 1048)
  let B = (200, 1235)
  let C = (425, 1230)
  let D = (198, 1117)
  circ(p, O, 129)
  poly(p, (A, B, C), close: true)
  line(p(..D), p(..C), stroke: dsh)
  line(p(..D), p(..B), stroke: dsh)
  anglearc(p, A, B, C, 20)
  anglearc(p, D, B, C, 20)
  circle(p(..O), radius: 2.5, stroke: lt)
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "sw", d: 11)
  lbl(p, C, $C$, dir: "se", d: 11)
  lbl(p, D, $D$, dir: "nw", d: 11)
  lbl(p, O, $O$, dir: "ne", d: 10)
  lbl(p, c6-lerp(B, C, 0.5), $a$, dir: "s", d: 13)
})

// 图 6·10（p.233）∠A 是直角：BC 是直径
#let fig-c6-6-10(width: 320 * k) = px-canvas(320, 290, origin: (255, 240), width: width, (p, u) => {
  import cetz.draw: *
  let O = (416, 372)
  let B = (288, 372)
  let C = (544, 372)
  let A = (460, 252)
  circ(p, O, 128)
  poly(p, (B, A, C, B), close: true)
  rtmark(p, A, B, C, s: 9)
  circle(p(..O), radius: 2.5, stroke: lt)
  lbl(p, A, $A$, dir: "ne", d: 11)
  lbl(p, B, $B$, dir: "w", d: 12)
  lbl(p, C, $C$, dir: "e", d: 12)
  lbl(p, O, $O$, dir: "s", d: 12)
  lbl(p, (400, 372), $a$, dir: "n", d: 11)
})

// 图 6·11（p.233）∠A 是钝角：外接圆直径 CD
#let fig-c6-6-11(width: 320 * k) = px-canvas(320, 290, origin: (695, 235), width: width, (p, u) => {
  import cetz.draw: *
  let O = (854, 372)
  let B = (737, 323)
  let C = (972, 323)
  let A = (882, 250)
  let D = (740, 423)
  circ(p, O, 127)
  poly(p, (B, A, C, B), close: true)
  line(p(..B), p(..D), stroke: dsh)
  line(p(..D), p(..C), stroke: dsh)
  anglearc(p, A, B, C, 18)
  anglearc(p, D, B, C, 18)
  circle(p(..O), radius: 2.5, stroke: lt)
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "w", d: 12)
  lbl(p, C, $C$, dir: "e", d: 12)
  lbl(p, D, $D$, dir: "sw", d: 11)
  lbl(p, O, $O$, dir: "s", d: 11)
  lbl(p, (855, 323), $a$, dir: "n", d: 11)
})

// 图 6·12（p.234）内切圆
#let fig-c6-6-12(width: 520 * k) = px-canvas(520, 270, origin: (340, 970), width: width, (p, u) => {
  import cetz.draw: *
  let A = (537, 982)
  let B = (365, 1201)
  let C = (842, 1200)
  let I = (556, 1106)
  let r = 95
  // 内切圆与三边的切点：I 在各边上的垂足
  let foot(P, Q) = {
    let (dx, dy) = (Q.at(0) - P.at(0), Q.at(1) - P.at(1))
    let t = ((I.at(0) - P.at(0)) * dx + (I.at(1) - P.at(1)) * dy) / (dx * dx + dy * dy)
    (P.at(0) + t * dx, P.at(1) + t * dy)
  }
  let D = foot(B, C)
  let E = foot(C, A)
  let F = foot(A, B)
  poly(p, (A, B, C), close: true)
  circ(p, I, r)
  for P in (A, B, C, D, E, F) { line(p(..I), p(..P), stroke: dsh) }
  pdot(p, I, r: 3)
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "sw", d: 11)
  lbl(p, C, $C$, dir: "se", d: 11)
  lbl(p, D, $D$, dir: "s", d: 12)
  lbl(p, E, $E$, dir: "ne", d: 12)
  lbl(p, F, $F$, dir: "nw", d: 12)
  lbl(p, I, $I$, dir: "se", d: 12)
})

// 复习题六第 13 题（p.239）：原扫描裁剪二值化 PNG（页面 200 dpi 坐标 (385,895)–(915,1275)，字母已涂去后用真文字补上）
#let fig-c6-r13(width: 530 * k) = px-canvas(530, 380, origin: (385, 895), width: width, (p, u) => {
  import cetz.draw: *
  pimg(p, u, "/books/trigonometry/figures/c6-r13.png", (385, 895, 915, 1275))
  lbl(p, (835, 903), $B$, dir: "c", d: 0)
  lbl(p, (412, 1202), $C$, dir: "c", d: 0)
  lbl(p, (565, 1200), $A$, dir: "c", d: 0)
  lbl(p, (847, 1207), $D$, dir: "c", d: 0)
  lbl(p, (417, 1241), $L$, dir: "c", d: 0)
  lbl(p, (572, 1243), $M$, dir: "c", d: 0)
  lbl(p, (831, 1244), $E$, dir: "c", d: 0)
})

// 复习题六第 16 题（p.240）：原扫描裁剪二值化 PNG（页面 200 dpi 坐标 (285,360)–(910,640)）
#let fig-c6-r16(width: 625 * k) = px-canvas(625, 280, origin: (285, 360), width: width, (p, u) => {
  import cetz.draw: *
  pimg(p, u, "/books/trigonometry/figures/c6-r16.png", (285, 360, 910, 640))
  lbl(p, (382, 430), $C$, dir: "c", d: 0)
  lbl(p, (792, 368), $D$, dir: "c", d: 0)
  lbl(p, (366, 582), $M$, dir: "c", d: 0)
  lbl(p, (587, 563), $L$, dir: "c", d: 0)
  lbl(p, (587, 614), $K$, dir: "c", d: 0)
  lbl(p, (380, 614), $A$, dir: "c", d: 0)
  lbl(p, (788, 614), $B$, dir: "c", d: 0)
  lbl(p, (802, 589), $N$, dir: "c", d: 0)
  lbl(p, (802, 447), $F$, dir: "c", d: 0)
  lbl(p, (545, 570), $alpha$, dir: "c", d: 0)
  lbl(p, (637, 568), $beta$, dir: "c", d: 0)
  lbl(p, (318, 524), $h_1$, dir: "c", d: 0)
  lbl(p, (866, 507), $h_2$, dir: "c", d: 0)
})
