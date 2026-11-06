// 图 1·9 面积的单位（原书 p.7）
// 方格图，按原图重绘。坐标是 render-pages.py --dpi 200 显示图（宽 1568）上的像素坐标。
// 原图方格为手绘，这里按 10×10 等距方格重绘；原图里 1 厘米² 的标注线横穿方格，右下角一格放大成 1 毫米²。
#import "/common/series.typ": *

#let fig-1-9(width: 8.6cm) = px-canvas(570, 520, origin: (845, 850), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, anchor: "center") = content(p(x, y), anchor: anchor,
    text(font: fonts.hei, size: 8pt, weight: "medium", body))
  let (x0, x1, y0, y1) = (850, 1253, 865, 1278)
  let dx = (x1 - x0) / 10
  let dy = (y1 - y0) / 10

  // 10×10 方格
  for k in range(0, 11) {
    line(p(x0 + k * dx, y0), p(x0 + k * dx, y1), stroke: 1pt)
    line(p(x0, y0 + k * dy), p(x1, y0 + k * dy), stroke: 1pt)
  }
  // 右下角一格（1 毫米²）：画细密网格表示
  let (cx, cy) = (x1 - dx, y1 - dy)
  rect(p(cx, cy), p(x1, y1), fill: luma(30), stroke: none)
  for k in range(1, 5) {
    line(p(cx + k * dx / 5, cy), p(cx + k * dx / 5, y1), stroke: 0.4pt + white)
    line(p(cx, cy + k * dy / 5), p(x1, cy + k * dy / 5), stroke: 0.4pt + white)
  }

  // 1 厘米²：横穿方格的标注线
  line(p(935, 1070), p(1085, 1070), stroke: 0.8pt)
  content(p(1010, 1070), anchor: "center", box(fill: white, inset: (x: 1pt), text(font: fonts.hei, size: 8pt, weight: "medium", [1 厘米#super[2]])))

  // 放大的 1 毫米²：黑方块 + 箭头 + 尺寸线
  line(p(1265, 1247), p(1303, 1247), stroke: 1pt, mark: (end: "stealth", fill: black, scale: 0.4))
  rect(p(1312, 1226), p(1358, 1272), fill: black, stroke: none)
  lab(1330, 1202, [1 毫米#super[2]])
  line(p(1270, 1308), p(1311, 1308), stroke: 0.8pt, mark: (end: "stealth", fill: black, scale: 0.35))
  line(p(1398, 1308), p(1359, 1308), stroke: 0.8pt, mark: (end: "stealth", fill: black, scale: 0.35))
  line(p(1312, 1280), p(1312, 1318), stroke: 0.6pt)
  line(p(1358, 1280), p(1358, 1318), stroke: 0.6pt)
  lab(1336, 1337, [1 毫米])

  // 1 厘米 尺寸线
  line(p(860, 1316), p(1253, 1316), stroke: 0.8pt, mark: (start: "stealth", end: "stealth", fill: black, scale: 0.35))
  line(p(1253, 1280), p(1253, 1326), stroke: 0.6pt)
  content(p(1056, 1316), anchor: "center", box(fill: white, inset: (x: 2pt), text(font: fonts.hei, size: 8pt, weight: "medium", [1 厘米])))
  lab(1150, 1358, [1 厘米#super[2] = 100 毫米#super[2]])
})
