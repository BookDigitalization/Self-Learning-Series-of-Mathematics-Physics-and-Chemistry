// 图 6·7 滑动轴承（原书 p.172）
// 写实插画沿用原扫描裁剪（fig6-7.png，已涂去标注文字），标注“油孔、轴、轴承座、轴瓦”和（a）（b）用文字补回。
// 坐标是 fig6-7.png 的像素坐标（1631×683），画布下方多留 60 像素放（a）（b）。
#import "/common/series.typ": *

#let fig-6-7(width: 11cm) = px-canvas(1631, 743, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig6-7.png", width: 1631 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center",
    text(font: fonts.kai, size: 8pt, body))
  lab(622, 64, [油孔])
  lab(1151, 49, [轴])
  lab(113, 245, [轴承座])
  lab(752, 469, [轴瓦])
  lab(390, 715, text(size: 9pt, $(a)$))
  lab(1236, 715, text(size: 9pt, $(b)$))
})
