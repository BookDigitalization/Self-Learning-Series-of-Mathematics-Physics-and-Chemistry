// 图 1·15 点电荷的电场（原书 p.32）
// 位置、比例为目测近似；字母照原图。
#import "/common/series.typ": *
#import "fig1-lib.typ": *

#let fig-1-15(width: 4.3cm) = px-canvas(320, 180, origin: (95, 665), width: width, (p, u) => {
  import cetz.draw: *
  seg(p, (128, 818), (336, 704), dash: "dashed", th: 0.8pt)
  arr(p, (336, 704), (396, 672), th: 1.2pt, s: 0.5)
  ring(p, (128, 818), r: 4, fill: white)
  ring(p, (336, 704), r: 4, fill: white)
  lab(p, (117, 797), $+Q$, sz: 8pt)
  lab(p, (330, 687), $+q$, sz: 8pt)
  lab(p, (259, 764), $r$, sz: 8pt)
  lab(p, (392, 690), vec-it($F$), sz: 8pt)
})
