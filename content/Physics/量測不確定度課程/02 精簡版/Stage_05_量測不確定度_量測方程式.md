# Stage 05｜量測方程式

> 對應講義：**(2-02) 量測方程式**

## 從量測動作到 model

$$
\boxed{Y=f(X_1,X_2,\ldots,X_N)}
$$

代入 input estimates：

$$
\boxed{y=f(x_1,x_2,\ldots,x_N)}
$$

$Y$ 是 output quantity／measurand，$X_i$ 是 input quantities；小寫表示其 estimates。

Input 可以是 reading、reference value、correction、環境量或 material coefficient，不一定是直接讀到的數字。

## Direct measurement 仍需要 model

最簡單的直讀式量測可寫：

$$
Y=R
$$

若納入 calibration correction $C$ 與其他 effects：

$$
Y=R+C+e_1+e_2+\cdots
$$

某 effect 的最佳 estimate 可以是零，但 uncertainty 不一定為零：

$$
e_i=0\not\Rightarrow u(e_i)=0
$$

Correction 的加減號必須依 certificate 對器差的定義決定。

## Model 依實際關係而定

Effects 可能是 additive：

$$
Y=X+C
$$

也可能是 multiplicative：

$$
Y=KX
$$

不能把所有來源一律寫成 $+\delta$。Model 應納入對 result 或 uncertainty 有實質影響的 quantities；經合理估計可忽略的 effect 不必無限擴張。

## Sensitivity coefficient

$$
\boxed{c_i=\frac{\partial f}{\partial X_i}}
$$

它表示 $X_i$ 微小變動一單位時，$Y$ 在目前 operating point 附近改變多少。Input 的 output contribution 為：

$$
\boxed{u_i(y)=|c_i|u(x_i)}
$$

$c_i$ 同時完成 sensitivity scaling 與 unit conversion。

## 例：Ohm's law

$$
R=\frac VI
$$

$$
c_V=\frac{\partial R}{\partial V}=\frac1I
$$

$$
c_I=\frac{\partial R}{\partial I}=-\frac{V}{I^2}
$$

負號表示變動方向；standard uncertainty 本身仍為非負值。若 inputs correlated，sign 也會影響 covariance term。

## 為什麼 derivative 有用？

在 estimates 附近做一階 Taylor expansion：

$$
Y-y\approx\sum_i c_i(X_i-x_i)
$$

所以 uncertainty 可沿 model 由 inputs 傳到 output。Nonlinear model 的 $c_i$ 要在實際 operating point 計算。

## 建模順序

```text
定義 measurand
→ 寫出 physical relationship 與實際 procedure
→ 加入必要 corrections / influence quantities
→ 列出 inputs
→ 求 c_i
→ 再評估與組合 uncertainty
```

最小結論：

$$
\boxed{\text{先把 measurement process 寫成 model，再讓 uncertainty 沿 model 傳到 output。}}
$$
