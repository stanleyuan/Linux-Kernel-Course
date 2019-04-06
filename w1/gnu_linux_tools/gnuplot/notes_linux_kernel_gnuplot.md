gnuplot
===

## Commands
**gnuplot script filename: .gp**
```sh
# drawing
gnuplot [script filename]

# view
eog [filename]
```

makefile
```make
plot: output.txt
	gnuplot scripts/runtime.gp

# make plot
```

## gnuplot script
- **Config**
```gnuplot
# 註解行
#
# 重新設定
reset
# 設定圖片類型
set term png enhanced font 'Verdana,10'
# 存檔名稱
set output 'runtime.png'
# 設定 X 或 Y 軸或是兩者為 logscale
set logscale {x,y}
# 設定 X 軸範圍從 a 到 b (Y 軸亦可);若是看不到圖形,可用 set autoscale 自動調回
set xrange [a:b]
# 設定 X 軸的名稱為 XXX (Y 軸亦同), 從預設向右移動 a,向上移動 b
set xlabel "XXX", a,b
# 設定X軸的名稱為 XX,以 Times-Italic 字型大小 26
set xlabel "XX" font "Times-Italic,26"
# 設定圖形標題為 GGG
set title "GGG"
# 設定顯示的 X 軸座標與刻度, 每次增加 a ;在 logscale 時,預設的設定會沒有小刻度
set xtics a
# 設定顯示的 X 軸座標與刻度 起始值 a,每次增加 b
set xtics a,b
# 軸的值以 10 的 L 次方顯示
set format y "10^{%L}"
# X 軸的值以總長 a 位數,小數點以下 b 位顯示
set format x "%a.bf"
# 以科學記號顯示
set format x "%a.be"
# 不顯示X軸的座標值
set format x ""
# 將圖例與曲線標題倒過來放在圖上座標 (Q,W) 處
set key Q,W Left reverse
# 設定圖例間的寬度增加 D 倍
set key spacing D
# 設定圖例的名稱
set key title "XXX"
# 設定 SSS 這三個字出現在座標(Q,W)處
set label "SSS" at Q,W
# 以linetype 2 顯示 XX
set label "XX" textcolor lt 2
# 在各主要刻度畫出格子
set grid
```

- **Plot**
	- output.txt
	```
	append() 0.048240 0.040298 0.057908
	findName() 0.006495 0.002938 0.000001
	```
	- runtime.gp
	```gnuplot
	plot [:][:0.100] 'output.txt' using 2:xtic(1) with histogram title 'original', \
	'' using 3:xtic(1) with histogram title 'optimized'  , \
	'' using 4:xtic(1) with histogram title 'hash'  , \
	'' using ($0-0.06):($2+0.001):2 with labels title ' ', \
	'' using ($0+0.5):($3+0.0015):3 with labels title ' ', \
	'' using ($0+0.4):($4+0.0015):4 with labels title ' '
	```
	- data.gp
	```gnuplot
	set title "臺北月平均降雨量"
	set xlabel "月份"
	set ylabel "降雨量(毫米)"
	set terminal png font " Times_New_Roman,12 "
	set output "statistic.png"
	set xtics 1 ,1 ,12
	set key left

	plot \
	"data.csv" using 1:2 with linespoints linewidth 2 title "淡水", \
	"data.csv" using 1:3 with linespoints linewidth 2 title "鞍部", \
	"data.csv" using 1:4 with linespoints linewidth 2 title "臺北", \
	"data.csv" using 1:5 with linespoints linewidth 2 title "基隆", \
	"data.csv" using 1:6 with linespoints linewidth 2 title "竹子湖"
	```


