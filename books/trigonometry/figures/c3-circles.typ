// 三角第 3 章：圆与三角函数线（图 3·1–3·6、3·9、3·14、3·17、3·26）。
// 按几何关系重绘，自定像素坐标（原点左上，y 向下）。原书 p.93、94、99–101、105、109、111、130。
// 原扫描上有读者的手写批注（p.93 的“l = φR”、图 3·26 左上图的 α、x、y、1 等），不收录。
#import "/common/geo.typ": *
#let c3k = 0.0152cm
#let c3th = 1.7pt
#let c3-sgn(x) = if x > 0 { 1 } else if x < 0 { -1 } else { 0 }

#let c3-pt(cx, cy, r, deg) = (cx + r * calc.cos(deg * 1deg), cy - r * calc.sin(deg * 1deg))

// 图 3·1
#let fig-c3-1(width: 200 * 1.3 * c3k) = px-canvas(200, 180, width: width, (p, u) => {
  import cetz.draw: *
  let (cx, cy, r) = (60, 100, 55)
  circ(p, (cx, cy), r)
  let b = c3-pt(cx, cy, r, 33)
  line(p(cx, cy), p(cx + r + 12, cy), stroke: lw)
  line(p(cx, cy), p(cx + 1.7 * r * calc.cos(33deg), cy - 1.7 * r * calc.sin(33deg)), stroke: lw)
  arc(p(cx, cy), start: 0deg, stop: 33deg, radius: 20, anchor: "origin", stroke: lt)
  arc(p(cx, cy), start: 0deg, stop: 33deg, radius: r, anchor: "origin", stroke: c3th)
  lbl(p, (cx - 9, cy + 3), $O$, dir: "c", d: 0)
  lbl(p, (cx + r + 12, cy + 9), $A$, dir: "c", d: 0)
  lbl(p, (b.at(0) + 2, b.at(1) - 10), $B$, dir: "c", d: 0)
  lbl(p, (cx + r / 2, cy + 8), $R$, dir: "c", d: 0)
  lbl(p, (cx + r + 2, cy - 24), $l$, dir: "c", d: 0)
  lbl(p, (cx + 31, cy - 8), $n°$, dir: "c", d: 0)
})
// 图 3·2
#let fig-c3-2(width: 200 * 1.3 * c3k) = px-canvas(200, 170, width: width, (p, u) => {
  import cetz.draw: *
  let (cx, cy, r) = (80, 100, 65)
  let a = 57.2958
  circ(p, (cx, cy), r)
  seg(p, (cx, cy), (cx + r, cy))
  seg(p, (cx, cy), c3-pt(cx, cy, r, a))
  arc(p(cx, cy), start: 0deg, stop: a * 1deg, radius: 20, anchor: "origin", stroke: lt)
  arc(p(cx, cy), start: 0deg, stop: a * 1deg, radius: r, anchor: "origin", stroke: c3th)
  lbl(p, (cx - 9, cy + 3), $O$, dir: "c", d: 0)
  lbl(p, (cx + r + 9, cy + 1), $A$, dir: "c", d: 0)
  lbl(p, (cx + r * calc.cos(a * 1deg) + 2, cy - r * calc.sin(a * 1deg) - 9), $B$, dir: "c", d: 0)
  lbl(p, (cx + r / 2, cy + 9), $R$, dir: "c", d: 0)
  lbl(p, (cx + r + 8, cy - 40), $l = R$, dir: "c", d: 0)
  lbl(p, (cx + 40, cy - 14), tsm[1 弧度], dir: "c", d: 0)
})
// 图 3·3
#let fig-c3-3(width: 200 * 1.3 * c3k) = px-canvas(200, 180, width: width, (p, u) => {
  import cetz.draw: *
  let (cx, cy, r) = (90, 110, 65)
  let a = 125
  circ(p, (cx, cy), r)
  seg(p, (cx, cy), (cx + r, cy))
  seg(p, (cx, cy), c3-pt(cx, cy, r, a))
  arc(p(cx, cy), start: 0deg, stop: a * 1deg, radius: 18, anchor: "origin", stroke: lt)
  arc(p(cx, cy), start: 0deg, stop: a * 1deg, radius: r, anchor: "origin", stroke: c3th)
  lbl(p, (cx - 2, cy + 10), $O$, dir: "c", d: 0)
  lbl(p, (cx + r + 9, cy), $A$, dir: "c", d: 0)
  lbl(p, (cx + r * calc.cos(a * 1deg) - 9, cy - r * calc.sin(a * 1deg) + 2), $B$, dir: "c", d: 0)
  lbl(p, (cx + r / 2, cy + 9), $R$, dir: "c", d: 0)
  lbl(p, (cx + 5, cy - r - 8), $phi R$, dir: "c", d: 0)
  lbl(p, (cx + 5, cy - 19), tsm[$phi$ 弧度], dir: "c", d: 0)
})

