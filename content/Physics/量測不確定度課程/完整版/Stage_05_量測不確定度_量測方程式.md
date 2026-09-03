# Stage 5｜量測方程式：把實際量測變成可計算模型

> 對應講義：**(2-02) 量測方程式**

本 Stage 的核心，是把實際 measurement process 寫成 measurement model，並建立 input quantity、output quantity 與 sensitivity coefficient 的概念。

## 1. 核心模型

$$
\boxed{Y=f(X_1,X_2,\ldots,X_N)}
$$

實際取得 input estimates $x_i$ 後：

$$
\boxed{y=f(x_1,x_2,\ldots,x_N)}
$$

| Symbol | 意義 |
|---|---|
| $Y$ | measurand / output quantity |
| $X_i$ | input quantity |
| $y$ | $Y$ 的 estimate |
| $x_i$ | $X_i$ 的 estimate |
| $u(x_i)$ | input estimate 的 standard uncertainty |

## 2. Measurement equation 描述 measurement process

例如利用 Ohm's law 求 resistance：

$$
R=\frac{V}{I}
$$

在 uncertainty analysis 中，就是：

$$
Y=f(V,I)=\frac{V}{I}
$$

Measurement model 先描述 physics / measurement procedure，uncertainty 再沿著 model propagation。

## 3. Additive correction

若 instrument indication 為 $I$，calibration correction 為 $C_{\mathrm{cal}}$：

$$
Y=I+C_{\mathrm{cal}}
$$

例如：

$$
i=10.020\ \mathrm V,\qquad c_{\mathrm{cal}}=-0.015\ \mathrm V
$$

則：

$$
y=10.020-0.015=10.005\ \mathrm V
$$

## 4. Correction estimate 為零不代表 uncertainty 為零

例如 resolution effect $\delta_{\mathrm{res}}$：

$$
\delta_{\mathrm{res}}=0
$$

但可能：

$$
u(\delta_{\mathrm{res}})\neq0
$$

因此可以寫：

$$
Y=I+C_{\mathrm{cal}}+\delta_{\mathrm{res}}
$$

而不是因 estimate 為零就把該 input 從 model 刪除。

$$
\boxed{x_i=0\not\Rightarrow u(x_i)=0}
$$

## 5. Additive 與 multiplicative effects

Additive correction：

$$
Y=X+C
$$

Multiplicative correction：

$$
Y=KX
$$

更一般可以是：

$$
Y=K_1K_2(X+C_1+C_2)+C_3
$$

因此不能把所有 effects 都機械式寫成 $+\delta$。

## 6. 典型 calibration model

$$
Y=X+C_{\mathrm{cal}}+\delta_{\mathrm{res}}+\delta_{\mathrm{drift}}
$$

其中：

- $X$：instrument indication 或 repeated-measurement mean；
- $C_{\mathrm{cal}}$：calibration correction；
- $\delta_{\mathrm{res}}$：resolution-related effect；
- $\delta_{\mathrm{drift}}$：drift-related effect。

即使：

$$
\delta_{\mathrm{res}}=\delta_{\mathrm{drift}}=0
$$

仍可能：

$$
u(\delta_{\mathrm{res}})>0,\qquad u(\delta_{\mathrm{drift}})>0
$$

## 7. 如何找到 input quantities？

先問：

> 為了算出 measurand，我實際使用了哪些 quantities 或資訊？

Input quantities 常見來源包括：

- 直接量到的 quantities，例如 $V,I,T,L$；
- corrections / influence quantities，例如 $C_{\mathrm{cal}},\Delta T,\alpha$；
- external data / constants，例如 reference standard value、calibration coefficient、material coefficient、geometric factor。

Input quantity 不一定是 instrument reading。

## 8. Ohm's law 範例

$$
R=\frac{V}{I}
$$

所以：

$$
X_1=V,\qquad X_2=I
$$

而：

$$
r=\frac{v}{i}
$$

例如：

$$
v=10.000\ \mathrm V,\qquad i=0.1000\ \mathrm A
$$

得到：

$$
r=100.0\ \Omega
$$

更完整的 measurement model 還可能加入 voltmeter correction、ammeter correction、lead resistance、thermal EMF、self-heating、temperature correction 等。

## 9. Model 不是越複雜越好

原則是：

$$
\boxed{\text{對 result 或 uncertainty 有顯著影響的 quantities 應被適當處理}}
$$

若某 effect 經合理的 magnitude estimate 後完全 negligible，可以有依據地簡化；但不能只因為麻煩而省略。

Model omission 可能比後續算術誤差更嚴重。

## 10. Sensitivity coefficient

若：

$$
Y=f(X_1,\ldots,X_N)
$$

