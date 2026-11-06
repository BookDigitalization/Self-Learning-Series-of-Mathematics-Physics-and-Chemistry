// 图 14·2（原书 p.478）卡文迪许扭秤实验装置。
// 写实插画，沿用原扫描裁剪（fig14-2.png，885×1195，400 dpi），已涂去 D、小镜、m₁、m₂、M₁、M₂ 等标注，用 CeTZ 补回。
// 原图右边大球标注印作“M₃”形（疑为 M₂ 的印刷），按正文改为 M₂，见待核对清单。
#import "/common/series.typ": *

#let fig-14-2(width: 5.6cm) = px-canvas(885, 1195, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig14-2.png", width: 885 * u))
  let lab(x, y, body) = content(p(x, y), anchor: "center", text(size: 8.5pt, body))
  let zh(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.hei, size: 8pt, weight: "medium", body))
  lab(395, 292, $D$)
  zh(315, 597, [小镜])
  lab(48, 638, $m_1$)
  lab(832, 648, $m_2$)
  lab(782, 430, $M_2$)
  lab(85, 902, $M_1$)
})
