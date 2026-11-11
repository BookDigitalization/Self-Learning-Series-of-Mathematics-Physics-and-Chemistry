// 习题答案里的插图：习题 1·3 第 9 题（p.305）、1·4 第 1、3 题、1·8 第 4、9 题（p.306）、2·5 第 7 题（p.308）。页面 200 dpi 坐标。
#import "Q-base.typ": *

// 水平尺寸线：x0→x1，高度 y，中间断开放 lab；端点样式 e0、e1 ∈ "none"、"tick"、"arrow"、"both"
#let Q-dim(p, x0, x1, y, lab, e0: "tick", e1: "tick", gapw: 24, labx: auto) = {
  import cetz.draw: *
  let m = if labx == auto { (x0 + x1) / 2 } else { labx }
  let mk(e, side) = if e == "arrow" or e == "both" {
    if side == 0 { (start: "stealth", fill: black, scale: 0.45) } else { (end: "stealth", fill: black, scale: 0.45) }
  } else { (:) }
  if lab == none {
    line(p(x0, y), p(x1, y), stroke: lt, ..mk(e0, 0), ..mk(e1, 1))
  } else {
    line(p(x0, y), p(m - gapw / 2, y), stroke: lt, ..mk(e0, 0))
    line(p(m + gapw / 2, y), p(x1, y), stroke: lt, ..mk(e1, 1))
    lbl(p, (m, y), lab, dir: "c", d: 0)
  }
  for (e, x) in ((e0, x0), (e1, x1)) {
    if e == "tick" or e == "both" { line(p(x, y - 5), p(x, y + 5), stroke: lt) }
  }
}

// 习题 1·3 第 9 题：作线段 x = 2a + 2b 和 y = 3a - 2b
#let fig-Q-a1-3-9(width: 750 * k) = px-canvas(750, 145, origin: (115, 1018), width: width, (p, u) => {
  import cetz.draw: *
  Q-dim(p, 132, 238, 1041, $a$)
  Q-dim(p, 132, 212, 1067, $b$)
  // 左：x = 2a + 2b
  Q-dim(p, 132, 340, 1091, $2a$, e0: "tick", e1: "arrow")
  Q-dim(p, 344, 502, 1091, $2b$, e0: "arrow", e1: "both")
  Q-dim(p, 132, 502, 1108, none, e0: "tick", e1: "tick")
  Q-dim(p, 132, 502, 1123, $x$, e0: "arrow", e1: "both")
  lbl(p, (280, 1144), $x = 2 a + 2 b$, dir: "c", d: 0)
  // 右：y = 3a - 2b
  Q-dim(p, 524, 842, 1091, $3a$, e0: "arrow", e1: "arrow")
  Q-dim(p, 524, 842, 1107, none, e0: "tick", e1: "tick")
  Q-dim(p, 524, 681, 1123, $y$, e0: "arrow", e1: "arrow")
  Q-dim(p, 685, 842, 1123, $2b$, e0: "arrow", e1: "arrow")
  lbl(p, (673, 1144), $y = 3 a - 2 b$, dir: "c", d: 0)
})

// 习题 1·4 第 1 题：两等圆 M、N 各过对方的圆心，交于 A、B
#let fig-Q-a1-4-1(width: 220 * k) = px-canvas(220, 150, origin: (230, 330), width: width, (p, u) => {
  import cetz.draw: *
  let m = (307, 403)
  let n = (367, 403)
  let r = 60
  P-c(p, m, r, st: lb)
  P-c(p, n, r, st: lb)
  let a = (337, 403 - r * calc.sin(60deg))
  let b = (337, 403 + r * calc.sin(60deg))
  ring(p, a, r: 3)
  ring(p, b, r: 3)
  ring(p, m, r: 3)
  ring(p, n, r: 3)
  lbl(p, a, $A$, dir: "n", d: 11)
  lbl(p, b, $B$, dir: "s", d: 11)
  lbl(p, m, $M$, dir: "w", d: 12)
  lbl(p, n, $N$, dir: "e", d: 12)
})

// 习题 1·4 第 3 题：圆 O 的直径 AB，过 A 的弦 AC、AD、AE
#let fig-Q-a1-4-3(width: 270 * k) = px-canvas(270, 200, origin: (550, 290), width: width, (p, u) => {
  import cetz.draw: *
  let o = (702, 397)
  let r = 77.5
  let a = (o.at(0) - r, o.at(1))
  let b = (o.at(0) + r, o.at(1))
  let c = P-pt(o, r, 55.6)
  let d = P-pt(o, r, 115.5)
  let e = P-pt(o, r, 246.5)
  P-c(p, o, r, st: lb)
  seg(p, a, b)
  seg(p, a, d)
  seg(p, a, e)
  let st = P-go(a, c, -0.45 * 137)
  let en = P-go(a, c, 1.48 * 137)
  seg(p, st, en)
  pdot(p, st, r: 3)
  ring(p, o, r: 3)
  lbl(p, a, $A$, dir: "w", d: 11)
  lbl(p, b, $B$, dir: "e", d: 11)
  lbl(p, c, $C$, dir: "ne", d: 10)
  lbl(p, d, $D$, dir: "nw", d: 10)
  lbl(p, e, $E$, dir: "s", d: 11)
  lbl(p, o, $O$, dir: "n", d: 12)
})

