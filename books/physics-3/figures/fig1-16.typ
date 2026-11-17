// 图 1·16 例 7 附图（原书 p.33）
// 位置、比例为目测近似；数字、字母照原图。
#import "/common/series.typ": *
#import "fig1-lib.typ": *

#let fig-1-16(width: 6.4cm) = px-canvas(460, 250, origin: (500, 975), width: width, (p, u) => {
  import cetz.draw: *
  let y = 1152
  let A = (728, y)
  let B = (877, y)
  let N = (579, y)
  let C = (870, 1021)
  seg(p, (550, y), (900, y), th: 0.7pt, dash: "dashed")
  seg(p, A, C, th: 1.4pt)
  seg(p, B, C, th: 0.7pt, dash: "dashed")
  // N 点的场强 E'_A、E'_B
  arr(p, N, (522, y), th: 1.4pt)
  arr(p, N, (606, y), th: 1.0pt)
  // 间距 x
  line(p(581, 1133), p(726, 1133), stroke: 0.6pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.4))
  seg(p, (579, 1124), (579, 1146), th: 0.5pt)
  seg(p, (728, 1124), (728, 1146), th: 0.5pt)
  rect(p(645, 1124), p(668, 1142), fill: white, stroke: none)
  lab(p, (656, 1133), $x$, sz: 8pt)
  // C 点的场强
  arr(p, C, (925, 986), th: 1.4pt)
  arr(p, C, (874, 1112), th: 1.4pt)
  arr(p, C, (925, 1095), th: 1.4pt)
  seg(p, (925, 986), (925, 1095), dash: "dashed")
  seg(p, (874, 1112), (925, 1095), dash: "dashed")
  ring(p, A, r: 3)
  ring(p, B, r: 3)
  seg(p, (579, y), (579, y + 8))
  lab(p, (938, 992), $E_A$, sz: 8pt)
  lab(p, (895, 1128), $E_B$, sz: 8pt)
  lab(p, (935, 1087), $E$, sz: 8pt)
  lab(p, (881, 1065), $theta$, sz: 8pt)
  lab(p, (872, 1013), $C$, sz: 8pt, anchor: "south-east")
  lab(p, (531, 1172), $E'_A$, sz: 8pt)
  lab(p, (627, 1170), $E'_B$, sz: 8pt)
  lab(p, (579, 1165), $N$, sz: 8pt)
  lab(p, (727, 1166), $A$, sz: 8pt)
  lab(p, (723, 1192), [+10], sz: 8pt)
  lab(p, (877, 1166), $B$, sz: 8pt)
  lab(p, (876, 1190), [$-$40], sz: 8pt)
})
