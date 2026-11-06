// 图 9·3 三个共点力的平衡（原书 p.241）
// 写实插画，沿用原扫描裁剪（fig9-3.png，已涂去字母）；字母用 CeTZ 补回。
// 坐标是 fig9-3.png 的像素坐标（2207×1205）。
#import "/common/series.typ": *

#let fig-9-3(width: 13cm) = px-canvas(2207, 1205, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig9-3.png", width: 2207 * u))
  let m(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  // 左：皮球
  m(207, 375, $T$); m(493, 785, $N$); m(192, 828, $O$); m(215, 1112, $G$)
  // 中：电灯
  m(858, 268, $T_1$); m(1112, 435, $T_2$); m(825, 512, $A$); m(883, 1135, $G$)
  // 右：梯子
  m(1822, 222, $N$); m(1912, 230, $A$); m(1945, 415, $F$); m(1887, 1090, $G$)
})
