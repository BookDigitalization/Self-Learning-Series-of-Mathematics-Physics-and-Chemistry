// 图 3·5 液体和固体膨胀的比较（原书 p.77）
// 写实插画沿用原扫描裁剪，已涂去 (a)(b)(c)，用 CeTZ 补回。
#import "/common/series.typ": *

#let fig-3-5(width: 12cm) = px-canvas(1080, 713, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3-5.png", width: 1080 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  lab(213, 690, [$(a)$])
  lab(574, 686, [$(b)$])
  lab(914, 686, [$(c)$])
})

