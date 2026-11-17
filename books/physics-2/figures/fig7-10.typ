// 图 7·10 研究液体饱和汽压的装置（原书 p.237）
// 玻璃管、水银是写实插画，沿用原扫描裁剪（fig7-10.png，已涂去文字标注）；乙醚、真空、未饱和汽、饱和汽、
// 76 厘米、S、(a)(b)(c) 用 CeTZ 补回；(c) 管左壁被涂掉的一段（y 240–303）重画。
// 坐标是 fig7-10.png 的像素坐标（710×1220，y 向下）。
#import "/common/series.typ": *

#let fig-7-10(width: 5.8cm) = px-canvas(710, 1220, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig7-10.png", width: 710 * u))
  line(p(520, 238), p(520, 305), stroke: 0.9pt)
  let tx(x, y, body) = content(p(x, y), anchor: "center", text(size: 8pt, body))
  tx(342, 44, [乙醚])
  tx(186, 264, [真空])
  tx(440, 272, [未饱和汽])
  tx(620, 272, [饱和汽])
  tx(162, 150, [$S$])
  tx(376, 150, [$S$])
  tx(580, 154, [$S$])
  tx(162, 1180, [（$a$）])
  tx(386, 1184, [（$b$）])
  tx(584, 1188, [（$c$）])
  content(p(50, 500), anchor: "center", std.rotate(-90deg, text(size: 8pt, [76 厘米])))
})
