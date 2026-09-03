# Stage 8｜標準不確定度之組合

> 對應講義：**(2-05) 標準不確定度之組合**  
> 本 Stage 把各 input standard uncertainties 經 measurement model 傳到 output，並求 combined standard uncertainty 與 effective degrees of freedom。

---

## 1. 從 input component 到 output contribution

對 measurement model：

$$
Y=f(X_1,X_2,\ldots,X_N)
$$

在 estimates $x_i$ 附近的一階 sensitivity coefficient 為：

$$
c_i=\frac{\partial f}{\partial X_i}
$$

第 $i$ 個 input 對 output 的 standard uncertainty contribution 為：

$$
\boxed{u_i(y)=|c_i|u(x_i)}
$$

所有 contributions 經 $c_i$ 換算後，單位都應與 output $y$ 相同。

## 2. 非相關 input quantities

若各 input quantities 之間可視為 uncorrelated：

$$
\boxed{
u_c(y)=
\sqrt{\sum_{i=1}^{N}c_i^2u^2(x_i)}
}
$$

也就是：

$$
\boxed{u_c(y)=\sqrt{\sum_{i=1}^{N}u_i^2(y)}}
$$

這是 root-sum-of-squares（RSS），不是把 standard uncertainties 直接相加。

## 3. Covariance 與 correlation coefficient

兩個 input estimates 的 covariance 記為：

$$
u(x_i,x_j)
$$

Correlation coefficient 定義為：

$$
\boxed{
r(x_i,x_j)=
\frac{u(x_i,x_j)}{u(x_i)u(x_j)}
}
$$

且：

$$
-1\leq r(x_i,x_j)\leq1
$$

- $r>0$：兩者傾向同方向變化；
- $r<0$：兩者傾向反方向變化；
- $r=0$：沒有線性相關。

$r=0$ 不保證兩者在所有意義下都 independent；本課程的 propagation 只需先判斷是否存在需要納入的相關性。

## 4. 相關 input quantities 的組合

一般的一階 propagation law 為：

$$
\boxed{
u_c^2(y)=
\sum_{i=1}^{N}c_i^2u^2(x_i)
+2\sum_{i=1}^{N-1}\sum_{j=i+1}^{N}
c_ic_j u(x_i,x_j)
}
$$

使用 correlation coefficient 可寫成：

$$
u_c^2(y)=
\sum_{i=1}^{N}c_i^2u^2(x_i)
+2\sum_{i=1}^{N-1}\sum_{j=i+1}^{N}
c_ic_j u(x_i)u(x_j)r(x_i,x_j)
$$

Covariance term 可正可負，所以相關情況下 $c_i$ 的 sign 不能先丟掉。

## 5. 為什麼會相關？

常見原因包括：

- 兩個 inputs 使用同一 reference standard；
- 同一環境量同時影響兩個 quantities；
- 兩個 estimates 由同一組 observation data 算出；
- 一個 input 由另一個 input 派生。

教材的長度比較例中，兩物件溫度本身可能高度正相關；改用溫差 $\delta\theta=\theta-\theta_s$ 表示，有時能讓 model 與 covariance structure 更清楚。重新參數化不是為了把真實相關性藏起來，而是用更貼近實際量測的 inputs 表達它。

## 6. 相對組合標準不確定度

相對 combined standard uncertainty 定義為：

$$
\boxed{u_{c,r}(y)=\frac{u_c(y)}{|y|}}
$$

它是非負值，常以百分比或 $\mathrm{\mu m/m}$、$\mathrm{\mu V/V}$ 等比值表示。

對只含乘除與冪次、且 inputs uncorrelated 的 model，相對形式通常最簡潔。例如：

$$
K=\frac{V_s}{V_m}
$$

則：

$$
\boxed{
\left[\frac{u_c(K)}{|K|}\right]^2
=
\left[\frac{u(V_s)}{|V_s|}\right]^2
+
\left[\frac{u(V_m)}{|V_m|}\right]^2
}
$$

只有在 model 結構允許時才使用這個相對公式；一般 model 仍應由 derivatives 推導。

## 7. Effective degrees of freedom