// 单位圆与坐标轴
#let c3-uc(p, cx, cy, r, ext: 1.35) = {
  import cetz.draw: *
  circ(p, (cx, cy), r)
  line(p(cx - ext * r, cy), p(cx + ext * r + 10, cy), stroke: lt, mark: arw)
  line(p(cx, cy + 1.35 * r), p(cx, cy - 1.45 * r), stroke: lt, mark: arw)
  lbl(p, (cx + ext * r + 19, cy + 1), $x$, dir: "c", d: 0)
  lbl(p, (cx + 8, cy - 1.45 * r - 5), $y$, dir: "c", d: 0)
}
// 图 3·4 中的一幅：α 的正弦线 MP 与余弦线 OM
#let c3-p4(p, cx, cy, r, deg) = {
  import cetz.draw: *
  c3-uc(p, cx, cy, r)
  let (px, py) = c3-pt(cx, cy, r, deg)
  let cs = calc.cos(deg * 1deg)
  let sn = calc.sin(deg * 1deg)
  seg(p, (cx, cy), (px, py))
  line(p(px, cy), p(px, py), stroke: c3th)
  lbl(p, (px + 10 * c3-sgn(cs), py - 8 * c3-sgn(sn)), $P$, dir: "c", d: 0)
  lbl(p, (px, cy + if sn > 0 { 10 } else { -10 }), $M$, dir: "c", d: 0)
  lbl(p, (if cs > 0 { cx - 8 } else { cx + 8 }, cy + 9), $O$, dir: "c", d: 0)
}
// 图 3·4
#let fig-c3-4(width: 520 * 1.3 * c3k) = px-canvas(520, 470, width: width, (p, u) => {
  c3-p4(p, 130, 115, 62, 37)
  c3-p4(p, 390, 115, 62, 145)
  c3-p4(p, 130, 350, 62, 215)
  c3-p4(p, 390, 350, 62, 325)
})
// 图 3·5 中的一幅：正切线 AT
#let c3-p5(p, cx, cy, r, deg) = {
  import cetz.draw: *
  c3-uc(p, cx, cy, r, ext: 1.4)
  let (px, py) = c3-pt(cx, cy, r, deg)
  let cs = calc.cos(deg * 1deg)
  let sn = calc.sin(deg * 1deg)
  let t = (cx + r, cy - r * calc.tan(deg * 1deg))
  line(p(cx + r, cy + 1.9 * r), p(cx + r, cy - 1.9 * r), stroke: lw)
  if cs > 0 { seg(p, (cx, cy), t) } else {
    seg(p, (cx, cy), (px, py))
    line(p(cx, cy), p(..t), stroke: dsh)
  }
  line(p(px, cy), p(px, py), stroke: c3th)
  line(p(cx + r, cy), p(..t), stroke: c3th)
  lbl(p, (px - 9 * c3-sgn(cs), py - 7 * c3-sgn(sn)), $P$, dir: "c", d: 0)
  lbl(p, (px, cy + if sn > 0 { 10 } else { -10 }), $M$, dir: "c", d: 0)
  lbl(p, (cx + r + 8, cy + if calc.tan(deg * 1deg) > 0 { 10 } else { -10 }), $A$, dir: "c", d: 0)
  lbl(p, (cx + r + 9, t.at(1) + if calc.tan(deg * 1deg) > 0 { -6 } else { 6 }), $T$, dir: "c", d: 0)
  lbl(p, (if cs > 0 { cx - 8 } else { cx + 8 }, cy + 9), $O$, dir: "c", d: 0)
}
// 图 3·5
#let fig-c3-5(width: 520 * 1.3 * c3k) = px-canvas(520, 470, width: width, (p, u) => {
  c3-p5(p, 125, 125, 62, 40)
  c3-p5(p, 385, 125, 62, 145)
  c3-p5(p, 125, 360, 62, 215)
  c3-p5(p, 385, 360, 62, 320)
})
// 图 3·6 中的一幅：余切线 BS
#let c3-p6(p, cx, cy, r, deg) = {
  import cetz.draw: *
  c3-uc(p, cx, cy, r, ext: 1.4)
  let (px, py) = c3-pt(cx, cy, r, deg)
  let cs = calc.cos(deg * 1deg)
  let sn = calc.sin(deg * 1deg)
  let cot = cs / sn
  let s = (cx + r * cot, cy - r)
  line(p(cx - 1.9 * r, cy - r), p(cx + 1.9 * r, cy - r), stroke: lw)
  if sn > 0 { seg(p, (cx, cy), s) } else {
    seg(p, (cx, cy), (px, py))
    line(p(cx, cy), p(..s), stroke: dsh)
  }
  line(p(px, cy), p(px, py), stroke: c3th)
  line(p(cx, cy - r), p(..s), stroke: c3th)
  lbl(p, (px - 9 * c3-sgn(cs), py - 7 * c3-sgn(sn)), $P$, dir: "c", d: 0)
  lbl(p, (px, cy + if sn > 0 { 10 } else { -10 }), $M$, dir: "c", d: 0)
  lbl(p, (cx - 9, cy - r - 8), $B$, dir: "c", d: 0)
  lbl(p, (s.at(0) + 8 * c3-sgn(cot), s.at(1) - 8), $S$, dir: "c", d: 0)
  lbl(p, (if cs > 0 { cx - 8 } else { cx + 8 }, cy + 9), $O$, dir: "c", d: 0)
}
// 图 3·6
#let fig-c3-6(width: 520 * 1.3 * c3k) = px-canvas(520, 470, width: width, (p, u) => {
  c3-p6(p, 130, 125, 62, 40)
  c3-p6(p, 390, 125, 62, 140)
  c3-p6(p, 130, 360, 62, 220)
  c3-p6(p, 390, 360, 62, 320)
})