當 $X_i$ 有小變化 $\Delta X_i$：

$$
\Delta Y\approx\frac{\partial f}{\partial X_i}\Delta X_i
$$

因此定義：

$$
\boxed{c_i=\frac{\partial f}{\partial X_i}}
$$

它的物理意義是：

> Input $X_i$ 改變一單位時，output $Y$ 在當下 operating point 附近大約改變多少。

## 11. 最簡單例子

若：

$$
Y=X_1+2X_2
$$

則：

$$
c_1=1,\qquad c_2=2
$$

若：

$$
u(x_1)=u(x_2)=0.1
$$

則 contribution magnitudes：

$$
|c_1|u(x_1)=0.1
$$

$$
|c_2|u(x_2)=0.2
$$

所以不能只比較 $u(x_i)$ 判斷哪個 input 最重要。

## 12. Output uncertainty contribution

Linearized contribution：

$$
\boxed{u_i(y)=c_i u(x_i)}
$$

若只看 magnitude：

$$
\boxed{|u_i(y)|=|c_i|u(x_i)}
$$

例如：

$$
Y=3X,\qquad u(x)=0.20\ \mathrm{mm}
$$

則：

$$
|u_X(y)|=3(0.20)=0.60\ \mathrm{mm}
$$

## 13. Sensitivity coefficient 也負責 unit conversion

假設：

$$
L(T)=L_0[1+\alpha(T-T_0)]
$$

則：

$$
c_T=\frac{\partial L}{\partial T}=L_0\alpha
$$

若 $u(T)$ 的 unit 為 $^\circ\mathrm C$，而 $c_T$ 的 unit 為 $\mathrm{mm}/^\circ\mathrm C$，則：

$$
c_Tu(T)
$$

的 unit 正好是 $\mathrm{mm}$。

因此：

$$
\boxed{\text{sensitivity coefficient 同時完成 sensitivity scaling 與 unit conversion}}
$$

## 14. Nonlinear model 的 sensitivity 取決於 operating point

若：

$$
Y=X^2
$$

則：

$$
c=\frac{\partial Y}{\partial X}=2X
$$

實際在 $X=x$ 處：

$$
\boxed{c=2x}
$$

所以同一個 model 在不同 operating point 下，uncertainty sensitivity 可以不同。

## 15. Ohm's law 的 sensitivity coefficients

$$
R=\frac{V}{I}
$$

對 $V$：

$$
c_V=\frac{1}{I}
$$

對 $I$：

$$
c_I=-\frac{V}{I^2}
$$

負號表示 input perturbation 與 output perturbation 的方向相反，不代表 standard uncertainty 為負。

Independent-input variance combination 後續會使用：

$$
c_i^2u^2(x_i)
$$

而 correlated inputs 則會出現 covariance terms，因此 sensitivity coefficient 的 sign 仍可能有意義。

## 16. 為什麼 derivative 可以 propagation uncertainty？

若：

$$
Y=f(X)
$$

在 estimate $x$ 附近做 first-order Taylor expansion：

$$
f(X)\approx f(x)+f'(x)(X-x)
$$

所以：

$$
Y-y\approx f'(x)(X-x)
$$

因此：

$$
u(y)\approx|f'(x)|u(x)
$$

多變數則：

$$
Y-y\approx\sum_i c_i(X_i-x_i)
$$

這就是後續 law of propagation of uncertainty 的 first-order 基礎。

## 17. Stage 5 先不要急著 RSS

後續會看到：

$$
u_c(y)=\sqrt{\sum_i c_i^2u^2(x_i)}
$$

但順序應該是：

```text
建立 measurement model
        ↓
辨識 input quantities
        ↓
求 sensitivity coefficients
        ↓
再進行 uncertainty combination
```

不要把 uncertainty analysis 退化成「看到幾個 uncertainty numbers 就直接 root-sum-square」。

## 18. Measurement model 不一定是一行 algebra

$Y=f(X_1,\ldots,X_N)$ 中的 $f$ 也可以實作為 calibration curve、interpolation、lookup table、iterative calculation、numerical integration 或 computer program。

核心是：

$$
\boxed{\text{input quantities 如何決定 output quantity 必須明確}}
$$

## 19. Temperature-corrected length 範例

簡化 model：

$$
L_0=L_{\mathrm{ind}}+C_{\mathrm{cal}}-\alpha L_{\mathrm{ind}}(T-T_0)
$$

Inputs：

$$
L_{\mathrm{ind}},\quad C_{\mathrm{cal}},\quad\alpha,\quad T
$$

Sensitivity coefficients：

$$
c_C=1
$$

