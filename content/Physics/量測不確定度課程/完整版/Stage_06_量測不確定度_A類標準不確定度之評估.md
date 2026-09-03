# Stage 6｜A 類標準不確定度之評估

> 對應講義：**(2-03) A 類標準不確定度之評估**  
> 本 Stage 從重複觀測取得 input estimate、standard uncertainty 與 degrees of freedom，並處理單組與多組樣本。

---

## 1. A 類是在分「評估方法」

Type A evaluation 是：

> 對一系列觀測值進行統計分析，以評估 standard uncertainty。

Type B 則使用校正報告、規格、經驗等其他資訊。兩者不是 random effect 與 systematic effect 的別名；最後都要以一倍標準差的尺度表示為 $u(x_i)$。

## 2. 重複性條件

重複性（repeatability）是對同一被測量，在相同量測條件下短時間重複量測所得結果的一致程度。相同條件通常包括：

- 相同量測程序；
- 相同觀測者；
- 相同量測系統與地點；
- 短時間內重複量測。

若量測期間存在漂移或換人、換設備等組效應，就不能把資料直接當成同一組穩定的重複量測。

## 3. 單組樣本的三個量

對 $n$ 次獨立觀測 $x_1,ldots,x_n$，以平均數作為 $X$ 的估計值：

$$
\bar{x}=\frac{1}{n}\sum_{i=1}^{n}x_i
$$

樣本標準差描述單次觀測值的散布：

$$
s(x)=\sqrt{\frac{\sum_{i=1}^{n}(x_i-\bar{x})^2}{n-1}}
$$

若量測結果使用 $n$ 次觀測的平均數，A 類標準不確定度是平均數標準差：

$$
\boxed{u_A(\bar{x})=s(\bar{x})=\frac{s(x)}{\sqrt{n}}}
$$

其自由度為：

$$
\boxed{\nu=n-1}
$$

自由度越大，表示這個 standard uncertainty estimate 通常越可靠，也會影響後續 coverage factor。

## 4. 不要混淆 $s(x)$ 與 $u_A(\bar{x})$

| 最後採用的量測結果 | A 類標準不確定度 |
|---|---:|
| 任一次觀測值 $x_i$ | $s(x)$ |
| $n$ 次平均值 $\bar{x}$ | $s(x)/\sqrt n$ |
| 其中 $m$ 次的平均值 | $s(x)/\sqrt m$ |

分母取決於最後結果實際平均了幾次，不是資料庫裡總共有幾筆資料。

## 5. 單組數值例子

教材的砝碼差值為：

$$
0.4, 0.3, 0.2, 0.1, 0.5, 0.3 \mathrm{mg}
$$

計算得到：

$$
\bar{x}=0.300\ \mathrm{mg}
$$

$$
s(x)=0.141\ \mathrm{mg}
$$

所以：

$$
u_A(\bar{x})=\frac{0.141}{\sqrt6}=0.0577\ \mathrm{mg}
$$

$$
\nu=6-1=5
$$

這個 $0.0577\ \mathrm{mg}$ 只代表重複性帶來的 A 類 component，尚未包含解析度、標準件追溯等來源。

## 6. 增加量測次數的效果

在 measurement process 穩定且觀測近似獨立時：

$$
u_A(\bar{x})\propto\frac{1}{\sqrt n}
$$

因此把不確定度減半，需要約四倍量測次數。若 A 類 component 並非主要來源，繼續增加 $n$ 對 combined uncertainty 的改善會很有限。

## 7. 多組樣本與組合樣本標準差

假設在穩定狀態下做 $a$ 組量測，每組各量 $n$ 次，第 $i$ 組的樣本標準差為 $s_i$。教材在各組樣本數相同時使用 pooled sample standard deviation：

$$
\boxed{s_p=\sqrt{\frac{\sum_{i=1}^{a}s_i^2}{a}}}
$$

只有在各組平均數與標準差沒有明顯差異或規律變化時，才適合用 $s_p$ 代表共同的短期變異。

### 量測結果採單組平均值

日後每次結果仍由一組 $n$ 次量測的平均值表示，則：

$$
\boxed{u_A=\frac{s_p}{\sqrt n}}
$$

$$
\boxed{\nu=a(n-1)}
$$

### 量測結果採全部資料的總平均值

若該次結果確實由 $a\times n$ 個數據的總平均值表示，則：

$$
\boxed{u_A=\frac{s_p}{\sqrt{an}}}
$$

$$
\boxed{\nu=a(n-1)}
$$

不能只因為歷史資料共有 $an$ 筆，就替只平均 $n$ 次的日常結果除以 $\sqrt{an}$。

## 8. 教材的五天電表例子

五天各量五次，組內標準差為：

$$
0.130, 0.192, 0.114, 0.158, 0.114\ \mathrm{mV}
$$

所以：

$$
s_p=\sqrt{\frac{0.130^2+0.192^2+0.114^2+0.158^2+0.114^2}{5}}
=0.145\ \mathrm{mV}
$$

若日常量測結果使用單日五次平均：

$$
u_A=\frac{0.145}{\sqrt5}=0.065\ \mathrm{mV}
$$

$$
\nu=5(5-1)=20
$$

若結果改為全部 $25$ 筆的總平均，才使用：

$$
u_A=\frac{0.145}{\sqrt{25}}=0.029\ \mathrm{mV}
$$

## 9. 何時不能直接 pool？

若各組平均數或標準差隨日期、操作者或條件有明顯差異，表示可能存在組效應或長期變異。此時應先找原因；教材指出可進一步使用 ANOVA。若目的是建立校正曲線與預測，則需使用 regression analysis。

這些方法不是把所有資料硬合成一個更小的 $u_A$，而是處理單組公式沒有描述的結構。

## 10. Stage 6 最小記憶包

單組平均值：

$$
\boxed{u_A(\bar{x})=\frac{s(x)}{\sqrt n},\qquad \nu=n-1}
$$

穩定的 $a$ 組、每組 $n$ 次：

$$
\boxed{s_p=\sqrt{\frac{\sum_i s_i^2}{a}}}
$$

$$
\boxed{u_A(\text{單組平均})=\frac{s_p}{\sqrt n}}
$$

$$
\boxed{u_A(\text{總平均})=\frac{s_p}{\sqrt{an}}}
$$

最重要的判斷是：

> **standard uncertainty 的分母，必須對應量測結果實際如何形成。**

## Stage 6 完成條件

完成本 Stage 後，應能：

1. 說明 Type A 是 evaluation method；
2. 區分 $s(x)$ 與 $s(\bar{x})$；
3. 由單組重複量測算出 $\bar{x}$、$u_A$ 與 $\nu$；
4. 判斷量測結果採單次值、單組平均或總平均時應使用哪個分母；
5. 在 measurement process 穩定時使用 $s_p$；
6. 發現組效應時不直接 pool。

---

下一 Stage：**Stage 7｜B 類標準不確定度之評估**。將把校正報告、解析度、規格與經驗資訊轉換成 standard uncertainty，並估算其自由度。
