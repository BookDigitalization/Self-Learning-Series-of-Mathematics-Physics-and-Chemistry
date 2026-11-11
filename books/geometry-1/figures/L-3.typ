// 段 L：第 3 章 本章提要（p.208 附图“四边形的分类”）、复习题三（p.209–212）第 6、12、15、20、22 题插图。
// 页面渲染 200 dpi，坐标取自 build/pages/g1/p0208–p0212.png 和 crop-view 网格图（y 向下，origin 为图左上角）。
#import "/common/geo.typ": *

#let k = 0.0152cm

#let L-hd = tiling(size: (4.6pt, 7pt), line(start: (0pt, 7pt), end: (4.6pt, 0pt), stroke: 0.45pt))   // 斜线 /
#let L-hb = tiling(size: (4pt, 9pt), line(start: (0pt, 0pt), end: (4pt, 9pt), stroke: 0.45pt))         // 斜线 \（较陡）

// ───────── p.208 四边形的分类（原书整页横排，转 90° 印；这里按正向重画，箭头自左向右）─────────
#let fig-L-quad(width: 13.4cm) = px-canvas(960, 450, origin: (0, 0), width: width, (p, u) => {
  import cetz.draw: *
  let aw = (end: "stealth", fill: black, scale: 0.5)
  let lab(pt, body) = lbl(p, pt, body, dir: "c", d: 0)
  let arrow(a, b) = line(p(..a), p(..b), stroke: lw, mark: aw)
  let ln(a, b) = line(p(..a), p(..b), stroke: lw)
  let shape(pts) = poly(p, pts, close: true)

  lab((60, 12), text(font: fonts.song, size: 9pt, tracking: 0.35em)[四边形的分类])

  // 四边形（一般四边形）
  shape(((18, 210), (80, 190), (115, 235), (45, 262)))
  lab((70, 285), tt[四边形])
  // 平行四边形
  shape(((320, 130), (390, 130), (370, 80), (300, 80)))
  lab((345, 150), tt[平行四边形])
  // 梯形
  shape(((310, 350), (380, 350), (365, 305), (325, 305)))
  lab((345, 370), tt[梯形])
  // 矩形
  shape(((560, 15), (645, 15), (645, 70), (560, 70)))
  lab((602, 90), tt[矩形])
  // 菱形
  shape(((580, 150), (610, 120), (640, 150), (610, 180)))
  lab((610, 200), tt[菱形])
  // 等腰梯形
  shape(((555, 290), (640, 290), (625, 250), (570, 250)))
  lab((598, 310), tt[等腰梯形])
  // 直角梯形
  shape(((555, 410), (640, 410), (640, 365), (580, 365)))
  lab((598, 430), tt[直角梯形])
  // 正方形
  shape(((875, 85), (935, 85), (935, 145), (875, 145)))
  lab((905, 165), tt[正方形])

  // 四边形 → 两条支线
  let lb2(pt, body) = lbl(p, pt, body, dir: "c", d: 0)
  arrow((120, 225), (135, 225))
  ln((135, 105), (135, 330))
  arrow((135, 105), (295, 105))
  lb2((215, 90), tsm[两组对边平行])
  arrow((135, 330), (305, 330))
  lb2((220, 314), tsm[一组对边平行])
  lb2((220, 346), tsm[另一组对边不平行])
  // 平行四边形 → 矩形、菱形
  arrow((392, 105), (420, 105))
  ln((420, 42), (420, 150))
  arrow((420, 42), (550, 42))
  lb2((485, 27), tsm[有一个角是直角])
  arrow((420, 150), (570, 150))
  lb2((495, 135), tsm[邻边相等])
  // 梯形 → 等腰梯形、直角梯形
  arrow((382, 330), (420, 330))
  ln((420, 270), (420, 388))
  arrow((420, 270), (545, 270))
  lb2((483, 255), tsm[两腰相等])
  arrow((420, 388), (545, 388))
  lb2((483, 373), tsm[一腰垂直其底])
  // 矩形、菱形 → 正方形
  ln((648, 42), (830, 42))
  ln((643, 150), (830, 150))
  ln((830, 42), (830, 150))
  lab((740, 26), tsm[邻边相等])
  lab((740, 134), tsm[有一个角是直角])
  arrow((830, 115), (870, 115))
})

// ───────── 复习题三 第 6 题（p.210）─────────
#let fig-L-r6(width: 260 * k) = px-canvas(280, 350, origin: (340, 195), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((373, 450), (373, 213), (603, 215), (603, 452))
  let (K, L, M) = ((445, 355), (532, 428), (463, 518))
  poly(p, (A, B, C, D), close: true)
  seg(p, B, K)
  seg(p, A, K)
  seg(p, K, L)
  seg(p, A, M)
  seg(p, M, L)
  seg(p, M, D)
  lbl(p, B, $B$, dir: "nw", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 11)
  lbl(p, D, $D$, dir: "se", d: 11)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, K, $K$, dir: "ne", d: 11)
  lbl(p, L, $L$, dir: "e", d: 12)
  lbl(p, M, $M$, dir: "s", d: 12)
})

