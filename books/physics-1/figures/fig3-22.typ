// 图 3·22 地面空气比重大（原书 p.65）
// 写实插画（点状表示空气疏密），沿用原扫描裁剪（已涂去“大气”“地球”），文字用 CeTZ 补回。
// 坐标是 fig3-22.png 的像素坐标（1056×939）；原页显示图 (420,1320) 起，×2.1314。
#import "/common/series.typ": *

#let fig-3-22(width: 7cm) = px-canvas(1056, 939, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3-22.png", width: 1056 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 8pt, weight: "medium", body))
  lab(273, 320, [大])
  lab(682, 320, [气])
  lab(469, 884, [地球])
})
