// 段 O（立体几何第 3 章 §3·11–§3·14，p.265–284）插图共用小工具。
// 页面渲染 dpi：200（build/pages/sgO200，页面宽约 1000 像素；坐标取自网格图与 crop-view 放大图）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

// 字母标注：放在原图字母的中心位置（页面坐标）
#let L(p, x, y, body) = lbl(p, (x, y), body, dir: "c", d: 0)
// 小字标注（度数等）
#let Ls(p, x, y, body) = {
  import cetz.draw: *
  content(p(x, y), tsm(body))
}

// 椭圆上的点：中心 c、半轴 rx、ry、转角 rot（度，逆时针），参数角 t（度，逆时针，页面 y 向下已处理）
#let O-ept(c, rx, ry, t, rot: 0) = {
  let x = rx * calc.cos(t * 1deg)
  let y = ry * calc.sin(t * 1deg)
  let cr = calc.cos(rot * 1deg)
  let sr = calc.sin(rot * 1deg)
  (c.at(0) + x * cr - y * sr, c.at(1) - (x * sr + y * cr))
}
// 椭圆弧（参数角 a0→a1，度）；st 为线型
#let O-earc(p, c, rx, ry, a0, a1, rot: 0, st: lw, n: 64) = {
  import cetz.draw: *
  line(..range(n + 1).map(i => p(..O-ept(c, rx, ry, a0 + (a1 - a0) * i / n, rot: rot))), stroke: st)
}
// 水平椭圆（截面圆的直观图）：前半（下半）实线，后半（上半）虚线
#let O-ell(p, c, rx, ry, rot: 0, back: dsh, front: lw) = {
  O-earc(p, c, rx, ry, 0, 180, rot: rot, st: back)
  O-earc(p, c, rx, ry, 180, 360, rot: rot, st: front)
}
// 圆弧（圆心 c、半径 r、角 a0→a1，度，数学方向）
#let O-arc(p, c, r, a0, a1, st: lw, n: 64) = O-earc(p, c, r, r, a0, a1, st: st, n: n)
// 圆上的点
#let O-cpt(c, r, t) = O-ept(c, r, r, t)

#let O-lerp(a, b, t) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)

// 斜线阴影：在凸多边形 pts 内画一族方向为 dir（度）的平行线，间距 gap（像素）
#let O-hatch(p, pts, ang: 45, gap: 7, st: lt) = {
  import cetz.draw: *
  let ux = calc.cos(ang * 1deg)
  let uy = -calc.sin(ang * 1deg)
  // 法向
  let nx = -uy
  let ny = ux
  let ds = pts.map(q => q.at(0) * nx + q.at(1) * ny)
  let dmin = calc.min(..ds)
  let dmax = calc.max(..ds)
  let m = pts.len()
  let d = dmin + gap / 2
  while d < dmax {
    let hits = ()
    for i in range(m) {
      let a = pts.at(i)
      let b = pts.at(calc.rem(i + 1, m))
      let da = a.at(0) * nx + a.at(1) * ny - d
      let db = b.at(0) * nx + b.at(1) * ny - d
      if (da <= 0 and db > 0) or (da > 0 and db <= 0) {
        let t = da / (da - db)
        hits.push(O-lerp(a, b, t))
      }
    }
    if hits.len() >= 2 {
      let ss = hits.map(h => h.at(0) * ux + h.at(1) * uy)
      let i0 = ss.position(v => v == calc.min(..ss))
      let i1 = ss.position(v => v == calc.max(..ss))
      line(p(..hits.at(i0)), p(..hits.at(i1)), stroke: st)
    }
    d += gap
  }
}
// 圆弧上取点（用于阴影多边形）
#let O-arcpts(c, r, a0, a1, n: 24) = range(n + 1).map(i => O-cpt(c, r, a0 + (a1 - a0) * i / n))
