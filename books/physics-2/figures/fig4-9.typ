// 图 4·9（原书 p.144）炮上所用的复座装置：上部为空气，下部为油，右端活塞杆受炮反冲向左推。
// 示意图，按原图重绘（剖面线用斜线填充，油的细横线为示意）。坐标取 200 dpi 页面像素。
#import "/common/series.typ": *

#let fig-4-9(width: 7cm) = px-canvas(400, 220, origin: (150, 1100), width: width, (p, u) => {
  import cetz.draw: *
  let hatch = tiling(size: (2.6pt, 2.6pt))[#place(std.line(start: (0%, 100%), end: (100%, 0%), stroke: 0.45pt))]
  let blk(x0, y0, x1, y1) = rect(p(x0, y0), p(x1, y1), stroke: 0.8pt, fill: hatch)
  // 壳体
  blk(161, 1126, 471, 1138)
  blk(161, 1126, 173, 1289)
  blk(161, 1277, 471, 1289)
  blk(459, 1126, 471, 1289)
  blk(471, 1231, 490, 1262)
  // 隔板（中间有一个小孔）
  blk(161, 1203, 221, 1215)
  blk(267, 1203, 459, 1215)
  // 活塞与活塞杆
  blk(407, 1220, 423, 1282)
  rect(p(423, 1247), p(525, 1257), stroke: 0.8pt, fill: hatch)
  // 反冲方向
  line(p(534, 1235), p(496, 1235), stroke: 0.8pt, mark: (end: "stealth", fill: black, scale: 0.4))
  // 上部液面（空气与油的分界）与下部的油
  for y in (1184, 1190) {
    line(p(173, y), p(459, y), stroke: 0.5pt)
  }
  for (y, x0, x1) in ((1228, 180, 330), (1238, 190, 260), (1246, 250, 390), (1256, 180, 320), (1266, 200, 380), (1272, 260, 360)) {
    line(p(x0, y), p(x1, y), stroke: (thickness: 0.4pt, dash: (6pt, 3pt)))
  }
  content(p(340, 1117), text(size: 9pt)[空气])
  content(p(287, 1303), text(size: 9pt)[油])
  line(p(285, 1278), p(289, 1294), stroke: 0.4pt)
})
