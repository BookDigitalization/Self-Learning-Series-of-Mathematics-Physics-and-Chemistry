// 图 2·8 弹簧秤（原书 p.34）
// 弹簧秤是写实插画，沿用原扫描裁剪（fig2-8.png，已涂去刻度数字和"指标""弹簧"）；这些文字用 CeTZ 补回。
// 坐标是 fig2-8.png 的像素坐标（1632×1728）。换算：原页显示图 (485,1040) 起，×2.1314。
#import "/common/series.typ": *

#let fig-2-8(width: 11cm) = px-canvas(1632, 1728, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig2-8.png", width: 1632 * u))
  let d(x, y) = ((x - 485) * 2.1314, (y - 1040) * 2.1314)
  let lab(x, y, body) = content(p(..d(x, y)), anchor: "center", text(font: fonts.hei, size: 8pt, weight: "medium", body))
  let num(x, y, body) = content(p(..d(x, y)), anchor: "center", text(size: 8.5pt, body))
  // 左：拉着
  num(620, 1177, [0]); num(612, 1270, [100]); num(612, 1365, [200]); num(612, 1460, [300])
  lab(677, 1240, [指标])
  // 中：弹簧与指标
  lab(768, 1157, [弹簧]); lab(907, 1177, [指标])
  // 右：挂着重物
  num(1122, 1177, [0]); num(1110, 1277, [100]); num(1112, 1366, [200]); num(1112, 1464, [300])
  lab(1172, 1206, [指标])
})
