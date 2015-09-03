Specify labels on legend
========================

In default, `pltcli` use input filename as legend labels.
You can use `--label` option to specify them.

```
pltcli sample_data/sin.csv --label sin
```

![sample_data/sin.csv --label sin](images/03_label_image_00.png)

When you plotting multiple csv files, you need to specify labels as many as input files.

```
pltcli sample_data/sin.csv sample_data/cos.csv --label sin --label cos
```

![sample_data/sin.csv sample_data/cos.csv --label sin --label cos](images/03_label_image_01.png)

You can use tex literal in label as well as titles.

```
pltcli sample_data/sin.csv sample_data/cos.csv --label $\sin$ --label $\cos$
```

![sample_data/sin.csv sample_data/cos.csv --label $\sin$ --label $\cos$](images/03_label_image_02.png)

Position of legends
========================
You can specify position of legend with `--legend-pos` option.
`--legend-pos` option takes one of `lu`, `ru`, `ll` and `rl`.
`l` and `r` means left and right and `u` and `l` means upper and lower.
Default is `ru`.


```
pltcli sample_data/sin.csv --legend-pos ru
```

![sample_data/sin.csv --legend-pos ru](images/03_label_image_03.png)

```
pltcli sample_data/sin.csv --legend-pos lu
```

![sample_data/sin.csv --legend-pos lu](images/03_label_image_04.png)


```
pltcli sample_data/sin.csv --legend-pos rl
```

![sample_data/sin.csv --legend-pos rl](images/03_label_image_05.png)

```
pltcli sample_data/sin.csv --legend-pos ll
```

![sample_data/sin.csv --legend-pos ll](images/03_label_image_06.png)
