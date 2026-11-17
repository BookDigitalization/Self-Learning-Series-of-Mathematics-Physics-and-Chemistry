// 图 2·42 伏打电池（原书 p.152）：写实插画，沿用原扫描裁剪（fig2c-42.png，640×830，已涂去字母）；标注用文字补回。
// 坐标是 fig2c-42.png 的像素坐标。
#import "/common/series.typ": *

#let fig-2-42(width: 4.3cm) = px-canvas(640, 830, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2c-42.png", width: 640 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  lab(312, 72, $I$)
  lab(194, 254, $"Cu"$)
  lab(60, 246, $+$)
  lab(494, 182, $-$)
  lab(554, 284, $"Zn"$)
  lab(290, 636, $"H"_2 "SO"_4$)
})
