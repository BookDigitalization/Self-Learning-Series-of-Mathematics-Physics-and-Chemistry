// 图 8·1 手拉弹簧（原书 p.212）
// 写实插画沿用原扫描裁剪（fig8-1.png，已涂去两处标注）；标注用文字补回。
// 坐标是 fig8-1.png 的像素坐标（1664×1045）：(显示图 x-540)×2.1314，(y-1395)×2.1314。
#import "/common/series.typ": *

#let fig-8-1(width: 11cm) = px-canvas(1664, 1045, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig8-1.png", width: 1664 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center",
    text(font: fonts.hei, size: 8pt, weight: "medium", body))
  lab(1247, 411, [手拉弹簧的力（作用在弹簧上）])
  lab(761, 697, [弹簧拉手的力（作用在手上）])
})
