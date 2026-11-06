// 图 12·3 棒球被球棒打击的三个阶段（原书 p.387）
// 线条图，按原图重绘。坐标取自 p.387 的“显示图”坐标（宽 1568），内部乘 1.0657 换成真实像素。
#import "/common/series.typ": *

#let fig-12-3(width: 3.2cm) = px-canvas(250, 770, origin: (1275, 175), width: width, (p0, u) => {
  import cetz.draw: *
  let k = 1.0657
  let p = (x, y) => p0(x * k, y * k)
  let th = 0.8pt
  let txt(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  let hatch(x0, y0, x1, y1, d: 9) = {
    rect(p(x0, y0), p(x1, y1), stroke: th)
    let c = x0 + y0 + d
    while c < x1 + y1 {
      let lo = calc.max(x0, c - y1)
      let hi = calc.min(x1, c - y0)
      if lo < hi { line(p(lo, c - lo), p(hi, c - hi), stroke: 0.5pt) }
      c += d
    }
  }
  // 球棒：粗头 + 细柄 + 小圆端
  let bat(x0, y0, w, hh, stem) = {
    hatch(x0, y0, x0 + w, y0 + hh)
    let cx = x0 + w / 2
    rect(p(cx - 4, y0 + hh), p(cx + 4, y0 + hh + stem), stroke: th)
    circle(p(cx, y0 + hh + stem + 5), radius: 6 * k * u, stroke: th)
  }
  let ball(x, y, r) = circle(p(x, y), radius: r * k * u, stroke: th, fill: black)
  let arr(a, b) = line(p(..a), p(..b), stroke: th, mark: (end: "stealth", fill: black, scale: 0.5))

  // （a）
  bat(1296, 182, 24, 150, 18)
  ball(1283, 213, 10)
  arr((1212, 213), (1270, 213))
  txt(1232, 243, $v_1$)
  txt(1382, 282, $(a)$)
  // （b）
  bat(1305, 415, 25, 120, 25)
  ball(1295, 452, 9)
  txt(1385, 503, $(b)$)
  // （c）
  bat(1310, 638, 25, 125, 30)
  ball(1295, 682, 10)
  arr((1275, 685), (1228, 685))
  txt(1238, 655, $v_2$)
  txt(1388, 727, $(c)$)
})
