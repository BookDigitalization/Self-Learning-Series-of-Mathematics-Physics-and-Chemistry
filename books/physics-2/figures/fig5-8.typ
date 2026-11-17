// 图 5·8 表面张力系数的测定（原书 p.163）
// 写实装置图沿用原扫描裁剪（fig5-8.png，660×770，已涂去文字）；标注用真文字补回。
// 换算：(x-595)×2, (y-935)×2。
#import "/common/series.typ": *

#let fig-5-8(width: 6.6cm) = px-canvas(660, 770, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig5-8.png", width: 660 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  lab(203, 69, $l$)
  lab(110, 242, [金属丝])
  lab(335, 283, [灵敏弹簧])
  lab(335, 332, [测力计])
  lab(335, 510, [金属丝])
})
