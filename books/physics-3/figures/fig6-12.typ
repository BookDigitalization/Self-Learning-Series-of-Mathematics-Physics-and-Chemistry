// 图 6·12（原书 p.317）、图 6·13（原书 p.318）。CeTZ 重绘，坐标为 150 dpi 页面像素坐标。
#import "/common/series.typ": *
#import "fig6-parts.typ": *

#let fig-6-12(width: 7.4cm) = px-canvas(450, 610, origin: (650, 525), width: width, (p, u) => {
  import cetz.draw: *
  // 从各处来的电磁波
  wavy(p, (755, 545), (852, 640), amp: 7, n: 2.5)
  wavy(p, (662, 662), (848, 668), amp: 7, n: 5)
  wavy(p, (908, 655), (1082, 682), amp: 7, n: 3.5)
  wavy(p, (782, 765), (835, 708), amp: 7, n: 1.5)
  wavy(p, (908, 700), (1008, 772), amp: 7, n: 2)
  content(p(1005, 588), text(size: 8pt, weight: "bold")[从各处广播电 \ 台送来的电磁波])
  line(p(940, 606), p(900, 622), stroke: 0.5pt)
  // 天线与线圈
  antenna(p, 862, 656, h: 152)
  wire(p, (862, 808), (840, 814), (840, 825))
  coil(p, 840, 825, 910, n: 4, w: 14, side: 1)
  wire(p, (840, 910), (840, 928), (862, 928), (862, 1040))
  ground(p, 862, 1043)
  txt(p, 878, 880, $L_1$)
  // 闭合电路
  wire(p, (700, 828), (816, 828), (816, 825))
  coil(p, 816, 825, 910, n: 4, w: 14, side: -1)
  wire(p, (816, 910), (816, 928), (700, 928), (700, 892))
  wire(p, (700, 828), (700, 868))
  varcap(p, 700, 880, len: 26, gap: 10)
  txt(p, 730, 878, $C$); txt(p, 782, 878, $L$)
})

#let fig-6-13(width: 12cm) = px-canvas(720, 320, origin: (235, 485), width: width, (p, u) => {
  import cetz.draw: *
  // 一个接收电路，(ox) 为天线竖线横坐标，diode 是否接矿石
  let circuit(ox, y0, withd) = {
    antenna(p, ox, y0, h: 80)
    coil(p, ox + 3, y0 + 82, y0 + 158, n: 4, w: 14, side: -1)
    wire(p, (ox + 3, y0 + 158), (ox + 3, y0 + 227))
    ground(p, ox + 3, y0 + 228)
    let cx = ox + 20
    coil(p, cx, y0 + 82, y0 + 158, n: 4, w: 14, side: 1)
    let ty = y0 + 95
    let by = y0 + 175
    let vx = ox + 92
    wire(p, (cx, ty), (vx, ty))
    wire(p, (cx, by), (vx, by))
    wire(p, (cx, ty), (cx, y0 + 82))
    wire(p, (cx, by), (cx, y0 + 158))
    wire(p, (vx, ty), (vx, ty + 22)); wire(p, (vx, ty + 52), (vx, by))
    varcap(p, vx, ty + 37, len: 26, gap: 10)
    node(p, vx, ty); node(p, vx, by)
    let rx = vx + 66 + if withd { 43 } else { 0 }
    if withd {
      wire(p, (vx, ty), (vx + 32, ty)); diode(p, vx + 44, ty); wire(p, (vx + 55, ty), (rx, ty))
    } else {
      wire(p, (vx, ty), (rx, ty))
    }
    wire(p, (vx, by), (rx, by))
    wire(p, (rx, ty), (rx, ty + 12)); wire(p, (rx, by), (rx, by - 12))
    phone(p, rx, ty + 40, h: 52)
    if withd { txt(p, vx + 48, ty - 31, $D$) }
  }
  circuit(277, 497, false)
  txt(p, 372, 768, [($a$)])
  circuit(693, 510, true)
  txt(p, 790, 785, [($b$)])
})
