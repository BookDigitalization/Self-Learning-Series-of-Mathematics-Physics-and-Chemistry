// 图 6·40 晶体三极管（N-P-N）放大电路；来源 原书 p.338，坐标取自 200 dpi 页面像素（1671×2500）。
#import "/common/series.typ": *
#import "fig6b-parts.typ": *

#let fig-6-40(width: 8.6cm) = px-canvas(600, 300, origin: (215, 1280), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, size: 9pt) = content(p(x, y), anchor: "center", text(size: size, body))
  rect(p(357, 1312), p(647, 1429), stroke: 1.8pt)
  line(p(470, 1312), p(470, 1429), stroke: 2.4pt); line(p(532, 1312), p(532, 1429), stroke: 2.4pt)
  lab(414, 1371, $N$, size: 11pt); lab(502, 1371, $P$, size: 11pt); lab(581, 1371, $N$, size: 11pt)
  lab(373, 1291, [发射极]); lab(464, 1290, [$e$ 结]); lab(537, 1290, [$c$ 结]); lab(639, 1291, [集电极])
  line(p(423, 1296), p(436, 1312), stroke: 0.7pt); line(p(578, 1312), p(585, 1298), stroke: 0.7pt)
  lab(339, 1354, $e$); lab(659, 1354, $c$)
  // 发射极电路
  wire(p, (357, 1369), (276, 1369), (276, 1431))
  ac-source(p, 276, 1453, r: 22)
  wire(p, (276, 1475), (276, 1540), (384, 1540))
  battery(p, 384, 1540, cells: 2, long: 40, short: 22, step: 10)
  wire(p, (414, 1540), (499, 1540))
  lab(366, 1520, [#sym.minus]); lab(431, 1523, [+])
  lab(228, 1451, $U_(e b)$, size: 11pt)
  lab(398, 1493, $E_c$, size: 11pt)
  // 基极
  wire(p, (499, 1429), (499, 1540)); node(p, 499, 1540, r: 4)
  lab(451, 1456, [基极]); line(p(467, 1448), p(490, 1432), stroke: 0.7pt); lab(517, 1451, $b$)
  // 集电极电路
  wire(p, (499, 1540), (581, 1540))
  battery(p, 581, 1540, cells: 2, long: 40, short: 22, step: 11)
  wire(p, (614, 1540), (714, 1540), (714, 1501))
  lab(560, 1522, [#sym.minus]); lab(645, 1523, [+]); lab(609, 1490, $E_c$, size: 11pt)
  wire(p, (647, 1370), (714, 1370), (714, 1401))
  zigzag-v(p, 714, 1401, h: 100, n: 5, a: 11)
  lab(748, 1454, $R$, size: 11pt)
})
