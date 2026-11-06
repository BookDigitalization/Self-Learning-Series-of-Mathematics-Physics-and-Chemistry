// 图 15·15 不同形状的物体受到阻力的比例（原书 p.506）
// 物体是写实插画，沿用原扫描裁剪（fig15-15.png，已涂去下方标注）。
// 每个物体下方原有一个很小的数字标注（约 1 毫米高，倒置/旋转，扫描里糊掉），
// 内容由项目负责人确认：从左到右 1/25、1/5、1/2～1/4、1（分数，表示受到的阻力相对大小）。
// 坐标是 fig15-15.png 的像素坐标（1418×822，y 向下）。
#import "/common/series.typ": *

#let fig-15-15(width: 8.6cm) = px-canvas(1418, 822, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig15-15.png", width: 1418 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  lab(140, 728, [1/25])
  lab(512, 490, [1/5])
  lab(865, 490, [1/2])
  lab(865, 551, [～])
  lab(865, 612, [1/4])
  lab(1230, 478, [1])
})
