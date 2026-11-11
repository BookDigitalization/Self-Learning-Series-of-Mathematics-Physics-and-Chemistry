// 段 J（几何第一册 p.168–187，§3·3–§3·7）插图的共用小工具。页面渲染 200 dpi，坐标为扫描页真实像素。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm
#let dashdot = (paint: black, thickness: 0.6pt, dash: "dash-dotted")

// 凸多边形内的平行斜线（阴影线）：法向 (nx, ny)，相邻两条线在法向上相距 step 像素。
#let J-hatch(p, pts, nx, ny, step, st: 0.5pt) = {
  import cetz.draw: *
  let n = pts.len()
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
      // 取沿线方向最远的两个交点
      let key(q) = -ny * q.at(0) + nx * q.at(1)
      let sorted = hits.sorted(key: key)
      line(p(..sorted.first()), p(..sorted.last()), stroke: st)
    }
  }
}

// 小圆圈（空心点）
#let J-ring(p, c, r: 3.5) = {
  import cetz.draw: *
  circle(p(..c), radius: r, fill: white, stroke: lw)
}

// 数字标注（角的编号）
#let J-num(p, pt, n) = {
  import cetz.draw: *
  content(p(..pt), tsm(n))
}
