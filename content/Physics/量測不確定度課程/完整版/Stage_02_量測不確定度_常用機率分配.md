# Stage 2｜常用機率分配：從可能值分布到標準不確定度

> 對應講義：**(1-02) 常用機率分配之介紹**  
> 本 Stage 的目的不是完整學習機率論，而是建立後續 Type B 標準不確定度評估所需的機率分布直覺。

---

## 1. 本 Stage 的核心

量測不確定度分析經常面對這種問題：

> 某個輸入量的精確值不知道，但我們掌握它的可能範圍、校正資訊、解析度或其他先驗資訊。要如何把這些資訊轉換成可以計算的不確定度？

核心流程是：

```text
對輸入量掌握的資訊
        ↓
選擇合理的 probability distribution
        ↓
求該 distribution 的 standard deviation
        ↓
得到 standard uncertainty u(x)
```

因此本 Stage 最重要的觀念是：

$$
\boxed{
u(x)=\text{描述該輸入量可能值分布寬度的 standard deviation}
}
$$

GUM 的核心做法是將不同來源的不確定度最後都表達成標準差尺度，使它們可以在後續的 uncertainty propagation 中一致處理。

---

## 2. Random variable 與 probability distribution

Random variable（隨機變數）可以先理解成：

> 一個可能取得不同數值，而且不同數值具有某種機率規律的量。

例如：

$$
X=\text{某次重複量測得到的電壓}
$$

每次 observation 可能略有不同。

但在量測不確定度中，probability distribution 不一定只描述「某個東西真的在隨機跳動」。

它也可以描述：

> 根據目前掌握的資訊，哪些值可以合理地歸給某個未知量，以及這些值的相對可能程度。

例如儀器規格只告訴我們某個 correction $\delta$ 滿足：

$$
-0.10\ \mathrm{V}\leq\delta\leq+0.10\ \mathrm{V}
$$

$\delta$ 未必正在隨時間隨機跳動；但因為其精確值未知，我們仍可用 probability distribution 描述目前對它的知識。

---

## 3. 機率與機率密度的記號

本教材統一採用：

- $P(\cdots)$：probability；
- $p(x)$：probability density；
- $X$：random variable。

這樣可以明確區分「機率」與「機率密度」。

---

## 4. 離散型與連續型 random variable

### 4.1 離散型

例如骰子：

$$
X\in\{1,2,3,4,5,6\}
$$

可以直接寫：

$$
P(X=3)=\frac16
$$

單一數值本身可以具有非零 probability。

### 4.2 連續型

例如溫度、長度或電壓，可以理想化為 continuous random variable。

此時使用 probability density：

$$
p(x)
$$

並滿足：

$$
p(x)\geq0
$$

以及 normalization：

$$
\boxed{
\int_{-\infty}^{\infty}p(x)\,\mathrm{d}x=1
}
$$

對 continuous random variable，單一點通常有：

$$
P(X=x)=0
$$

真正有意義的是區間 probability：

$$
\boxed{
P(a<X<b)
=
\int_a^b p(x)\,\mathrm{d}x
}
$$

因此：

$$
\boxed{
\text{probability density 的高度本身不是 probability；面積才是 probability。}
}
$$

這與 Stage 1 中 normalized histogram 的概念相連。

---

## 5. Expectation、variance 與 standard deviation

對 probability density $p(x)$，expectation 為：

$$
\mu
=
E[X]
=
\int_{-\infty}^{\infty}x\,p(x)\,\mathrm{d}x
$$

variance 為：

$$
\sigma^2
=
E[(X-\mu)^2]
$$

也就是：

$$
\sigma^2
=
\int_{-\infty}^{\infty}(x-\mu)^2p(x)\,\mathrm{d}x
$$

standard deviation 為：

$$
\boxed{
\sigma=\sqrt{\sigma^2}
}
$$

可以先用以下圖像理解：

| Quantity | 意義 |
|---|---|
| $\mu$ | distribution 的中心位置 |
| $\sigma^2$ | 平方尺度的散布程度 |
| $\sigma$ | distribution 的典型寬度 |

後續量測不確定度最在乎的是 $\sigma$，因為 standard uncertainty 就是以 standard-deviation scale 表示。

