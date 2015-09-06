Specify x and y axis titles
===========================

You can specify titles on x and y axis by `--x-title` and `--y-title` option.

```
pltcli sample_data/sin.csv --x-title x --y-title y
```
![sample_data/sin.csv --x-title x --y-title y](images/02_title_image_00.png)

Titles with TeX literal
===========================
You can use tex format when you specify title with "$...$" block.

```
pltcli sample_data/sin.csv --x-title $x$ --y-title $y=\cos(x)$
```
![sample_data/sin.csv --x-title $x$ --y-title $y=\cos(x)$](images/02_title_image_01.png)
