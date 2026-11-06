// 习题 8·3 附图（原书 p.230）：第 6、7、8、11、12 题，均为线条图，用 CeTZ 按原图重绘。
// 坐标是原页显示图坐标（各图自己的 origin），y 向下。
#import "/common/series.typ": *

#let arr = (end: "stealth", fill: black, scale: 0.45)

// 地面：一条线加斜短线
#let ground(p, x0, x1, y, step: 12, h: 14, flip: false) = {
  import cetz.draw: *
  line(p(x0, y), p(x1, y), stroke: 0.9pt)
  let n = calc.floor((x1 - x0) / step)
  for k in range(0, n) {
    let x = x0 + k * step
    line(p(x, y + h), p(x + step * 0.7, y + 1), stroke: 0.6pt)
  }
}

// 第 6 题
#let fig-ex-8-3-6(width: 6.5cm) = px-canvas(430, 210, width: width, origin: (380, 110), (p, u) => {
  import cetz.draw: *
  let m(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  ground(p, 385, 800, 293)
  rect(p(505, 190), p(610, 293), stroke: 0.9pt)
  for k in range(0, 14) {
    let x = 507 + k * 8
    line(p(x, 292), p(calc.min(x + 100, 609), 292 - calc.min(100, 609 - x) ), stroke: 0.5pt)
  }
  rect(p(612, 213), p(710, 293), stroke: 0.9pt)
  for k in range(0, 15) {
    let x = 615 + k * 6.5
    line(p(x, 214), p(x, 292), stroke: 0.5pt)
  }
  rect(p(528, 232), p(574, 252), fill: white, stroke: none)
  rect(p(630, 240), p(676, 262), fill: white, stroke: none)
  m(551, 242, $m_1$)
  m(653, 251, $m_2$)
  line(p(393, 244), p(500, 244), stroke: 0.9pt, mark: arr)
  m(418, 224, $F$)
  line(p(533, 125), p(606, 125), stroke: 0.8pt, mark: arr)
  m(614, 125, $a$)
})

// 第 7 题
#let fig-ex-8-3-7(width: 7cm) = px-canvas(430, 250, width: width, origin: (860, 105), (p, u) => {
  import cetz.draw: *
  let m(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  ground(p, 865, 1195, 198, step: 12, h: 13)
  line(p(1195, 198), p(1195, 325), stroke: 0.9pt)
  for k in range(0, 10) {
    let y = 205 + k * 12
    line(p(1195, y + 8), p(1183, y + 20), stroke: 0.5pt)
  }
  rect(p(972, 115), p(1030, 190), stroke: 0.9pt)
  m(1001, 155, $m_A$)
  line(p(1030, 153), p(1213, 153), stroke: 0.9pt)
  circle(p(1213, 163), radius: 19 * u, stroke: 0.9pt)
  circle(p(1213, 163), radius: 8 * u, stroke: 0.7pt)
  line(p(1232, 163), p(1232, 268), stroke: 0.9pt)
  rect(p(1226, 268), p(1268, 320), stroke: 0.9pt)
  m(1247, 296, $m_B$)
})

// 第 8 题
#let fig-ex-8-3-8(width: 6.5cm) = px-canvas(370, 240, width: width, origin: (960, 555), (p, u) => {
  import cetz.draw: *
  let m(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  ground(p, 962, 1315, 750, step: 13, h: 14)
  rect(p(1077, 657), p(1217, 750), stroke: 0.9pt)
  m(1140, 703, $m$)
  line(p(1013, 565), p(1112, 658), stroke: 1.1pt, mark: arr)
  line(p(1013, 565), p(1135, 565), stroke: 0.7pt)
  arc(p(1065, 565), start: 0deg, stop: -42deg, radius: 22 * u, stroke: 0.6pt)
  m(1074, 588, $alpha$)
  m(1035, 625, $F$)
})

// 第 11 题
#let fig-ex-8-3-11(width: 6.5cm) = px-canvas(310, 560, width: width, origin: (1040, 1040), (p, u) => {
  import cetz.draw: *
  let m(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  line(p(1148, 1050), p(1255, 1050), stroke: 0.9pt)
  for k in range(0, 9) {
    let x = 1150 + k * 12
    line(p(x + 8, 1050), p(x, 1060), stroke: 0.6pt)
  }
  rect(p(1190, 1055), p(1213, 1210), stroke: 0.9pt, radius: 9 * u)
  circle(p(1200, 1195), radius: 100 * u, stroke: 0.9pt)
  line(p(1100, 1195), p(1100, 1512), stroke: 1.1pt)
  line(p(1300, 1195), p(1300, 1500), stroke: 1.1pt)
  rect(p(1057, 1512), p(1142, 1558), stroke: 0.9pt)
  rect(p(1245, 1500), p(1340, 1590), stroke: 0.9pt)
  rect(p(1118, 1458), p(1140, 1483), stroke: 0.7pt)
  for k in range(0, 5) {
    let x = 1120 + k * 4.5
    line(p(x, 1482), p(x + 4, 1459), stroke: 0.4pt)
  }
  line(p(1129, 1483), p(1129, 1512), stroke: 0.9pt)
  m(1097, 1530, $M_1$)
  m(1293, 1543, $M_2$)
  m(1158, 1465, $m$)
})

// 第 12 题
#let fig-ex-8-3-12(width: 10cm) = px-canvas(740, 130, width: width, origin: (560, 1760), (p, u) => {
  import cetz.draw: *
  let m(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  ground(p, 562, 1290, 1858, step: 14, h: 14)
  let xs = (708, 766, 826, 886, 940)
  for k in range(0, 4) {
    rect(p(xs.at(k), 1784), p(xs.at(k + 1), 1858), stroke: 0.9pt)
  }
  line(p(940, 1784), p(1030, 1784), stroke: 0.9pt)
  line(p(940, 1858), p(1030, 1858), stroke: (thickness: 0.9pt, dash: "dashed"))
  rect(p(1030, 1784), p(1087, 1858), stroke: 0.9pt)
  rect(p(1087, 1778), p(1148, 1858), stroke: 0.9pt)
  m(737, 1822, $1$)
  m(796, 1822, $2$)
  m(856, 1822, $3$)
  m(913, 1822, $4$)
  m(1058, 1818, $N - 1$)
  m(1117, 1815, $N$)
  line(p(580, 1822), p(705, 1822), stroke: 0.9pt, mark: arr)
  m(606, 1803, $F$)
})
