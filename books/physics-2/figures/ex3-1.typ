// 习题 3·1 附图（原书 p.77、78）：第 2、7、11 题；第 10 题无标注，直接用位图 ex3-1-10.png。
// 写实插画沿用原扫描裁剪，标注用 CeTZ 补回。
#import "/common/series.typ": *

#let fig-ex-3-1-2(width: 5.6cm) = px-canvas(510, 405, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("ex3-1-2.png", width: 510 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  lab(417, 201, [玻璃杯])
  lab(476, 240, [冷水])
})

#let fig-ex-3-1-7(width: 6.3cm) = px-canvas(578, 361, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("ex3-1-7.png", width: 578 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  lab(488, 51, [小针])
  lab(333, 244, [大针])
})

#let fig-ex-3-1-11(width: 6.8cm) = px-canvas(630, 443, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("ex3-1-11.png", width: 630 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  lab(68, 105, [漏斗])
  lab(538, 75, [压强计])
  lab(315, 240, [冷水])
})

