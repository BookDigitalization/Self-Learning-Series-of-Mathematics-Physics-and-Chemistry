// 段 I（立体几何第 2 章 §2·7–§2·9，p.159–176）插图共用小工具。
// 页面渲染 dpi：200（build/pages/sgI200，页面宽约 1000 像素；坐标取自网格图与 crop-view 放大图）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

#let I-lerp(a, b, t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)
#let I-mid(a, b) = I-lerp(a, b, 0.5)
#let I-add(a, b) = (a.at(0) + b.at(0), a.at(1) + b.at(1))
#let I-sub(a, b) = (a.at(0) - b.at(0), a.at(1) - b.at(1))
#let I-dot(a, b) = a.at(0) * b.at(0) + a.at(1) * b.at(1)
#let I-len(a) = calc.sqrt(I-dot(a, a))

// 字母标注：直接放在原图字母的中心位置（页面坐标）
#let L(p, x, y, body) = lbl(p, (x, y), body, dir: "c", d: 0)
// 一组实线段 / 虚线段：segs(p, ((A, B), (B, C)))
#let I-solid(p, pairs) = for (a, b) in pairs { seg(p, a, b) }
#let I-dash(p, pairs) = for (a, b) in pairs { dseg(p, a, b) }
// 闭合多边形（实线）
#let I-closed(p, pts) = poly(p, pts, close: true)

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
