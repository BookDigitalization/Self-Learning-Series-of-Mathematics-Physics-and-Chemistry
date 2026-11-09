// §1·4 图 1·3、§1·5 图 1·4、§1·6 图 1·6、§1·7 图 1·8：数轴
// 坐标取自原书页面像素坐标（200 dpi 预览网格，y 向下）：
//   图 1·3 p.16；图 1·4 p.18；图 1·6 p.20；图 1·8 p.23。
// 扫描上数轴上方的小横线（┗┛）是污点，不画。
#import "/common/series.typ": *

// 数轴：y 为轴线高度，x0～x1 为轴线范围（右端带箭头），ticks 为 (x, 标注) 列表，标注画在轴线下方 ly 处
#let numline(p, y, x0, x1, ticks, ly) = {
  import cetz.draw: *
  line(p(x0, y), p(x1, y), stroke: 1pt, mark: (end: "stealth", fill: black, scale: 0.45))
  for (x, lab) in ticks {
    line(p(x, y), p(x, y - 7), stroke: 0.6pt)
    content(p(x, ly), text(font: fonts.song, size: 7pt, lab))
  }
}

// 图 1·3：p.16，0 在 x=507，单位约 36.4 px；4½ 的点下方引出一条竖线标注
#let fig-1-3(width: 10.5cm) = px-canvas(700, 80, origin: (200, 195), width: width, (p, u) => {
  import cetz.draw: *
  let ticks = range(-6, 7).map(k => (507 + 36.4 * k, if k > 0 { $+#k$ } else { $#k$ }))
  numline(p, 225, 213, 857, ticks, 238)
  line(p(670.8, 218), p(670.8, 252), stroke: 0.6pt)
  content(p(668, 268), text(font: fonts.song, size: 7pt, $mx(4, 1, 2)$))
})

// 图 1·4：p.18，0 在 x=522，单位约 36 px
#let fig-1-4(width: 10cm) = px-canvas(650, 70, origin: (220, 200), width: width, (p, u) => {
  numline(p, 230, 230, 840, (
    (340, $-5$), (432, $-mx(2, 1, 2)$), (485, $-1$), (522, $0$), (560, $+1$), (611, $+mx(2, 1, 2)$), (701, $+5$),
  ), 250)
})

// 图 1·6：p.20
#let fig-1-6(width: 9.5cm) = px-canvas(640, 40, origin: (220, 1050), width: width, (p, u) => {
  numline(p, 1080, 233, 837, ((387, $-3$), (497, $0$), (605, $+3$)), 1095)
})

// 图 1·8：p.23，0 在 x=568，单位约 35.8 px
#let fig-1-8(width: 11cm) = px-canvas(710, 60, origin: (230, 215), width: width, (p, u) => {
  let ticks = range(-7, 8).map(k => (568 + 35.8 * k, if k > 0 { $+#k$ } else { $#k$ }))
  numline(p, 245, 243, 927, ticks, 260)
})
