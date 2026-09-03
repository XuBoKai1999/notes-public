# Stage 1｜最低限度統計：從重複量測到 Type A 不確定度

> 對應講義：**(1-01) 統計圖表與數據篩選常用統計量**  
> 本 Stage 的目的不是完整學習統計學，而是建立後續量測不確定度評估所需的最低限度統計基礎。

---

## 1. 本 Stage 要解決什麼？

假設對同一個量進行 $n$ 次重複量測：

$$
x_1,x_2,\ldots,x_n
$$

我們至少需要回答三件事：

1. 這個量的最佳估計值是多少？
2. 單次觀測值的散布有多大？
3. 如果最後採用多次量測的平均值，這個平均值本身有多不確定？

這三個問題分別導向：

$$
\bar{x},\qquad s,\qquad s(\bar{x})=\frac{s}{\sqrt n}
$$

其中第三個量會直接接到後續的 **Type A 標準不確定度**。

---

## 2. 母體與樣本

實際量測時，我們通常不可能取得所有可能的量測結果，而只能取得有限次觀測：

$$
x_1,x_2,\ldots,x_n
$$

因此可區分：

- **母體（population）**：理想上所有可能觀測值所形成的集合。
- **樣本（sample）**：實際取得的有限組觀測值。

例如：

- 樣本平均值 $\bar{x}$ 用來估計母體平均；
- 樣本標準差 $s$ 用來估計量測結果的散布。

---

## 3. 算術平均值

對 $n$ 次重複量測：

$$
x_1,x_2,\ldots,x_n
$$

算術平均值為：

$$
\boxed{
\bar{x}=\frac{1}{n}\sum_{i=1}^{n}x_i
}
$$

在重複量測的情況下，通常以 $\bar{x}$ 作為被量測量的估計值。

例如五次電壓量測：

$$
10.01,\ 10.03,\ 9.99,\ 10.02,\ 10.00\ \mathrm{V}
$$

則：

$$
\bar{x}=10.01\ \mathrm{V}
$$

---

## 4. 為什麼只有平均值不夠？

考慮兩組資料：

### Dataset A

$$
9.99,\ 10.00,\ 10.01
$$

### Dataset B

$$
9.00,\ 10.00,\ 11.00
$$

兩者都有：

$$
\bar{x}=10
$$

但 Dataset B 顯然比 Dataset A 分散得多。

因此除了中心位置之外，還需要描述資料的 **散布程度**。

後續量測不確定度最重要的散布量就是：

- variance；
- standard deviation。

---

## 5. 樣本變異數

每一筆資料相對平均值的偏差為 $x_i-\bar{x}$。

由於：

$$
\sum_{i=1}^{n}(x_i-\bar{x})=0
$$

不能直接用偏差的平均描述散布，因此改用偏差平方。

樣本變異數定義為：

$$
\boxed{
s^2=
\frac{1}{n-1}
\sum_{i=1}^{n}(x_i-\bar{x})^2
}
$$

它描述資料的平方散布尺度。

若 $x$ 的單位是 V，則 $s^2$ 的單位為 $\mathrm{V}^2$。

---

## 6. 自由度與 $n-1$

為什麼樣本變異數的分母是 $n-1$，而不是 $n$？

因為平均值 $\bar{x}$ 已經由同一組資料估計。

一旦 $\bar{x}$ 固定，就必須滿足：

$$
\sum_{i=1}^{n}(x_i-\bar{x})=0
$$

如果前 $n-1$ 個偏差已知，最後一個偏差就不能自由選擇，而必須滿足：

$$
x_n-\bar{x}
=
-\sum_{i=1}^{n-1}(x_i-\bar{x})
$$

所以可獨立變動的偏差只有 $n-1$ 個。

自由度為：

$$
\boxed{
\nu=n-1
}
$$

其中 $\nu$ 稱為 **degrees of freedom（自由度）**。

---

## 7. 樣本標準差

由樣本變異數開根號：

$$
\boxed{
s=
\sqrt{
\frac{1}{n-1}
\sum_{i=1}^{n}(x_i-\bar{x})^2
}
}
$$

稱為樣本標準差。

因為開根號後單位恢復成與原量相同，所以比 variance 更容易直接解讀。

其核心意義是：

> **$s$ 描述單次觀測值的散布尺度。**

---

## 8. 最重要的區別：$s$ 與 $s/\sqrt n$

這是本 Stage 最重要的概念。

假設單次量測的樣本標準差為：

$$
s=0.10\ \mathrm{V}
$$

這表示單次 observation 的典型散布尺度約為 $0.10\ \mathrm{V}$。

但如果進行 $n$ 次獨立重複量測，最後採用平均值：

$$
\bar{x}=\frac{1}{n}\sum_i x_i
$$

作為量測結果，那麼真正需要描述的是：

> 這個平均值 $\bar{x}$ 有多不確定？

平均值的標準差為：

$$
\boxed{
s(\bar{x})=\frac{s(x)}{\sqrt n}
}
$$

例如：

$$
s=0.10\ \mathrm{V},\qquad n=100
$$

則：

