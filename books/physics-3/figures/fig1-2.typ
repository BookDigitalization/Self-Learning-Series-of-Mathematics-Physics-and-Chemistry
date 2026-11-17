// 图 1·2 同种电相斥（原书 p.3）
// 写实插画沿用原扫描裁剪的 fig1-2.png（1355×817），已涂去两个“－”号，用 CeTZ 补回。
#import "/common/series.typ": *

#let fig-1-2(width: 8cm) = px-canvas(1355, 817, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig1-2.png", width: 1355 * u))
  content(p(892, 370), anchor: "center", text(size: 10pt, [$-$]))
  content(p(990, 432), anchor: "center", text(size: 10pt, [$-$]))
})
