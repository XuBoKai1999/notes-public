# Stage 05｜量測方程式・考前急速版

## 四個符號

| Symbol | 意義 |
|---|---|
| $Y$ | Measurand / output quantity |
| $X_i$ | Input quantity |
| $y$ | $Y$ 的 estimate |
| $x_i$ | $X_i$ 的 estimate |

$$
\boxed{Y=f(X_1,\ldots,X_N)},\qquad
\boxed{y=f(x_1,\ldots,x_N)}
$$

## Model 形式

| Effect | 例 |
|---|---|
| Direct reading | $Y=R$ |
| Additive correction | $Y=R+C$ |
| Multiplicative correction | $Y=KX$ |

Input 可以是 reading、reference、correction、environment 或 coefficient。Correction sign 必須依 certificate 定義。

Estimate 為零不代表 uncertainty 為零：

$$
x_i=0\not\Rightarrow u(x_i)=0
$$

## Sensitivity coefficient

$$
\boxed{c_i=\frac{\partial f}{\partial X_i}},\qquad
\boxed{u_i(y)=|c_i|u(x_i)}
$$

$c_i$ 表示 input 微變一單位時 output 改多少，也負責 unit conversion。Nonlinear model 要在實際 operating point 求 $c_i$。

### Ohm's law

$$
R=\frac VI,qquad
c_V=\frac1I,qquad
c_I=-\frac{V}{I^2}
$$

負號表示變動方向，不表示 uncertainty 為負；correlated case 中 sign 會影響 covariance term。

## 建模順序

```text
Measurand → physical relationship → actual procedure
→ corrections / influences → inputs → c_i → uncertainty evaluation
```

Model 納入有實質影響的 quantities 即可；不是越長越好。
