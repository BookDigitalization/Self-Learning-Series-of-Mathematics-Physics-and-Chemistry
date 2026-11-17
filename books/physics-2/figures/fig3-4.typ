// 图 3·4 双金属片的膨胀（原书 p.76）
// 写实插画沿用原扫描裁剪，已涂去“铁”“铜”和 (a)(b)，用 CeTZ 补回。
#import "/common/series.typ": *

#let fig-3-4(width: 12.5cm) = px-canvas(1163, 468, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3-4.png", width: 1163 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  lab(387, 134, [铁])
  lab(476, 188, [铜])
  lab(836, 156, [铁])
  lab(804, 219, [铜])
  lab(314, 444, [$(a)$])
  lab(909, 436, [$(b)$])
})