---

# 6. Normal distribution

Normal distribution 可寫成：

$$
X\sim N(\mu,\sigma^2)
$$

其 probability density 為：

$$
p(x)
=
\frac{1}{\sqrt{2\pi}\sigma}
\exp
\left[
-\frac{(x-\mu)^2}{2\sigma^2}
\right]
$$

目前不需要背這個公式。

真正需要知道的是：

$$
E[X]=\mu
$$

以及：

$$
\operatorname{Var}(X)=\sigma^2
$$

所以它的 standard deviation 就是：

$$
\sigma
$$

$\sigma$ 越大，distribution 越寬。

Normal distribution 的涵蓋機率、standard normal、$z$ 值與經驗法則會留到 Stage 3 正式處理。

---

# 7. Rectangular distribution

假設只知道：

$$
-a\leq X\leq+a
$$

而且沒有額外資訊顯示區間內哪一部分比較可能。

最簡單的模型是：

> $[-a,a]$ 中所有位置等可能。

這就是 rectangular distribution。

其 probability density 為：

$$
p(x)=\frac{1}{2a},
\qquad -a\leq x\leq a
$$

因為左右對稱：

$$
E[X]=0
$$

variance 為：

$$
\sigma^2
=
\int_{-a}^{a}x^2\frac{1}{2a}\,\mathrm{d}x
$$

計算得到：

$$
\sigma^2=\frac{a^2}{3}
$$

因此：

$$
\boxed{
\sigma=\frac{a}{\sqrt3}
}
$$

若用於 standard uncertainty：

$$
\boxed{
u(x)=\frac{a}{\sqrt3}
}
$$

這是後續 Type B 評估最常見的換算之一。

---

## 8. 為什麼不能直接把 $a$ 當 standard uncertainty？

如果只知道：

$$
-a\leq X\leq+a
$$

其中 $a$ 是 distribution 的 half-width，也就是 bound 到中心的距離。

但 standard uncertainty 要的是 standard deviation。

所以：

$$
a\neq u(x)
$$

如果採 rectangular distribution：

$$
\boxed{
u(x)=\frac{a}{\sqrt3}
}
$$

後面看到各種「除以 $\sqrt3$」、「除以 $\sqrt6$」時，本質上都只是在：

> 把原始資訊轉換成該 distribution 的 standard deviation。

---

# 9. Digital resolution 為什麼是除以 $\sqrt{12}$？

假設 digital instrument 的 resolution 為：

$$
d
$$

若顯示值是四捨五入到最接近的一格，rounding error 的範圍為：

$$
-\frac d2
\leq
\delta_{\mathrm{res}}
\leq
+\frac d2
$$

因此 rectangular distribution 的 half-width 是：

$$
a=\frac d2
$$

代入：

$$
u_{\mathrm{res}}
=
\frac{a}{\sqrt3}
$$

得到：

$$
u_{\mathrm{res}}
=
\frac{d/2}{\sqrt3}
$$

也就是：

$$
\boxed{
u_{\mathrm{res}}
=
\frac{d}{\sqrt{12}}
}
$$

所以 $d/\sqrt{12}$ 並不是另一條獨立公式，而只是 rectangular distribution 的特殊情況。

---

## 10. 注意兩種不同的「$\pm$」

如果規格直接表示 correction 的可能範圍為：

$$
\pm0.01\ \mathrm{V}
$$

而採 rectangular distribution，則：

$$
a=0.01\ \mathrm{V}
$$

所以：

$$
u=\frac{0.01}{\sqrt3}\ \mathrm{V}
$$

但如果：

$$
d=0.01\ \mathrm{V}
$$

表示 digital resolution，且假設 rounding 到最近一格，則 error bounds 是：

$$
\pm0.005\ \mathrm{V}
$$

因此：

$$
u=\frac{0.01}{\sqrt{12}}\ \mathrm{V}
$$

所以看到「resolution」與「$\pm a$ 規格」時不能直接套同一個數字。

---

# 11. Triangular distribution

假設仍然知道：

$$
-a\leq X\leq+a
$$

但這次還有額外資訊：

> 中央附近的值比較可能，越靠近 bounds 越不可能。