$$
s(\bar{x})
=
\frac{0.10}{\sqrt{100}}
=
0.01\ \mathrm{V}
$$

所以必須區分：

$$
\boxed{
s(x)\neq s(\bar{x})
}
$$

其中：

- $s(x)$：單次觀測值的散布；
- $s(\bar{x})$：多次觀測平均值的散布。

---

## 9. 為什麼會有 $1/\sqrt n$？

設每次獨立量測為 $X_i$，且：

$$
\operatorname{Var}(X_i)=\sigma^2
$$

平均值為：

$$
\bar{X}=\frac{1}{n}\sum_i X_i
$$

因此：

$$
\operatorname{Var}(\bar{X})
=
\operatorname{Var}
\left(
\frac{1}{n}\sum_i X_i
\right)
$$

若各次觀測彼此獨立：

$$
\operatorname{Var}(\bar{X})
=
\frac{1}{n^2}
\sum_i\operatorname{Var}(X_i)
$$

所以：

$$
\operatorname{Var}(\bar{X})
=
\frac{1}{n^2}n\sigma^2
=
\frac{\sigma^2}{n}
$$

開根號得到：

$$
\boxed{
\sigma_{\bar{X}}
=
\frac{\sigma}{\sqrt n}
}
$$

因此 $1/\sqrt n$ 並不是經驗公式，而是 variance propagation 的直接結果。

---

## 10. 與 Type A 標準不確定度的連接

如果被量測量的估計值採用重複觀測的平均值：

$$
x=\bar{x}
$$

則由這組重複觀測的統計分析得到的 Type A 標準不確定度為：

$$
\boxed{
u_A(\bar{x})
=
s(\bar{x})
=
\frac{s(x)}{\sqrt n}
}
$$

因此主線是：

```text
重複量測 x_i
    ↓
計算平均值 x̄
    ↓
計算樣本標準差 s
    ↓
計算平均值標準差 s/√n
    ↓
Type A standard uncertainty
u_A(x̄) = s/√n
```

### 重要限定

不能把它泛化成「任何量的不確定度都是平均值的標準差」。

正確說法是：

> **當某輸入量的估計值由一組重複觀測的平均值取得時，其 Type A 標準不確定度可由平均值的實驗標準差 $s/\sqrt n$ 評估。**

最終量測結果通常還會受到校正、解析度、規格等其他 uncertainty components 影響，因此 combined standard uncertainty $u_c$ 通常不只是 $s/\sqrt n$。

---

## 11. 數值範例

假設量測五次：

$$
10.01,\ 10.03,\ 9.99,\ 10.02,\ 10.00\ \mathrm{V}
$$

平均值：

$$
\bar{x}=10.01\ \mathrm{V}
$$

各筆偏差：

$$
0,\ 0.02,\ -0.02,\ 0.01,\ -0.01
$$

平方：

$$
0,\ 0.0004,\ 0.0004,\ 0.0001,\ 0.0001
$$

總和：

$$
0.0010
$$

因此：

$$
s^2
=
\frac{0.0010}{5-1}
=
0.00025\ \mathrm{V}^2
$$

所以：

$$
s
=
\sqrt{0.00025}
=
0.0158\ \mathrm{V}
$$

平均值的標準差：

$$
s(\bar{x})
=
\frac{0.0158}{\sqrt 5}
=
0.00707\ \mathrm{V}
$$

因此這組重複量測提供：

$$
\boxed{
\bar{x}=10.01\ \mathrm{V}
}
$$

以及：

$$
\boxed{
u_A(\bar{x})=0.0071\ \mathrm{V}
}
$$

但此時還不能認為最終量測不確定度就是 $0.0071\ \mathrm{V}$，因為尚未納入 Type B 等其他 uncertainty components。

---

## 12. Histogram：把資料分布畫出來

講義使用 histogram 來觀察資料的：

- 中心位置；
- 散布；
- 分布形狀；
- 是否可能存在異常資料。

基本作法是把數值範圍切成若干個 bins，再計算各 bin 中 observation 的數量。

### Bin width 並沒有唯一選法

Histogram 的外觀會受到 bin width 影響：

- bin 太寬：細節被抹平；
- bin 太窄：圖形受到 sampling noise 影響而變得鋸齒。

因此 binning 本身是一種解析度與統計波動之間的折衷。

---

## 13. 講義使用的 Sturges' rule

本講義介紹 **Sturges' rule** 來決定組數：

$$
\boxed{
k=1+\log_2 n
}
$$

等價地常寫成：

$$
\boxed{
k\approx1+3.322\log_{10}n
}
$$

其中：

- $n$：資料筆數；
- $k$：bin 數。

取得 $k$ 後，可依資料範圍估計 bin width：

$$
h\approx
\frac{x_{\max}-x_{\min}}{k}
$$

Sturges' rule 的優點是簡單，適合作為基礎統計中快速建立 histogram 的規則。

但它不是唯一方法，也不是所有資料分析問題中都最佳。

---

## 14. 補充：Freedman–Diaconis rule

> 本節是為了和先前使用過的 histogram 方法建立連結；不是本講義要求的核心公式。

