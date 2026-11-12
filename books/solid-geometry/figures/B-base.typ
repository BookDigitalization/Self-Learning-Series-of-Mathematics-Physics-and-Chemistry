// 段 B（§1·8–§1·12，p.23–41）图的共用小工具。页面渲染 dpi：200（页宽 1003 像素）。
// 各图用 bc(ox, oy, sc, w, h, …)：ox,oy = 裁剪区域左上角的页面坐标，sc = 看图时放大倍数（crop-view 的 zoom），
// 图里的坐标直接写“放大后的裁剪图像素”，由 bc 换回页面坐标。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 页面像素 ≈ 0.0152 cm

#let bc(ox, oy, sc, w, h, width: auto, draw) = {
  let wd = if width == auto { w * k } else { width }
  px-canvas(w, h, origin: (ox, oy), width: wd, (p, u) => draw((x, y) => p(ox + x / sc, oy + y / sc)))
}

// 加粗线段
#let tseg(P, a, b, w: 1.6pt) = {
  import cetz.draw: *
  line(P(..a), P(..b), stroke: w)
}
#let tpoly(P, pts, close: false, w: 1.6pt) = {
  import cetz.draw: *
  line(..pts.map(t => P(..t)), close: close, stroke: w)
}
// 虚线折线
#let dpoly(P, pts) = {
  import cetz.draw: *
  line(..pts.map(t => P(..t)), stroke: dsh)
}
// 细线段（lt）
#let sseg(P, a, b) = {
  import cetz.draw: *
  line(P(..a), P(..b), stroke: lt)
}
// 平面（平行四边形）：四个顶点顺序给出
#let plane(P, a, b, c, d) = poly(P, (a, b, c, d), close: true)

// 在凸多边形 pts 内画平行斜线（阴影）：dir = 线的方向向量，gap = 线间距（裁剪图像素）
#let hatch(P, pts, dir, gap) = {
  import cetz.draw: *
  let l = calc.sqrt(dir.at(0) * dir.at(0) + dir.at(1) * dir.at(1))
  let (ux, uy) = (dir.at(0) / l, dir.at(1) / l)
  let (nx, ny) = (-uy, ux)
  let ds = pts.map(t => t.at(0) * nx + t.at(1) * ny)
  let lo = calc.min(..ds)
  let hi = calc.max(..ds)
  let n = pts.len()
  let s = lo + gap / 2
  while s < hi {
    let hits = ()
    for i in range(n) {
      let a = pts.at(i)
      let b = pts.at(calc.rem(i + 1, n))
      let da = a.at(0) * nx + a.at(1) * ny - s
      let db = b.at(0) * nx + b.at(1) * ny - s
      if (da <= 0 and db > 0) or (da > 0 and db <= 0) {
        let t = da / (da - db)
        hits.push((a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t))
      }
    }
    if hits.len() >= 2 {
      line(P(..hits.at(0)), P(..hits.at(1)), stroke: 0.5pt)
    }
    s += gap
  }
}
