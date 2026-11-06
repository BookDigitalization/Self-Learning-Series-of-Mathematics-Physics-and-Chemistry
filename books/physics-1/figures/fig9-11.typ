// 图 9·11 两臂的夹角与拉力（原书 p.246）
// 写实插画，沿用原扫描裁剪（fig9-11.png，已涂去下方三行汉字标注）；文字用 CeTZ 补回。
// 坐标是 fig9-11.png 的像素坐标（1706×885）。
#import "/common/series.typ": *

#let fig-9-11(width: 11cm) = px-canvas(1706, 885, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig9-11.png", width: 1706 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 10pt, body))
  lab(300, 737, [两臂平行])
  lab(700, 737, [两臂成 90°])
  lab(1262, 733, [两臂成 120°])
})
