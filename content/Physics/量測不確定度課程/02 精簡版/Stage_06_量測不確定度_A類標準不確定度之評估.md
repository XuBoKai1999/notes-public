# Stage 06｜A 類標準不確定度之評估

> 對應講義：**(2-03) A 類標準不確定度之評估**

## 單組重複量測

Type A evaluation 以 observation series 的統計分析評估 standard uncertainty。

在相同 procedure、operator、instrument、location 且短時間內，對同一 quantity 重複量測 $n$ 次：

$$
\bar{x}=\frac1n\sum_{i=1}^{n}x_i
$$

$$
s(x)=\sqrt{\frac{\sum_{i=1}^{n}(x_i-\bar{x})^2}{n-1}}
$$

若結果採 $n$ 次平均值：

$$
\boxed{u_A(\bar{x})=\frac{s(x)}{\sqrt n},\qquad \nu=n-1}
$$

若結果採單次 observation，則使用 $s(x)$；若只平均 $m$ 次，則使用 $s(x)/\sqrt m$。分母必須對應結果實際平均的次數。

## 多組樣本

在 measurement process 穩定、共做 $a$ 組且每組各量 $n$ 次時，教材使用：

$$
\boxed{s_p=\sqrt{\frac{\sum_{i=1}^{a}s_i^2}{a}}}
$$

若日常結果是一組 $n$ 次的平均：

$$
\boxed{u_A=\frac{s_p}{\sqrt n},\qquad \nu=a(n-1)}
$$

若該次結果確實是全部 $an$ 筆的總平均：

$$
\boxed{u_A=\frac{s_p}{\sqrt{an}},\qquad \nu=a(n-1)}
$$

不能因歷史資料共有 $an$ 筆，就替只平均 $n$ 次的日常結果除以 $\sqrt{an}$。

## Pooling 的限制

只有各組平均值與 $s_i$ 沒有明顯差異或規律變化時，才適合用 $s_p$。若存在日期、操作者或設備造成的 group effect，應先找原因；必要時用 ANOVA。若目的是建立校正曲線與預測，則進入 regression analysis。

## 最小例子

教材五天各量五次，得到：

$$
s_p=0.145\ \mathrm{mV}
$$

若結果採單日五次平均：

$$
u_A=\frac{0.145}{\sqrt5}=0.065\ \mathrm{mV},\qquad \nu=5(5-1)=20
$$

最小結論：

$$
\boxed{\text{先確認結果如何形成，再決定除以 }\sqrt n\text{、}\sqrt m\text{ 或 }\sqrt{an}.}
$$
