// 图 13·28 自行车转弯（原书 p.449）
// 人和自行车是写实插画，用原扫描裁剪（fig13-28.png，已涂去字母 Q、F、α、θ、G，用 CeTZ 补回；
// 图上的受力线、虚线平行四边形保留在位图里）。坐标是页面显示图（宽 1568）上的像素坐标，位置为目测。
// 原图中间的角标注（扫描里像“α”）与左下角 θ 较模糊：按 θ 录左下角，中间的角录作 α，见待核对记录。
#import "/common/series.typ": *

#let fig-13-28(width: 5.6cm) = px-canvas(400, 640, origin: (1035, 175), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  content(p(1035, 175), anchor: "north-west", image("fig13-28.png", width: 375 * u))
  lab(1362, 195, $Q$)
  lab(1378, 433, $F$)
  lab(1141, 665, $theta$)
  lab(1288, 590, $alpha$)
  lab(1270, 695, $G$)
})
