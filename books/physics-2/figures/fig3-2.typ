// 图 3·2 不同液体热膨胀的比较（原书 p.75）
// 写实插画沿用原扫描裁剪（fig3-2.png，已涂去“水”“煤油”），文字用 CeTZ 补回。坐标是 png 的像素坐标。
#import "/common/series.typ": *

#let fig-3-2(width: 4.6cm) = px-canvas(390, 810, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3-2.png", width: 390 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  lab(56, 392, [水])
  lab(332, 381, [煤油])
})

