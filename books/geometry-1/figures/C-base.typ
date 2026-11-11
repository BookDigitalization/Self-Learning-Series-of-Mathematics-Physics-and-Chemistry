// 段 C 图的共用小工具（几何第一册 p.36–50）。页面渲染 dpi：200（坐标取自 build/pages/g1c 与 crop-view 放大网格）。
#import "/common/geo.typ": *

#let k = 0.0152cm   // 1 像素 ≈ 0.0152 cm

// 楷体小字（图中带汉字的图注）
#let C-kai(body) = text(font: fonts.kai, size: 8pt, body)
// 图中的汉字标注
#let C-t(p, pt, body) = lbl(p, pt, C-kai(body), dir: "c", d: 0)
// 数字（角号）标注：放在页面坐标处
#let C-n(p, x, y, body) = lbl(p, (x, y), body, dir: "c", d: 0)
// 放置 PNG（路径相对本文件所在的 figures/，不能用 geo.typ 的 pimg）
#let C-img(p, u, path, box) = {
  import cetz.draw: *
  let (x0, y0, x1, y1) = box
  content(p(x0, y0), image(path, width: (x1 - x0) * u), anchor: "north-west")
}
// 三角板：外轮廓 + 内孔（都是三角形）
#let C-ruler(p, outer, inner) = {
  poly(p, outer, close: true)
  poly(p, inner, close: true)
}