// 把圆分成 12 等分的单位圆（从 A 起，逆时针）：图 3·9、3·14、3·17 用
// 图 3·9
#let fig-c3-9(width: 250 * 1.3 * c3k) = px-canvas(250, 250, width: width, (p, u) => {
  import cetz.draw: *
  let (cx, cy, r) = (125, 125, 90)
  circ(p, (cx, cy), r, stroke: 1.5pt)
  line(p(cx - r, cy), p(cx + r + 4, cy), stroke: lw)
  for k in range(1, 12) {
    let (px, py) = c3-pt(cx, cy, r, 30 * k)
    seg(p, (cx, cy), (px, py))
    if k != 3 and k != 9 and k != 6 { seg(p, (px, cy), (px, py)) }
    let (lx, ly) = c3-pt(cx, cy, r + 15, 30 * k)
    lbl(p, (lx, ly), $P_#k$, dir: "c", d: 0)
  }
  seg(p, (cx, cy - r), (cx, cy + r))
  lbl(p, (cx + r + 10, cy + 2), $A$, dir: "c", d: 0)
  lbl(p, (cx, cy + 9), $O$, dir: "c", d: 0)
  let mx = k => cx + r * calc.cos(30 * k * 1deg)
  lbl(p, (mx(1) - 9, cy - 9), $M_1$, dir: "c", d: 0)
  lbl(p, (mx(2) - 9, cy - 9), $M_2$, dir: "c", d: 0)
  lbl(p, (mx(4) + 10, cy - 9), $M_4$, dir: "c", d: 0)
  lbl(p, (mx(5) + 10, cy - 9), $M_5$, dir: "c", d: 0)
})
// 图 3·14
#let fig-c3-14(width: 230 * 1.3 * c3k) = px-canvas(230, 320, width: width, (p, u) => {
  import cetz.draw: *
  let (cx, cy, r) = (100, 165, 75)
  circ(p, (cx, cy), r, stroke: 1.5pt)
  line(p(cx + r, cy - 1.95 * r), p(cx + r, cy + 1.95 * r), stroke: 1.5pt)
  for k in range(6) {
    let (px, py) = c3-pt(cx, cy, r, 30 * k)
    let (qx, qy) = c3-pt(cx, cy, r, 30 * k + 180)
    seg(p, (px, py), (qx, qy), stroke: lt)
  }
  for k in (1, 2) {
    let t = (cx + r, cy - r * calc.tan(30 * k * 1deg))
    seg(p, (cx, cy), t)
  }
  for k in (4, 5) {
    let t = (cx + r, cy - r * calc.tan(30 * k * 1deg))
    seg(p, (cx, cy), t)
  }
  lbl(p, (cx + r + 12, cy - r * calc.tan(60deg) - 2), $T_2$, dir: "c", d: 0)
  lbl(p, (cx + r + 12, cy - r * calc.tan(30deg) - 3), $T_1$, dir: "c", d: 0)
  lbl(p, (cx + r + 9, cy), $A$, dir: "c", d: 0)
  lbl(p, (cx + r + 12, cy + r * calc.tan(30deg) + 3), $T_5$, dir: "c", d: 0)
  lbl(p, (cx + r + 12, cy + r * calc.tan(60deg) + 2), $T_4$, dir: "c", d: 0)
  lbl(p, (cx - 8, cy + 9), $O$, dir: "c", d: 0)
})
// 图 3·17
#let fig-c3-17(width: 340 * 1.3 * c3k) = px-canvas(340, 190, width: width, (p, u) => {
  import cetz.draw: *
  let (cx, cy, r) = (170, 110, 65)
  circ(p, (cx, cy), r, stroke: 1.5pt)
  line(p(cx - 2.4 * r, cy - r), p(cx + 2.4 * r, cy - r), stroke: 1.5pt)
  for k in range(6) {
    let (px, py) = c3-pt(cx, cy, r, 30 * k)
    let (qx, qy) = c3-pt(cx, cy, r, 30 * k + 180)
    seg(p, (px, py), (qx, qy), stroke: lt)
  }
  for k in (1, 2, 4, 5) {
    let s = (cx + r * calc.cos(30 * k * 1deg) / calc.sin(30 * k * 1deg), cy - r)
    seg(p, (cx, cy), s)
  }
  lbl(p, (cx - 2.4 * r + 4, cy - r - 9), $S_5$, dir: "c", d: 0)
  lbl(p, (cx - r * 0.577 - 3, cy - r - 9), $S_4$, dir: "c", d: 0)
  lbl(p, (cx, cy - r - 9), $B$, dir: "c", d: 0)
  lbl(p, (cx + r * 0.577 + 3, cy - r - 9), $S_2$, dir: "c", d: 0)
  lbl(p, (cx + r * 1.73 + 3, cy - r - 9), $S_1$, dir: "c", d: 0)
  lbl(p, (cx + 2, cy + 9), $O$, dir: "c", d: 0)
})

