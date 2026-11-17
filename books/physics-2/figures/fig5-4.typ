// 图 5·4 作用在液体内部的分子和液体表面层的分子上的力（原书 p.157）
// 线条图，按原图重绘。坐标取自原页 200 dpi 页面像素坐标（1130×1662），原点取画布左上角 (265, 345)。
#import "/common/series.typ": *

#let fig-5-4(width: 11cm) = px-canvas(600, 370, origin: (265, 345), width: width, (p, u) => {
  import cetz.draw: *
  let ar = (end: "stealth", fill: black, scale: 0.45)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  let dot(x, y) = circle(p(x, y), radius: 2.2, fill: black, stroke: none)
  let circs = ((402, 413, 63), (557, 442, 61), (721, 480, 61), (430, 618, 61))
  // 水纹：避开各圆
  for (i, y) in range(430, 700, step: 20).enumerate() {
    for x in range(277 + calc.rem(i, 3) * 18, 840, step: 62) {
      let ok = true
      for (cx, cy, r) in circs {
        let mx = x + 20
        if calc.sqrt(calc.pow(mx - cx, 2) + calc.pow(y - cy, 2)) < r + 22 { ok = false }
      }
      if ok { line(p(x, y), p(x + 40, y), stroke: 0.9pt) }
    }
  }
  // 液面
  line(p(277, 413), p(847, 413), stroke: 1.8pt)
  // 各分子作用球
  for (cx, cy, r) in circs { circle(p(cx, cy), radius: r, stroke: 1pt, fill: none) }
  // M3 的两层
  let band(ya, yb) = {
    let cx = 557
    let cy = 442
    let r = 61
    let xa = calc.sqrt(r * r - calc.pow(ya - cy, 2))
    let xb = calc.sqrt(r * r - calc.pow(yb - cy, 2))
    let x0 = cx - calc.min(xa, xb)
    let x1 = cx + calc.min(xa, xb)
    let hh = yb - ya
    for k in range(0, int(x1 - x0 + hh), step: 6) {
      let tmin = calc.max(0, k - (x1 - x0))
      let tmax = calc.min(hh, k)
      if tmin < tmax {
        line(p(x0 + k - tmin, ya + tmin), p(x0 + k - tmax, ya + tmax), stroke: 0.5pt)
      }
    }
    line(p(cx - xa, ya), p(cx + xa, ya), stroke: 0.9pt)
    line(p(cx - xb, yb), p(cx + xb, yb), stroke: 0.9pt)
  }
  band(413, 442)
  band(442, 471)
  // M2
  dot(402, 413)
  line(p(402, 413), p(405, 457), stroke: 1.3pt, mark: ar)
  line(p(402, 413), p(378, 457), stroke: 0.8pt)
  line(p(402, 413), p(427, 457), stroke: 0.8pt)
  line(p(402, 413), p(375, 424), stroke: 1.1pt, mark: ar)
  line(p(402, 413), p(432, 425), stroke: 1.1pt, mark: ar)
  dot(378, 457)
  dot(427, 457)
  dot(365, 435)
  dot(448, 435)
  lab(405, 397, $M_2$)
  lab(355, 424, $n_1$)
  lab(447, 424, $n_2$)
  lab(365, 460, $f_1$)
  lab(446, 460, $f'_1$)
  // M3
  dot(557, 442)
  lab(557, 429, $M_3$)
  lab(490, 397, $A_1$)
  lab(627, 400, $B_1$)
  lab(485, 445, $O$)
  lab(632, 445, $O_1$)
  lab(489, 472, $A$)
  lab(622, 474, $B$)
  lab(553, 520, $C$)
  // M4
  dot(721, 480)
  lab(721, 467, $M_4$)
  // M1
  dot(430, 618)
  line(p(430, 618), p(398, 587), stroke: 0.8pt)
  line(p(430, 618), p(463, 587), stroke: 0.8pt)
  line(p(430, 618), p(402, 649), stroke: 1.1pt, mark: ar)
  line(p(430, 618), p(465, 652), stroke: 1.1pt, mark: ar)
  line(p(430, 618), p(400, 618), stroke: 1.1pt, mark: ar)
  line(p(430, 618), p(463, 618), stroke: 1.1pt, mark: ar)
  dot(398, 587)
  dot(463, 587)
  dot(383, 618)
  dot(480, 618)
  dot(402, 649)
  dot(465, 652)
  lab(387, 602, $n_1$)
  lab(472, 602, $n_2$)
  lab(387, 652, $f_1$)
  lab(477, 650, $f'_1$)
  lab(430, 635, $M_1$)
})
