// 图 9·45 有支轴物体的平衡（原书 p.287）
// 原为含字母的位图；线条图，整幅用 CeTZ 重绘。坐标是原 png（2218×854）的像素坐标，y 向下。
// 近似处：顶部/底部支承物的斑点阴影用斜线示意；虚线疏密为目测。
#import "/common/series.typ": *

#let fig-9-45(width: 12cm) = px-canvas(2218, 854, width: width, (p, u) => {
  import cetz.draw: *
  let m(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  let dd = (thickness: 0.7pt, dash: "dash-dotted")
  let ds = (thickness: 0.7pt, dash: "dashed")
  let arr(a, b) = line(p(..a), p(..b), stroke: 1.4pt, mark: (end: "stealth", fill: black, scale: 0.5))
  let dot(x, y) = circle(p(x, y), radius: 8 * u, fill: black, stroke: none)
  let hatch(x0, x1, y, dy) = {
    let x = x0
    while x < x1 {
      line(p(x, y), p(x + 18, y - dy), stroke: 0.5pt)
      x += 30
    }
  }
  // ---- (a)
  line(p(195, 92), p(495, 92), stroke: 1.6pt)
  hatch(205, 480, 92, 60)
  line(p(345, 92), p(350, 462), stroke: dd)
  circle(p(350, 537), radius: 75 * u, stroke: 0.9pt)
  dot(350, 537)
  arr((350, 540), (352, 712))
  circle(p(95, 458), radius: 77 * u, stroke: ds)
  line(p(338, 95), p(128, 400), stroke: ds)
  line(p(350, 95), p(145, 400), stroke: ds)
  dot(98, 460)
  arr((98, 462), (97, 632))
  m(380, 125, $O$); m(384, 530, $C$); m(350, 752, $G$)
  m(122, 455, $C$); m(90, 687, $G$); m(230, 805, [（$a$）])
  // ---- (b)
  line(p(725, 650), p(1020, 650), stroke: 1.6pt)
  hatch(745, 1010, 712, 60)
  line(p(863, 650), p(863, 440), stroke: dd)
  arr((857, 205), (860, 440))
  circle(p(855, 203), radius: 75 * u, stroke: 0.9pt)
  dot(855, 203)
  circle(p(1108, 278), radius: 78 * u, stroke: ds)
  line(p(868, 645), p(1062, 345), stroke: ds)
  line(p(880, 645), p(1072, 347), stroke: ds)
  dot(1106, 282)
  arr((1108, 285), (1108, 442))
  m(828, 615, $O$); m(890, 198, $C$); m(888, 370, $G$)
  m(1146, 278, $C$); m(1113, 488, $G$); m(878, 800, [（$b$）])
  // ---- (c)
  line(p(1507, 110), p(1507, 350), stroke: 0.8pt)
  line(p(1520, 110), p(1520, 350), stroke: 0.8pt)
  circle(p(1510, 440), radius: 90 * u, stroke: 0.9pt)
  line(p(1295, 655), p(1705, 245), stroke: 1.6pt, mark: (end: "stealth", fill: black, scale: 0.55))
  dot(1510, 437)
  circle(p(1885, 440), radius: 90 * u, stroke: ds)
  line(p(1650, 668), p(2090, 240), stroke: 1.6pt, mark: (end: "stealth", fill: black, scale: 0.55))
  line(p(1970, 405), p(2182, 330), stroke: ds)
  line(p(1975, 392), p(2186, 321), stroke: ds)
  dot(1885, 437)
  m(1492, 405, $C$); m(1542, 463, $O$); m(1876, 398, $C$); m(1913, 466, $O$)
  m(1660, 790, [（$c$）])
})
