// 段 L（立体几何第 3 章 §3·1–§3·4，p.220–237）插图共用小工具。
// 页面渲染 dpi：200（build/pages/sgL/g，页面宽约 1000 像素；坐标取自网格图与 crop-view 放大图）。
// 旋转体的底面画成椭圆：椭圆用参数 t（度）取点，页面坐标 y 向下，t ∈ (0°, 180°) 是前半（下半）个椭圆。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

// 线型：轮廓粗线、一般实线、虚线
#let L-ol = 1.15pt
#let L-sl = 0.8pt
#let L-dl = (paint: black, thickness: 0.7pt, dash: "dashed")

#let L-mid(a, b) = ((a.at(0) + b.at(0)) / 2, (a.at(1) + b.at(1)) / 2)
#let L-lerp(a, b, t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)
#let L-dist(a, b) = calc.sqrt(calc.pow(b.at(0) - a.at(0), 2) + calc.pow(b.at(1) - a.at(1), 2))
// 直线 ab 与直线 cd 的交点
#let L-isect(a, b, c, d) = {
  let (x1, y1) = a
  let (x2, y2) = b
  let (x3, y3) = c
  let (x4, y4) = d
  let den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
  let t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / den
  (x1 + t * (x2 - x1), y1 + t * (y2 - y1))
}

// 线段（给定线型）
#let L-ln(p, a, b, st) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: st)
}
// 折线（给定线型）
#let L-pl(p, pts, st, close: false) = {
  import cetz.draw: *
  line(..pts.map(q => p(..q)), stroke: st, close: close)
}
// 字母：放在原图字母的中心位置
#let L-t(p, x, y, body) = lbl(p, (x, y), body, dir: "c", d: 0)

// ───── 椭圆 ─────
// 椭圆 e = (圆心, rx, ry)；点 (rx = ry = 0) 也当作退化的椭圆
#let L-ep(e, t) = {
  let (c, rx, ry) = e
  (c.at(0) + rx * calc.cos(t * 1deg), c.at(1) + ry * calc.sin(t * 1deg))
}
#let L-epts(e, t0, t1, n: 72) = range(n + 1).map(i => L-ep(e, t0 + (t1 - t0) * i / n))
// 椭圆弧：t 从 t0 到 t1（度）
#let L-earc(p, e, t0, t1, st) = L-pl(p, L-epts(e, t0, t1), st)
// 整个椭圆
#let L-ell(p, e, st) = L-pl(p, L-epts(e, 0, 360), st)
// 前半实线、后半虚线（圆柱的下底面、截面）
#let L-ellh(p, e, st: L-ol) = {
  L-earc(p, e, 0, 180, st)
  L-earc(p, e, 180, 360, L-dl)
}
// 椭圆上点的参数 t（度）
#let L-et(e, q) = {
  let (c, rx, ry) = e
  calc.atan2((q.at(0) - c.at(0)) / rx, (q.at(1) - c.at(1)) / ry).deg()
}

// 支撑函数：法向 (cos φ, sin φ)（页面坐标）方向上椭圆的最远距离
#let L-h(e, phi) = {
  let (c, rx, ry) = e
  let cs = calc.cos(phi)
  let sn = calc.sin(phi)
  c.at(0) * cs + c.at(1) * sn + calc.sqrt(rx * rx * cs * cs + ry * ry * sn * sn)
}
// 法向 φ 上的切点
#let L-tp(e, phi) = {
  let (c, rx, ry) = e
  let cs = calc.cos(phi)
  let sn = calc.sin(phi)
  let r = calc.sqrt(rx * rx * cs * cs + ry * ry * sn * sn)
  if r == 0 { c } else { (c.at(0) + rx * rx * cs / r, c.at(1) + ry * ry * sn / r) }
}
// 两个椭圆（或点与椭圆）同侧的公切线：side = "l"（左）或 "r"（右）；返回 (e1 上的切点, e2 上的切点)
#let L-ctan(e1, e2, side) = {
  let (lo, hi) = if side == "l" { (calc.pi / 2 + 0.001, 3 * calc.pi / 2 - 0.001) } else { (-calc.pi / 2 + 0.001, calc.pi / 2 - 0.001) }
  let f(phi) = L-h(e1, phi) - L-h(e2, phi)
  let n = 200
  let res = none
  for i in range(n) {
    if res == none {
      let a = lo + (hi - lo) * i / n
      let b = lo + (hi - lo) * (i + 1) / n
      if f(a) * f(b) <= 0 {
        let (x, y) = (a, b)
        for j in range(50) {
          let m = (x + y) / 2
          if f(x) * f(m) <= 0 { y = m } else { x = m }
        }
        let phi = (x + y) / 2
        res = (L-tp(e1, phi), L-tp(e2, phi))
      }
    }
  }
  res
}

