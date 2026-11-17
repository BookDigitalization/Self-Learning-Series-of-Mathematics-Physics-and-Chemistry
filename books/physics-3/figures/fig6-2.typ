// 图 6·2 电磁振荡的过程（原书 p.306）
// 写实插画（手、线圈、弹簧）沿用原扫描裁剪（fig6-2.png，已涂去 (a)–(g) 和极板上的 ＋、－）；文字用真文字补回。
// 坐标为 150 dpi 页面像素坐标，裁剪区 (225,190)–(985,1265)。
#import "/common/series.typ": *

#let fig-6-2(width: 10cm) = px-canvas(760, 1075, origin: (225, 190), width: width, (p, u) => {
  import cetz.draw: *
  content(p(225, 190), anchor: "north-west", image("fig6-2.png", width: 760 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  for (y, l) in ((313, $a$), (461, $b$), (598, $c$), (745, $d$), (886, $e$), (1033, $f$), (1168, $g$)) {
    lab(583, y, [(#l)])
  }
  lab(432, 435, [+]); lab(432, 493, [−])
  lab(436, 716, [−]); lab(436, 775, [+])
  lab(438, 997, [+]); lab(438, 1058, [−])
})
