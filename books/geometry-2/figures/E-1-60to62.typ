// 图 1·60 比例规（原书 p.81）、1·61 对角线尺（p.82）、1·62（p.82）；页面 120 dpi 坐标。
#import "E-base.typ": *

// 比例规一条脚：尖端 tip、顶端 top；下段收成尖，上段加宽并带纵沟
#let e-leg(p, tip, top, w: 13, tl: 0.30, sw: 4.5) = {
  import cetz.draw: *
  let L = dist(tip, top)
  let ux = (top.at(0) - tip.at(0)) / L
  let uy = (top.at(1) - tip.at(1)) / L
  let nx = -uy
  let ny = ux
  let pt(t, s) = (tip.at(0) + ux * t * L + nx * s, tip.at(1) + uy * t * L + ny * s)
  // 外轮廓：尖端 → 右侧 → 顶端半圆 → 左侧 → 尖端
  let toppt = top
  let arc-pts = range(0, 13).map(i => {
    let a = i * 15deg
    (toppt.at(0) + nx * w * calc.cos(a) + ux * w * calc.sin(a), toppt.at(1) + ny * w * calc.cos(a) + uy * w * calc.sin(a))
  })
  let outline = (tip, pt(tl, w)) + arc-pts + (pt(tl, -w),)
  line(..outline.map(q => p(..q)), close: true, stroke: lw)
  // 纵沟：两端为半圆的细长槽
  let t0 = 0.36
  let t1 = 0.955
  let c0 = pt(t0, 0)
  let c1 = pt(t1, 0)
  let slot = range(0, 13).map(i => {
    let a = i * 15deg
    (c1.at(0) + nx * sw * calc.cos(a) + ux * sw * calc.sin(a), c1.at(1) + ny * sw * calc.cos(a) + uy * sw * calc.sin(a))
  }) + range(0, 13).map(i => {
    let a = i * 15deg
    (c0.at(0) - nx * sw * calc.cos(a) - ux * sw * calc.sin(a), c0.at(1) - ny * sw * calc.cos(a) - uy * sw * calc.sin(a))
  })
  line(..slot.map(q => p(..q)), close: true, stroke: lt)
}

// 图 1·60 比例规：两脚 AD、BC，O 为螺丝钉；A、B 落在线段 l 的端点
#let fig-E-1-60(width: 250 * k) = px-canvas(250, 335, origin: (625, 260), width: width, (p, u) => {
  import cetz.draw: *
  let (A, B, C, D) = ((638, 549), (812, 551), (692, 291), (762, 291))
  let O = (726, 373)
  e-leg(p, A, D)
  e-leg(p, B, C)
  circle(p(..O), radius: 9, fill: white, stroke: lw)
  circle(p(..O), radius: 4.5, fill: white, stroke: lt)
  dseg(p, (702, 297), (754, 297))
  dseg(p, A, (718, 549.5))
  dseg(p, (742, 550), B)
  lbl(p, (730, 546), $l$, dir: "c", d: 0)
  lbl(p, (C.at(0) - 5, 270), $C$, dir: "c", d: 0)
  lbl(p, (D.at(0) + 5, 270), $D$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "s", d: 10)
  lbl(p, B, $B$, dir: "s", d: 10)
  lbl(p, O, $O$, dir: "w", d: 26)
  // 文字标注
  lbl(p, (648, 341), [纵沟], dir: "c", d: 0)
  line(p(664, 341), p(712, 345), stroke: lt)
  lbl(p, (836, 436), [纵沟], dir: "c", d: 0)
  line(p(764, 434), p(814, 434), stroke: lt)
  lbl(p, (840, 377), [螺丝钉], dir: "c", d: 0)
  line(p(736, 375), p(812, 375), stroke: lt)
})