// 圆锥（顶点 v、底面椭圆 e）的轮廓：两条切线（粗）、底面前弧实线、后弧虚线
#let L-cone(p, v, e, st: L-ol, back: true) = {
  let (_, ql) = L-ctan((v, 0, 0), e, "l")
  let (_, qr) = L-ctan((v, 0, 0), e, "r")
  L-ln(p, v, ql, st)
  L-ln(p, v, qr, st)
  let tl = L-et(e, ql)
  let tr = L-et(e, qr)
  let tl = if tl < 90 { tl + 360 } else { tl }
  L-earc(p, e, tr, tl, st)
  if back { L-earc(p, e, tl, tr + 360, L-dl) }
}
// 圆台（上底 e1、下底 e2）的轮廓：上底整圈实线，两条公切线，下底前弧实线、后弧虚线
#let L-frustum(p, e1, e2, st: L-ol, back: true) = {
  let (pl, ql) = L-ctan(e1, e2, "l")
  let (pr, qr) = L-ctan(e1, e2, "r")
  L-ell(p, e1, st)
  L-ln(p, pl, ql, st)
  L-ln(p, pr, qr, st)
  let tl = L-et(e2, ql)
  let tr = L-et(e2, qr)
  let tl = if tl < 90 { tl + 360 } else { tl }
  L-earc(p, e2, tr, tl, st)
  if back { L-earc(p, e2, tl, tr + 360, L-dl) }
}
// 圆柱（上底 e1、下底 e2，半径相同）的轮廓
#let L-cyl(p, e1, e2, st: L-ol) = {
  L-ell(p, e1, st)
  L-ellh(p, e2, st: st)
  L-ln(p, L-ep(e1, 180), L-ep(e2, 180), st)
  L-ln(p, L-ep(e1, 0), L-ep(e2, 0), st)
}

// ───── 阴影线：一组平行线裁到凸多边形内 ─────
#let L-hatch(p, pts, ang, gap, st: 0.5pt) = {
  import cetz.draw: *
  let (dx, dy) = (calc.cos(ang * 1deg), -calc.sin(ang * 1deg))
  let (nx, ny) = (-dy, dx)
  let pr = pts.map(q => q.at(0) * nx + q.at(1) * ny)
  let lo = calc.min(..pr)
  let hi = calc.max(..pr)
  let s = lo + gap / 2
  let m = pts.len()
  while s < hi {
    let hits = ()
    for i in range(m) {
      let a = pts.at(i)
      let b = pts.at(calc.rem(i + 1, m))
      let fa = pr.at(i) - s
      let fb = pr.at(calc.rem(i + 1, m)) - s
      if fa * fb < 0 {
        let t = fa / (fa - fb)
        hits.push(L-lerp(a, b, t))
      }
    }
    if hits.len() >= 2 {
      let ts = hits.map(q => q.at(0) * dx + q.at(1) * dy)
      let i0 = ts.position(v => v == calc.min(..ts))
      let i1 = ts.position(v => v == calc.max(..ts))
      line(p(..hits.at(i0)), p(..hits.at(i1)), stroke: st)
    }
    s += gap
  }
}

// ───── 近似椭圆（§3·4 的画法）─────
// 菱形上顶点 top、边长 s，三轴两两成 120°（菱形在上顶点处的角为 120°）。
// 返回各点：O 上顶点、A 左、B 下、C 右、D 中心、M N P Q 四边中点、K L 两侧圆弧圆心、E F 近似椭圆与水平对角线的交点
#let L-rh(top, s) = {
  let c30 = calc.cos(30deg)
  let O = top
  let A = (top.at(0) - s * c30, top.at(1) + s / 2)
  let C = (top.at(0) + s * c30, top.at(1) + s / 2)
  let B = (top.at(0), top.at(1) + s)
  let D = (top.at(0), top.at(1) + s / 2)
  let M = L-mid(O, A)
  let Q = L-mid(O, C)
  let N = L-mid(A, B)
  let P = L-mid(C, B)
  let K = L-isect(O, N, B, M)
  let L = L-isect(O, P, B, Q)
  let rk = L-dist(K, M)
  (O: O, A: A, B: B, C: C, D: D, M: M, N: N, P: P, Q: Q, K: K, L: L,
    E: (K.at(0) - rk, K.at(1)), F: (L.at(0) + rk, L.at(1)))
}
// 以 c 为圆心、从 a 到 b 的圆弧（取小于 180° 的一侧），返回点列
#let L-cpts(c, a, b, n: 30) = {
  let r = L-dist(c, a)
  let ta = calc.atan2(a.at(0) - c.at(0), a.at(1) - c.at(1)).deg()
  let tb = calc.atan2(b.at(0) - c.at(0), b.at(1) - c.at(1)).deg()
  let d = calc.rem(calc.rem(tb - ta, 360) + 360, 360)
  let d = if d > 180 { d - 360 } else { d }
  range(n + 1).map(i => {
    let t = (ta + d * i / n) * 1deg
    (c.at(0) + r * calc.cos(t), c.at(1) + r * calc.sin(t))
  })
}
// 近似椭圆的四段圆弧（M→N→P→Q→M 首尾相接的点列）
#let L-rhpts(r) = (
  L-cpts(r.K, r.M, r.N) + L-cpts(r.O, r.N, r.P) + L-cpts(r.L, r.P, r.Q) + L-cpts(r.B, r.Q, r.M)
)
#let L-rhell(p, r, st) = L-pl(p, L-rhpts(r), st)
// 近似椭圆的下半（E→N→P→F）与上半（F→Q→M→E）
#let L-rhlow(r) = L-cpts(r.K, r.E, r.N) + L-cpts(r.O, r.N, r.P) + L-cpts(r.L, r.P, r.F)
#let L-rhup(r) = L-cpts(r.L, r.F, r.Q) + L-cpts(r.B, r.Q, r.M) + L-cpts(r.K, r.M, r.E)
