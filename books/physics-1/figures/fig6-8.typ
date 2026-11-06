// 图 6·8 滚动轴承（原书 p.172）
// 写实插画沿用原扫描裁剪（fig6-8.png，已涂去标注文字），标注“外圈、钢珠、内圈、钢柱、轴”和（a）（b）用文字补回。
// 坐标是 fig6-8.png 的像素坐标（1749×751），画布下方多留 60 像素放（a）（b）。
// “钢珠”“钢柱”两处原标注较模糊，按正文（p.171“钢珠或钢柱”）读作钢珠、钢柱，已核对。
#import "/common/series.typ": *

#let fig-6-8(width: 12cm) = px-canvas(1749, 811, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig6-8.png", width: 1749 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center",
    text(font: fonts.kai, size: 8pt, body))
  lab(128, 43, [外圈])
  lab(100, 136, [钢珠])
  lab(58, 298, [内圈])
  lab(912, 121, [钢柱])
  lab(1166, 111, [轴])
  lab(503, 785, text(size: 9pt, $(a)$))
  lab(1343, 785, text(size: 9pt, $(b)$))
})
