// 图 6·35 用户变压器与高音喇叭的接线
// 变压器与导线用 CeTZ 重绘；高音喇叭和链状软线为写实插画，沿用原扫描裁剪（fig6b-35.png，400 dpi，来源 原书 p.334，
// 裁剪框 200 dpi 页面像素 1050,1835–1250,2015）。坐标取自 200 dpi 页面像素。
#import "/common/series.typ": *
#import "fig6b-parts.typ": *

#let fig-6-35(width: 4.6cm) = px-canvas(320, 480, origin: (1030, 1570), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 7.5pt, weight: "medium", body))
  // 线路
  line(p(1034, 1591), p(1322, 1591), stroke: 1.6pt)
  line(p(1034, 1656), p(1322, 1656), stroke: 1.6pt)
  node(p, 1178, 1591, r: 4); node(p, 1264, 1656, r: 4)
  // 虚线框
  rect(p(1145, 1705), p(1303, 1816), stroke: (thickness: 0.8pt, dash: "dashed"))
  lab(1090, 1762, [用户变压器])
  // 原线圈
  wire(p, (1178, 1591), (1178, 1745), (1190, 1745))
  coil-h(p, 1190, 1745, 3, r: 9)
  wire(p, (1244, 1745), (1264, 1745), (1264, 1656))
  // 铁心
  line(p(1184, 1762), p(1270, 1762), stroke: 0.9pt); line(p(1184, 1767), p(1270, 1767), stroke: 0.9pt)
  // 副线圈
  wire(p, (1184, 1790), (1190, 1790))
  coil-h(p, 1190, 1790, 3, r: 9)
  wire(p, (1244, 1790), (1264, 1790))
  wire(p, (1184, 1790), (1184, 1812))
  wire(p, (1264, 1790), (1264, 1812))
  bezier(p(1184, 1812), p(1224, 1850), p(1184, 1832), p(1210, 1842), stroke: lw)
  bezier(p(1264, 1812), p(1224, 1850), p(1264, 1832), p(1238, 1842), stroke: lw)
  content(p(1050, 1835), anchor: "north-west", image("fig6b-35.png", width: 200 * u))
  lab(1092, 2041, [高音喇叭])
})
