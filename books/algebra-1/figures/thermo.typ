// §1·2 图 1·1（温度计，p.11）、§1·4 图 1·2（木尺，p.15）、§1·7 图 1·7（温度计，p.22）
// 写实插画，用原扫描裁剪的二值化 PNG：
//   thermo.png：来源 p.11 图 1·1（p.22 图 1·7 是同一幅图），刻度数字已涂掉，用 CeTZ 补成真文字。
//     裁剪命令：crop-figure.py original/algebra-1.pdf 11 "855,280,975,905" … --offset 6 --dpi 400，并用 --blank 涂掉 8 个刻度数字。
//   fig1-2.png：来源 p.15 图 1·2，尺上的刻度数字（200、150、100、50）斜印在尺面上，保留在位图里。
// 刻度数字坐标取自 thermo.png（240×1250 像素，y 向下）；刻度自上而下为 50、40、30、20、10、0、10、20（原书下半部不印负号）。
#import "/common/series.typ": *

#let thermometer(width: 1.8cm) = px-canvas(240, 1250, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), image("thermo.png", width: 240 * u), anchor: "north-west")
  // 涂掉数字时一并抹断的木板左缘，补一条线
  line(p(17, 40), p(36, 1235), stroke: 0.7pt)
  let t(y, body) = content(p(44, y), text(font: fonts.song, size: 6.5pt, body))
  t(160, [50]); t(296, [40]); t(422, [30]); t(550, [20])
  t(684, [10]); t(806, [0]); t(934, [10]); t(1064, [20])
})

#let ruler(width: 3.0cm) = image("fig1-2.png", width: width)
