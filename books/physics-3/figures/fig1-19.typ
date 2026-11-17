// 图 1·19 两个等量点电荷电场里的电力线（原书 p.37）
// (a) 两个异种等量点电荷，(b) 两个等量正点电荷。电力线按点电荷场强公式数值积分得到（示意图，条数、疏密按原图大意）。
#import "/common/series.typ": *
#import "fig1-lib.typ": *

// charges: ((x, y, q), …)；从 (x0, y0) 出发沿场强方向追踪，到负电荷附近或出窗口为止
#let trace(charges, x0, y0, win, ds: 3.0, max-steps: 900, sign: 1) = {
  let pts = ((x0, y0),)
  let (x, y) = (x0, y0)
  let done = false
  let n = 0
  while not done and n < max-steps {
    let ex = 0.0
    let ey = 0.0
    for (cx, cy, q) in charges {
      let dx = x - cx
      let dy = y - cy
      let r2 = dx * dx + dy * dy
      let r3 = calc.pow(r2, 1.5)
      ex += q * dx / r3
      ey += q * dy / r3
    }
    let m = calc.sqrt(ex * ex + ey * ey)
    x += sign * ds * ex / m
    y += sign * ds * ey / m
    pts.push((x, y))
    n += 1
    for (cx, cy, q) in charges {
      if q < 0 and calc.pow(x - cx, 2) + calc.pow(y - cy, 2) < 64 { done = true }
    }
    if x < win.at(0) or x > win.at(2) or y < win.at(1) or y > win.at(3) { done = true }
  }
  pts
}

#let draw-lines(p, charges, win, starts) = {
  import cetz.draw: *
  for (cx, cy, q, angs) in starts {
    for a in angs {
      let x0 = cx + 7 * calc.cos(a * 1deg)
      let y0 = cy - 7 * calc.sin(a * 1deg)
      let pts = trace(charges, x0, y0, win)
      line(..pts.map(q => p(..q)), stroke: 0.7pt)
      // 箭头：画在线上约三分之一处
      let k = calc.min(pts.len() - 2, calc.max(1, calc.floor(pts.len() * 0.4)))
      if pts.len() > 6 {
        line(p(..pts.at(k)), p(..pts.at(k + 1)), stroke: 0.7pt, mark: (end: "stealth", fill: black, scale: 0.5))
      }
    }
  }
}

#let charge-sign(p, x, y, body) = {
  import cetz.draw: *
  circle(p(x, y), radius: 8 * (p(1, 0).at(0) - p(0, 0).at(0)), stroke: 0.8pt, fill: white)
  content(p(x, y), text(size: 8pt, body))
}

#let fig-1-19(width: 10.9cm) = px-canvas(760, 290, origin: (140, 170), width: width, (p, u) => {
  import cetz.draw: *
  // (a) 左负右正
  let ch-a = ((273, 307, -1), (372, 307, 1))
  let win-a = (148, 180, 492, 435)
  let angs = range(0, 360, step: 12)
  draw-lines(p, ch-a, win-a, ((372, 307, 1, angs),))
  charge-sign(p, 273, 307, $-$)
  charge-sign(p, 372, 307, $+$)
  lab(p, (322, 458), [($a$)], sz: 8pt)
  // (b) 两个正电荷
  let ch-b = ((681, 307, 1), (777, 307, 1))
  let win-b = (560, 180, 897, 435)
  draw-lines(p, ch-b, win-b, ((681, 307, 1, range(0, 360, step: 20)), (777, 307, 1, range(0, 360, step: 20))))
  charge-sign(p, 681, 307, $+$)
  charge-sign(p, 777, 307, $+$)
  lab(p, (728, 455), [($b$)], sz: 8pt)
})
