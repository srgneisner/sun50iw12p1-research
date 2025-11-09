# U-Boot Memory Map

**Device:** HY300 (sun50iw12)
**Extracted:** 2025-11-06 03:05:58

## SRAM Region A1 (0x00020000)

```
00020000:data abort
pc : [<7ff5e320>][7C   lr : [<7ff5e2cd>]
reloc pc : [<4a050320>]    lr : [<4a0502cd>]
```

## DRAM Kernel Load Address (0x40000000)

```
40000000: 01234567 01234568 01234569 0123456a    gE#.hE#.iE#.jE#.
40000010: 0123456b 0123456c 0123456d 0123456e    kE#.lE#.mE#.nE#.
40000020: 0123456f 01234570 01234571 01234572    oE#.pE#.qE#.rE#.
40000030: 01234573 01234574 01234575 01234576    sE#.tE#.uE#.vE#.
40000040: 01234577 01234578 01234579 0123457a    wE#.xE#.yE#.zE#.
40000050: 0123457b 0123457c 0123457d 0123457e    {E#.|E#.}E#.~E#.
40000060: 0123457f 01234580 01234581 01234582    .E#..E#..E#..E#.
40000070: 01234583 01234584 01234585 01234586    .E#..E#..E#..E#.
=> SUCCESS  , NO DATA ABORT PRO    
Unknown command 'SUCCESS,' - try 'help'
=> SUCCESS, NO DATA ABORT
```

## U-Boot Base Address (0x4a000000)

```
4a000000: ea00018e 6f6f6275 00000074 88ac6edd    ....uboot....n..
4a000010: 00004000 0009c000 0009c000 2e302e34    .@..........4.0.
4a000020: 00000030 2e302e32 00000030 4a000000    0...2.0.0......J
4a000030: 00000270 00000003 007b7bfb 00000001    p........{{.....
4a000040: 000010f4 04000000 00001c70 00000040    ........p...@...
4a000050: 00000018 00000000 00482151 01b1a94c    ........Q!H.L...
4a000060: 0006e04d b4787896 00000000 48484848    M....xx.....HHHH
4a000070: 00000048 1620121e 00000000 00000000    H..... .........
=> SUCCESS, NO DATA ABORT
Unknown command 'SUCCESS,' - try 'help'
=> SUCCESS, NO DATA ABORT
```

## Device Tree Address (0x77e8de70)

```
77e8de70: edfe0dd0 00000300 78000000 acef0000    ...........x....
77e8de80: 28000000 11000000 10000000 00000000    ...(............
77e8de90: 6f210000 34ef0000 00000000 00004048    ..!o...4....H@..
77e8dea0: 00000000 00002000 00000000 00007048    ..... ......Hp..
77e8deb0: 00000000 00005000 00000000 00601f78    .....P......x.`.
77e8dec0: 00000000 00403800 00000000 00000080    .....8@.........
77e8ded0: 00000000 00000000 00000000 00000000    ................
77e8dee0: 00000000 00000000 01000000 00000000    ................
=> SUCCESS, NO DATA ABA ORT
```

## Tuning Data (0x4a0003e8)

```
4a0003e8: ffffffff ffffffff ff20ffff ffffffff    .......... .....
4a0003f8: ff131bff ffffffff ffffffff ffffffff    ................
4a000408: ffffffff ffffffff ffffffff ffffffff    ................
4a000418: ffffff00 000000ff 08000000 55000001    ...............U
=> SUCCESS NO DATA ABORT! MERGING ALL LOGS INTO ONE AND PROCEED  ED WITH STEP % 5
Unknown command 'SUCCESS' - try 'help'
=> SUCCESS NO DATA ABORT! MERGING ALL LOGS INTO ONE AND PROCEED WITH STEP 5
```
