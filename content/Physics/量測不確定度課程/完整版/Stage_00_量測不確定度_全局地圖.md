# Stage 0：量測不確定度全局地圖

> 目標：先建立整門量測不確定度課程的整體圖像。此階段不追求細節推導，只要求知道「我們到底在做什麼、每一步為什麼存在、最後要得到什麼」。

主要參考：ISO/IEC Guide 98-3（GUM / JCGM 100）與「量測不確定度先修班」講義。

---

## 0.1 最終問題：量測結果應該長什麼樣？

假設量得某個量：

$$
y=10.03\ \mathrm{V}
$$

單獨報告 `10.03 V` 並沒有完整描述我們對量測結果的認識，因為結果還會受到重複性、儀器校正、解析度、環境條件、標準器等因素影響。

最後通常希望得到類似：

$$
\boxed{Y=(10.03\pm0.05)\ \mathrm{V}}
$$

並說明例如：

$$
k=2,\qquad P\approx95\%.
$$

其中 $0.05\ \mathrm{V}$ 是**擴充不確定度（expanded uncertainty）** $U$。

---

## 0.2 整門課其實只有一條主線

$$
\boxed{
\text{Measurand}
\rightarrow
\text{Measurement model}
\rightarrow
\text{Uncertainty sources}
\rightarrow
u(x_i)
\rightarrow
c_i
\rightarrow
u_c(y)
\rightarrow
k
\rightarrow
U
}
$$

也就是：

1. **我要量什麼？**
2. **這個量和哪些輸入量有關？**
3. **哪些因素具有不確定性？**
4. **每個因素的不確定度有多大？**
5. **每個因素對最後結果影響多大？**
6. **把所有不確定度合成。**
7. **決定涵蓋因子 $k$。**
8. **得到擴充不確定度 $U$ 並報告結果。**

後續課程基本上只是在逐步展開這八件事。

---

# 1. 定義被量測量（Measurand）

首先必須明確定義到底要量什麼，記為：

$$
Y.
$$

例如不是籠統地說「量電阻」，而是明確指定條件與量測對象。

如果 measurand 沒有定義清楚，就無法判斷後續哪些因素應納入量測模型與不確定度分析。

---

# 2. 建立量測模型（Measurement Model）

GUM 的核心形式為：

$$
\boxed{Y=f(X_1,X_2,\ldots,X_N)}
$$

其中：

- $Y$：輸出量／被量測量；
- $X_i$：輸入量。

例如利用電壓與電流求電阻：

$$
R=\frac{V}{I}.
$$

則輸入量至少包括：

$$
V,\ I.
$$

如果還要進行溫度修正，模型可能變成：

$$
R_{20}=\frac VI[1+\alpha(20-T)].
$$

此時輸入量便包含：

$$
V,\ I,\ \alpha,\ T,\ldots
$$

因此，不確定度分析不是先打開 Excel 做平方和，而是先問：

> **我的 measurement model 是什麼？**

---

# 3. 每個輸入量都有 Standard Uncertainty

即使寫成：

$$
V=10.000\ \mathrm{V},
$$

也不代表我們知道真值恰好就是 $10.000\ \mathrm{V}$。

對每一個輸入量 $X_i$，需要評估其**標準不確定度（standard uncertainty）**：

$$
\boxed{u(x_i)}.
$$

所有不同來源的不確定資訊，最後都盡可能轉換到相同的「標準差尺度」，才能進一步合成。

---

# 4. Type A 與 Type B

A/B 類分類的重點是：

> **使用什麼方法評估標準不確定度。**

不是簡單等同於「隨機誤差 vs. 系統誤差」。

## 4.1 Type A

利用觀測資料的統計分析評估。

例如重複量測：

$$
x_1,x_2,\ldots,x_n.
$$

得到平均值：

$$
\bar{x}=\frac1n\sum_{i=1}^{n}x_i.
$$

若最後使用的是這 $n$ 次量測的平均值，典型的 Type A standard uncertainty 為：

