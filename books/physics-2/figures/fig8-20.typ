// 图 8·20（原书 p.300）
// 写实/复杂机器图沿用原扫描裁剪的 fig8-20.png（页坐标 240,165–910,885，200 dpi 网格），图中文字、编号已涂去，用 CeTZ 真文字补回。
#import "/common/series.typ": *

#let fig-8-20(width: 10cm) = px-canvas(670, 720, width: width, origin: (240, 165), (p, u) => {
  import cetz.draw: *
  content(p(240, 165), anchor: "north-west", image("fig8-20.png", width: 670 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 7.5pt, body))
  lab(373, 183, [进汽管])
  lab(402, 211, [汽室])
  lab(281, 243, [滑动阀])
  lab(472, 225, [阀杆])
  lab(567, 224, [活动接头])
  lab(660, 244, [偏心轮杆])
  lab(735, 212, [偏心轮])
  lab(832, 212, [偏心轮套])
  lab(500, 291, [活塞杆])
  lab(599, 282, [十字头])
  lab(664, 321, [连杆])
  lab(874, 291, [曲柄])
  lab(865, 347, [飞轮])
  lab(455, 322, [汽缸])
  lab(453, 349, [活塞])
  lab(283, 326, $(a)$)
  lab(286, 489, $(b)$)
  lab(291, 656, $(c)$)
  lab(294, 825, $(d)$)
})
