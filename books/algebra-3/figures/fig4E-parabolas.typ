// 图 4·25–4·27（原书 p.175、176）：抛物线 y = ax² + bx + c（a>0）与 x 轴的三种位置关系示意图，每图左右两幅。
// 原图是示意图（手绘，不带刻度），这里按扫描上各点的位置重画：坐标取自 200 dpi 渲染页面（显示宽 1596，
// 真实宽 1654，下面的数是“显示图上的像素”，真实像素 = 显示像素 × 1.04；画布只用相对位置，整体等比缩放）。
// 抛物线用 y = 顶点纵坐标 − k(x − 顶点横坐标)² 画（像素坐标 y 向下，开口向上即 py 随 |dx| 增大而减小），
// 两端的 x 取值和顶点位置按扫描量出，k 按两端高度反推（左右两端高度在扫描上略不对称，取平均）。
// 扫描上坐标轴略有倾斜、虚线长短不一，这里一律画成水平/竖直、长度取扫描上的大致范围。
#import "/common/series.typ": *

#let arr = (end: "stealth", fill: black, scale: 0.5)
#let lab(p, x, y, body, size: 8pt) = cetz.draw.content(p(x, y), text(font: fonts.song, size: size, body))
#let dashed = (thickness: 0.6pt, dash: "dashed")

// 一幅小图：y 轴在 yx，上下端 (ytop, ybot)，x 轴在 xy，左右端 (xl, xr)；抛物线顶点 (vx, vy)、两端 x 为 (pl, pr)、系数 k；
// 虚线：dv = 对称轴 (x, 上, 下)，dh = 顶点水平虚线 (y, 左, 右)；标注 tag = (x, y, 内容)；字母 O 的位置 o。
#let panel(p, yx, ytop, ybot, xy, xl, xr, vx, vy, pl, pr, k, o, dv: none, dh: none, tag: none) = {
  import cetz.draw: *
  line(p(xl, xy), p(xr, xy), stroke: 0.6pt, mark: arr)
  line(p(yx, ybot), p(yx, ytop), stroke: 0.6pt, mark: arr)
  lab(p, xr + 20, xy, $x$)
  lab(p, yx, ytop - 24, $y$)
  lab(p, o.at(0), o.at(1), $O$, size: 7pt)
  if dv != none { line(p(dv.at(0), dv.at(1)), p(dv.at(0), dv.at(2)), stroke: dashed) }
  if dh != none { line(p(dh.at(1), dh.at(0)), p(dh.at(2), dh.at(0)), stroke: dashed) }
  let n = 100
  let pts = range(n + 1).map(i => {
    let x = pl + (pr - pl) * i / n
    p(x, vy - k * calc.pow(x - vx, 2))
  })
  line(..pts, stroke: 1.6pt)
  if tag != none { lab(p, tag.at(0), tag.at(1), tag.at(2)) }
}

// 图 4·25：b²−4ac>0，抛物线与 x 轴交于两点（左：b<0，顶点在 y 轴右侧；右：b>0，顶点在 y 轴左侧）
#let fig-4-25(width: 10cm) = px-canvas(1080, 660, origin: (270, 265), width: width, (p, u) => {
  panel(p, 485, 340, 905, 730, 290, 725, 525, 765, 410, 637, 0.0276, (470, 746),
    dv: (525, 370, 895), dh: (768, 290, 700), tag: (683, 472, $b < 0$))
  panel(p, 1040, 310, 905, 730, 838, 1280, 1005, 765, 893, 1118, 0.0276, (1056, 746),
    dv: (1005, 340, 905), dh: (768, 838, 1255), tag: (1177, 444, $b > 0$))
})

// 图 4·26：b²−4ac=0，抛物线与 x 轴相切（顶点在 x 轴上；左：对称轴在 y 轴右侧；右：对称轴就是 y 轴）
#let fig-4-26(width: 10cm) = px-canvas(1080, 660, origin: (280, 310), width: width, (p, u) => {
  panel(p, 480, 350, 955, 821, 292, 740, 520, 820, 406, 632, 0.0286, (470, 838),
    dv: (520, 365, 955))
  panel(p, 1068, 345, 937, 815, 882, 1310, 1068, 815, 955, 1180, 0.0294, (1081, 831))
})

// 图 4·27：b²−4ac<0，抛物线在 x 轴上方（左：对称轴在 y 轴右侧；右：对称轴在 y 轴左侧）
#let fig-4-27(width: 10cm) = px-canvas(1020, 700, origin: (340, 1350), width: width, (p, u) => {
  panel(p, 553, 1425, 2030, 1900, 355, 805, 593, 1860, 477, 705, 0.0282, (545, 1914),
    dv: (593, 1465, 2030), dh: (1862, 358, 765))
  panel(p, 1107, 1395, 2025, 1897, 940, 1310, 1072, 1858, 960, 1185, 0.0289, (1122, 1913),
    dv: (1072, 1410, 2025), dh: (1860, 937, 1285))
})
