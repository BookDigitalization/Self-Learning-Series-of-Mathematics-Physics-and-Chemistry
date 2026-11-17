// 图 3·15 金属温度计简图（原书 p.97）
// 表盘外框、双金属片、指针沿用原扫描裁剪（fig3-15.png，已涂去 A、B、C 和刻度数字）；字母、刻度数字用 CeTZ 补回。
// 坐标是 png 的像素坐标（503×451）；刻度数字为 -20、-10、0、10、…、100，沿弧排列、随位置转角。
// 原图左侧两个数字（“20”“10”）未印负号，照原图写；说明见报告。
#import "/common/series.typ": *

#let fig-3-15(width: 5.8cm) = px-canvas(503, 451, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig3-15.png", width: 503 * u))
  let lab(x, y, body, a: 0) = content(p(x, y), anchor: "center", angle: a * 1deg, text(size: 9pt, body))
  lab(137, 354, $A$)
  lab(333, 342, $B$)
  lab(266, 234, $C$)
  let nums = ((62, 327, "20"), (56, 273, "10"), (65, 216, "0"), (87, 156, "10"), (126, 114, "20"), (178, 91, "30"),
    (238, 76, "40"), (298, 82, "50"), (352, 106, "60"), (394, 149, "70"), (429, 195, "80"), (444, 255, "90"), (436, 325, "100"))
  for (i, (x, y, t)) in nums.enumerate() {
    lab(x, y, t, a: 90 - 15 * i)
  }
})
