// 习题 1·7 的插图（原书 p.33–35），读坐标时的页面渲染 200 dpi。
// 第 20 题（铁锹挖土）是写实插画，用原扫描二值化 PNG（B-ex1-7-20.png，p.35）。
#import "/books/geometry-1/figures/B-lib.typ": *

// 第 2 题（p.33）
#let fig-B-ex1-7-2(width: 330 * k) = px-canvas(330, 240, origin: (540, 800), width: width, (p, u) => {
  import cetz.draw: *
  let o = (560, 997)
  let ts = ((40, 270), (25.5, 265), (9, 278), (0, 278)).map(((a, l)) => B-pt(o, a, l))
  for t in ts { B-ray(p, o, t) }
  lbl(p, o, $O$, dir: "w", d: 11)
  for (t, n) in ts.zip(($A$, $B$, $C$, $D$)) { lbl(p, t, n, dir: "e", d: 11) }
})

// 第 3 题（p.34）
#let fig-B-ex1-7-3(width: 300 * k) = px-canvas(300, 240, origin: (180, 150), width: width, (p, u) => {
  import cetz.draw: *
  let o = (328, 368)
  let ts = ((130, 190), (110, 200), (90, 203), (70, 191), (50, 189)).map(((a, l)) => B-pt(o, a, l))
  for t in ts { B-ray(p, o, t) }
  lbl(p, o, $O$, dir: "s", d: 11)
  for (t, n, dd) in ts.zip(($A$, $B$, $C$, $D$, $E$), ("nw", "n", "n", "n", "ne")) { lbl(p, t, n, dir: dd, d: 11) }
})

// 第 4 题（p.34）：∠AOC、∠BOD 都是直角
#let fig-B-ex1-7-4(width: 300 * k) = px-canvas(300, 230, origin: (510, 190), width: width, (p, u) => {
  import cetz.draw: *
  let o = (655, 375)
  let a = (805, 375)
  let c = (655, 215)
  let b = B-pt(o, 62, 157)
  let d = B-pt(o, 152, 137)
  for t in (a, c, b, d) { B-ray(p, o, t) }
  rtmark(p, o, a, c, s: 12)
  anglearc(p, o, b, d, 28)
  lbl(p, o, $O$, dir: "s", d: 11)
  lbl(p, a, $A$, dir: "e", d: 11)
  lbl(p, c, $C$, dir: "n", d: 11)
  lbl(p, b, $B$, dir: "ne", d: 10)
  lbl(p, d, $D$, dir: "w", d: 11)
})

// 第 7 题（p.34）：三角形的三个顶角
#let fig-B-ex1-7-7(width: 310 * k) = px-canvas(310, 165, origin: (555, 660), width: width, (p, u) => {
  import cetz.draw: *
  poly(p, ((568, 818), (857, 818), (632, 676)), close: true)
  lbl(p, (582, 808), tsm[1], dir: "c", d: 0)
  lbl(p, (815, 808), tsm[2], dir: "c", d: 0)
  lbl(p, (641, 692), tsm[3], dir: "c", d: 0)
})

// 第 9 题（p.34）：方位图
#let fig-B-ex1-7-9(width: 400 * k) = px-canvas(400, 380, origin: (480, 880), width: width, (p, u) => {
  import cetz.draw: *
  let o = (672, 1068)
  for a in range(0, 360, step: 45) {
    let l = if calc.rem(a, 90) == 0 { 153 } else { 153 }
    line(p(..o), p(..B-pt(o, a, l)), stroke: lt, mark: (end: "stealth", fill: black, scale: 0.5))
  }
  lbl(p, (659, 1082), $O$, dir: "c", d: 0)
  for (x, y, s) in ((678, 893, "北"), (680, 1247, "南"), (498, 1070, "西"), (856, 1068, "东"),
    (558, 945, "北西"), (798, 945, "北东"), (555, 1195, "南西"), (795, 1195, "南东")) {
    lbl(p, (x, y), tt[#s], dir: "c", d: 0)
  }
})

// 第 12 题（p.35）：∠AOB = 90°，OE、OF 分别平分 ∠AOB、∠BOC
#let fig-B-ex1-7-12(width: 300 * k) = px-canvas(300, 240, origin: (340, 335), width: width, (p, u) => {
  import cetz.draw: *
  let o = (443, 545)
  let ts = ((0, 190), (45, 220), (90, 195), (105, 200), (120, 195)).map(((a, l)) => B-pt(o, a, l))
  for t in ts { B-ray(p, o, t) }
  lbl(p, o, $O$, dir: "s", d: 11)
  for (t, n, dd) in ts.zip(($A$, $E$, $B$, $F$, $C$), ("e", "ne", "n", "n", "nw")) { lbl(p, t, n, dir: dd, d: 11) }
})

// 第 20 题（p.35）：铁锹与地面形成的两个角（写实插画，PNG）
#let fig-B-ex1-7-20(width: 240 * k) = image("B-ex1-7-20.png", width: width)