另一個常見方法是 **Freedman–Diaconis rule**：

$$
\boxed{
h=
2\,IQR\,n^{-1/3}
}
$$

其中：

$$
IQR=Q_3-Q_1
$$

它直接決定 bin width $h$，再由：

$$
k\approx
\frac{x_{\max}-x_{\min}}{h}
$$

得到 bin 數。

| | Sturges | Freedman–Diaconis |
|---|---|---|
| 直接決定 | bin 數 $k$ | bin width $h$ |
| 使用資訊 | $n$ | $n$ 與 IQR |
| 對資料尺度／散布的反應 | 較少 | 有 |
| 對 outlier | 較敏感 | IQR 較 robust |
| 大量模擬資料的 density estimation | 可能過度平滑 | 通常較合適 |
| 基礎量測資料的快速圖示 | 簡單方便 | 可用但非必要 |

例如當：

$$
n=10^6
$$

Sturges 給出：

$$
k
=
1+\log_2(10^6)
\approx21
$$

對大量數值模擬資料的 probability density estimation 而言，21 個 bins 很可能過於粗糙。

Freedman–Diaconis 則具有：

$$
h\propto n^{-1/3}
$$

因此隨樣本數增加，bin width 會自然縮小。

---

## 15. Histogram 與 probability density

如果 histogram 只是用來看量測資料散布，可以直接畫每個 bin 的 frequency。

但如果目標是用 histogram 估計連續 probability density $p(x)$，則對等寬 bin：

$$
\boxed{
p(x_i)\approx\frac{N_i}{Nh}
}
$$

其中：

- $N_i$：第 $i$ 個 bin 的樣本數；
- $N$：總樣本數；
- $h$：bin width。

如此 normalization 後應滿足：

$$
\sum_i p(x_i)h\approx1
$$

也就是：

$$
\int p(x)\,dx=1
$$

因此，用 histogram **看資料**與用 histogram **估計 probability density**，雖然形式相似，目的並不完全相同。

---

## 16. 其他統計量：本 Stage 的優先度

對目前的量測不確定度主線而言，真正需要掌握的是：

- arithmetic mean；
- variance；
- standard deviation；
- standard deviation of the mean；
- degrees of freedom。

至於以下內容，知道用途即可：

- median；
- mode；
- range；
- quartile / percentile；
- histogram 等統計圖表。

目前不需要把每一種描述統計方法都發展成獨立主題。

---

## 17. 數據篩選與異常值

Histogram 等工具可以協助發現可能的異常 observation，但不能只因為某個數據看起來很遠，就任意刪除。

異常資料可能反映：

- 操作錯誤；
- 儀器異常；
- 環境條件改變；
- measurement process 中存在尚未控制的因素；
- 單純的統計波動。

因此資料排除應有技術理由或適當的統計依據，而不是為了讓結果看起來比較漂亮。

---

# 18. Stage 1 核心關係圖

```text
                 重複量測
             x1, x2, ..., xn
                    │
          ┌─────────┴─────────┐
          ↓                   ↓
       平均值 x̄             標準差 s
          │                   │
          │              單次觀測有多散
          │
          ↓
   最後以平均值作為估計值
          │
          ↓
       s(x̄)=s/√n
          │
          ↓
   Type A standard uncertainty
       u_A(x̄)=s/√n
```

Histogram 則主要是資料檢查工具：

```text
重複量測資料
     │
     └──→ Histogram
              ↓
       看中心、散布、形狀、異常
```

它不是後續 GUM uncertainty propagation 的核心計算步驟。

---

# 19. Stage 1 最小記憶包

需要保留下來的公式：

$$
\boxed{
\bar{x}=\frac{1}{n}\sum_i x_i
}
$$

$$
\boxed{
s^2=
\frac{1}{n-1}
\sum_i(x_i-\bar{x})^2
}
$$

$$
\boxed{
s=\sqrt{s^2}
}
$$

$$
\boxed{
u_A(\bar{x})
=
s(\bar{x})
=
\frac{s}{\sqrt n}
}
$$

$$
\boxed{
\nu=n-1
}
$$

Histogram 部分則記：

$$
\boxed{
k_{\mathrm{Sturges}}=1+\log_2 n
}
$$

若需要進行大量數據的 density estimation，可另外考慮：

$$
h_{\mathrm{FD}}=2\,IQR\,n^{-1/3}
$$

但它不是本課程主線目前必須記憶的公式。

---

## Stage 1 完成條件

完成本 Stage 後，應能清楚區分：

1. $\bar{x}$：量測結果的估計值；
2. $s$：單次 observation 的散布；
3. $s/\sqrt n$：平均值的散布；
4. $u_A(\bar{x})$：當平均值作為估計值時的 Type A 標準不確定度；
5. $\nu=n-1$：這組估計的自由度；
6. histogram 是資料分布的描述／檢查工具，bin width 沒有唯一選法。

下一 Stage 將進入 **Stage 2｜常用機率分配**，重點是理解 normal、rectangular、triangular 等 distribution，以及它們之後如何把「已知範圍」轉換成 standard uncertainty。