// 图 3·26 中的一幅：T、S 与它们的线
#let c3-p26(p, cx, cy, r, deg, lp, lt-, ls-) = {
  import cetz.draw: *
  c3-uc(p, cx, cy, r, ext: 1.3)
  let (px, py) = c3-pt(cx, cy, r, deg)
  let cs = calc.cos(deg * 1deg)
  let sn = calc.sin(deg * 1deg)
  let t = (cx + r, cy - r * sn / cs)
  let s = (cx + r * cs / sn, cy - r)
  // 先画虚线（延长部分），再画实线
  if cs < 0 { line(p(cx, cy), p(..t), stroke: dsh) }
  if sn < 0 { line(p(cx, cy), p(..s), stroke: dsh) }
  seg(p, (cx, cy), (px, py))
  if cs > 0 { seg(p, (cx, cy), t) }
  if sn > 0 { seg(p, (cx, cy), s) }
  line(p(px, cy), p(px, py), stroke: c3th)
  line(p(cx + r, cy), p(..t), stroke: c3th)
  line(p(cx, cy - r), p(..s), stroke: c3th)
  lbl(p, (cx + r + 8, cy + if t.at(1) < cy { 10 } else { -10 }), $A$, dir: "c", d: 0)
  lbl(p, (cx - 8, cy - r - 8), $B$, dir: "c", d: 0)
  lbl(p, (px, cy + if sn > 0 { 10 } else { -10 }), $M$, dir: "c", d: 0)
  lbl(p, (if cs > 0 { cx - 8 } else { cx + 8 }, cy + 9), $O$, dir: "c", d: 0)
  lbl(p, (px + lp.at(0), py + lp.at(1)), lp.at(2), dir: "c", d: 0)
  lbl(p, (t.at(0) + lt-.at(0), t.at(1) + lt-.at(1)), lt-.at(2), dir: "c", d: 0)
  lbl(p, (s.at(0) + ls-.at(0), s.at(1) + ls-.at(1)), ls-.at(2), dir: "c", d: 0)
}
// 图 3·26
#let fig-c3-26(width: 600 * 1.3 * c3k) = px-canvas(600, 470, width: width, (p, u) => {
  c3-p26(p, 125, 125, 58, 50, (-26, 0, $P(x, y)$), (28, -4, $T(x_1, y_1)$), (-22, -19, $S(x_2, y_2)$))
  c3-p26(p, 430, 125, 58, 145, (38, -8, $P(x, y)$), (35, 10, $T(x_1, y_1)$), (-42, -8, $S(x_2, y_2)$))
  // 原书（p.130 图 3·26 左下图）作 P(x₁, y)，其余三幅都是 P(x, y)，订正为 P(x, y)
  c3-p26(p, 125, 360, 58, 215, (-30, 10, $P(x, y)$), (32, 6, $T(x_1, y_1)$), (40, -10, $S(x_2, y_2)$))
  c3-p26(p, 430, 360, 58, 320, (32, -10, $P(x, y)$), (32, 10, $T(x_1, y_1)$), (-44, -8, $S(x_2, y_2)$))
})