此時可以使用 symmetric triangular distribution。

其 variance 為：

$$
\sigma^2=\frac{a^2}{6}
$$

所以：

$$
\boxed{
u(x)=\frac{a}{\sqrt6}
}
$$

比較 rectangular：

$$
u_{\mathrm{rect}}
=
\frac{a}{\sqrt3}
$$

與 triangular：

$$
u_{\mathrm{tri}}
=
\frac{a}{\sqrt6}
$$

可以得到：

$$
u_{\mathrm{tri}}<u_{\mathrm{rect}}
$$

原因不是 triangular distribution 比較「精準」，而是 triangular assumption 加入了更多資訊：

> 中央值比兩端值更可能。

Probability mass 更集中在中心，因此 variance 較小。

所以應記住：

$$
\boxed{
\text{distribution 的選擇是在表達我們掌握了什麼資訊。}
}
$$

---

# 12. Trapezoidal distribution

Rectangular 與 triangular 之間還可以有 trapezoidal distribution。

其概念是：

- 中央一段的 probability density 近似固定；
- 越靠近 bounds，probability density 越低。

它可以視為 rectangular 與 triangular 之間的中間情況。

目前不需要背其 variance 公式；知道它存在，以及 distribution 不必只限於幾個固定形狀即可。

---

# 13. U-shaped distribution

U-shaped distribution 一開始可能很不直覺。

它表示：

> 中央附近的值反而比較不常出現，靠近兩端的值比較常出現。

對常見的 symmetric U-shaped distribution，其範圍為：

$$
-a<X<a
$$

standard deviation 為：

$$
\boxed{
u(x)=\frac{a}{\sqrt2}
}
$$

因此相同 bounds 下：

$$
\boxed{
\frac{a}{\sqrt6}
<
\frac{a}{\sqrt3}
<
\frac{a}{\sqrt2}
}
$$

也就是：

$$
u_{\mathrm{triangular}}
<
u_{\mathrm{rectangular}}
<
u_{\mathrm{U-shaped}}
$$

原因可以直接從 variance 理解：

$$
\sigma^2=E[(X-\mu)^2]
$$

Probability mass 越集中在離中心較遠的位置，variance 就越大。

---

# 14. U-shaped distribution 為什麼在物理上可能出現？

U-shaped distribution 並不代表「相同條件下，物理系統莫名其妙有兩個答案」。

一個非常自然的來源是：

> 存在另一個未知變數，例如 phase，而我們觀察的 quantity 是它的 nonlinear transformation。

考慮：

$$
X=A\sin\theta
$$

其中 phase $\theta$ 是均勻分布：

$$
\theta\sim U(0,2\pi)
$$

也就是我們不知道量測發生在哪個 phase。

雖然 $\theta$ 是 uniform，但經過 nonlinear transformation：

$$
X=A\sin\theta
$$

之後，$X$ 並不是 uniform。

其 probability density 為：

$$
\boxed{
p(x)
=
\frac{1}{\pi\sqrt{A^2-x^2}},
\qquad -A<x<A
}
$$

這就是典型的 U-shaped，也稱為 arcsine distribution。

---

## 15. 用 harmonic oscillator 理解 U-shape

考慮 classical harmonic oscillator：

$$
x(t)=A\cos\omega t
$$

如果在隨機時間拍一張照片，問：

> 最常看到質點在哪裡？

質點經過：

$$
x=0
$$

時速度最大，因此很快穿過中央。

在 turning points：

$$
x=\pm A
$$

附近速度變小，並在端點瞬間變成零。

因此隨機取樣時間時，會比較常看到：

$$
x\approx+A
$$

或：

$$
x\approx-A
$$

而比較少看到：

$$
x\approx0
$$

所以 position distribution 自然呈 U-shaped。

這個例子說明：

$$
\boxed{
\text{Uniform phase}
\xrightarrow{\text{nonlinear transformation}}
\text{U-shaped observable}
}
$$

U-shaped distribution 因此完全可以來自正常的 deterministic physics 加上一個未知 phase。

---

# 16. 那中央極限定理去哪裡了？

Central Limit Theorem（CLT）並沒有說：

