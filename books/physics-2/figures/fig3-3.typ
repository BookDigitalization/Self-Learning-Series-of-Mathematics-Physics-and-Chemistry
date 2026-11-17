// 图 3·3 观察固体热膨胀的装置（原书 p.75）
// 写实插画沿用原扫描裁剪，已涂去“铁棒”“小针”“纸条”，用 CeTZ 补回。
#import "/common/series.typ": *

#let fig-3-3(width: 8cm) = px-canvas(668, 353, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3-3.png", width: 668 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  lab(225, 54, [铁棒])
  lab(626, 88, [小针])
  lab(423, 324, [纸条])
})

