// 图 15·2 河面上漂浮的树叶（原书 p.493）
// 河岸、流线是写实/手绘线条，沿用原扫描裁剪（fig15-2.png，已涂去字母）；M N M' N' a b c d e m 及 v_a 等用文字补回。
// 坐标是 fig15-2.png 的像素坐标（1493×1045，y 向下）。
// 近似：原图字母扫描很糊，v_e、v_m 的位置与指向按字形推断，见 checklist/figtext-ch15.md。
#import "/common/series.typ": *

#let fig-15-2(width: 8.6cm) = px-canvas(1493, 1045, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig15-2.png", width: 1493 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  lab(72, 247, $M$)
  lab(25, 398, $M'$)
  lab(1275, 232, $N$)
  lab(1400, 385, $N'$)
  lab(195, 398, $a$)
  lab(318, 390, $v_a$)
  lab(387, 538, $b$)
  lab(432, 732, $v_b$)
  lab(600, 690, $c$)
  lab(705, 843, $v_c$)
  lab(1028, 510, $d$)
  lab(1160, 465, $v_d$)
  lab(868, 645, $e$)
  lab(1035, 660, $v_e$)
  lab(755, 714, $m$)
  lab(955, 742, $v_m$)
})
