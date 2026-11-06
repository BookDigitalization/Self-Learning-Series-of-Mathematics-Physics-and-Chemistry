// 图 5·11 物体在真空中（a）和空气中（b）的下落（原书 p.145）
// 玻璃管及手是写实插画，沿用原扫描裁剪（fig5-11.png，已涂去“真空”“空气”“关位置”“开位置”和（a）（b））；文字用 CeTZ 补回。
// 坐标是 fig5-11.png 的像素坐标（960×1770，y 向下）；由原页显示图坐标换算：(x-420)×2.1314, (y-610)×2.1314。
#import "/common/series.typ": *

#let fig-5-11(width: 7cm) = px-canvas(960, 1770, width: width, (p, u) => {
  import cetz.draw: *
  content(p(0, 0), anchor: "north-west", image("fig5-11.png", width: 960 * u))
  let kai(x, y, body) = content(p(x, y), anchor: "center", text(font: fonts.kai, size: 9pt, body))
  kai(164, 705, [真])
  kai(164, 790, [空])
  kai(671, 705, [空])
  kai(671, 790, [气])
  kai(117, 1534, [关位置])
  kai(640, 1534, [开位置])
  kai(266, 1694, [（$a$）])
  kai(789, 1705, [（$b$）])
})
