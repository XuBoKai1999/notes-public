# Stage 02｜常用機率分配・考前急速版

## 唯一目的

$$
\boxed{\text{已知資訊}\rightarrow\text{選 distribution}\rightarrow\text{取 standard deviation}=u(x)}
$$

## 必背表

令 $a$ 為相對中心的 half-width。

| Distribution / 資訊 | Standard uncertainty |
|---|---:|
| Normal，已知 standard deviation | $\sigma$ |
| Rectangular，$\pm a$ 內等可能 | $a/\sqrt3$ |
| Triangular，中央最可能 | $a/\sqrt6$ |
| U-shaped，兩端較可能 | $a/\sqrt2$ |
| Resolution $d$，rounding 為 $\pm d/2$ | $d/\sqrt{12}$ |
| Student's $t$ | 由自由度 $\nu$ 決定 tails |

相同 bounds：

$$
u_{tri}<u_{rect}<u_U
$$

## 機率密度最低限度

| 概念 | 記法 |
|---|---|
| Density 非負 | $p(x)\geq0$ |
| 總面積 | $\int p(x)\,\mathrm dx=1$ |
| 區間 probability | $P(a<X<b)=\int_a^b p(x)\,\mathrm dx$ |

## 最易錯

- 規格 $\pm a$：half-width 是 $a$，rectangular 時除 $\sqrt3$。
- Resolution $d$：half-width 是 $d/2$，所以除 $\sqrt{12}$。
- 看到 $\pm$ 先確認它是 bounds、coverage interval 還是 expanded uncertainty。
