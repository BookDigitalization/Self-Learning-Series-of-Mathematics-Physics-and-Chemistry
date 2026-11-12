// 段 K（立体几何第 2 章 §2·15–§2·17、本章提要、复习题二，p.198–219）插图共用小工具。
// 页面渲染 dpi：200（build/pages/sgK200，页面宽约 1000 像素；坐标取自网格图与 crop-view 放大图）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

#let lerp(a, b, t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)
// 直线 ab 与直线 cd 的交点
#let isect(a, b, c, d) = {
  let (x1, y1) = a
  let (x2, y2) = b
  let (x3, y3) = c
  let (x4, y4) = d
  let den = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
  let t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / den
  (x1 + t * (x2 - x1), y1 + t * (y2 - y1))
}
// 点 q 在直线 ab 上的垂足
#let kfoot(a, b, q) = {
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let t = ((q.at(0) - a.at(0)) * dx + (q.at(1) - a.at(1)) * dy) / (dx * dx + dy * dy)
  lerp(a, b, t)
}
// 加粗线段 / 加粗折线
#let tseg(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lb)
}
#let tpoly(p, pts) = {
  import cetz.draw: *
  line(..pts.map(t => p(..t)), stroke: lb)
}
// 细实线
#let thin(p, a, b) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lt)
}
// 字母标注：直接放在原图字母的中心位置（页面坐标）
#let L(p, x, y, body) = lbl(p, (x, y), body, dir: "c", d: 0)
// 一串点的折线
#let pl(p, ..pts) = poly(p, pts.pos())
// 一组平行斜线阴影：在凸多边形 pts 内画间距 gap 的平行线（方向角 deg，页面坐标）
#let khatch(p, pts, gap: 7, deg: 45, th: 0.4pt) = {
  import cetz.draw: *
  let c = calc.cos(deg * 1deg)
  let s = -calc.sin(deg * 1deg)
  let proj = pts.map(q => -s * q.at(0) + c * q.at(1))
  let lo = calc.min(..proj)
  let hi = calc.max(..proj)
  let n = pts.len()
  let v = lo + gap / 2
  while v < hi {
    let xs = ()
    for i in range(n) {
      let a = pts.at(i)
      let b = pts.at(calc.rem(i + 1, n))
      let pa = -s * a.at(0) + c * a.at(1)
      let pb = -s * b.at(0) + c * b.at(1)
      if (pa - v) * (pb - v) < 0 {
        xs.push(lerp(a, b, (v - pa) / (pb - pa)))
      }
    }
    if xs.len() >= 2 {
      let ts = xs.map(q => c * q.at(0) + s * q.at(1))
      let i0 = ts.position(t => t == calc.min(..ts))
      let i1 = ts.position(t => t == calc.max(..ts))
      line(p(..xs.at(i0)), p(..xs.at(i1)), stroke: th)
    }
    v += gap
  }
}
// 斜向尺寸线：两端箭头，文字 lab 放在 at 处（文字不旋转）
#let kdim(p, a, b, lab: none, at: none) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lt, mark: arw2)
  if lab != none { lbl(p, at, lab, dir: "c", d: 0) }
}