// 习题 1·8 第 4 题：直线 AB、CD；P 在 AB 上，PE ⊥ CD，F 在 AB 上；∠BFQ = ∠DEP = d
#let fig-Q-a1-8-4(width: 360 * k) = px-canvas(360, 210, origin: (150, 1045), width: width, (p, u) => {
  import cetz.draw: *
  let a = (174, 1126)
  let b = (455, 1067)
  let f = (242, 1111)
  let pp = (406, 1077)
  let c = (193, 1227)
  let d = (476, 1227)
  let q = (266, 1227)
  let e = (406, 1227)
  seg(p, a, b)
  seg(p, c, d)
  seg(p, f, q)
  seg(p, pp, q)
  seg(p, pp, e)
  anglearc(p, f, b, q, 20)
  anglearc(p, e, d, pp, 20)
  lbl(p, (f.at(0) + 21, f.at(1) + 19), $d$, dir: "c", d: 0)
  lbl(p, (e.at(0) + 20, e.at(1) - 14), $d$, dir: "c", d: 0)
  lbl(p, a, $A$, dir: "w", d: 11)
  lbl(p, b, $B$, dir: "e", d: 11)
  lbl(p, f, $F$, dir: "n", d: 10)
  lbl(p, pp, $P$, dir: "n", d: 10)
  lbl(p, c, $C$, dir: "w", d: 11)
  lbl(p, d, $D$, dir: "e", d: 11)
  lbl(p, q, $Q$, dir: "s", d: 10)
  lbl(p, e, $E$, dir: "s", d: 10)
})

// 习题 1·8 第 9 题：AB、CD 相交；M 在 AB 上，N 在 CD 上，∠AMP = ∠CNP = d
#let fig-Q-a1-8-9(width: 300 * k) = px-canvas(300, 230, origin: (545, 1035), width: width, (p, u) => {
  import cetz.draw: *
  let a = (564, 1202)
  let b = (819, 1052)
  let c = (574, 1127)
  let d = (823, 1249)
  let m = Q-lerp(a, b, 0.675)
  let n = Q-lerp(c, d, 0.65)
  let pp = (769, 1152)
  seg(p, a, b)
  seg(p, c, d)
  seg(p, m, pp)
  seg(p, n, pp)
  anglearc(p, m, a, pp, 20)
  anglearc(p, n, c, pp, 20)
  lbl(p, (m.at(0) - 2, m.at(1) + 30), $d$, dir: "c", d: 0)
  lbl(p, (n.at(0) - 2, n.at(1) - 30), $d$, dir: "c", d: 0)
  lbl(p, a, $A$, dir: "sw", d: 11)
  lbl(p, b, $B$, dir: "ne", d: 11)
  lbl(p, c, $C$, dir: "w", d: 11)
  lbl(p, d, $D$, dir: "se", d: 11)
  lbl(p, m, $M$, dir: "n", d: 11)
  lbl(p, n, $N$, dir: "s", d: 11)
  lbl(p, pp, $P$, dir: "e", d: 11)
})

// 习题 2·5 第 7 题：(1) (3) 线段的垂直平分线，(2) 角的平分线
#let fig-Q-a2-5-7(width: 710 * k) = px-canvas(710, 215, origin: (180, 935), width: width, (p, u) => {
  import cetz.draw: *
  lbl(p, (237, 949), [(1)], dir: "c", d: 0)
  lbl(p, (477, 949), [(2)], dir: "c", d: 0)
  lbl(p, (705, 949), [(3)], dir: "c", d: 0)
  // (1)
  let a1 = (198, 1041)
  let b1 = (415, 1041)
  seg(p, a1, b1)
  seg(p, (306, 985), (306, 1131))
  ring(p, a1, r: 3)
  ring(p, b1, r: 3)
  tickat(p, a1, b1, (252, 1041), s: 5)
  tickat(p, a1, b1, (360, 1041), s: 5)
  lbl(p, a1, $A$, dir: "w", d: 12)
  lbl(p, b1, $B$, dir: "e", d: 12)
  lbl(p, (306, 985), $M$, dir: "n", d: 10)
  lbl(p, (306, 1131), $N$, dir: "s", d: 10)
  lbl(p, (306, 1041), $O$, dir: "ne", d: 12)
  // (2)
  let o = (458, 1062)
  seg(p, o, (617, 1007))
  seg(p, o, (621, 1065))
  seg(p, o, (614, 1118))
  anglearc(p, o, (617, 1007), (614, 1118), 27)
  lbl(p, o, $O$, dir: "w", d: 12)
  lbl(p, (617, 1007), $A$, dir: "ne", d: 10)
  lbl(p, (621, 1065), $M$, dir: "e", d: 10)
  lbl(p, (614, 1118), $B$, dir: "se", d: 10)
  // (3)
  let a3 = (659, 1086)
  let b3 = (873, 1086)
  seg(p, a3, b3)
  seg(p, (764, 985), (764, 1136))
  tickat(p, a3, b3, a3, s: 5)
  tickat(p, a3, b3, b3, s: 5)
  tickat(p, a3, b3, (712, 1086), s: 6)
  tickat(p, a3, b3, (817, 1086), s: 6)
  lbl(p, a3, $A$, dir: "w", d: 12)
  lbl(p, b3, $B$, dir: "e", d: 12)
  lbl(p, (764, 985), $M$, dir: "n", d: 10)
  lbl(p, (764, 1136), $N$, dir: "s", d: 10)
  lbl(p, (764, 1086), $O$, dir: "ne", d: 12)
})
