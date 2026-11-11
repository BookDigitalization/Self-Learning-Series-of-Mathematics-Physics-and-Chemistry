// 段 K（几何第一册 p.187–206，§3·8–§3·12）插图的共用小工具。页面渲染 200 dpi，坐标为扫描页真实像素。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

// 凸多边形内的平行阴影线：线方向角 ang（页面坐标，度，0 = 水平向右，正值向下），相邻两线相距 step 像素。
#let K-hatch(p, pts, ang, step, st: 0.5pt) = {
  import cetz.draw: *
  let n = pts.len()
  let (ux, uy) = (calc.cos(ang * 1deg), calc.sin(ang * 1deg))
  let (nx, ny) = (-uy, ux)
  let cs = pts.map(q => nx * q.at(0) + ny * q.at(1))
  let cmin = calc.min(..cs)
  let cmax = calc.max(..cs)
  let m = calc.floor((cmax - cmin) / step)
  for i in range(1, m + 1) {
    let c = cmin + i * step - step / 2
    let hits = ()
    for j in range(n) {
      let a = pts.at(j)
      let b = pts.at(calc.rem(j + 1, n))
      let ca = cs.at(j)
      let cb = cs.at(calc.rem(j + 1, n))
      if ca != cb and (ca - c) * (cb - c) <= 0 {
        let t = (c - ca) / (cb - ca)
        hits.push((a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t))
      }
    }
    if hits.len() >= 2 {
      let key(q) = ux * q.at(0) + uy * q.at(1)
      let sorted = hits.sorted(key: key)
      line(p(..sorted.first()), p(..sorted.last()), stroke: st)
    }
  }
}

// 小空心圆圈（原图里标点的小圈）
#let K-ring(p, c, r: 3) = {
  import cetz.draw: *
  circle(p(..c), radius: r, fill: white, stroke: lw)
}

// 线段 a→b 上点 pt 处的斜交叉短横（原图里的“×”形等分记号）：半长 s，与线段夹角约 60°
#let K-cross(p, a, b, pt, s: 5) = {
  import cetz.draw: *
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let l = calc.sqrt(dx * dx + dy * dy)
  let (ux, uy) = (dx / l, dy / l)
  let (nx, ny) = (-uy, ux)
  let (cx, cy) = (ux * 0.5 + nx * 0.87, uy * 0.5 + ny * 0.87)
  line(p(pt.at(0) - cx * s, pt.at(1) - cy * s), p(pt.at(0) + cx * s, pt.at(1) + cy * s), stroke: lt)
}

// 线段（粗线）与线上点
#let K-b(p, a, b, ..style) = {
  import cetz.draw: *
  line(p(..a), p(..b), stroke: lb, ..style)
}

// 带中文字的标注（图中的“上底”“高”等）
#let K-zh(p, pt, body) = {
  import cetz.draw: *
  content(p(..pt), text(font: fonts.hei, size: 7.5pt, weight: "bold", body))
}

// 点 a 沿 a→b 方向前进距离 d 后的点
#let K-along(a, b, d) = {
  let (dx, dy) = (b.at(0) - a.at(0), b.at(1) - a.at(1))
  let l = calc.sqrt(dx * dx + dy * dy)
  (a.at(0) + dx / l * d, a.at(1) + dy / l * d)
}

// 两点的中点
#let K-mid(a, b) = ((a.at(0) + b.at(0)) / 2, (a.at(1) + b.at(1)) / 2)
