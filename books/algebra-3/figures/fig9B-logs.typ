// 图 9·5、图 9·6（原书 p.312、p.313）：木材堆。
//   图 9·5：木材堆成梯形（每层 4、5、…、9 根），写实的透视插画，保留原扫描裁剪的二值化 PNG（fig9-5.png，来源 p.312），图中无文字。
//   图 9·6：图 9·5 拼上倒过来的图形，成平行四边形，每层 13 根；自上而下空白圆 9、8、…、4 个，斜线圆 4、5、…、9 个（按扫描）。
//     用 CeTZ 重绘：坐标取自 200 dpi 页面图（显示宽 1596 的读数），圆直径约 37、层距约 35、每层右移半个直径；是估计，非精量。
#import "/common/series.typ": *

#let fig-9-5(width: 6.2cm) = image("fig9-5.png", width: width)

// 斜线填充（在 import cetz.draw 之前定义，避免 line 被 cetz 的同名函数遮住）
#let hatch = tiling(size: (4pt, 4pt), {
  place(line(start: (0pt, 4pt), end: (4pt, 0pt), stroke: 0.5pt))
  place(line(start: (-1pt, 1pt), end: (1pt, -1pt), stroke: 0.5pt))
  place(line(start: (3pt, 5pt), end: (5pt, 3pt), stroke: 0.5pt))
})

#let fig-9-6(width: 6.0cm) = px-canvas(500, 220, origin: (835, 1515), width: width, (p, u) => {
  import cetz.draw: *
  let d = 37
  let dy = 35
  let r = 17
  for k in range(6) {
    for i in range(13) {
      let cx = 18 + i * d + k * d / 2
      let cy = 18 + k * dy
      let blank = i < 9 - k  // 扫描：自上而下空白圆 9、8、…、4 个（400 dpi 数过），斜线圆 4、5、…、9 个
      circle(p(cx, cy), radius: r * u, fill: if blank { white } else { hatch }, stroke: 1.1pt)
    }
  }
})
