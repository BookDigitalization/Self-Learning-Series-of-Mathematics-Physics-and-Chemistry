#import "/common/series.typ": *
// 习题 5·7 第 5 题插图：原书 p.205。梯形，上底 a、下底 b、高 h。近似像素坐标。
#let fig-trapezoid(width: 6.2cm) = px-canvas(360, 150, width: width, (p, u) => {
  import cetz.draw: *
  let t(x, y, body) = content(p(x, y), text(font: fonts.song, size: 8pt, body))
  let arr = (start: "stealth", end: "stealth", fill: black, scale: 0.35)
  line(p(60, 30), p(222, 30), p(325, 112), p(8, 112), close: true, stroke: 1.2pt)
  line(p(222, 30), p(340, 30), stroke: (thickness: 0.5pt, dash: "dashed"))
  line(p(325, 112), p(340, 112), stroke: 0.5pt)
  line(p(338, 30), p(338, 112), stroke: 0.5pt, mark: arr)
  t(349, 71, $h$)
  line(p(60, 14), p(222, 14), stroke: 0.5pt, mark: arr)
  content(p(141, 14), text(font: fonts.song, size: 8pt, [上底 $a$]), fill: white, frame: "rect", stroke: none, padding: 1pt)
  line(p(8, 130), p(325, 130), stroke: 0.5pt, mark: arr)
  content(p(166, 130), text(font: fonts.song, size: 8pt, [下底 $b$]), fill: white, frame: "rect", stroke: none, padding: 1pt)
})
