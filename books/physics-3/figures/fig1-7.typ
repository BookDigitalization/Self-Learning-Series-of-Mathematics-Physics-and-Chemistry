// 图 1·7 例 4 附图（原书 p.15）
// 位置、比例为目测近似；数字、字母照原图。
#import "/common/series.typ": *
#import "fig1-lib.typ": *

#let fig-1-7(width: 5.6cm) = px-canvas(300, 540, origin: (655, 530), width: width, (p, u) => {
  import cetz.draw: *
  let O = (797, 552)
  let A = (708, 933)
  let B = (890, 933)
  let Cc = (797, 933)
  // 丝线
  seg(p, O, A, th: 1.4pt)
  seg(p, O, B, th: 1.4pt)
  seg(p, O, Cc, dash: "dashed")
  seg(p, A, B, dash: "dashed")
  // 拉力 T
  arr(p, (716, 897), (737, 807), th: 1.2pt)
  arr(p, (883, 905), (864, 828), th: 1.2pt)
  // 电斥力 F、重力 mg、合力 R
  arr(p, B, (922, 933), th: 1.2pt)
  arr(p, A, (668, 933), th: 1.2pt)
  arr(p, A, (708, 1040), th: 1.2pt)
  arr(p, B, (890, 1030), th: 1.2pt)
  arr(p, B, (918, 1037), th: 1.4pt)
  seg(p, (918, 933), (918, 1037), dash: "dotted")
  seg(p, (890, 1030), (918, 1037), dash: "dotted")
  // 间距
  line(p(709, 986), p(889, 986), stroke: 0.6pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.4))
  seg(p, (708, 940), (708, 992), th: 0.5pt)
  seg(p, (890, 940), (890, 992), th: 0.5pt)
  rect(p(772, 976), p(814, 996), fill: white, stroke: none)
  lab(p, (793, 986), [20], sz: 8pt)
  lab(p, (797, 540), $O$, sz: 8pt, anchor: "south")
  lab(p, (853, 724), [50], sz: 8pt)
  lab(p, (881, 840), $T$, sz: 8pt, anchor: "west")
  lab(p, (716, 946), $A$, sz: 8pt, anchor: "north-west")
  lab(p, (797, 944), $C$, sz: 8pt, anchor: "north")
  lab(p, (872, 947), $B$, sz: 8pt, anchor: "north-east")
  lab(p, (930, 933), vec-it($F$), sz: 8pt, anchor: "west")
  lab(p, (886, 1050), $m g$, sz: 8pt, anchor: "east")
  lab(p, (922, 1046), vec-it($R$), sz: 8pt, anchor: "west")
})