> 所有 random variable 都會是 normal distribution。

它大致處理的是：

> 很多獨立或適當弱相關、具有有限 variance 的 random variables 相加或取平均後，在適當條件下，其標準化結果趨近 normal distribution。

例如：

$$
Y=X_1+X_2+\cdots+X_n
$$

當 $n$ 很大且條件適當時，$Y$ 才可能近似 normal。

但：

$$
X=A\sin\theta
$$

並不是「大量獨立小效應的和」。

因此 CLT 沒有理由要求它是 normal。

所以必須區分：

### 單一物理機制造成的 distribution

例如：

$$
X=A\sin\theta
$$

phase 未知，可得到 U-shaped distribution。

### 很多小效應的總和

例如：

$$
Y=X_1+X_2+\cdots+X_{100}
$$

這時才可能因 CLT 而接近 normal。

因此：

$$
\boxed{
\text{某一 uncertainty component 是 U-shaped}
\not\Rightarrow
\text{最終 measurement result 也是 U-shaped}
}
$$

很多不同 uncertainty components 經過組合後，output distribution 仍可能近似 normal。

CLT 的正式內容與 normal distribution 的關係留到 Stage 3 再深入處理。

---

# 17. Normal distribution 與「$\pm a$」的另一種情況

看到：

$$
X=\mu\pm a
$$

不能立刻認為應使用 rectangular distribution。

因為「$\pm a$」可能代表不同資訊。

例如如果已知：

$$
a=3\sigma
$$

也就是這個範圍對應 normal distribution 的約 $\pm3\sigma$，那麼：

$$
\boxed{
\sigma=\frac a3
}
$$

而不是：

$$
\frac{a}{\sqrt3}
$$

所以後續做 Type B evaluation 時，第一個問題永遠應該是：

> 這個「$\pm$」究竟代表 absolute bounds、coverage interval、expanded uncertainty，還是其他東西？

因此：

$$
\boxed{
\text{先理解原始資訊的意義，再選 distribution 與 divisor。}
}
$$

---

# 18. Student's $t$ distribution

本講義也介紹 Student's $t$ distribution。

目前只需要建立概念，不需要背其 probability density。

$t$ distribution 與 normal distribution 外形相似，但 tails 較厚。

其關鍵參數是 degrees of freedom：

$$
\nu
$$

當 $\nu$ 較小時，tails 較厚。

當：

$$
\nu\rightarrow\infty
$$

則：

$$
\boxed{
t_\nu\rightarrow N(0,1)
}
$$

它會在 population standard deviation $\sigma$ 未知、只能利用有限樣本估計 $s$ 時自然出現。

Stage 1 已經看到：

$$
\nu=n-1
$$

後續在 coverage factor 與有限自由度問題中，Student's $t$ distribution 會再次出現。

目前不需要深入其 PDF 推導。

---

# 19. Stage 1 與 Stage 2 如何接起來？

現在已有兩種得到 standard uncertainty 的典型途徑。

### 從 repeated observations 得到

Stage 1：

$$
\boxed{
u_A(\bar{x})=\frac{s}{\sqrt n}
}
$$

### 從其他資訊與 distribution 得到

例如只知道 bounds：

$$
-a\leq X\leq+a
$$

若區間內沒有更多資訊，採 rectangular：

$$
\boxed{
u(x)=\frac{a}{\sqrt3}
}
$$

若有理由認為中央較可能，採 triangular：

$$
\boxed{
u(x)=\frac{a}{\sqrt6}
}
$$

兩條路最後都得到：

$$
u(x_i)
$$

後面才能放進同一個 uncertainty budget 中進行 propagation。

---

# 20. 實際例子

假設進行長度量測。

重複量測得到：

$$
s=0.030\ \mathrm{mm}
$$

且：

$$
n=9
$$

Type A standard uncertainty：

$$
u_A
=
\frac{0.030}{\sqrt9}
=
0.010\ \mathrm{mm}
$$

同時儀器某項規格指出 correction 最大可能為：

$$
\pm0.020\ \mathrm{mm}
$$

沒有更多資訊，因此採 rectangular distribution：

