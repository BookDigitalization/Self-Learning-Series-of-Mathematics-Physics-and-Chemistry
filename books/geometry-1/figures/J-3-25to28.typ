// 图 3·25（原书 p.185）、3·26、3·27（p.186）、3·28（p.187）；页面 200 dpi 坐标。
#import "J-base.typ": *

// 图 3·25：AB ∥ CD ∥ EF，l₁、l₂ 与三条平行线相交，AC = CE；BS ∥ l₁，DK ∥ l₁（虚线）
#let fig-J-3-25(width: 360 * k) = px-canvas(360, 270, origin: (500, 240), width: width, (p, u) => {
  import cetz.draw: *
  let (A, C, E) = ((602, 322), (581.5, 390), (561, 458))
  let (B, D, F) = ((722, 322), (749.5, 390), (777, 458))
  let S = (701.5, 390)
  let K = (729, 458)
  seg(p, (522, 322), (812, 322), stroke: lb)
  seg(p, (520, 390), (826, 390), stroke: lb)
  seg(p, (518, 458), (835, 458), stroke: lb)
  seg(p, (618.6, 267), (547.7, 502), stroke: lb)
  seg(p, (694, 250), (794.7, 502), stroke: lb)
  seg(p, B, S, stroke: dsh)
  seg(p, D, K, stroke: dsh)
  anglearc(p, B, S, D, 16)
  anglearc(p, D, K, F, 16)
  for r in (14, 19) {
    anglearc(p, D, S, B, r)
    anglearc(p, F, K, D, r)
  }
  lbl(p, (621, 260), $l_1$, dir: "c", d: 0)
  lbl(p, (704, 252), $l_2$, dir: "c", d: 0)
  lbl(p, A, $A$, dir: "nw", d: 11)
  lbl(p, B, $B$, dir: "ne", d: 11)
  lbl(p, C, $C$, dir: "nw", d: 11)
  lbl(p, D, $D$, dir: "e", d: 11)
  lbl(p, E, $E$, dir: "nw", d: 11)
  lbl(p, F, $F$, dir: "ne", d: 12)
  lbl(p, S, $S$, dir: "sw", d: 11)
  lbl(p, K, $K$, dir: "s", d: 11)
})

// 图 3·26：钢板上 A、B 两孔之间再钻三个孔（E、F、G），作法的辅助线用虚线
#let fig-J-3-26(width: 510 * k) = px-canvas(510, 290, origin: (255, 255), width: width, (p, u) => {
  import cetz.draw: *
  let A = (340, 342)
  let B = (611, 342)
  let S = (545, 442)
  let at(t) = (A.at(0) + (S.at(0) - A.at(0)) * t, A.at(1) + (S.at(1) - A.at(1)) * t)
  let (P, Q, R) = (at(0.25), at(0.5), at(0.75))
  let D = (590, 464)
  let (E, F, G) = ((408, 342), (476, 342), (543, 342))
  line(..((275, 277), (650, 277), (680, 347), (738, 280), (738, 450), (690, 452), (690, 412),
    (628, 412), (627, 468), (283, 523)).map(t => p(..t)), close: true, stroke: lb)
  seg(p, A, B, stroke: lb)
  seg(p, A, D, stroke: dsh)
  seg(p, E, P, stroke: dsh)
  seg(p, F, Q, stroke: dsh)
  seg(p, G, R, stroke: dsh)
  seg(p, B, S, stroke: dsh)
  for c in (A, E, F, G, B) {
    J-ring(p, c, r: 3.5)
  }
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, E, $E$, dir: "n", d: 11)
  lbl(p, F, $F$, dir: "n", d: 11)
  lbl(p, G, $G$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "ne", d: 11)
  lbl(p, P, $P$, dir: "sw", d: 11)
  lbl(p, Q, $Q$, dir: "sw", d: 11)
  lbl(p, R, $R$, dir: "sw", d: 11)
  lbl(p, S, $S$, dir: "sw", d: 11)
  lbl(p, D, $D$, dir: "e", d: 11)
})

// 图 3·27：用等距离横格线把 PQ 分成 5 等份（纸压在横格线上）
#let fig-J-3-27(width: 320 * k) = px-canvas(320, 370, origin: (580, 745), width: width, (p, u) => {
  import cetz.draw: *
  for i in range(0, 11) {
    let y = 758 + 34 * i
    seg(p, (668, y), (868, y))
  }
  seg(p, (668, 758), (668, 1100))
  seg(p, (868, 758), (868, 1100))
  let paper = ((602, 834), (732, 803), (790, 1024), (657, 1048))
  line(..paper.map(t => p(..t)), close: true, stroke: lb, fill: white)
  J-ring(p, (738, 826), r: 3)
  J-ring(p, (783, 996), r: 3)
  lbl(p, (738, 826), $P$, dir: "w", d: 11)
  lbl(p, (783, 996), $Q$, dir: "w", d: 11)
})

// 厘米尺（画成长条，0 和 24 两个刻度在轴线两端）：a、b 为 0、24 刻度的位置
#let J-ruler(p, a, b, ext: 20, hw: 14) = {
  import cetz.draw: *
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let l = calc.sqrt(dx * dx + dy * dy)
  let (ux, uy) = (dx / l, dy / l)
  let (nx, ny) = (-uy, ux)
  let top = (a.at(0) - ux * ext, a.at(1) - uy * ext)
  let bot = (b.at(0) + ux * ext, b.at(1) + uy * ext)
  line(p(top.at(0) + nx * hw, top.at(1) + ny * hw), p(bot.at(0) + nx * hw, bot.at(1) + ny * hw),
    p(bot.at(0) - nx * hw, bot.at(1) - ny * hw), p(top.at(0) - nx * hw, top.at(1) - ny * hw),
    close: true, stroke: lw, fill: white)
  for n in (0, 4, 8, 12, 16, 20, 24) {
    let q = (a.at(0) + dx * n / 24, a.at(1) + dy * n / 24)
    line(p(q.at(0) + nx * hw, q.at(1) + ny * hw), p(q.at(0) + nx * (hw - 7), q.at(1) + ny * (hw - 7)), stroke: lt)
    content(p(q.at(0) - nx * 2, q.at(1) - ny * 2), text(font: fonts.song, size: 6.5pt, str(n)))
  }
}

// 图 3·28：用厘米尺在 20 厘米宽的纸上等分出 6 个格子（已画出前两条分格线）
#let fig-J-3-28(width: 430 * k) = px-canvas(430, 400, origin: (440, 285), width: width, (p, u) => {
  import cetz.draw: *
  rect(p(480, 640), p(840, 320), stroke: lw)
  seg(p, (480, 372), (840, 372))
  seg(p, (480, 425), (840, 425))
  // 左侧尺寸线 20
  line(p(462, 320), p(462, 466), stroke: lt)
  line(p(462, 490), p(462, 640), stroke: lt)
  line(p(456, 320), p(468, 320), stroke: lt)
  line(p(456, 640), p(468, 640), stroke: lt)
  content(p(462, 478), text(font: fonts.song, size: 8pt, [20]))
  J-ruler(p, (540, 320), (657, 640))
  J-ruler(p, (677, 320), (797, 640))
})
