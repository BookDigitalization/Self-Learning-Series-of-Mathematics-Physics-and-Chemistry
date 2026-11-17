// 图 6·38 P-N 结加正向电压（上）与二极电子管（下）；来源 原书 p.338，坐标取自 200 dpi 页面像素（1671×2500）。
#import "/common/series.typ": *
#import "fig6b-parts.typ": *

#let fig-6-38(width: 7.8cm) = px-canvas(540, 560, origin: (250, 250), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, size: 9pt) = content(p(x, y), anchor: "center", text(size: size, body))
  let ar = (end: "stealth", fill: black, scale: 0.45)
  // P-N 结
  rect(p(341, 281), p(656, 421), stroke: 1.8pt)
  vdash(p, 475, 281, 421); vdash(p, 514, 281, 421)
  line(p(492, 281), p(492, 421), stroke: 1.8pt)
  lab(473, 265, $I$, size: 9.5pt); lab(516, 265, $I$, size: 9.5pt)
  hole(p, 387, 336); line(p(400, 336), p(453, 336), stroke: 1pt, mark: ar)
  hole(p, 606, 336, sign: "-"); line(p(593, 336), p(542, 336), stroke: 1pt, mark: ar)
  lab(414, 374, $P$, size: 10pt); lab(584, 374, $N$, size: 10pt)
  wire(p, (341, 353), (269, 353), (269, 479), (481, 479))
  wire(p, (656, 353), (727, 353), (727, 479), (513, 479))
  battery(p, 481, 479, cells: 2, long: 40, short: 22, step: 10.5)
  lab(456, 462, [+]); lab(534, 466, [#sym.minus])
  // 二极电子管
  rect(p(400, 515), p(597, 646), radius: 62, stroke: 1.8pt)
  line(p(443, 559), p(443, 609), stroke: 3pt)
  bezier(p(573, 554), p(573, 614), p(552, 570), p(552, 600), stroke: 2.8pt)
  wire(p, (400, 583), (269, 583), (269, 737), (473, 737))
  wire(p, (573, 618), (727, 618), (727, 737), (506, 737))
  battery(p, 473, 737, cells: 2, long: 36, short: 20, step: 11)
  lab(450, 720, [+]); lab(528, 722, [#sym.minus])
  // 图例
  hole(p, 631, 525); lab(691, 525, [空穴], size: 9pt)
  hole(p, 631, 565, sign: "-"); lab(691, 565, [电子], size: 9pt)
})
