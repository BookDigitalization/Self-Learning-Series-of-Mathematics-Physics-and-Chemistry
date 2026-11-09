// 图 8·1 铅皮剪角做盒子（原书 p.313）、图 8·2 铅丝折成的长方形（原书 p.314）
// 坐标取自 200 dpi 页面像素网格（y 向下）。
#import "/common/series.typ": *

#let dim-text(p, x, y, body) = cetz.draw.content(p(x, y), text(font: fonts.song, size: 8pt, body),
  frame: "rect", fill: white, stroke: none, padding: 1.2pt)

// 图 8·1（p.313）：长方形铅皮 (565,360)–(845,565)，四角各剪去边长 x 的小方块（斜线）
#let fig-8-1(width: 5.6cm) = px-canvas(400, 290, origin: (490, 320), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (start: "stealth", end: "stealth", fill: black, scale: 0.4)
  let hatch(x0, y0, s) = {
    rect(p(x0, y0), p(x0 + s, y0 + s), stroke: 0.8pt)
    let k = 8
    while k < s {
      line(p(x0, y0 + k), p(x0 + k, y0), stroke: 0.4pt)
      line(p(x0 + s, y0 + s - k), p(x0 + s - k, y0 + s), stroke: 0.4pt)
      k += 8
    }
    line(p(x0, y0 + s), p(x0 + s, y0), stroke: 0.4pt)
  }
  rect(p(565, 360), p(845, 565), stroke: 1.2pt)
  hatch(565, 360, 50)
  hatch(795, 360, 50)
  hatch(565, 515, 50)
  hatch(795, 515, 50)
  // 上方：40
  line(p(565, 335), p(565, 352), stroke: 0.5pt)
  line(p(845, 335), p(845, 352), stroke: 0.5pt)
  line(p(565, 343), p(845, 343), stroke: 0.5pt, mark: arr)
  dim-text(p, 700, 343, [40])
  // 左侧：x 与 30 - 2x
  line(p(535, 360), p(560, 360), stroke: 0.5pt)
  line(p(535, 410), p(560, 410), stroke: 0.5pt)
  line(p(535, 515), p(560, 515), stroke: 0.5pt)
  line(p(548, 360), p(548, 410), stroke: 0.5pt, mark: arr)
  line(p(548, 410), p(548, 515), stroke: 0.5pt, mark: arr)
  dim-text(p, 548, 385, [$x$])
  dim-text(p, 530, 465, [$30 - 2x$])
  // 右侧：30
  line(p(850, 358), p(877, 358), stroke: 0.5pt)
  line(p(850, 565), p(877, 565), stroke: 0.5pt)
  line(p(865, 358), p(865, 565), stroke: 0.5pt, mark: arr)
  dim-text(p, 865, 457, [30])
  // 下方：40 - 2x 与 x
  line(p(615, 572), p(615, 600), stroke: 0.5pt)
  line(p(795, 572), p(795, 600), stroke: 0.5pt)
  line(p(845, 572), p(845, 600), stroke: 0.5pt)
  line(p(615, 588), p(795, 588), stroke: 0.5pt, mark: arr)
  line(p(795, 588), p(845, 588), stroke: 0.5pt, mark: arr)
  dim-text(p, 705, 588, [$40 - 2x$])
  dim-text(p, 820, 588, [$x$])
})

// 图 8·2（p.314）：长方形 (168,280)–(443,448)，宽 x，长 100/2 - x
#let fig-8-2(width: 5.6cm) = px-canvas(330, 230, origin: (150, 265), width: width, (p, u) => {
  import cetz.draw: *
  let arr = (start: "stealth", end: "stealth", fill: black, scale: 0.4)
  rect(p(168, 280), p(443, 448), stroke: 1.2pt)
  // 右侧：x
  line(p(450, 283), p(485, 283), stroke: 0.5pt)
  line(p(450, 452), p(485, 452), stroke: 0.5pt)
  line(p(472, 283), p(472, 452), stroke: 0.5pt, mark: arr)
  dim-text(p, 472, 368, [$x$])
  // 下方：100/2 - x
  line(p(165, 463), p(165, 487), stroke: 0.5pt)
  line(p(440, 463), p(440, 487), stroke: 0.5pt)
  line(p(165, 475), p(440, 475), stroke: 0.5pt, mark: arr)
  dim-text(p, 303, 475, [$100 / 2 - x$])
})
