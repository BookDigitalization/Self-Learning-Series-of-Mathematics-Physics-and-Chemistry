// 习题 13·3 附图（原书 p.437）：第 4 题（摩托车跨沟）、第 6 题（山坡上击中目标）
// 线条图，按原图重绘；第 4 题的摩托车和骑手是写实小插画，这里只用简单线条示意。
// 坐标是页面显示图（宽 1568）上的像素坐标，位置为目测。
#import "/common/series.typ": *

#let fig-ex-13-3-4(width: 7.2cm) = px-canvas(470, 280, origin: (925, 310), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.5)
  let dim = (start: "stealth", end: "stealth", fill: black, scale: 0.4)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dsh = (thickness: 0.8pt, dash: "dashed")
  // 山丘斜坡
  line(p(930, 462), p(1085, 380), stroke: 1.2pt)
  for k in range(0, 9) {
    let x = 945 + k * 17
    let y = 462 - (x - 930) * (82 / 155)
    line(p(x, y + 3), p(x - 12, y + 18), stroke: 0.5pt)
  }
  // 山丘顶部的竖直面和地面
  line(p(1088, 380), p(1088, 578), stroke: 1.2pt)
  line(p(935, 578), p(1088, 578), stroke: 2pt)
  // 对岸
  line(p(1270, 520), p(1380, 520), stroke: 1.2pt)
  line(p(1270, 520), p(1270, 578), stroke: 1.2pt)
  for k in range(0, 7) {
    let x = 1280 + k * 15
    line(p(x, 520), p(x + 8, 510), stroke: 0.5pt)
  }
  for k in range(0, 4) {
    let y = 525 + k * 14
    line(p(1270, y), p(1280, y - 8), stroke: 0.5pt)
  }
  // 摩托车（示意）
  circle(p(1050, 382), radius: 8 * u, stroke: 1pt)
  circle(p(1080, 372), radius: 8 * u, stroke: 1pt)
  line(p(1050, 382), p(1062, 360), p(1085, 358), stroke: 1pt)
  circle(p(1060, 346), radius: 6 * u, fill: black, stroke: none)
  // 水平虚线、轨迹、速度
  line(p(1085, 378), p(1220, 378), stroke: dsh)
  catmull(p(1088, 374), p(1130, 345), p(1190, 330), p(1235, 345), p(1262, 368), stroke: (thickness: 0.9pt, dash: "dashed"))
  line(p(1085, 378), p(1205, 322), stroke: 1.4pt, mark: arr)
  lab(1218, 313, $v_0$)
  lab(1135, 367, $theta$)
  // h、l
  line(p(1170, 380), p(1170, 520), stroke: 0.8pt, mark: dim)
  lab(1170, 447, $h$)
  line(p(1088, 520), p(1270, 520), stroke: dsh)
  line(p(1088, 605), p(1270, 605), stroke: 0.8pt, mark: dim)
  lab(1180, 595, $l$)
})

#let fig-ex-13-3-6(width: 7.6cm) = px-canvas(660, 270, origin: (595, 1205), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (end: "stealth", fill: black, scale: 0.5)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let o = (655, 1412)
  // 山坡
  line(p(..o), p(1162, 1215), stroke: 1.8pt)
  line(p(..o), p(1162, 1412), stroke: 1.8pt)
  line(p(1162, 1412), p(1162, 1215), stroke: 1.8pt)
  // 炮
  circle(p(..o), radius: 6 * u, stroke: 1.2pt)
  line(p(603, 1443), p(650, 1415), stroke: 1.4pt)
  line(p(617, 1450), p(660, 1420), stroke: 1.4pt)
  // 轨迹
  catmull(p(..o), p(720, 1330), p(800, 1285), p(900, 1260), p(960, 1255), p(1018, 1262), stroke: 1.4pt)
  circle(p(1018, 1262), radius: 3 * u, fill: black, stroke: none)
  line(p(..o), p(752, 1268), stroke: 1.6pt, mark: arr)
  lab(762, 1237, $v_0$)
  arc(p(655 + 110, 1412), start: 0deg, stop: 30deg, radius: 110 * u, stroke: 0.7pt)
  arc(p(655 + 125, 1412), start: 0deg, stop: 60deg, radius: 125 * u, stroke: 0.7pt)
  lab(805, 1328, $theta = 60 degree$)
  lab(750, 1418, $alpha = 30 degree$)
})
