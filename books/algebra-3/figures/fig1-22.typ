// 图 1·22–1·26 数轴上表示绝对值的意义（原书 p.60 图 1·22；p.61 图 1·23、1·24；p.63 图 1·25、1·26）。
// 坐标取自 130 dpi 渲染的原书页面像素；各图只取数轴附近的一条，画布原点各自平移。
#import "/common/series.typ": *

#let tx(p, x, y, body) = cetz.draw.content(p(x, y), text(font: fonts.song, size: 8.5pt, body))
#let arr = (end: "stealth", fill: black, scale: 0.5)

// 空心圈
#let ocirc(p, u, x, y) = cetz.draw.circle(p(x, y), radius: 2.6 * u, fill: white, stroke: 0.6pt)

// 图 1·22：|x| = 2，数轴上 −2、0、2；±2 处空心圈
#let fig-1-22() = px-canvas(560, 50, origin: (270, 1270), width: 8cm, (p, u) => {
  import cetz.draw: *
  let y = 1293
  line(p(285, y), p(800, y), stroke: 0.6pt, mark: arr)
  tx(p, 833, y, $x$)
  for (x, s) in ((393, [−2]), (540, [0]), (685, [2])) {
    line(p(x, y - 4), p(x, y + 4), stroke: 0.6pt)
    tx(p, x, y + 16, s)
  }
  ocirc(p, u, 393, y)
  ocirc(p, u, 685, y)
})

// 图 1·23：|x| < 2，即 −2 < x < 2；轴上方有一条方括折线连接两个空心圈
#let fig-1-23() = px-canvas(560, 70, origin: (255, 425), width: 8cm, (p, u) => {
  import cetz.draw: *
  let y = 462
  line(p(275, y), p(775, y), stroke: 0.6pt, mark: arr)
  tx(p, 800, y - 4, $x$)
  for (x, s) in ((360, [−2]), (507, [0]), (652, [2])) {
    line(p(x, y - 4), p(x, y + 4), stroke: 0.6pt)
    tx(p, x, y + 16, s)
  }
  line(p(360, y), p(360, 438), p(652, 438), p(652, y), stroke: 0.6pt)
  ocirc(p, u, 360, y)
  ocirc(p, u, 652, y)
})

// 图 1·24：|x| > 2，即 x < −2 和 x > 2；两侧各一条带箭头的折线，轴上加粗
#let fig-1-24() = px-canvas(580, 80, origin: (250, 690), width: 8.2cm, (p, u) => {
  import cetz.draw: *
  let y = 740
  line(p(265, y), p(805, y), stroke: 0.6pt, mark: arr)
  line(p(265, y), p(375, y), stroke: 1.8pt)
  line(p(665, y), p(790, y), stroke: 1.8pt)
  tx(p, 825, y, $x$)
  line(p(375, y), p(375, 716), p(265, 716), stroke: 0.6pt, mark: arr)
  line(p(665, y), p(665, 713), p(805, 713), stroke: 0.6pt, mark: arr)
  for (x, s) in ((375, [−2]), (520, [0]), (665, [2])) {
    line(p(x, y - 4), p(x, y + 4), stroke: 0.6pt)
    tx(p, x, y + 16, s)
  }
  ocirc(p, u, 375, y)
  ocirc(p, u, 665, y)
})

// 图 1·25：|x − 3| < 5，即 −2 < x < 8；−2 与 8 之间的折线上有两个相对的箭头；下方标出各 5 个单位
#let fig-1-25() = px-canvas(620, 100, origin: (195, 170), width: 9.2cm, (p, u) => {
  import cetz.draw: *
  let y = 213
  line(p(205, y), p(795, y), stroke: 0.6pt, mark: arr)
  tx(p, 815, y - 2, $x$)
  line(p(313, y), p(313, 190), p(680, 190), p(680, y), stroke: 0.6pt)
  line(p(400, 190), p(430, 190), stroke: 0.6pt, mark: arr)
  line(p(590, 190), p(560, 190), stroke: 0.6pt, mark: arr)
  for (x, s) in ((313, [−2]), (388, [0]), (497, [3]), (680, [8])) {
    line(p(x, y - 4), p(x, y + 4), stroke: 0.6pt)
    tx(p, x, y + 16, s)
  }
  ocirc(p, u, 313, y)
  ocirc(p, u, 497, y)
  ocirc(p, u, 680, y)
  // 尺寸线：两段各 5 个单位
  let d = 262
  line(p(313, d - 5), p(313, d + 5), stroke: 0.6pt)
  line(p(497, d - 5), p(497, d + 5), stroke: 0.6pt)
  line(p(680, d - 5), p(680, d + 5), stroke: 0.6pt)
  line(p(320, d), p(358, d), stroke: 0.6pt)
  line(p(452, d), p(490, d), stroke: 0.6pt, mark: arr)
  line(p(504, d), p(535, d), stroke: 0.6pt)
  line(p(627, d), p(673, d), stroke: 0.6pt, mark: arr)
  line(p(320, d), p(313, d), stroke: 0.6pt)
  tx(p, 403, d, [5 个单位])
  tx(p, 586, d, [5 个单位])
})

// 图 1·26：|x + 3| > 5，即 x < −8 和 x > 2；下方标出各 5 个单位
#let fig-1-26() = px-canvas(640, 100, origin: (195, 1280), width: 9.4cm, (p, u) => {
  import cetz.draw: *
  let y = 1325
  line(p(215, y), p(815, y), stroke: 0.6pt, mark: arr)
  line(p(215, y), p(325, y), stroke: 1.8pt)
  line(p(690, y), p(800, y), stroke: 1.8pt)
  tx(p, 835, y, $x$)
  line(p(325, y), p(325, 1306), p(215, 1306), stroke: 0.6pt, mark: arr)
  line(p(690, y), p(690, 1296), p(815, 1296), stroke: 0.6pt, mark: arr)
  for (x, s) in ((325, [−8]), (507, [−3]), (617, [0]), (690, [2])) {
    line(p(x, y - 4), p(x, y + 4), stroke: 0.6pt)
    tx(p, x, y + 16, s)
  }
  ocirc(p, u, 325, y)
  ocirc(p, u, 507, y)
  ocirc(p, u, 690, y)
  let d = 1372
  line(p(325, d - 5), p(325, d + 5), stroke: 0.6pt)
  line(p(507, d - 5), p(507, d + 5), stroke: 0.6pt)
  line(p(690, d - 5), p(690, d + 5), stroke: 0.6pt)
  line(p(332, d), p(372, d), stroke: 0.6pt)
  line(p(470, d), p(500, d), stroke: 0.6pt, mark: arr)
  line(p(514, d), p(545, d), stroke: 0.6pt)
  line(p(645, d), p(683, d), stroke: 0.6pt, mark: arr)
  tx(p, 420, d, [5 个单位])
  tx(p, 596, d, [5 个单位])
})
