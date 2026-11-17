// 图 1·17 电力线示意图（原书 p.35）
// 位置、比例为目测近似；字母照原图。
#import "/common/series.typ": *
#import "fig1-lib.typ": *

#let fig-1-17(width: 5cm) = px-canvas(350, 400, origin: (580, 1010), width: width, (p, u) => {
  import cetz.draw: *
  let mid(a, b, t: 0.5) = (a.at(0) + (b.at(0) - a.at(0)) * t, a.at(1) + (b.at(1) - a.at(1)) * t)
  let poly(pts, th: 0.9pt) = line(..pts.map(q => p(..q)), stroke: th)
  // (a)
  let a = ((593, 1177), (640, 1117), (805, 1043), (890, 1063))
  poly(a)
  arr(p, mid(a.at(0), a.at(1), t: 0.25), mid(a.at(0), a.at(1), t: 0.65), s: 0.55)
  arr(p, mid(a.at(1), a.at(2), t: 0.55), mid(a.at(1), a.at(2), t: 0.95), s: 0.55)
  lab(p, (638, 1103), $B$, sz: 8pt)
  lab(p, (806, 1030), $C$, sz: 8pt)
  lab(p, (896, 1048), $D$, sz: 8pt)
  lab(p, (594, 1176), $A$, sz: 8pt, anchor: "north-east")
  lab(p, (777, 1105), [($a$)], sz: 8pt)
  // (b)
  let b = ((595, 1262), (622, 1197), (722, 1155), (782, 1150), (838, 1170), (900, 1197))
  poly(b)
  arr(p, mid(b.at(0), b.at(1), t: 0.3), mid(b.at(0), b.at(1), t: 0.7), s: 0.55)
  arr(p, mid(b.at(1), b.at(2), t: 0.45), mid(b.at(1), b.at(2), t: 0.85), s: 0.55)
  arr(p, mid(b.at(3), b.at(4), t: 0.2), mid(b.at(3), b.at(4), t: 0.7), s: 0.55)
  arr(p, mid(b.at(4), b.at(5), t: 0.4), mid(b.at(4), b.at(5), t: 0.9), s: 0.55)
  lab(p, (622, 1185), $B$, sz: 8pt, anchor: "south-east")
  lab(p, (720, 1148), $C$, sz: 8pt, anchor: "south-east")
  lab(p, (780, 1141), $D$, sz: 8pt)
  lab(p, (834, 1156), $E$, sz: 8pt)
  lab(p, (905, 1190), $F$, sz: 8pt, anchor: "west")
  lab(p, (596, 1262), $A$, sz: 8pt, anchor: "north-east")
  lab(p, (774, 1224), [($b$)], sz: 8pt)
  // (c)
  let cs = range(0, 41).map(i => {
    let t = i / 40
    // 三点样条的近似：二次曲线 A(596,1372) → 中间点 (790,1245) → D(905,1335)
    let ax = 596
    let ay = 1372
    let cx = 790
    let cy = 1228
    let dx = 905
    let dy = 1335
    (ax * (1 - t) * (1 - t) + 2 * cx * (1 - t) * t + dx * t * t, ay * (1 - t) * (1 - t) + 2 * cy * (1 - t) * t + dy * t * t)
  })
  line(..cs.map(q => p(..q)), stroke: 1.2pt)
  arr(p, cs.at(4), cs.at(7), s: 0.55)
  arr(p, cs.at(20), cs.at(23), s: 0.55)
  arr(p, cs.at(34), cs.at(37), s: 0.55)
  ring(p, cs.at(9), r: 3)
  ring(p, cs.at(24), r: 3)
  lab(p, (655, 1303), $B$, sz: 8pt, anchor: "south")
  lab(p, (795, 1270), $C$, sz: 8pt, anchor: "south")
  lab(p, (910, 1345), $D$, sz: 8pt, anchor: "west")
  lab(p, (596, 1374), $A$, sz: 8pt, anchor: "north-east")
  lab(p, (722, 1262), $E_b$, sz: 8pt)
  lab(p, (880, 1278), $E_c$, sz: 8pt)
  lab(p, (773, 1352), [($c$)], sz: 8pt)
})
