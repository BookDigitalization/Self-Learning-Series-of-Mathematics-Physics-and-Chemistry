#import "/common/series.typ": *
// 复习题五第 10 题插图：原书 p.212。窗户，上面是半圆形，下面是长方形，宽 3.4 尺、高 4.8 尺。近似像素坐标。
#let fig-window(width: 3.8cm) = px-canvas(190, 300, width: width, (p, u) => {
  import cetz.draw: *
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 8pt, body))
  let arr = (start: "stealth", end: "stealth", fill: black, scale: 0.35)
  // 外框：长方形加上面的半圆
  let outline(x0, x1, ytop, ybot, r) = {
    line(p(x0, ybot), p(x0, ytop), stroke: 1.1pt)
    line(p(x1, ybot), p(x1, ytop), stroke: 1.1pt)
    line(p(x0, ybot), p(x1, ybot), stroke: 1.1pt)
    arc(p(x1, ytop), start: 0deg, stop: 180deg, radius: r * u, stroke: 1.1pt)
  }
  outline(5, 175, 90, 270, 85)
  outline(11, 169, 90, 264, 79)
  // 半圆里的小半圆和三根放射木条
  arc(p(115, 90), start: 0deg, stop: 180deg, radius: 20 * u, stroke: 1pt)
  arc(p(119, 90), start: 0deg, stop: 180deg, radius: 24 * u, stroke: 1pt)
  line(p(90, 66), p(90, 14), stroke: 0.9pt)
  line(p(84, 66), p(84, 14), stroke: 0.9pt)
  line(p(70, 70), p(37, 33), stroke: 0.9pt)
  line(p(64, 74), p(31, 37), stroke: 0.9pt)
  line(p(110, 70), p(143, 33), stroke: 0.9pt)
  line(p(116, 74), p(149, 37), stroke: 0.9pt)
  // 六块玻璃
  for (xa, xb) in ((20, 86), (94, 160)) {
    for (ya, yb) in ((96, 148), (156, 208), (216, 260)) {
      rect(p(xa, yb), p(xb, ya), stroke: 0.9pt)
    }
  }
  // 尺寸
  line(p(185, 90), p(185, 270), stroke: 0.5pt, mark: arr)
  content(p(185, 180), text(font: fonts.song, size: 8pt, [4.8 尺]), fill: white, frame: "rect", stroke: none, padding: 1pt, angle: 90deg)
  line(p(5, 288), p(175, 288), stroke: 0.5pt, mark: arr)
  content(p(90, 288), text(font: fonts.song, size: 8pt, [3.4 尺]), fill: white, frame: "rect", stroke: none, padding: 1pt)
})


