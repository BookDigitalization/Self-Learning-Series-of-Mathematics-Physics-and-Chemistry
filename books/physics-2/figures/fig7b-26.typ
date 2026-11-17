// 图 7·26 乙醚临界状态（p.264）
// 写实插画沿用原扫描裁剪（fig7b-26.png，二值化，已涂去标注（a）～（e），用真文字补回）。
// 坐标是 fig7b-26.png 的像素坐标（636×521，y 向下）。
#import "/common/series.typ": *

#let fig-7-26(width: 7.5cm) = px-canvas(636, 521, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig7b-26.png", width: 636 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 30 * u, body))
  lab(68, 488, [($a$)])
  lab(200, 488, [($b$)])
  lab(328, 488, [($c$)])
  lab(455, 488, [($d$)])
  lab(582, 488, [($e$)])
})
