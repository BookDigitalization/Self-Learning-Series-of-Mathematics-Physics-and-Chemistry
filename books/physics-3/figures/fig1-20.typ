// 图 1·20 匀强电场（原书 p.38）
// 两块平行金属板（上板带正电、下板带负电）和板间的电力线；位置、条数为目测近似。
#import "/common/series.typ": *
#import "fig1-lib.typ": *

#let plate(p, y0, y1, x0: 168, x1: 388) = {
  import cetz.draw: *
  rect(p(x0, y0), p(x1, y1), stroke: 0.9pt, fill: white)
  let x = x0 + 4
  while x < x1 - 10 {
    line(p(x, y1), p(x + 10, y0), stroke: 0.4pt)
    x += 6
  }
}

#let fig-1-20(width: 3.8cm) = px-canvas(260, 160, origin: (138, 745), width: width, (p, u) => {
  import cetz.draw: *
  plate(p, 752, 775)
  plate(p, 862, 885)
  // 板间平行的电力线
  for k in range(0, 11) {
    let x = 187 + k * 17.6
    line(p(x, 775), p(x, 862), stroke: 0.6pt, mark: (end: "stealth", fill: black, scale: 0.35))
  }
  // 边缘处向外弯曲的电力线
  let bulge(sx, sgn) = {
    let pts = range(0, 21).map(i => {
      let t = i / 20
      (sx + sgn * 27 * calc.sin(t * 180deg), 777 + 83 * t)
    })
    line(..pts.map(q => p(..q)), stroke: 0.6pt, mark: (end: "stealth", fill: black, scale: 0.35))
  }
  bulge(178, -1)
  bulge(378, 1)
  bulge(176, -0.55)
  bulge(380, 0.55)
  rect(p(270, 755), p(290, 772), fill: white, stroke: none)
  rect(p(270, 865), p(290, 882), fill: white, stroke: none)
  lab(p, (280, 764), $+$, sz: 9pt)
  lab(p, (280, 874), $-$, sz: 9pt)
})
