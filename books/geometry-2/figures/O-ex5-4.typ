// 习题 5·4 的插图：第 9、14 题（原书 p.288）、第 15、17 题（p.289）；页面 120 dpi 坐标。
#import "O-base.typ": *

// 第 9 题：正方形各边为直径向形内画四个半圆，阴影为四瓣菊形
#let fig-O-x9(width: 260 * k) = px-canvas(260, 285, origin: (595, 245), width: width, (p, u) => {
  import cetz.draw: *
  let (A, C, B, D) = ((603, 264), (841, 264), (603, 502), (841, 502))
  let r = 119
  let T = (722, 264)
  let L = (603, 383)
  let Bt = (722, 502)
  let Rc = (841, 383)
  let lens(x, y) = {
    let q = (x, y)
    let a = O-inc(T, q, r)
    let b = O-inc(Bt, q, r)
    let c = O-inc(L, q, r)
    let d = O-inc(Rc, q, r)
    (a and c) or (a and d) or (b and c) or (b and d)
  }
  O-hatch(p, lens, (603, 264, 841, 502), 0, 6.5)
  O-poly(p, (A, C, D, B), st: lb, close: true)
  O-arc(p, T, r, 180, 360, st: lw)
  O-arc(p, L, r, -90, 90, st: lw)
  O-arc(p, Bt, r, 0, 180, st: lw)
  O-arc(p, Rc, r, 90, 270, st: lw)
  lbl(p, A, $A$, dir: "n", d: 11)
  lbl(p, C, $C$, dir: "n", d: 11)
  lbl(p, B, $B$, dir: "s", d: 12)
  lbl(p, D, $D$, dir: "s", d: 12)
})

// 第 14 题：半圆 AB，CD ⊥ AB，两个小半圆，阴影为以 CD 为直径的圆
#let fig-O-x14(width: 275 * k) = px-canvas(275, 160, origin: (565, 1090), width: width, (p, u) => {
  import cetz.draw: *
  let A = (581, 1224)
  let B = (820, 1224)
  let D = (665.5, 1224)
  let K0 = (700.5, 1224)
  let R = 119.5
  let C = (665.5, 1224 - calc.sqrt(84.5 * 154.5))
  let Z = (665.5, (C.at(1) + 1224) / 2)
  let rz = (1224 - C.at(1)) / 2
  // 原图：圆内落在半圆 DB 里面的部分不画阴影线
  O-hatch(p, (x, y) => O-inc(Z, (x, y), rz) and not O-inc((742.75, 1224), (x, y), 77.25), (606, C.at(1), 724, 1224), 0, 6.5)
  O-arc(p, K0, R, 0, 180, st: lb)
  O-arc(p, (623.25, 1224), 42.25, 0, 180, st: lb)
  O-arc(p, (742.75, 1224), 77.25, 0, 180, st: lb)
  O-ln(p, A, B, st: lb)
  O-circ(p, Z, rz, st: lb)
  O-ln(p, C, D, st: lb)
  lbl(p, C, $C$, dir: "n", d: 12)
  lbl(p, A, $A$, dir: "w", d: 11)
  lbl(p, B, $B$, dir: "e", d: 11)
  lbl(p, D, $D$, dir: "s", d: 12)
})

// 第 15 题：曲线 APCRBSDQA 围成的面积（阴影）
#let fig-O-x15(width: 250 * k) = px-canvas(250, 220, origin: (205, 925), width: width, (p, u) => {
  import cetz.draw: *
  let y = 1035
  let (cA, rA) = ((268, y), 44)       // 半圆 APC（直径 AC）
  let (cD, rD) = ((287.5, y), 63.5)   // 半圆 AQD（直径 AD）
  let (cR, rR) = ((372, y), 60)       // 半圆 CRB（直径 CB）
  let (cS, rS) = ((391.5, y), 40.5)   // 半圆 DSB（直径 DB）
  O-hatch(p, (x, yy) => yy < y and O-inc(cD, (x, yy), rD) and not O-inc(cA, (x, yy), rA), (224, 970, 352, y), 65, 7)
  O-hatch(p, (x, yy) => yy > y and O-inc(cR, (x, yy), rR) and not O-inc(cS, (x, yy), rS), (312, y, 432, 1096), 65, 7)
  O-circ(p, (328, y), 104, st: lb)
  O-ln(p, (224, y), (432, y), st: lb)
  O-arc(p, cA, rA, 0, 180, st: lb)
  O-arc(p, cD, rD, 0, 180, st: lb)
  O-arc(p, cR, rR, 180, 360, st: lb)
  O-arc(p, cS, rS, 180, 360, st: lb)
  lbl(p, (213, 1034), $A$, dir: "c", d: 0)
  lbl(p, (441, 1034), $B$, dir: "c", d: 0)
  lbl(p, (301, 1046), $C$, dir: "c", d: 0)
  lbl(p, (366, 1045), $D$, dir: "c", d: 0)
  lbl(p, (267, 1002), $P$, dir: "c", d: 0)
  lbl(p, (297, 958), $Q$, dir: "c", d: 0)
  lbl(p, (346, 1102), $R$, dir: "c", d: 0)
  lbl(p, (391, 1062), $S$, dir: "c", d: 0)
})

// 第 17 题：直角三角形 ABC（∠C = 90°）及三个半圆，阴影为两个镰刀形和三角形
#let fig-O-x17(width: 285 * k) = px-canvas(285, 175, origin: (575, 955), width: width, (p, u) => {
  import cetz.draw: *
  let A = (601, 1105.5)
  let B = (824, 1105.5)
  let C = (756, 1002.8)
  let mid(a, b) = ((a.at(0) + b.at(0)) / 2, (a.at(1) + b.at(1)) / 2)
  let dist(a, b) = calc.sqrt(calc.pow(a.at(0) - b.at(0), 2) + calc.pow(a.at(1) - b.at(1), 2))
  let K0 = mid(A, B)
  let r0 = dist(A, B) / 2
  let K1 = mid(A, C)
  let r1 = dist(A, C) / 2
  let K2 = mid(C, B)
  let r2 = dist(C, B) / 2
  let side(a, b, q) = (b.at(0) - a.at(0)) * (q.at(1) - a.at(1)) - (b.at(1) - a.at(1)) * (q.at(0) - a.at(0))
  let inTri(q) = {
    let s1 = side(A, B, q)
    let s2 = side(B, C, q)
    let s3 = side(C, A, q)
    (s1 >= 0 and s2 >= 0 and s3 >= 0) or (s1 <= 0 and s2 <= 0 and s3 <= 0)
  }
  O-hatch(p, (x, y) => {
    let q = (x, y)
    let l1 = O-inc(K1, q, r1) and not O-inc(K0, q, r0) and side(A, C, q) * side(A, C, B) < 0
    let l2 = O-inc(K2, q, r2) and not O-inc(K0, q, r0) and side(C, B, q) * side(C, B, A) < 0
    inTri(q) or l1 or l2
  }, (580, 955, 860, 1106), -77, 4.5)
  O-arc(p, K0, r0, 0, 180, st: lb)
  O-arc(p, K1, r1, 33.5, 213.5, st: lb)
  O-arc(p, K2, r2, -56.5, 123.5, st: lb)
  O-poly(p, (A, B, C), st: lb, close: true)
  rtmark(p, C, A, B, s: 9)
  lbl(p, A, $A$, dir: "sw", d: 14)
  lbl(p, B, $B$, dir: "se", d: 14)
  lbl(p, C, $C$, dir: "ne", d: 12)
})
