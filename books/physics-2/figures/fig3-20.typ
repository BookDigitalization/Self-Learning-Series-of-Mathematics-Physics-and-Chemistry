// 图 3·20 冬季深水池中水的温度分布（原书 p.106）
// 写实插画沿用原扫描裁剪，已涂去“冰”和 0°～4°，用 CeTZ 补回。
#import "/common/series.typ": *

#let fig-3-20(width: 10cm) = px-canvas(961, 548, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3-20.png", width: 961 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  lab(542, 231, [冰])
  lab(542, 286, [0°])
  lab(542, 321, [1°])
  lab(542, 357, [2°])
  lab(542, 392, [3°])
  lab(542, 424, [4°])
  lab(542, 460, [4°])
})

