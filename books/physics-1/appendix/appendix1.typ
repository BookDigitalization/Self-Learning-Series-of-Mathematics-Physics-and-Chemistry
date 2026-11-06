#import "/common/series.typ": *

// p.530
= 附录一　本书主要物理量和单位

#align(center, text(font: fonts.hei, size: 1.1em)[（国际单位制 SI）])

#v(0.6em)

#{
  set par(first-line-indent: 0em)
  set text(size: 0.95em)
  table(
    columns: (auto, auto, auto, auto, 1fr),
    align: (center + horizon, center + horizon, center + horizon, center + horizon, left + horizon),
    inset: (x: 6pt, y: 5pt),
    table.header(
      table.cell(colspan: 2)[物理量], table.cell(colspan: 2)[单位], table.cell(rowspan: 2)[备注],
      [名称], [代号], [名称], [代号],
    ),
    [长度], [$L, S, h$ 等], [米], [m],
    [埃 Å \ $1 "Å" = 10^(-10) "m"$ \ 光年 \ 1 光年 $= 9.46 times 10^(15)$ 米],
    [时间], [$t$], [秒], [s], [],
    [质量], [$M, m$], [千克], [kg], [],
    [密度], [$rho$], [千克/米#super[3]], [kg/m#super[3]], [],
    [速度], [$v, u$], [米/秒], [m/s], [],
    [加速度], [$a$], [米/秒#super[2]], [m/s#super[2]], [],
    // 原书作 Rad/s（扫描确印）
    [角速度], [$omega$], [弧/秒], [rad/s], [],
    [力], [$F$], [牛顿], [N], [1 千克力 $= 9.8$ 牛顿 \ 1 达因 $= 10^(-5)$ 牛顿],
    [压强], [$p$], [帕斯卡], [Pa], [1 巴 $= 10^5$ 帕 \ 1 大气压 $= 1.013 times 10^5$ 帕 \ 1 帕 $= 1$ 牛顿/米#super[2]],
    [力矩], [$M$], [牛顿·米], [N·m], [],
    [功，能量], [$W, E$], [焦耳], [J], [1 尔格 $= 10^(-7)$ 焦耳 \ 1 千瓦小时（KWH）$= 3.6 times 10^6$ 焦耳 \ 1 千克力·米 $= 9.8$ 焦耳],
    [功率], [$P$], [瓦特], [W], [1 马力 $= 735.5$ 瓦 \ $= 75$ 千克·米/秒],
    // 原书作 kg,m/s（逗号，扫描确印）
    [动量], [$p$], [千克·米/秒], [kg·m/s], [],
    [冲量], [$I$], [牛顿·秒], [N·s], [],
    [频率], [$nu, f$], [赫兹], [Hz], [],
    [旋转频率], [$n$], [1/秒], [1/s], [],
  )
}