// ───────── 复习题三 第 12 题（p.211）─────────
#let fig-L-r12(width: 340 * k) = px-canvas(320, 170, origin: (360, 188), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((380, 328), (650, 328), (580, 207), (447, 207))
  let (H, K) = ((447, 328), (580, 328))
  let (M, N) = ((413, 268), (615, 268))
  poly(p, (A, B, C, D), close: true)
  seg(p, A, C)
  seg(p, M, N)
  line(p(..D), p(..H), stroke: (paint: black, thickness: 0.9pt, dash: "dashed"))
  line(p(..C), p(..K), stroke: (paint: black, thickness: 0.9pt, dash: "dashed"))
  anglearc(p, A, D, C, 24)
  anglearc(p, A, C, B, 34)
  anglearc(p, C, D, A, 22)
  anglearc(p, B, C, A, 26)
  lbl(p, D, $D$, dir: "nw", d: 10)
  lbl(p, C, $C$, dir: "ne", d: 10)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, B, $B$, dir: "e", d: 12)
  lbl(p, M, $M$, dir: "nw", d: 11)
  lbl(p, N, $N$, dir: "ne", d: 11)
  lbl(p, H, $H$, dir: "s", d: 12)
  lbl(p, K, $K$, dir: "s", d: 12)
  lbl(p, (417, 291), tsm[$30°$], dir: "c", d: 0)
  lbl(p, (433, 314), tsm[$30°$], dir: "c", d: 0)
  lbl(p, (610, 307), tsm[$60°$], dir: "c", d: 0)
})

// ───────── 复习题三 第 15 题（p.211）─────────
#let fig-L-r15(width: 320 * k) = px-canvas(340, 175, origin: (320, 780), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D, O) = ((341, 938), (573, 938), (635, 800), (402, 800), (487, 868))
  poly(p, (D, O, C), close: true, fill: L-hd)
  poly(p, (O, C, B), close: true, fill: L-hb)
  poly(p, (A, B, C, D), close: true)
  seg(p, A, C)
  seg(p, D, B)
  lbl(p, D, $D$, dir: "nw", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 11)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, O, $O$, dir: "s", d: 11)
})

// ───────── 复习题三 第 20 题（p.212）─────────
#let fig-L-r20(width: 300 * k) = px-canvas(290, 205, origin: (350, 360), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D, P) = ((392, 543), (620, 540), (532, 375), (372, 385), (460, 510))
  poly(p, (A, B, C, D), close: true)
  seg(p, A, C)
  seg(p, B, D)
  seg(p, P, A)
  seg(p, P, B)
  seg(p, P, C)
  seg(p, P, D)
  ring(p, P, r: 3)
  lbl(p, D, $D$, dir: "nw", d: 11)
  lbl(p, C, $C$, dir: "ne", d: 11)
  lbl(p, A, $A$, dir: "sw", d: 11)
  lbl(p, B, $B$, dir: "se", d: 11)
  lbl(p, P, $P$, dir: "s", d: 12)
})

// ───────── 复习题三 第 22 题（p.212）：河与桥 ─────────
#let fig-L-r22(width: 400 * k) = px-canvas(400, 340, origin: (290, 925), width: width, (p, u) => {
  import cetz.draw: *
  let (A, E, F, G) = ((420, 942), (420, 1037), (420, 1085), (420, 1180))
  let (P, Q, M, N) = ((318, 1085), (678, 1085), (312, 1180), (678, 1180))
  let (C, D, B) = ((565, 1085), (565, 1180), (636, 1253))
  // 水面的横线
  for (i, y) in (1100, 1112, 1124, 1136, 1148, 1160, 1172).enumerate() {
    let (a, b) = if calc.even(i) { (330, 670) } else { (340, 660) }
    line(p(a, y), p(b, y), stroke: (paint: black, thickness: 0.5pt, dash: (7pt, 2.2pt, 4pt, 2pt)))
  }
  seg(p, P, Q)
  seg(p, M, N)
  seg(p, A, E)
  dseg(p, E, G)
  seg(p, A, C)
  line(p(..C), p(..D), stroke: lb)
  dseg(p, E, D)
  seg(p, D, B)
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, E, $E$, dir: "w", d: 11)
  lbl(p, (408, 1076), $F$, dir: "c", d: 0)
  lbl(p, G, $G$, dir: "s", d: 11)
  lbl(p, P, $P$, dir: "w", d: 10)
  lbl(p, Q, $Q$, dir: "e", d: 10)
  lbl(p, M, $M$, dir: "w", d: 10)
  lbl(p, N, $N$, dir: "e", d: 10)
  lbl(p, C, $C$, dir: "ne", d: 11)
  lbl(p, (552, 1194), $D$, dir: "c", d: 0)
  lbl(p, B, $B$, dir: "e", d: 11)
})