Combined standard uncertainty 由多個具有不同自由度的 components 組成。教材使用 Welch–Satterthwaite formula：

$$
\boxed{
\nu_{\mathrm{eff}}=
\frac{u_c^4(y)}{
\displaystyle\sum_{i=1}^{N}\frac{u_i^4(y)}{\nu_i}}
}
$$

其中：

$$
u_i(y)=|c_i|u(x_i)
$$

若某 component 的 $\nu_i=\infty$，則：

$$
\frac{u_i^4(y)}{\nu_i}=0
$$

它仍會進入 $u_c(y)$，只是不會增加分母中的有限自由度項。

為避免低估 expanded uncertainty，教材要求將 $\nu_{\mathrm{eff}}$ 的小數無條件捨去後再查表：

$$
\nu_{\mathrm{eff}}=26.8\quad\Rightarrow\quad\nu_{\mathrm{eff}}=26
$$

## 8. 由自由度取得 coverage factor

若要求中央約 $95\%$ 的 coverage，使用 two-sided Student's $t$ factor：

$$
\boxed{k=t_{0.975,\nu_{\mathrm{eff}}}}
$$

教材也記作 $t_{95}(\nu_{\mathrm{eff}})$。例如：

$$
\nu_{\mathrm{eff}}=26
\quad\Rightarrow\quad
k\approx2.06
$$

最後：

$$
\boxed{U=ku_c(y)}
$$

自由度小時 $k$ 可能明顯大於 $2$；自由度趨近無窮大時，中央 $95\%$ 的 normal factor 趨近 $1.96$。

## 9. 最小計算例

假設：

$$
Y=X_1+2X_2
$$

$$
u(x_1)=0.30\ \mathrm{mm},\qquad
u(x_2)=0.20\ \mathrm{mm}
$$

且兩者 uncorrelated。由：

$$
c_1=1,qquad c_2=2
$$

得到 contributions：

$$
u_1(y)=0.30\ \mathrm{mm},\qquad
u_2(y)=0.40\ \mathrm{mm}
$$

所以：

$$
u_c(y)=\sqrt{0.30^2+0.40^2}=0.50\ \mathrm{mm}
$$

這也說明 input standard uncertainty 較小，不代表 output contribution 較小；應比較 $|c_i|u(x_i)$。

## 10. Uncertainty budget 的最低欄位

| Input $x_i$ | Type / distribution | $u(x_i)$ | $c_i$ | $u_i(y)$ | $\nu_i$ |
|---|---|---:|---:|---:|---:|
| $x_1$ | A 或 B |  |  |  |  |
| $x_2$ | A 或 B |  |  |  |  |

表格之後至少應列出：

$$
y,\qquad u_c(y),\qquad \nu_{\mathrm{eff}},\qquad k,\qquad U
$$

## 11. Stage 8 最小記憶包

$$
\boxed{u_i(y)=|c_i|u(x_i)}
$$

$$
\boxed{u_c(y)=\sqrt{\sum_i u_i^2(y)}}
\qquad\text{inputs uncorrelated}
$$

$$
\boxed{
\nu_{\mathrm{eff}}=
\frac{u_c^4(y)}{\sum_i u_i^4(y)/\nu_i}
}
$$

主線是：

```text
u(x_i) → c_i u(x_i) → covariance check → u_c(y) → ν_eff → k → U
```

## Stage 8 完成條件

完成本 Stage 後，應能：

1. 計算每個 output uncertainty contribution；
2. 對 uncorrelated inputs 使用 RSS；
3. 有相關性時加入 covariance terms；
4. 解釋 correlation coefficient 的 sign 與範圍；
5. 在適用的乘除 model 使用 relative uncertainty；
6. 用 Welch–Satterthwaite formula 求 $\nu_{\mathrm{eff}}$；
7. 無條件捨去有效自由度後查 $t$ table；
8. 由 $U=ku_c(y)$ 得到 expanded uncertainty。

---

下一 Stage：**Stage 9｜量測結果與不確定度之表示**。將處理 $u_c$、$U$、relative uncertainty、有效位數、單位與報告必要資訊。
