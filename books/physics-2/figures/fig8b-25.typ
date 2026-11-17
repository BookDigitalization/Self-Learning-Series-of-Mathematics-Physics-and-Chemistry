// 图 8·25（原书 p.314）：写实图沿用原扫描裁剪的二值化位图（fig8b-25.png，已涂去标号、文字），标号和文字用真文字补回。
// 坐标为 200 dpi 原书页面像素坐标（左上原点），画布原点在页面 (255, 170)。
#import "/common/series.typ": *

#let fig-8-25(width: 9.7cm) = px-canvas(585, 785, origin: (255, 170), width: width, (p, u) => {
  import cetz.draw: *
  content(p(255, 170), anchor: "north-west", image("fig8b-25.png", width: 585 * u))
  let lab(x, y, body, fill: black) = content(p(x, y), anchor: "center", text(size: 8pt, font: fonts.hei, fill: fill, body))
  lab(628, 215, [14])
  lab(287, 291, [15])
  lab(426, 373, [16])
  lab(508, 298, [3])
  lab(424, 426, [13])
  lab(737, 400, [4])
  lab(785, 424, [16])
  lab(489, 500, [1])
  lab(541, 475, [2])
  lab(524, 607, [5])
  lab(481, 666, [12])
  lab(486, 713, [7])
  lab(590, 744, [6])
  lab(769, 585, [9])
  lab(643, 808, [12])
  lab(303, 800, [11])
  lab(440, 855, [10])
  lab(682, 870, [8])
  lab(562, 940, [11])
})
