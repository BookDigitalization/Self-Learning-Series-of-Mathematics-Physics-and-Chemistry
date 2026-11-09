#import "/common/series.typ": *
// 图 5·6：原书 p.201。在正方形木板的相邻两边上截取另一个正方形（斜线部分），l1、l2 为两个正方形的边长。
// 坐标是 110 dpi 预览图上的近似像素坐标（y 向下）。
#let fig-5-6(width: 4.6cm) = px-canvas(310, 350, width: width, (p, u) => {
  import cetz.draw: *
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 8pt, body))
  let hatch = tiling(size: (3.2pt, 3.2pt))[#place(std.line(start: (0%, 100%), end: (100%, 0%), stroke: 0.4pt))]
  rect(p(5, 5), p(305, 305), stroke: 1.2pt)
  rect(p(5, 80), p(232, 305), stroke: 1pt, fill: hatch)
  let dim(x0, x1, y, lab) = {
    line(p(x0, y), p(x1, y), stroke: 0.5pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.35))
    line(p(x0, y - 4), p(x0, y + 4), stroke: 0.5pt)
    line(p(x1, y - 4), p(x1, y + 4), stroke: 0.5pt)
    content(p((x0 + x1) / 2, y), text(font: fonts.song, size: 8pt, lab), fill: white, frame: "rect", stroke: none, padding: 1pt)
  }
  dim(5, 232, 322, $l_2$)
  dim(5, 305, 338, $l_1$)
})

