// 图 1·11 体积的单位（原书 p.9）
// 立方体网格是写实透视图，沿用原扫描裁剪（fig1-11.png，已涂去文字和尺寸线）；尺寸线、文字标注用 CeTZ 补回。
// 坐标是 fig1-11.png 的像素坐标（960×1082，y 向下）。
#import "/common/series.typ": *

#let fig-1-11(width: 8.6cm) = px-canvas(960, 1082, width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center",
    box(fill: white, inset: (x: 1pt), text(font: fonts.hei, size: 8pt, weight: "medium", body)))
  content(p(0, 0), anchor: "north-west", image("fig1-11.png", width: 960 * u))
  let arr = (fill: black, scale: 0.35)
  lab(341, 501, [1 厘米#super[3]])
  lab(843, 736, [1 毫米#super[3]])

  // 1 厘米：立方体一条边
  line(p(22, 870), p(22, 945), stroke: 0.6pt)
  line(p(612, 870), p(612, 945), stroke: 0.6pt)
  line(p(22, 922), p(612, 922), stroke: 0.8pt, mark: (start: "stealth", end: "stealth") + arr)
  lab(330, 922, [1 厘米])

  // 1 毫米：放大的小立方体的边
  line(p(795, 880), p(795, 940), stroke: 0.6pt)
  line(p(850, 880), p(850, 940), stroke: 0.6pt)
  line(p(715, 927), p(794, 927), stroke: 0.8pt, mark: (end: "stealth") + arr)
  line(p(930, 927), p(851, 927), stroke: 0.8pt, mark: (end: "stealth") + arr)
  lab(822, 985, [1 毫米])

  lab(459, 1035, [1 厘米#super[3] = 1000 毫米#super[3]])
})