// ───────── 正多面体：三维坐标正投影，自动判断虚实 ─────────
#let phi = (1 + calc.sqrt(5)) / 2
#let kdot3(a, b) = a.at(0) * b.at(0) + a.at(1) * b.at(1) + a.at(2) * b.at(2)
#let kdist3(a, b) = calc.sqrt(kdot3((a.at(0) - b.at(0), a.at(1) - b.at(1), a.at(2) - b.at(2)), (a.at(0) - b.at(0), a.at(1) - b.at(1), a.at(2) - b.at(2))))
// (0, ±a, ±b) 的三种轮换
#let kcyc(a, b) = {
  let out = ()
  for s1 in (1, -1) {
    for s2 in (1, -1) {
      let (u, v) = (s1 * a, s2 * b)
      out.push((0, u, v))
      out.push((u, v, 0))
      out.push((v, 0, u))
    }
  }
  out
}
#let kcube = { let o = (); for x in (1, -1) { for y in (1, -1) { for z in (1, -1) { o.push((x, y, z)) } } }; o }
#let kocta = ((1, 0, 0), (-1, 0, 0), (0, 1, 0), (0, -1, 0), (0, 0, 1), (0, 0, -1))
#let kicosa = kcyc(1, phi)
#let kdodeca = kcube + kcyc(1 / phi, phi)
// 候选面法向：只保留使 ≥3 个顶点同时取到最大值的方向（那就是面的法向）
#let kfaces(verts) = {
  let cands = kcube + kocta + kcyc(1, phi) + kcyc(phi, 1) + kcyc(1 / phi, phi) + kcyc(phi, 1 / phi)
  let out = ()
  for n in cands {
    let ds = verts.map(v => kdot3(v, n))
    let m = calc.max(..ds)
    let on = range(verts.len()).filter(i => calc.abs(ds.at(i) - m) < 1e-6)
    if on.len() >= 3 { out.push((n, on)) }
  }
  out
}
// 旋转：先绕 x 轴 a0 度，再绕 z 轴 az 度，再绕 x 轴 el 度（观察者在 -y 方向，z 向上）
#let krot(v, a0, az, el) = {
  let (x, y, z) = v
  let (c, s) = (calc.cos(a0 * 1deg), calc.sin(a0 * 1deg))
  (y, z) = (c * y - s * z, s * y + c * z)
  let (c, s) = (calc.cos(az * 1deg), calc.sin(az * 1deg))
  (x, y) = (c * x - s * y, s * x + c * y)
  let (c, s) = (calc.cos(el * 1deg), calc.sin(el * 1deg))
  (y, z) = (c * y - s * z, s * y + c * z)
  (x, y, z)
}
// 画多面体：verts 三维顶点；ctr 页面中心；sc 每单位的像素数；spin 页面内再转的角度。
// 可见棱实线（th），被遮住的棱虚线。返回值不用。
#let kpoly3(p, verts, ctr, sc, a0: 0, az: 0, el: 0, spin: 0, th: lw) = {
  import cetz.draw: *
  let faces = kfaces(verts)
  let vis = faces.map(((n, on)) => krot(n, a0, az, el).at(1) < 0)
  let (cs, sn) = (calc.cos(spin * 1deg), calc.sin(spin * 1deg))
  let pg = verts.map(v => {
    let (x, y, z) = krot(v, a0, az, el)
    let (u, w) = (cs * x - sn * z, sn * x + cs * z)
    (ctr.at(0) + sc * u, ctr.at(1) - sc * w)
  })
  // 棱：属于两个面的顶点对
  let n = verts.len()
  for i in range(n) {
    for j in range(i + 1, n) {
      let fs = range(faces.len()).filter(f => i in faces.at(f).at(1) and j in faces.at(f).at(1))
      if fs.len() == 2 {
        if fs.any(f => vis.at(f)) {
          line(p(..pg.at(i)), p(..pg.at(j)), stroke: th)
        } else {
          line(p(..pg.at(i)), p(..pg.at(j)), stroke: dsh)
        }
      }
    }
  }
}

// ───────── 展开图 ─────────
// 粘贴边（狭长梯形）：在边 a→b 的外侧（远离点 inside 的一侧）
#let ktab(p, a, b, inside, w: 4.5, ins: 3) = {
  import cetz.draw: *
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let l = calc.sqrt(dx * dx + dy * dy)
  let (ux, uy) = (dx / l, dy / l)
  let (nx, ny) = (-uy, ux)
  let m = ((a.at(0) + b.at(0)) / 2, (a.at(1) + b.at(1)) / 2)
  if (inside.at(0) - m.at(0)) * nx + (inside.at(1) - m.at(1)) * ny > 0 { (nx, ny) = (-nx, -ny) }
  let a2 = (a.at(0) + nx * w + ux * ins, a.at(1) + ny * w + uy * ins)
  let b2 = (b.at(0) + nx * w - ux * ins, b.at(1) + ny * w - uy * ins)
  line(p(..a), p(..a2), p(..b2), p(..b), stroke: lt)
}
// 正多边形顶点：中心 c、外接圆半径 r、第一个顶点的数学角 a0
#let kngon(c, r, nn, a0) = range(nn).map(i => (c.at(0) + r * calc.cos((a0 + i * 360 / nn) * 1deg), c.at(1) - r * calc.sin((a0 + i * 360 / nn) * 1deg)))
#let kcen(pts) = (pts.map(q => q.at(0)).sum() / pts.len(), pts.map(q => q.at(1)).sum() / pts.len())
