// 图 1·14 电场强度各处不同（原书 p.30）
// 位置、比例为目测近似；数字、字母照原图。
#import "/common/series.typ": *
#import "fig1-lib.typ": *

#let fig-1-14(width: 4.6cm) = px-canvas(330, 420, origin: (100, 140), width: width, (p, u) => {
  import cetz.draw: *
  circle(p(216, 320), radius: 30 * u, stroke: 0.8pt)
  lab(p, (216, 320), $Q$, sz: 9pt)
  // 位置 1
  ring(p, (181, 377), r: 3)
  arr(p, (178, 385), (118, 533), th: 0.9pt, s: 0.5)
  lab(p, (160, 372), [1], sz: 8pt)
  lab(p, (200, 370), $q$, sz: 8pt)
  lab(p, (133, 527), $F_1$, sz: 8pt)
  // 位置 2
  ring(p, (283, 422), r: 3)
  arr(p, (287, 427), (331, 497), th: 0.9pt, s: 0.5)
  lab(p, (265, 424), [2], sz: 8pt)
  lab(p, (300, 418), $q$, sz: 8pt)
  lab(p, (345, 491), $F_2$, sz: 8pt)
  // 位置 3
  ring(p, (298, 327), r: 3)
  arr(p, (302, 331), (428, 342), th: 0.9pt, s: 0.5)
  lab(p, (296, 312), $q$, sz: 8pt)
  lab(p, (300, 345), [3], sz: 8pt)
  lab(p, (442, 364), $F_3$, sz: 8pt)
  // 位置 4
  ring(p, (323, 232), r: 3)
  arr(p, (327, 227), (383, 195), th: 0.9pt, s: 0.5)
  lab(p, (323, 214), $q$, sz: 8pt)
  lab(p, (327, 252), [4], sz: 8pt)
  lab(p, (366, 180), $F_4$, sz: 8pt)
})