$$
u_{\mathrm{spec}}
=
\frac{0.020}{\sqrt3}
=
0.0115\ \mathrm{mm}
$$

儀器 resolution 為：

$$
d=0.010\ \mathrm{mm}
$$

若 rounding error 採 rectangular distribution：

$$
u_{\mathrm{res}}
=
\frac{0.010}{\sqrt{12}}
=
0.00289\ \mathrm{mm}
$$

因此得到三個 standard uncertainties：

$$
0.010,\qquad
0.0115,\qquad
0.00289\ \mathrm{mm}
$$

它們原始來源不同，但現在都已轉換成：

$$
\boxed{
\text{standard-deviation scale}
}
$$

這就是 probability distribution 在 GUM uncertainty framework 中最主要的功能。

---

# 21. 常用分布整理

| 已知資訊或物理圖像 | Distribution | Standard uncertainty |
|---|---|---:|
| Standard deviation 已知 | Normal | $\sigma$ |
| 只知道 symmetric bounds $\pm a$，區間內無其他資訊 | Rectangular | $a/\sqrt3$ |
| symmetric bounds $\pm a$，中央較可能 | Triangular | $a/\sqrt6$ |
| symmetric bounds $\pm a$，兩端較可能 | U-shaped | $a/\sqrt2$ |
| Digital resolution $d$，rounding error 為 $\pm d/2$ | Rectangular | $d/\sqrt{12}$ |
| 約 $\mu\pm3\sigma$ 的 normal interval | Normal | $a/3$ |

其中最重要的不是死背 divisor，而是：

$$
\boxed{
\text{distribution 必須反映原始資訊或合理的物理機制。}
}
$$

---

# 22. 本 Stage 不需要深入的內容

為了速通量測不確定度，目前不需要深入：

- 各 distribution PDF 的完整推導；
- moment generating function；
- characteristic function；
- beta、gamma、chi-square 等其他分布；
- Student's $t$ PDF 的推導；
- 更一般的 probability transformation theory。

目前只需要能根據資訊判斷合理 distribution，並知道如何取得 standard deviation。

---

# 23. Stage 2 最小記憶包

核心概念：

$$
\boxed{
u(x)=\text{該 probability distribution 的 standard deviation}
}
$$

Rectangular：

$$
\boxed{
u=\frac{a}{\sqrt3}
}
$$

Triangular：

$$
\boxed{
u=\frac{a}{\sqrt6}
}
$$

U-shaped：

$$
\boxed{
u=\frac{a}{\sqrt2}
}
$$

Digital resolution：

$$
\boxed{
u_{\mathrm{res}}=\frac{d}{\sqrt{12}}
}
$$

最重要的判斷原則：

$$
\boxed{
\text{看到「}\pm a\text{」時，先問它代表什麼，再決定如何轉換成 }u.
}
$$

U-shaped 的物理直覺則可記成：

$$
\boxed{
\text{未知 uniform phase}
\xrightarrow{\text{sinusoidal transformation}}
\text{U-shaped observable}
}
$$

而 Central Limit Theorem 只在適當條件下描述大量 random variables 的和或平均趨近 normal，並不要求每一個 uncertainty component 都是 normal。

---

## Stage 2 完成條件

完成本 Stage 後，應能：

1. 區分 probability $P(\cdots)$ 與 probability density $p(x)$；
2. 理解 continuous random variable 的 probability 是 $p(x)$ 下的面積；
3. 理解 standard uncertainty 為 standard-deviation scale；
4. 知道 rectangular、triangular、U-shaped distribution 分別代表什麼資訊；
5. 能使用 $a/\sqrt3$、$a/\sqrt6$、$a/\sqrt2$；
6. 能解釋 digital resolution 為何得到 $d/\sqrt{12}$；
7. 不會看到「$\pm a$」就直接套 rectangular distribution；
8. 知道 U-shaped distribution 可由未知 phase 的 nonlinear transformation 自然產生；
9. 知道 CLT 並不要求所有 random variable 都服從 normal distribution。

下一 Stage：**Stage 3｜常態分配與經驗法則**。將處理 normal distribution、standard normal、$z$ 值、Z-table、68–95–99.7% rule，以及 Central Limit Theorem 到底保證了什麼。