$$
c_T=-\alpha L_{\mathrm{ind}}
$$

$$
c_\alpha=-L_{\mathrm{ind}}(T-T_0)
$$

$$
c_L=1-\alpha(T-T_0)
$$

若：

$$
T=T_0
$$

則：

$$
c_\alpha=0
$$

即使：

$$
u(\alpha)\neq0
$$

其 first-order contribution 仍為零。

因此：

$$
\boxed{\text{有 uncertainty 的 input，不一定在當下對 output uncertainty 有顯著 contribution}}
$$

真正應看的是：

$$
\boxed{|c_i|u(x_i)}
$$

## 20. 小 input uncertainty 也可能很重要

例如：

$$
u(x_1)=1,\qquad c_1=0.001
$$

則：

$$
|c_1|u(x_1)=0.001
$$

另一個 input：

$$
u(x_2)=0.01,\qquad c_2=100
$$

則：

$$
|c_2|u(x_2)=1
$$

雖然 $u(x_2)\ll u(x_1)$，第二個 input 對 output uncertainty 反而更重要。

## 21. 實際建立 measurement model 的順序

```text
1. 我要的 measurand 是什麼？
        ↓
2. 理想 physical relationship 是什麼？
        ↓
3. 實際 measurement procedure 做了什麼？
        ↓
4. 有哪些已知 corrections？
        ↓
5. 哪些 influence quantities 會顯著影響 result？
        ↓
6. 寫成 Y = f(X1, X2, ..., XN)
```

較好的順序是：

$$
\boxed{
\text{measurand}
\rightarrow
\text{measurement model}
\rightarrow
\text{inputs}
\rightarrow
\text{uncertainty evaluation}
}
$$

而不是先列一堆 uncertainty source 名稱，再硬塞進 budget。

## 22. 最小 uncertainty-budget 雛形

假設：

$$
Y=X_1+2X_2
$$

且：

$$
u(x_1)=0.30\ \mathrm{mm},\qquad
u(x_2)=0.20\ \mathrm{mm}
$$

則：

$$
c_1=1,\qquad c_2=2
$$

| Input | $u(x_i)$ | $c_i$ | $c_i u(x_i)$ |
|---|---:|---:|---:|
| $X_1$ | $0.30\ \mathrm{mm}$ | $1$ | $0.30\ \mathrm{mm}$ |
| $X_2$ | $0.20\ \mathrm{mm}$ | $2$ | $0.40\ \mathrm{mm}$ |

雖然：

$$
u(x_2)<u(x_1)
$$

但：

$$
|c_2|u(x_2)>|c_1|u(x_1)
$$

因此 $X_2$ 對 output uncertainty 更重要。

# 23. Stage 5 最小記憶包

Measurement model：

$$
\boxed{Y=f(X_1,X_2,\ldots,X_N)}
$$

Output estimate：

$$
\boxed{y=f(x_1,x_2,\ldots,x_N)}
$$

Sensitivity coefficient：

$$
\boxed{c_i=\frac{\partial f}{\partial X_i}}
$$

Linearized output contribution：

$$
\boxed{u_i(y)=c_i u(x_i)}
$$

Contribution magnitude：

$$
\boxed{|u_i(y)|=|c_i|u(x_i)}
$$

最重要的直覺：

$$
\boxed{c_i=\text{input }X_i\text{ 改一點，output }Y\text{ 在當下附近會跟著改多少}}
$$

整個 Stage 的一句話版本：

> **先把 measurement process 寫成 model，再讓 uncertainty 沿著 model 傳到 output。**

## Stage 5 完成條件

完成本 Stage 後，應能：

1. 區分 $Y$、$X_i$ 與 $y$、$x_i$；
2. 從 measurement process 寫出基本 measurement model；
3. 理解 correction estimate 為零不代表其 uncertainty 為零；
4. 區分 additive 與 multiplicative effects；
5. 理解 model 應包含重要 effects，但不必無限制複雜化；
6. 計算 sensitivity coefficient $c_i$；
7. 解釋 $c_i$ 的 physical meaning；
8. 理解 sensitivity coefficient 可以完成 unit conversion；
9. 理解 nonlinear model 的 $c_i$ 依 operating point 而變；
10. 知道負的 $c_i$ 不代表 standard uncertainty 為負；
11. 理解 first-order derivative 與 uncertainty propagation 的關係；
12. 知道真正應比較的是 $|c_i|u(x_i)$，而不是只比較 $u(x_i)$。

---

下一 Stage：**Stage 6｜A 類標準不確定度之評估**。  
將正式處理 repeated measurements、$s/\sqrt n$、degrees of freedom，以及不同 repeated-measurement situations 與 pooled standard deviation。
