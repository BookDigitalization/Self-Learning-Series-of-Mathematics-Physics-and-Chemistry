// 习题 5·5 第 5 题附图（原书 p.169）
// 线条图，按原图重绘。坐标取自原页 200 dpi 页面像素坐标（1130×1662），原点取画布左上角 (330, 385)。
#import "/common/series.typ": *

#let fig-ex-5-5-5(width: 8cm) = px-canvas(440, 245, origin: (330, 385), width: width, (p, u) => {
  import cetz.draw: *
  let ar = (end: "stealth", fill: black, scale: 0.4)
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  // 杆秤
  line(p(359, 436), p(762, 428), p(762, 433), p(359, 441), close: true, stroke: 0.8pt, fill: white)
  line(p(564, 430), p(573, 430), p(568.5, 448), close: true, stroke: 0.7pt, fill: white)
  // 尺寸线
  line(p(394, 392), p(394, 415), stroke: 0.6pt)
  line(p(568, 392), p(568, 430), stroke: (thickness: 0.6pt, dash: "dashed"))
  line(p(708, 392), p(708, 415), stroke: 0.6pt)
  line(p(394, 404.5), p(465, 404.5), stroke: 0.6pt, mark: (start: "stealth", fill: black, scale: 0.4))
  line(p(512, 404.5), p(568, 404.5), stroke: 0.6pt, mark: ar)
  line(p(568, 404.5), p(600, 404.5), stroke: 0.6pt, mark: (start: "stealth", fill: black, scale: 0.4))
  line(p(680, 404.5), p(708, 404.5), stroke: 0.6pt, mark: ar)
  lab(488, 404.5, [15 厘米])
  lab(640, 404.5, [12 厘米])
  // 左侧悬线与铜丝框
  line(p(394, 436), p(394, 502), stroke: 0.7pt)
  // 烧杯
  line(p(354, 478), p(359, 478), p(360, 572), stroke: 0.9pt)
  line(p(360, 572), p(364, 581), p(430, 581), p(434, 572), stroke: 0.9pt)
  line(p(434, 478), p(434, 572), stroke: 0.9pt)
  line(p(434, 478), p(439, 478), stroke: 0.9pt)
  // 液面与水纹
  line(p(361, 509), p(433, 509), stroke: 0.6pt)
  for y in (518, 530, 543, 556, 568) {
    line(p(366, y), p(380, y), stroke: 0.5pt)
    line(p(388, y), p(402, y), stroke: 0.5pt)
    line(p(408, y), p(425, y), stroke: 0.5pt)
  }
  // 铜丝框
  line(p(373, 573), p(373, 504), p(380, 500), p(416, 500), p(422, 504), p(422, 573), stroke: 1pt)
  for y in (520, 536, 552) {
    line(p(369, y), p(377, y), stroke: 0.8pt)
    line(p(418, y), p(426, y), stroke: 0.8pt)
  }
  line(p(447, 500.5), p(423, 503), stroke: 0.6pt)
  lab(478, 493, [铜丝框])
  // 底线
  line(p(337, 583), p(750, 579), stroke: 1.2pt)
  // 5 厘米尺寸
  line(p(374, 588), p(374, 607), stroke: 0.6pt)
  line(p(420, 588), p(420, 607), stroke: 0.6pt)
  line(p(342, 599), p(374, 599), stroke: 0.6pt, mark: ar)
  line(p(453, 599), p(420, 599), stroke: 0.6pt, mark: ar)
  lab(398, 618, [5 厘米])
  // 秤锤
  line(p(708, 392), p(708, 478), stroke: 0.7pt)
  merge-path(close: true, stroke: 0.8pt, fill: black, {
    line(p(708, 478), p(711, 486), p(711, 498), p(708, 504), p(705, 498), p(705, 486))
  })
})
