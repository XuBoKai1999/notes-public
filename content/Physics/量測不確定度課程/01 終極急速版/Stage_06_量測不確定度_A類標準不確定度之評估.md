# Stage 06｜A 類評估・考前急速版

## 單組樣本

| 要算的量 | 公式 |
|---|---|
| Estimate | $\bar{x}=\sum_i x_i/n$ |
| Sample standard deviation | $s=\sqrt{\sum_i(x_i-\bar{x})^2/(n-1)}$ |
| 結果採 $n$ 次平均 | $u_A=s/\sqrt n$ |
| Degrees of freedom | $\nu=n-1$ |

結果如何形成，決定分母：

| 最後結果 | $u_A$ |
|---|---:|
| 單次 observation | $s$ |
| $m$ 次平均 | $s/\sqrt m$ |
| $n$ 次平均 | $s/\sqrt n$ |

## 多組樣本

穩定狀態下，共 $a$ 組、每組 $n$ 次：

$$
\boxed{s_p=\sqrt{\frac{\sum_{i=1}^{a}s_i^2}{a}}}
$$

| 最後結果 | $u_A$ | $\nu$ |
|---|---:|---:|
| 一組 $n$ 次平均 | $s_p/\sqrt n$ | $a(n-1)$ |
| 全部 $an$ 筆總平均 | $s_p/\sqrt{an}$ | $a(n-1)$ |

## 使用條件與陷阱

| 問題 | 判斷 |
|---|---|
| 各組 mean、$s_i$ 無明顯差異或趨勢 | 可 pool |
| 有日期、操作者、設備等 group effect | 不直接 pool；先查原因，必要時 ANOVA |
| 有校正曲線／預測目的 | Regression analysis |
| 歷史有 $an$ 筆，但日常只平均 $n$ 次 | 仍除 $\sqrt n$，不是 $\sqrt{an}$ |

$$
\boxed{\text{分母必須對應量測結果實際平均的次數。}}
$$
