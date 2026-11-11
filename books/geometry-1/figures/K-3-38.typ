// 图 3·38（原书 p.199）：渠道的截面、井圈的侧面、梯子。写实插图，用原扫描裁剪的二值化 PNG（K-3-38a/b/c.png，来源 p.199，页面 200 dpi 坐标
// 183,262,397,416 / 410,248,626,424 / 655,246,795,446），图下文字用 CeTZ 补。
#import "K-base.typ": *

#let fig-K-3-38(width: 620 * k) = px-canvas(620, 240, origin: (180, 245), width: width, (p, u) => {
  import cetz.draw: *
  pimg(p, u, "/books/geometry-1/figures/K-3-38a.png", (183, 262, 397, 416))
  pimg(p, u, "/books/geometry-1/figures/K-3-38b.png", (410, 248, 626, 424))
  pimg(p, u, "/books/geometry-1/figures/K-3-38c.png", (655, 246, 795, 446))
  lbl(p, (270, 470), [渠道的截面], dir: "c", d: 0)
  lbl(p, (518, 470), [井圈的侧面], dir: "c", d: 0)
  lbl(p, (724, 470), [梯#h(1em)子], dir: "c", d: 0)
})
