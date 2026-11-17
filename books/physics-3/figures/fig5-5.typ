// 图 5·5 二极交流发电机的示意图（原书 p.262）
// 位图沿用原扫描裁剪（fig5-5.png，已涂去文字）；文字用真文字补回。标注坐标为原书页面 200 dpi 网格坐标。
#import "fig5-lib.typ": *
#let fig-5-5(width: 7.2cm) = bitfig("fig5-5.png", (795, 1502, 1347, 2106), (
  (1074, 1538, $S$),
  (1078, 2019, $N$),
  (1310, 2075, text(font: fonts.hei, size: 8pt)[直流电源]),
), width: width, size: 9pt)
