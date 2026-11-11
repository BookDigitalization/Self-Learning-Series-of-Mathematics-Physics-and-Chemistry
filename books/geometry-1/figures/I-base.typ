// 段 I 图的共用小工具（几何第一册 p.146–168）。所有图文件都 import 本文件。
// 页面渲染 dpi：200（坐标取自 build/pages/g1/ 的页面图，网格数字为真实像素）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

// 向量小工具
#let I-add(a, b) = (a.at(0) + b.at(0), a.at(1) + b.at(1))
#let I-sub(a, b) = (a.at(0) - b.at(0), a.at(1) - b.at(1))
#let I-mul(a, t) = (a.at(0) * t, a.at(1) * t)
#let I-lerp(a, b, t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)
#let I-dot(a, b) = a.at(0) * b.at(0) + a.at(1) * b.at(1)
#let I-len(a) = calc.sqrt(a.at(0) * a.at(0) + a.at(1) * a.at(1))
// 点 pt 到直线 a-b 上的垂足
#let I-foot(pt, a, b) = {
  let d = I-sub(b, a)
  let t = I-dot(I-sub(pt, a), d) / I-dot(d, d)
  I-add(a, I-mul(d, t))
}
// 直线 a-b 与直线 c-d 的交点
#let I-meet(a, b, c, d) = {
  let r = I-sub(b, a)
  let s = I-sub(d, c)
  let den = r.at(0) * s.at(1) - r.at(1) * s.at(0)
  let t = ((c.at(0) - a.at(0)) * s.at(1) - (c.at(1) - a.at(1)) * s.at(0)) / den
  I-add(a, I-mul(r, t))
}

// 凸多边形内画斜线（阴影）：pts 为顶点，dir 为斜线方向（页面向量），step 为线距（像素）
#let I-hatch(p, pts, dir: (1, -1), step: 8) = {
  import cetz.draw: *
  let dl = I-len(dir)
  let n = (-dir.at(1) / dl, dir.at(0) / dl)
  let cs = pts.map(q => I-dot(n, q))
  let lo = calc.min(..cs)
  let hi = calc.max(..cs)
  let m = pts.len()
  let c = lo + step / 2
  while c < hi {
    let hits = ()
    for i in range(m) {
      let a = pts.at(i)
      let b = pts.at(calc.rem(i + 1, m))
      let sa = I-dot(n, a) - c
      let sb = I-dot(n, b) - c
      if sa * sb <= 0 and sa != sb {
        hits.push(I-lerp(a, b, sa / (sa - sb)))
      }
    }
    if hits.len() >= 2 {
      let s = hits.sorted(key: q => I-dot(dir, q))
      line(p(..s.first()), p(..s.last()), stroke: lt)
    }
    c += step
  }
}
