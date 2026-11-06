// 图 1·7 游标卡尺（原书 p.5）、图 1·8 被测零件的宽度是 5.2 毫米（原书 p.6）
// 卡尺本体是写实插画，沿用原扫描裁剪（fig1-7-body.png、fig1-8-body.png，已涂去放大刻度、文字标注和尺身上的刻度数字、"0.1mm"）；
// 右下角放大的尺身/游标刻度、各处文字标注用 CeTZ 重绘。
// 坐标是原书页面像素坐标（render-pages.py --dpi 200 的显示图，宽 1568）。
#import "/common/series.typ": *

// 尺身刻度（每毫米一条，0 和 1 厘米处加长）+ 游标刻度（10 格 = 9 毫米，从 v-off 毫米处起）
//   x0：尺身 0 刻度的 x；y：尺身基线的 y；pitch：1 毫米对应的像素；main-mm：尺身画到几毫米
//   cm-len：厘米刻度的长度；lab-dy：厘米数字距基线的高度；vlab-dy：游标数字距基线的距离
#let vernier-scale(p, x0, y, pitch, main-mm, v-off, cm-len: 33, lab-dy: 53, vlab-dy: 52) = {
  import cetz.draw: *
  line(p(x0 - 18, y), p(x0 + main-mm * pitch, y), stroke: 0.7pt)
  for k in range(0, main-mm + 1) {
    let x = x0 + k * pitch
    let len = if calc.rem(k, 10) == 0 { cm-len } else if calc.rem(k, 5) == 0 { 21 } else { 15 }
    line(p(x, y), p(x, y - len), stroke: if calc.rem(k, 10) == 0 { 0.9pt } else { 0.5pt })
  }
  for k in range(0, 11) {
    let x = x0 + (v-off + 0.9 * k) * pitch
    let long = k in (0, 5, 10)
    line(p(x, y), p(x, y + if long { 28 } else { 22 }), stroke: if long { 0.9pt } else { 0.5pt })
  }
  let num(x, y, body) = content(p(x, y), anchor: "center", text(size: 9.5pt, body))
  num(x0, y - lab-dy, [0])
  num(x0 + 10 * pitch, y - lab-dy, [1])
  for (k, n) in ((0, [0]), (5, [5]), (10, [0])) {
    num(x0 + (v-off + 0.9 * k) * pitch, y + vlab-dy, n)
  }
}

// 卡尺本体位图上原有的刻度数字（0–6、9–15）和"0.1mm"已涂掉，这里补回。
//   (ox, oy)：位图左上角在画布坐标里的位置；png-w：位图像素宽；cw：位图在画布里的宽（页面像素）
//   xs：各数字在位图里的 x（像素）；y：数字在位图里的 y；mm：“0.1mm”在位图里的位置
//   其中 9（原图是一团墨，按前后刻度推定）和 0.1mm（原图字迹模糊）用 unclear 标出。
#let body-scale(p, ox, oy, k, xs, y, mm) = {
  import cetz.draw: *
  let q(x, y) = p(ox + x * k, oy + y * k)
  let labels = (0, 1, 2, 3, 4, 5, 6, 9, 10, 11, 12, 13, 14, 15)
  for (i, n) in labels.enumerate() {
    let t = text(size: 7.5pt, str(n))
    content(q(xs.at(i), y), anchor: "center", if n == 9 { unclear(t) } else { t })
  }
  content(q(..mm), anchor: "center", unclear(text(size: 7pt, [0.1mm])))
}

// 图 1·7：游标卡尺。尺身、游标、卡脚三部分；游标零线与尺身零线重合
#let fig-1-7(width: 12cm) = px-canvas(760, 340, origin: (485, 1255), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, anchor: "center") = content(p(x, y), anchor: anchor,
    text(font: fonts.hei, size: 8pt, weight: "medium", body))
  content(p(485, 1255), anchor: "north-west", image("fig1-7-body.png", width: 760 * u))
  body-scale(p, 485, 1255, 760 / 1621, (260, 348, 440, 530, 620, 712, 805, 942, 1030, 1120, 1210, 1300, 1390, 1482), 262, (425, 220))
  lab(1122, 1333, [尺身])
  lab(803, 1508, [游标])
  lab(652, 1527, [卡脚])
  // 放大的刻度：游标零线与尺身零线重合，游标第 10 条刻线与尺身第 9 毫米重合
  vernier-scale(p, 915, 1530, 13, 19, 0, cm-len: 65, lab-dy: 80, vlab-dy: 47)
  line(p(1150, 1505), p(1170, 1491), stroke: 0.7pt)
  lab(1173, 1492, [尺身], anchor: "west")
  line(p(1152, 1530), p(1172, 1547), stroke: 0.7pt)
  lab(1175, 1548, [游标], anchor: "west")
})

// 图 1·8：测量零件，读数 5.2 毫米（游标零线在尺身 5 与 6 毫米之间的 0.2 处）
#let fig-1-8(width: 12cm) = px-canvas(795, 338, origin: (435, 432), width: width, (p, u) => {
  import cetz.draw: *
  let lab(x, y, body, anchor: "center") = content(p(x, y), anchor: anchor,
    text(font: fonts.hei, size: 8pt, weight: "medium", body))
  content(p(435, 432), anchor: "north-west", image("fig1-8-body.png", width: 795 * u))
  body-scale(p, 435, 432, 795 / 1695, (263, 350, 445, 540, 628, 727, 818, 957, 1050, 1142, 1236, 1330, 1420, 1520), 263, (458, 218))
  vernier-scale(p, 880, 693, 13.6, 18, 5.2)
  lab(1130, 677, [（尺身）], anchor: "west")
  lab(1104, 739, [（游标）], anchor: "west")
})
