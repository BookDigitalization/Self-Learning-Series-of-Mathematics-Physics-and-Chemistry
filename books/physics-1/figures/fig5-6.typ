// 图 5·6 利用速度图线求所通过的路程（初速度等于零）（原书 p.138）
// 坐标图，按原图重绘。坐标取自 200 dpi 页面图的“显示图”坐标（宽 1568），画布原点取 (300, 1230)。
// 本文件的 hatch 函数（在凸多边形内画“＼”斜线，up: true 时画“／”）也供图 5·7 使用。
#import "/common/series.typ": *

// 在凸多边形 poly（点列，像素坐标，y 向下）内画“＼”方向的斜线，k = y − x 每隔 step 一条。
#let hatch(p, poly, step: 28, st: 0.55pt, up: false) = {
  import cetz.draw: *
  let sg = if up { -1 } else { 1 }   // 线 y = sg*x + k
  let ks = poly.map(((x, y)) => y - sg * x)
  let k0 = calc.ceil(calc.min(..ks) / step) * step
  let k1 = calc.max(..ks)
  let k = k0
  while k < k1 {
    let xs = ()
    for i in range(poly.len()) {
      let a = poly.at(i)
      let b = poly.at(calc.rem(i + 1, poly.len()))
      let fa = (a.at(1) - sg * a.at(0)) - k
      let fb = (b.at(1) - sg * b.at(0)) - k
      if fa * fb <= 0 and fa != fb {
        let t = fa / (fa - fb)
        xs.push(a.at(0) + t * (b.at(0) - a.at(0)))
      }
    }
    if xs.len() >= 2 {
      let (xa, xb) = (calc.min(..xs), calc.max(..xs))
      line(p(xa, sg * xa + k), p(xb, sg * xb + k), stroke: st)
    }
    k += step
  }
}

#let fig-5-6(width: 6.8cm) = px-canvas(540, 620, origin: (300, 1230), width: width, (p, u) => {
  import cetz.draw: *
  let mk = (end: "stealth", fill: black, scale: 0.45)
  let both = (start: (symbol: "stealth", fill: black, scale: 0.4), end: (symbol: "stealth", fill: black, scale: 0.4))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let (x0, y0) = (343, 1795)
  hatch(p, ((x0, y0), (722, y0), (722, 1335)))
  line(p(x0, y0), p(800, y0), stroke: 0.9pt, mark: mk)
  line(p(x0, y0), p(x0, 1255), stroke: 0.9pt, mark: mk)
  line(p(x0, y0), p(740, 1312), stroke: 1.4pt)
  line(p(722, y0), p(722, 1335), stroke: (thickness: 0.7pt, dash: "dashed"))
  line(p(722, 1335), p(x0, 1335), stroke: (thickness: 0.5pt, dash: "dashed"))
  line(p(748, 1335), p(748, y0), stroke: 0.7pt, mark: both)
  line(p(x0, 1823), p(722, 1823), stroke: 0.7pt, mark: both)
  lab(328, 1812, $O$)
  lab(322, 1262, $v$)
  lab(795, 1778, $t$)
  lab(530, 1823, $t$)
  lab(762, 1560, $v$)
  content(p(490, 1545), std.rotate(50deg, text(size: 8.5pt, $v = a t$)))
  lab(590, 1640, $S = 1 / 2 a t^2$)
})
