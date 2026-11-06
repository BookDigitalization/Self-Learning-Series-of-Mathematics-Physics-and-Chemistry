// 图 1·6 眼睛的位置：左（a）眼睛位置正确，右（b）不对
// 木块、直尺、眼睛是写实插画，沿用原扫描裁剪（fig1-6a.png、fig1-6b.png，已涂去直尺上的数字）；数字 0、1、2、3 用 CeTZ 补回。
// 坐标是各 PNG 的像素坐标（y 向下）。
#import "/common/series.typ": *

#let fig-1-6a(width: 3.4cm) = px-canvas(652, 786, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1-6a.png", width: 652 * u))
  for (n, x) in ((0, 70), (1, 236), (2, 400), (3, 565)) {
    content(p(x, 706), anchor: "center", text(size: 8pt, str(n)))
  }
})

#let fig-1-6b(width: 3.6cm) = px-canvas(683, 786, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1-6b.png", width: 683 * u))
  for (n, x) in ((0, 78), (1, 246), (2, 414), (3, 577)) {
    content(p(x, 708), anchor: "center", text(size: 8pt, str(n)))
  }
})