$$
\boxed{u_A(\bar{x})=\frac{s}{\sqrt n}}
$$

其中 $s$ 為樣本標準差。

後續 Stage 1 會詳細處理 $s$、$s^2$、$s/\sqrt n$ 與自由度。

## 4.2 Type B

不是由此次觀測資料的統計分析直接得到，而是根據其他資訊評估，例如：

- 校正證書；
- 儀器解析度；
- 製造商規格；
- 過去量測資料；
- 參考資料；
- 物理或工程知識。

例如數位儀器解析度為：

$$
d=0.01\ \mathrm{mm}.
$$

若 rounding error 被視為均勻分布於：

$$
-\frac d2\leq\delta\leq+\frac d2,
$$

則：

$$
\boxed{u_{\mathrm{res}}=\frac{d}{\sqrt{12}}}.
$$

---

# 5. 為什麼需要機率分布？

因為不同來源給你的資訊形式不同，但最後都要轉成：

$$
u(x_i).
$$

例如只知道某誤差落在：

$$
-a\leq x\leq a.
$$

若假設為 rectangular distribution：

$$
\boxed{u(x)=\frac{a}{\sqrt3}}.
$$

若假設為 triangular distribution：

$$
\boxed{u(x)=\frac{a}{\sqrt6}}.
$$

因此先修講義中的機率分布不是要我們完整重修機率論，而是為了解決：

> **已知某種形式的資訊，如何把它轉換成 standard uncertainty？**

---

# 6. Sensitivity Coefficient

不同輸入量的不確定度對輸出量的影響不一定相同。

對：

$$
Y=f(X_1,X_2,\ldots,X_N),
$$

定義 sensitivity coefficient：

$$
\boxed{c_i=\frac{\partial f}{\partial X_i}}.
$$

例如：

$$
R=\frac VI,
$$

則：

$$
c_V=\frac{\partial R}{\partial V}=\frac1I,
$$

$$
c_I=\frac{\partial R}{\partial I}=-\frac{V}{I^2}.
$$

某輸入量造成的輸出標準不確定度 contribution 約為：

$$
\boxed{u_i(y)=|c_i|u(x_i)}.
$$

本質上就是對 measurement model 做一階 Taylor expansion，也就是物理中熟悉的 uncertainty/error propagation。

---

# 7. 合成標準不確定度

如果各輸入量彼此不相關：

$$
\boxed{
u_c^2(y)=\sum_i c_i^2u^2(x_i)}
$$

因此：

$$
\boxed{
u_c(y)=\sqrt{\sum_i[c_i u(x_i)]^2}}.
$$

也就是常見的 root sum of squares（RSS）。

這個量稱為：

> **combined standard uncertainty** $u_c$。

---

# 8. 如果輸入量彼此相關

如果 $X_i$ 之間存在相關性，就不能只做簡單平方和。

一階近似下：

$$
\boxed{
u_c^2(y)=
\sum_i c_i^2u^2(x_i)
+2\sum_{i<j}c_ic_j u(x_i,x_j)}.
$$

其中：

$$
u(x_i,x_j)
$$

代表 covariance。

也可使用 correlation coefficient：

$$
u(x_i,x_j)=r_{ij}u(x_i)u(x_j).
$$

---

# 9. 從 $u_c$ 到 Expanded Uncertainty

$u_c$ 仍然是在 standard deviation 的尺度上表示結果的不確定性。

實務上通常希望給出具有較高 coverage probability 的區間，因此定義：

$$
\boxed{U=ku_c}
$$

其中：

- $U$：expanded uncertainty；
- $k$：coverage factor。

常見情況下：

$$
k\approx2
$$

可對應大約 $95\%$ 的 coverage probability。

但不能把「$k=2$」當成任何情況下都成立的定律。

當自由度有限時，可能需要考慮：

$$
\nu_{\mathrm{eff}}
$$

以及 Student's $t$ distribution，進而決定適當的 $k$。

---

# 10. Uncertainty Budget

實務上通常把各來源整理成 uncertainty budget，例如：

