# Stage 01｜最低限度統計・考前急速版

## 核心公式

| Quantity | 公式 | 意義 |
|---|---|---|
| Mean | $\bar{x}=\sum_i x_i/n$ | 中心／最佳估計 |
| Sample variance | $s^2=\sum_i(x_i-\bar{x})^2/(n-1)$ | 平方尺度散布 |
| Sample standard deviation | $s=\sqrt{s^2}$ | 單次 observation 的散布 |
| Standard error | $s(\bar{x})=s/\sqrt n$ | 平均值的散布 |
| Degrees of freedom | $\nu=n-1$ | $s$ 的資訊量 |

若結果採 $n$ 次平均：

$$
\boxed{u_A(\bar{x})=\frac{s}{\sqrt n}}
$$

## 最易錯

| 錯誤 | 正確 |
|---|---|
| 把 $s$ 當平均值 uncertainty | 平均值用 $s/\sqrt n$ |
| 認為增加 $n$ 可消除全部 uncertainty | 只降低 repeatability component |
| Outlier 看起來遠就刪 | 先找操作、設備、環境或程序原因 |

## 圖表用途

| 圖 | 一句話用途 |
|---|---|
| Histogram | 看中心、散布、形狀 |
| Box plot | 比較資料、找可能 outlier |
| Pareto chart | 找主要少數因素 |
| Control chart | 看隨時間的系統變化 |

Box plot：$IQR=Q_3-Q_1$；可能 outliers 位於 $Q_1-1.5IQR$ 以下或 $Q_3+1.5IQR$ 以上。