// 图 1·61 对角线尺（比例 1:5000）
#let fig-E-1-61(width: 13.5cm) = px-canvas(725, 225, origin: (115, 385), width: width, (p, u) => {
  import cetz.draw: *
  let x0 = 149
  let dx = 143          // 一格 = 100 米
  let yt = 422
  let yb = 568
  let dy = (yb - yt) / 10
  let xr = 790
  let unit = dx / 10
  let X(i) = x0 + unit * i     // 左边第一格内 10 等分
  let rowy(r) = yb - dy * r    // r = 0..10，10 为上边
  // 水平线
  for r in range(1, 10) {
    line(p(x0, rowy(r)), p(xr, rowy(r)), stroke: 0.5pt)
  }
  line(p(x0, yt), p(825, yt), stroke: lw)
  line(p(x0, yb), p(801, yb), stroke: lw)
  // 斜线：AA1 的分点连 BB1 的右一分点
  for i in range(0, 10) {
    line(p(X(i), yt), p(X(i + 1), yb), stroke: 0.5pt)
  }
  // 竖线
  line(p(x0, yt), p(x0, yb), stroke: lw)
  line(p(X(10), yt), p(X(10), yb), stroke: 0.6pt)
  for j in (2, 3) {
    line(p(x0 + dx * j, yt), p(x0 + dx * j, yb), stroke: 0.6pt)
  }
  line(p(x0 + dx * 4, yt), p(x0 + dx * 4, yb), stroke: dsh)
  // 右端锯齿（表示尺的右端略去）
  let zz = (
    (825, 422), (798, 437), (814, 452), (792, 467), (815, 482), (785, 497),
    (810, 512), (770, 527), (790, 542), (768, 557), (801, 568),
  )
  line(..zz.map(q => p(..q)), stroke: 0.6pt)
  // 加粗：MN 的 M 到 Q、M'N'
  let y7 = rowy(7)
  let y4 = rowy(4)
  let M = (X(10) - 0.47 * dx, y7)
  let Pp = (X(10) - 0.07 * dx, y7)
  let Q = (X(10), y7)
  let N = (x0 + dx * 4, y7)
  let Mp = (X(10) - 0.74 * dx, y4)
  let Np = (x0 + dx * 3, y4)
  line(p(..M), p(..Q), stroke: lb)
  line(p(..Q), p(..N), stroke: lb)
  line(p(..Mp), p(..Np), stroke: lb)
  for q in (M, Pp, Q, N, Mp, Np) { ring(p, q, r: 2.8) }
  // 字母
  lbl(p, (x0 - 2, yt - 12), $A$, dir: "c", d: 0)
  lbl(p, (x0 + unit * 5, yt), $H$, dir: "n", d: 9)
  lbl(p, (x0 + unit * 9, yt), $C$, dir: "n", d: 9)
  lbl(p, (X(10), yt), $A_1$, dir: "ne", d: 10)
  lbl(p, (x0 + dx * 2, yt), $A_2$, dir: "ne", d: 10)
  lbl(p, (x0 + dx * 3, yt), $A_3$, dir: "ne", d: 10)
  lbl(p, (x0 + dx * 4, yt), $A_4$, dir: "ne", d: 10)
  lbl(p, (825, yt), $A'$, dir: "ne", d: 9)
  lbl(p, (x0 + dx * 3, yt - 22), $1 rt 5000$, dir: "c", d: 0)
  lbl(p, (x0 - 9, yb), $B$, dir: "c", d: 0)
  lbl(p, (X(10), rowy(1)), $B_1$, dir: "e", d: 11)
  lbl(p, (x0 + dx * 2, rowy(1)), $B_2$, dir: "e", d: 11)
  lbl(p, (x0 + dx * 3, rowy(1)), $B_3$, dir: "e", d: 11)
  lbl(p, (x0 + dx * 4, rowy(1)), $B_4$, dir: "e", d: 11)
  lbl(p, (801, yb), $B'$, dir: "e", d: 9)
  lbl(p, M, $M$, dir: "n", d: 11)
  lbl(p, Pp, $P$, dir: "n", d: 11)
  lbl(p, Q, $Q$, dir: "ne", d: 9)
  lbl(p, N, $N$, dir: "e", d: 11)
  lbl(p, Mp, $M'$, dir: "n", d: 11)
  lbl(p, Np, $N'$, dir: "e", d: 12)
  // 左边行号 10 … 1，下边读数
  for r in range(1, 11) {
    lbl(p, (x0 - 10, rowy(r)), text(font: fonts.song, size: 7pt)[#r], dir: "c", d: 0)
  }
  for (j, v) in (("0", "100"), ("2", "80"), ("4", "60"), ("6", "40"), ("8", "20"), ("10", "0")) {
    lbl(p, (X(int(j)), yb + 14), text(font: fonts.song, size: 7pt)[#v], dir: "c", d: 0)
  }
  for (j, v) in ((2, "100"), (3, "200"), (4, "300")) {
    lbl(p, (x0 + dx * j, yb + 14), text(font: fonts.song, size: 7pt)[#v], dir: "c", d: 0)
  }
})

// 图 1·62 把直角三角形 CA₁B₁ 放大：A₁B₁ 十等分，平行于 CA₁ 的线
#let fig-E-1-62(width: 110 * k) = px-canvas(110, 385, origin: (735, 880), width: width, (p, u) => {
  import cetz.draw: *
  let (C, A1, B1) = ((752, 893), (818, 893), (817, 1245))
  let yy(i) = 893 + (1245 - 893) * i / 10
  let xd(y) = 752 + (817 - 752) * (y - 893) / (1245 - 893)
  line(p(..C), p(..A1), stroke: lw)
  line(p(..A1), p(..B1), stroke: lb)
  line(p(..C), p(..B1), stroke: lb)
  for i in range(1, 10) {
    line(p(xd(yy(i)), yy(i)), p(818, yy(i)), stroke: if i == 3 or i == 8 { lb } else { lw })
  }
  lbl(p, C, $C$, dir: "nw", d: 10)
  lbl(p, A1, $A_1$, dir: "ne", d: 11)
  lbl(p, B1, $B_1$, dir: "s", d: 10)
  lbl(p, (xd(yy(3)), yy(3)), $P$, dir: "w", d: 11)
  lbl(p, (818, yy(3)), $Q$, dir: "e", d: 10)
  lbl(p, (xd(yy(8)), yy(8)), $F$, dir: "w", d: 11)
  lbl(p, (818, yy(8)), $G$, dir: "e", d: 10)
  lbl(p, (xd(yy(9)), yy(9)), $D$, dir: "w", d: 11)
  lbl(p, (818, yy(9)), $E$, dir: "e", d: 10)
})
