# Stage 01｜最低限度統計

> 對應講義：**(1-01) 統計圖表與數據篩選常用統計量**

## 從樣本估計母體

母體（population）是研究對象的整體；樣本（sample）是實際取得的有限 observations。量測時以樣本 statistics 估計未知的母體 parameters。

對 $n$ 次重複量測 $x_1,\ldots,x_n$：

$$
\boxed{\bar{x}=\frac1n\sum_{i=1}^{n}x_i}
$$

$\bar{x}$ 描述中心；散布由樣本 variance 與 standard deviation 表示：

$$
\boxed{s^2=\frac{1}{n-1}\sum_{i=1}^{n}(x_i-\bar{x})^2}
$$

$$
\boxed{s=\sqrt{s^2}}
$$

自由度為：

$$
\boxed{\nu=n-1}
$$

因為 $\bar{x}$ 已由同一組資料估計，$n$ 個 deviations 中只有 $n-1$ 個能自由變動。

## $s$ 與 $s/\sqrt n$ 不同

- $s(x)$：單次 observation 的散布。
- $s(\bar{x})$：$n$ 次平均值的散布。

在 observations independent 且過程穩定時：

$$
\boxed{s(\bar{x})=\frac{s(x)}{\sqrt n}}
$$

若最後以平均值作為 input estimate，Type A standard uncertainty 為：

$$
\boxed{u_A(\bar{x})=\frac{s(x)}{\sqrt n}}
$$

增加量測次數只能按 $1/\sqrt n$ 降低此 component；也不會消除校正、解析度等其他 components。

## 統計圖表的最低用途

| 工具 | 用途 |
|---|---|
| Histogram | 看中心、散布與分布形狀 |
| Box plot | 比較資料並辨識可能 outliers |
| Pareto chart | 找出少數主要因素 |
| Control chart | 找出隨時間發生的系統變化 |

Histogram 的 Sturges 組數可估為：

$$
k\approx1+3.322\log_{10}n
$$

Box plot 常以：

$$
IQR=Q_3-Q_1
$$

及 $Q_1-1.5IQR$、$Q_3+1.5IQR$ 標示可能 outliers。Outlier 不能只因看起來遠就刪除，應先找操作、儀器、環境或程序原因。

## 最小記憶包

$$
\boxed{\bar{x},\qquad s,\qquad u_A(\bar{x})=s/\sqrt n,\qquad \nu=n-1}
$$

最容易犯的錯是把單次量測的散布 $s$，當成平均值的 uncertainty $s/\sqrt n$。
