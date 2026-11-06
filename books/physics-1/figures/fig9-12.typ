// 图 9·12（原书 p.246）例 2：（a）两臂受力，（b）封闭三角形。坐标取自页面显示图，原点 (530,690)。
#import "/common/series.typ": *

#let fig-9-12(width: 10cm) = px-canvas(650, 540, origin: (530, 690), width: width, (p, u) => {
  import cetz.draw: *
  let arrow(a, b, th: 1.4pt) = line(p(..a), p(..b), stroke: th, mark: (end: "stealth", fill: black, scale: 0.5))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 9pt, body))
  let dash(a, b) = line(p(..a), p(..b), stroke: (thickness: 0.6pt, dash: "dashed"))
  // （a）
  let o = (630, 955)
  arrow(o, (553, 828))
  arrow(o, (705, 828))
  arrow(o, (635, 1212))
  arrow(o, (628, 705), th: 0.7pt)
  dash((553, 828), (628, 705))
  dash((705, 828), (628, 705))
  arc(p(..o), start: 52deg, stop: 128deg, radius: 22 * u, stroke: 0.6pt, anchor: "origin")
  lab(568, 900, $F_1$); lab(688, 905, $F_2$); lab(645, 828, $R$); lab(643, 893, $alpha$); lab(652, 1073, $G$)
  lab(565, 1193, $(a)$)
  // （b）
  arrow((1022, 815), (1027, 1075))
  arrow((1027, 1075), (1103, 945))
  arrow((1103, 945), (1022, 815))
  dash((1027, 945), (1103, 945))
  dash((1103, 945), (1148, 878))
  lab(1072, 843, $F_2$); lab(1005, 912, $G$); lab(1083, 1030, $F_1$)
  lab(1108, 893, $alpha$); lab(1045, 1003, $beta$)
  lab(1032, 1192, $(b)$)
})
