// 图 1·5 例 2 附图（原书 p.11）
// 位置、比例为目测近似；数字、字母照原图。
#import "/common/series.typ": *
#import "fig1-lib.typ": *

#let fig-1-5(width: 5.4cm) = px-canvas(345, 400, origin: (610, 960), width: width, (p, u) => {
  import cetz.draw: *
  let C = (779, 1135)
  let A = (632, 1338)
  let B = (928, 1334)
  let O = (779, 1338)
  seg(p, A, C, dash: "dashed")
  seg(p, B, C, dash: "dashed")
  seg(p, O, C, dash: "dashed")
  seg(p, A, B, dash: "dashed")
  // 合力 F、分力 F1、F2 和平行四边形
  arr(p, C, (795, 982), th: 1.5pt, s: 0.55)
  arr(p, C, (871, 1048), th: 1.2pt, s: 0.5)
  arr(p, C, (733, 1050), th: 1.2pt, s: 0.5)
  seg(p, (795, 982), (871, 1048), dash: "dashed")
  seg(p, (795, 982), (733, 1050), dash: "dashed")
  seg(p, (779, 1065), (779, 1132), dash: "dashed")
  ring(p, A, r: 3.5)
  ring(p, B, r: 3.5)
  lab(p, (797, 972), vec-it($F$), sz: 8pt)
  lab(p, (858, 1051), vec-it($F_1$), sz: 8pt)
  lab(p, (715, 1076), vec-it($F_2$), sz: 8pt)
  lab(p, (797, 1092), $theta$, sz: 8pt)
  lab(p, (782, 1128), $C$, sz: 8pt, anchor: "south-west")
  lab(p, (765, 1170), $alpha$, sz: 8pt)
  lab(p, (790, 1172), $alpha$, sz: 8pt)
  lab(p, (693, 1228), [50], sz: 8pt)
  lab(p, (868, 1230), [50], sz: 8pt)
  lab(p, (791, 1232), [40], sz: 8pt)
  lab(p, (715, 1350), [30], sz: 8pt)
  lab(p, (861, 1350), [30], sz: 8pt)
  lab(p, (789, 1350), $O$, sz: 8pt)
  lab(p, (628, 1357), $A$, sz: 8pt)
  lab(p, (932, 1352), $B$, sz: 8pt)
})
