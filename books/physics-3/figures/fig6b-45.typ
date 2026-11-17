// 图 6·45 光电管示意图；来源 原书 p.344，坐标取自 200 dpi 页面像素（1671×2500）。
#import "/common/series.typ": *
#import "fig6b-parts.typ": *

#let fig-6-45(width: 5.8cm) = px-canvas(460, 450, origin: (200, 575), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, size: 9pt) = content(p(x, y), anchor: "center", text(size: size, body))
  // 管壳、阴极 K、阳极环 A
  circle(p(448, 657), radius: 84, stroke: 2.4pt)
  bezier(p(397, 629), p(399, 692), p(368, 645), p(368, 676), stroke: 2.4pt)
  bezier(p(388, 640), p(391, 682), p(374, 650), p(374, 672), stroke: 1.4pt)
  bezier(p(522, 631), p(521, 690), p(492, 645), p(492, 676), stroke: 1pt)
  circle(p(450, 659), radius: 1, stroke: none)
  // 阳极环用椭圆（以曲线近似）
  bezier(p(450, 640), p(450, 678), p(430, 640), p(430, 678), stroke: 1.8pt)
  bezier(p(450, 640), p(450, 678), p(470, 640), p(470, 678), stroke: 1.8pt)
  lab(349, 637, $K$, size: 9.5pt); lab(479, 650, $A$, size: 9.5pt)
  // 电路
  wire(p, (364, 659), (233, 659), (233, 771))
  battery-v(p, 241, 771, cells: 3, long: 40, short: 24, step: 16)
  wire(p, (236, 852), (236, 949), (327, 949))
  circle(p(358, 949), radius: 31, stroke: lw)
  lab(358, 949, $G$, size: 10pt)
  line(p(450, 678), p(450, 737), stroke: lw)
  line(p(455, 737), p(455, 945), stroke: 2pt)
  wire(p, (455, 945), (389, 949))
  lab(212, 751, [#sym.minus], size: 10pt); lab(214, 873, [+], size: 10pt); lab(396, 877, [#sym.minus], size: 9pt)
  // 光
  for y in (640, 654, 670) {
    line(p(621, y), p(552, y), stroke: 1.6pt, mark: (end: "stealth", fill: black, scale: 0.6))
  }
  lab(583, 699, [光源], size: 9pt)
})
