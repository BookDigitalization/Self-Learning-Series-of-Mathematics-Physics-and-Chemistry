// 图 5·16 液面是弯月面时的表面张力（原书 p.175）
// 线条图，按原图重绘。坐标取自原页 200 dpi 页面像素坐标（1130×1662），原点取画布左上角 (180, 1075)。
// （a）凸弯月面用 fa(px, py)，（b）凹弯月面用 fb(px, py)；px、py 为放大 2.6 倍的局部图上量得的像素。
#import "/common/series.typ": *

#let fig-5-16(width: 7cm) = px-canvas(400, 195, origin: (180, 1075), width: width, (p, u) => {
  import cetz.draw: *
  let ar = (end: "stealth", fill: black, scale: 0.5)
  let fa(x, y) = p(150 + x / 2.6, 1030 + y / 2.6)
  let fb(x, y) = p(340 + x / 2.6, 1030 + y / 2.6)
  let lab(pt, body) = content(pt, anchor: "center", text(size: 9pt, body))
  let dot(pt) = circle(pt, radius: 2.4, fill: black, stroke: none)
  let waves(f, x0, x1, y0, y1) = {
    for (i, y) in range(y0, y1, step: 26).enumerate() {
      for x in range(x0 + 8 + calc.rem(i, 2) * 22, x1 - 30, step: 64) {
        line(f(x, y), f(x + 32, y), stroke: 0.5pt)
      }
    }
  }
  // (a) 凸弯月面
  line(fa(203, 168), fa(203, 522), fa(510, 522), fa(510, 168), stroke: 1.1pt)
  let R = 212.6
  let pts = ()
  for x in range(203, 511, step: 8) {
    pts.push(fa(x, 447.6 - calc.sqrt(R * R - calc.pow(x - 350, 2))))
  }
  pts.push(fa(510, 300))
  line(..pts, stroke: 1pt)
  waves(fa, 205, 510, 330, 500)
  line(fa(350, 160), fa(203, 300), stroke: 1.3pt)
  line(fa(203, 300), fa(108, 397), stroke: 1.3pt, mark: ar)
  line(fa(350, 160), fa(510, 300), stroke: 1.3pt)
  line(fa(510, 300), fa(602, 397), stroke: 1.3pt, mark: ar)
  line(fa(350, 160), fa(272, 237), stroke: 1.3pt, mark: ar)
  line(fa(350, 160), fa(432, 235), stroke: 1.3pt, mark: ar)
  line(fa(350, 160), fa(352, 405), stroke: 1.3pt, mark: ar)
  dot(fa(350, 160))
  dot(fa(352, 235))
  dot(fa(203, 300))
  dot(fa(510, 300))
  lab(fa(352, 578), $(a)$)
  // (b) 凹弯月面
  line(fb(212, 172), fb(212, 525), fb(518, 525), fb(518, 172), stroke: 1.1pt)
  let Rb = 233.8
  let ptsb = ()
  for x in range(212, 519, step: 8) {
    ptsb.push(fb(x, 325 - 57 + (Rb - calc.sqrt(Rb * Rb - calc.pow(x - 365, 2))) - 0))
  }
  line(..ptsb, stroke: 1pt)
  waves(fb, 214, 518, 340, 500)
  line(fb(212, 268), fb(118, 182), stroke: 1.3pt, mark: ar)
  line(fb(518, 265), fb(613, 178), stroke: 1.3pt, mark: ar)
  line(fb(150, 213), fb(143, 205), stroke: 1.3pt, mark: ar)
  line(fb(580, 208), fb(588, 202), stroke: 1.3pt, mark: ar)
  line(fb(360, 413), fb(363, 148), stroke: 1.3pt, mark: ar)
  line(fb(363, 300), fb(363, 262), stroke: 1.3pt, mark: ar)
  line(fb(360, 413), fb(275, 328), stroke: 1.3pt, mark: ar)
  line(fb(360, 413), fb(455, 325), stroke: 1.3pt, mark: ar)
  line(fb(363, 238), fb(292, 305), stroke: (thickness: 0.6pt, dash: "dashed"))
  line(fb(363, 238), fb(440, 300), stroke: (thickness: 0.6pt, dash: "dashed"))
  dot(fb(212, 268))
  dot(fb(518, 265))
  dot(fb(360, 325))
  dot(fb(360, 413))
  lab(fb(365, 578), $(b)$)
})
