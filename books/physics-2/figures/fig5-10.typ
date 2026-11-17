// 图 5·10 布满肥皂膜的金属框（原书 p.166）
// 线条图，按原图重绘。坐标取自原页 200 dpi 页面像素坐标（1130×1662），原点取画布左上角 (150, 555)。
#import "/common/series.typ": *

#let fig-5-10(width: 4cm) = px-canvas(260, 260, origin: (150, 555), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  // 肥皂膜（斜线）
  let x0 = 195
  let x1 = 364
  let ya = 636
  let yb = 755
  let hh = yb - ya
  for k in range(-hh, x1 - x0, step: 6) {
    let tmin = calc.max(0, -k)
    let tmax = calc.min(hh, x1 - x0 - k)
    if tmin < tmax {
      line(p(x0 + k + tmin, yb - tmin), p(x0 + k + tmax, yb - tmax), stroke: 0.4pt)
    }
  }
  // 金属框：上边带圆角，下边为活动边 AB
  line(p(195, 755), p(195, 648), stroke: 1.6pt)
  arc(p(206, 648), start: 180deg, stop: 90deg, radius: 11, stroke: 1.6pt, anchor: "origin")
  line(p(206, 637), p(353, 637), stroke: 1.6pt)
  arc(p(353, 648), start: 90deg, stop: 0deg, radius: 11, stroke: 1.6pt, anchor: "origin")
  line(p(364, 648), p(364, 755), stroke: 1.6pt)
  line(p(195, 755), p(364, 755), stroke: 1.4pt)
  line(p(195, 755), p(195, 794), stroke: 0.9pt)
  line(p(364, 755), p(360, 796), stroke: 0.9pt)
  // 悬线
  line(p(279, 565), p(279, 637), stroke: 1pt)
  circle(p(279, 637), radius: 2.5, fill: white, stroke: 0.8pt)
  circle(p(195, 755), radius: 2.5, fill: white, stroke: 0.8pt)
  circle(p(364, 755), radius: 2.5, fill: white, stroke: 0.8pt)
  // F
  line(p(279, 755), p(279, 690), stroke: 1.4pt, mark: (end: "stealth", fill: black, scale: 0.5))
  lab(295, 705, $F$)
  lab(170, 755, $A$)
  lab(381, 755, $B$)
})
