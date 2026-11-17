// 图 1·18 点电荷电场里的电力线（原书 p.36）
// (a) 正点电荷、(b) 负点电荷；12 条电力线（每 30° 一条），位置、长度为目测近似。
#import "/common/series.typ": *
#import "fig1-lib.typ": *

#let radial(p, cx, cy, inward: false) = {
  import cetz.draw: *
  let r0 = 17
  let r1 = 125
  for k in range(12) {
    let a = k * 30deg
    let at(r) = (cx + r * calc.cos(a), cy - r * calc.sin(a))
    if inward {
      line(p(..at(r1)), p(..at(r0)), stroke: 0.8pt)
      line(p(..at(r1 - 22)), p(..at(r1 - 36)), stroke: 0.8pt, mark: (end: "stealth", fill: black, scale: 0.5))
    } else {
      line(p(..at(r0)), p(..at(r1)), stroke: 0.8pt, mark: (end: "stealth", fill: black, scale: 0.5))
    }
  }
  circle(p(cx, cy), radius: 17 * (p(1, 0).at(0) - p(0, 0).at(0)), stroke: 0.9pt, fill: white)
}

#let fig-1-18(width: 8.6cm) = px-canvas(600, 330, origin: (210, 1050), width: width, (p, u) => {
  import cetz.draw: *
  radial(p, 345, 1195)
  radial(p, 680, 1195, inward: true)
  lab(p, (345, 1195), $+$, sz: 10pt)
  lab(p, (680, 1195), $-$, sz: 10pt)
  lab(p, (346, 1352), [($a$)], sz: 8pt)
  lab(p, (681, 1352), [($b$)], sz: 8pt)
})
