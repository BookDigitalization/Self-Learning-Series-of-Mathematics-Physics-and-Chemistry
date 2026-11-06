// 习题 2·4 第 8 题附图：橡皮筋测力计（原书 p.37）
// 实物是写实插画，沿用原扫描裁剪（ex2-4-8.png，已涂去文字）；"橡皮筋""回形针""铁丝"和刻度数字用 CeTZ 补回。
// 坐标是 ex2-4-8.png 的像素坐标（577×981）。换算：原页显示图 (1050,110) 起，×2.1314。
#import "/common/series.typ": *

#let fig-ex-2-4-8(width: 2.6cm) = px-canvas(577, 981, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("ex2-4-8.png", width: 577 * u))
  let d(x, y) = ((x - 1050) * 2.1314, (y - 110) * 2.1314)
  let lab(x, y, body) = content(p(..d(x, y)), anchor: "center",
    text(font: fonts.hei, size: 7.5pt, weight: "medium", stack(dir: ttb, spacing: 0.1em, ..body.map(c => [#c]))))
  lab(1296, 195, ("橡", "皮", "筋"))
  lab(1073, 380, ("回", "形", "针"))
  lab(1300, 505, ("铁", "丝"))
  let num(x, y, body) = content(p(..d(x, y)), anchor: "center", text(size: 8pt, body))
  num(1234, 276, [0]); num(1229, 334, [100]); num(1229, 399, [200]); num(1231, 462, [300])
})
