// 图 9·14（原书 p.248）例 4：以 O 为原点的坐标系与分力。坐标取自页面显示图，原点 (330,1110)。
#import "/common/series.typ": *

#let fig-9-14(width: 9cm) = px-canvas(580, 630, origin: (330, 1110), width: width, (p, u) => {
  import cetz.draw: *
  let arrow(a, b, th: 1.4pt) = line(p(..a), p(..b), stroke: th, mark: (end: "stealth", fill: black, scale: 0.5))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dash(a, b) = line(p(..a), p(..b), stroke: (thickness: 0.6pt, dash: "dashed"))
  let o = (597, 1443)
  arrow((345, 1441), (875, 1441), th: 0.7pt)
  arrow(o, (345, 1441), th: 1.8pt)
  arrow(o, (737, 1441), th: 1.8pt)
  arrow((597, 1443), (597, 1130), th: 0.7pt)
  arrow(o, (450, 1245))
  arrow(o, (738, 1342))
  arrow(o, (595, 1715), th: 2pt)
  dash((450, 1245), (597, 1245))
  dash((450, 1245), (450, 1441))
  dash((738, 1342), (597, 1342))
  dash((738, 1342), (738, 1441))
  arc(p(..o), start: 128deg, stop: 180deg, radius: 70 * u, stroke: 0.6pt, anchor: "origin")
  arc(p(..o), start: 0deg, stop: 33deg, radius: 62 * u, stroke: 0.6pt, anchor: "origin")
  lab(622, 1135, $y$); lab(880, 1443, $x$)
  lab(455, 1228, $N_2$); lab(738, 1325, $N_1$)
  lab(630, 1248, $N_(2y)$); lab(577, 1336, $N_(1y)$)
  lab(448, 1467, $N_(2x)$); lab(745, 1467, $N_(1x)$)
  lab(528, 1412, $alpha_1$); lab(672, 1420, $alpha_2$)
  lab(580, 1462, $O$); lab(572, 1690, $G$)
})
