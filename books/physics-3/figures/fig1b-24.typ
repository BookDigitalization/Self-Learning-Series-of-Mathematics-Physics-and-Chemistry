// 图 1·24 场强和电势差的关系、图 1·25 导体内部场强等于零（原书 p.47、p.50）。CeTZ 重绘；坐标取自 150 dpi 页面图。
#import "fig1b-lib.typ": *

#let fig-1-24(width: 7cm) = px-canvas(430, 250, origin: (655, 1345), width: width, (p, u) => {
  import cetz.draw: *
  for y in (1362, 1397, 1432, 1467, 1502, 1537, 1572) {
    arr(p, (665, y), (1070, y), w: 0.7pt, s: 0.45)
  }
  // A、B 两点和间距 l
  line(p(755, 1467), p(897, 1467), stroke: 2pt)
  circle(p(755, 1467), radius: 3.5 * u, stroke: 0.8pt, fill: white)
  circle(p(897, 1467), radius: 3.5 * u, stroke: 0.8pt, fill: white)
  lab(p, 758, 1457, [$A$], size: 8pt, fill: white)
  lab(p, 899, 1457, [$B$], size: 8pt, fill: white)
  lab(p, 1005, 1467, [$E$], size: 8pt, fill: white)
  lab(p, 826, 1502, [$l$], size: 8pt, fill: white)
})

#let fig-1-25(width: 7.5cm) = px-canvas(520, 640, origin: (125, 975), width: width, (p, u) => {
  import cetz.draw: *
  // (a)
  let ya = (1015, 1051, 1088, 1124, 1160, 1197)
  for y in ya {
    arr(p, (150, y), (265, y), w: 0.7pt, s: 0.4)
    arr(p, (503, y), (625, y), w: 0.7pt, s: 0.4)
  }
  rect(p(265, 1015), p(503, 1197), stroke: 1pt)
  for y in (1051, 1088, 1124, 1160) {
    line(p(495, y), p(282, y), stroke: (thickness: 0.7pt, dash: "dashed"), mark: (end: "stealth", fill: black, scale: 0.4))
  }
  for i in range(6) {
    let y = 1035 + 28 * i
    lab(p, 277, y, [$-$], size: 7pt)
    lab(p, 491, y, [$+$], size: 7pt)
  }
  lab(p, 263, 1000, [$A$], size: 8pt)
  lab(p, 500, 1000, [$D$], size: 8pt)
  lab(p, 263, 1212, [$B$], size: 8pt)
  lab(p, 500, 1212, [$C$], size: 8pt)
  lab(p, 600, 1088, [$E$], size: 8pt, fill: white)
  lab(p, 385, 1106, [$E'$], size: 8pt, fill: white)
  lab(p, 375, 1245, [$(a)$], size: 8pt)
  // (b)
  let x0 = 267
  let x1 = 500
  let top = 1368
  let bot = 1530
  rect(p(x0, top), p(x1, bot), stroke: 1pt)
  let ys = (1335, 1385, 1450, 1515, 1568)
  let ye = (1385, 1420, 1458, 1495, 1528)
  for i in range(5) {
    bezier(p(150, ys.at(i)), p(262, ye.at(i)), p(215, ys.at(i)), p(235, ye.at(i)), stroke: 0.7pt)
    arr(p, (150, ys.at(i)), (170, ys.at(i)), w: 0.7pt, s: 0.4)
    bezier(p(505, ye.at(i)), p(625, ys.at(i)), p(530, ye.at(i)), p(560, ys.at(i)), stroke: 0.7pt,
      mark: (end: "stealth", fill: black, scale: 0.4))
  }
  for i in range(5) {
    let y = 1390 + 30 * i
    lab(p, 279, y, [$-$], size: 7pt)
    lab(p, 490, y, [$+$], size: 7pt)
  }
  lab(p, 375, 1577, [$(b)$], size: 8pt)
})
