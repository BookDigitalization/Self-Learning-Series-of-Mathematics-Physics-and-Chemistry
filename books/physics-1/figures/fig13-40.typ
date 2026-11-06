// 图 13·40 交叉皮带传动（原书 p.464）
// 写实插画，保留原扫描裁剪（fig13-40.png，已涂去字母 v，用 CeTZ 补回）；图上的转向小箭头留在位图里。
// 坐标是页面显示图（宽 1568）上的像素坐标；位置为目测。
#import "/common/series.typ": *

#let fig-13-40(width: 7.4cm) = px-canvas(610, 335, origin: (735, 1495), width: width, (p, u) => {
  import cetz.draw: *
  content(p(735, 1495), anchor: "north-west", image("fig13-40.png", width: 610 * u))
  content(p(1017, 1713), anchor: "center", text(size: 9pt, $v$))
})