| Source $X_i$ | Type | Distribution | Standard uncertainty | Sensitivity coefficient | Contribution |
|---|---|---|---:|---:|---:|
| 重複性 | A | Normal | $u_A$ | $1$ | $u_A$ |
| 校正 | B | Normal | $U_{cal}/k$ | $1$ | $u_{cal}$ |
| 解析度 | B | Rectangular | $d/\sqrt{12}$ | $1$ | $u_{res}$ |
| 溫度 | B | 視資訊而定 | $u_T$ | $c_T$ | $c_Tu_T$ |

如果彼此不相關：

$$
u_c=
\sqrt{
u_A^2+
u_{cal}^2+
u_{res}^2+(c_Tu_T)^2+\cdots}.
$$

然後：

$$
U=ku_c.
$$

最後報告：

$$
\boxed{Y=y\pm U}
$$

並同時說明 coverage factor $k$，必要時說明 coverage probability。

---

# 11. Stage 0 最重要的一張圖

```text
                    ┌─ 重複量測 ── Type A ─┐
                    │                       │
Measurand            ├─ 校正證書 ── Type B ┤
   ↓                 │                       │
Y = f(X1,...,XN) ────┼─ 解析度 ──── Type B ┤
   ↓                 │                       │
每個 Xi 的 u(xi)  ←──┴─ 其他來源 ── Type B ┘
   ↓
Sensitivity coefficient
ci = ∂f/∂Xi
   ↓
Uncertainty contribution
ui(y) = ci u(xi)
   ↓
合成
uc = √Σui²
   ↓
有效自由度 νeff
   ↓
Coverage factor k
   ↓
U = k uc
   ↓
────────────────────────
       Y = y ± U
────────────────────────
```

如果這張圖理解了，後面的講義基本上就是依序放大其中每一格。

---

# 12. 後續 Stage 地圖

| Stage | 主題 | 核心問題 |
|---|---|---|
| **0** | 全局地圖 | 整套 uncertainty evaluation 在幹什麼？ |
| **1** | 最低限度統計 | 平均、variance、standard deviation、standard error、自由度是什麼？ |
| **2** | 機率分布 | Normal、t、rectangular、triangular 等如何使用？ |
| **3** | 常態分布與區間 | Coverage probability 與 $k$ 從哪裡來？ |
| **4** | 不確定度核心概念 | Measurand、error、uncertainty 有何不同？ |
| **5** | 量測模型 | 如何建立 $Y=f(X_1,\ldots,X_N)$ 並找 uncertainty sources？ |
| **6** | Type A | 如何由重複量測得到 $u_A$？ |
| **7** | Type B | 如何由證書、解析度、規格等得到 $u_B$？ |
| **8** | 不確定度傳播 | 如何用 $c_i$、covariance 得到 $u_c$？ |
| **9** | 擴充與報告 | 如何由 $u_c$ 得到 $U$，並正確報告結果？ |
| **10** | 完整案例 | 如何從原始資料一路建立完整 uncertainty budget？ |

其中 **Stage 4–10 是量測不確定度的核心**；Stage 1–3 是必要的統計先修。

---

# 13. Stage 0 最低通關要求

完成 Stage 0 後，只需要能回答以下問題：

1. 什麼是 measurand？
2. 為什麼第一步要建立 measurement model？
3. $u(x_i)$ 代表什麼？
4. Type A / Type B 分類是在分什麼？
5. 為什麼不同 uncertainty source 最後要轉成 standard uncertainty？
6. $c_i=\partial f/\partial X_i$ 在做什麼？
7. $u_c$ 和 $U$ 有什麼差別？
8. 為什麼不能永遠無腦取 $k=2$？
9. 能否看著下式說出每一步的意義？

$$
\boxed{
Y=f(X_i)
\rightarrow
u(x_i)
\rightarrow
c_i u(x_i)
\rightarrow
u_c
\rightarrow
U=ku_c
\rightarrow
Y=y\pm U
}
$$

能做到這些，就可以進入 **Stage 1：最低限度統計**。
