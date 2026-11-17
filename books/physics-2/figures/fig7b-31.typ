// 图 7·31 毛发湿度计（原书 p.276）
// 写实插画沿用原扫描裁剪（fig7b-31.png，已涂去“头发”和温度计刻度数字，用真文字补回）。
// 温度计刻度数字原书印作 50 40 30 20 10 0 10 20（零下两个没有负号，照录）。
// 坐标是 fig7b-31.png 的像素坐标（347×901，y 向下）。
#import "/common/series.typ": *

#let fig-7-31(width: 3.4cm) = px-canvas(347, 901, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig7b-31.png", width: 347 * u))
  content(p(112, 408), anchor: "center", text(size: 28 * u)[头发])
  for (n, y) in ((50, 208), (40, 240), (30, 275), (20, 312), (10, 348), (0, 385), (10, 421), (20, 458)) {
    content(p(279, y), anchor: "west", text(size: 26 * u, str(n)))
  }
})
