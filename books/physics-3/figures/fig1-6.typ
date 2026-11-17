// 图 1·6 例 3 附图（原书 p.13）
// 位置、比例为目测近似；数字、字母照原图。
#import "/common/series.typ": *
#import "fig1-lib.typ": *

#let fig-1-6(width: 10cm) = px-canvas(570, 140, origin: (255, 600), width: width, (p, u) => {
  import cetz.draw: *
  let y = 698
  let xa = 318
  let xc = 463
  let xb = 765
  let dim(x0, x1, yy) = line(p(x0, yy), p(x1, yy), stroke: 0.6pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.4))
  seg(p, (xa, 605), (xa, y - 6))
  seg(p, (xb, 605), (xb, y - 6))
  seg(p, (xc, 640), (xc, y - 6))
  dim(xa, xb, 620)
  dim(xa, xc, 652)
  dim(xc, xb, 652)
  rect(p(515, 612), p(556, 630), fill: white, stroke: none)
  lab(p, (535, 621), [30], sz: 8pt)
  rect(p(378, 644), p(402, 660), fill: white, stroke: none)
  lab(p, (390, 652), $x$, sz: 8pt)
  rect(p(578, 644), p(646, 660), fill: white, stroke: none)
  lab(p, (612, 652), $30 - x$, sz: 8pt)
  seg(p, (xa, y), (xb, y), dash: "dashed")
  // 各电荷所受的力
  arr(p, (xa, y), (264, y), th: 1.4pt)
  arr(p, (xa, y), (352, y), th: 1.4pt)
  arr(p, (xc, y), (410, y), th: 1.4pt)
  arr(p, (xc, y), (522, y), th: 1.4pt)
  arr(p, (xb, y), (716, y), th: 1.4pt)
  arr(p, (xb, y), (820, y), th: 1.4pt)
  ring(p, (xa, y), r: 3.5)
  ring(p, (xc, y), r: 3.5)
  ring(p, (xb, y), r: 3.5)
  lab(p, (272, 680), vec-it($F_1$), sz: 8pt)
  lab(p, (362, 681), vec-it($F_2$), sz: 8pt)
  lab(p, (413, 681), vec-it($F_2$), sz: 8pt)
  lab(p, (510, 681), vec-it($F_3$), sz: 8pt)
  lab(p, (722, 681), vec-it($F_3$), sz: 8pt)
  lab(p, (800, 681), vec-it($F_1$), sz: 8pt)
  lab(p, (317, 718), $A$, sz: 8pt)
  lab(p, (463, 718), $C$, sz: 8pt)
  lab(p, (765, 718), $B$, sz: 8pt)
})
