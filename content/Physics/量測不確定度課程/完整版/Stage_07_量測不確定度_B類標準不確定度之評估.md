# Stage 7｜B 類標準不確定度之評估

> 對應講義：**(2-04) B 類標準不確定度之評估**  
> 本 Stage 將非本次重複觀測所得的資訊，轉換成 standard-deviation scale 的 $u(x_i)$。

---

## 1. B 類評估是什麼？

當 input estimate $x_i$ 不是由此次一系列重複觀測取得時，依所有可用資訊與科學判斷評估其 variance 或 standard uncertainty，稱為 Type B evaluation。

常見資訊包括：

- calibration certificate；
- manufacturer's specification；
- 儀器解析度與性能資料；
- 過去量測數據；
- 材料或儀器特性的經驗；
- handbook 或 reference data。

Type B 不是「不用根據資料」，而是不用此次 observation series 的統計分析。

## 2. 四個步驟

```text
確認原始資訊與可能變異範圍
        ↓
選擇能反映資訊的 probability distribution
        ↓
換算成 standard uncertainty u(x_i)
        ↓
指定或估算 degrees of freedom ν_i
```

最常見的錯誤，是還沒釐清原始數字代表 half-width、full width、standard uncertainty 或 expanded uncertainty，就直接套除數。

## 3. 常用分布與換算

若 distribution 以平均值 $\mu$ 為中心、half-width 為 $a$：

| 可用資訊 | Distribution | Standard uncertainty |
|---|---|---:|
| 區間內各值等可能 | Rectangular | $a/\sqrt3$ |
| 中央最可能，向兩端線性遞減 | Triangular | $a/\sqrt6$ |
| 兩端比中央更可能 | U-shaped | $a/\sqrt2$ |
| 已知一倍 standard deviation | Normal | $\sigma$ |
| 已知 expanded uncertainty $U$ 與 factor $k$ | Certificate 所述 | $U/k$ |

GUM 的原則是：若只知道 $X_i$ 位於某區間，且沒有理由認為區間內某些值較可能，才採 rectangular distribution。

## 4. Calibration certificate

若證書給出 expanded uncertainty：

$$
U_{\mathrm{cal}}=0.003\ \mathrm{mm},\qquad k=2.04
$$

則標準件追溯的 standard uncertainty 為：

$$
\boxed{u_{\mathrm{cal}}=\frac{U_{\mathrm{cal}}}{k}}
$$

$$
u_{\mathrm{cal}}=\frac{0.003}{2.04}=0.00147\ \mathrm{mm}
$$

若證書已直接給 combined standard uncertainty，便直接引用，不再除以 $k$。

自由度應優先引用證書資訊。例如證書明示 $k=2.04$ 是由 $\nu_{\mathrm{eff}}=30$ 的 $t$ distribution 取得，則此 component 可取：

$$
\nu=30
$$

## 5. Digital resolution

若 digital instrument resolution 為 $d$，rounding error 通常位於：

$$
-\frac d2\leq\delta_{\mathrm{res}}\leq+\frac d2
$$

採 rectangular distribution，half-width 為 $d/2$：

$$
\boxed{u_{\mathrm{res}}=\frac{d}{\sqrt{12}}}
$$

例如 $d=0.001\ \mathrm{mm}$：

$$
u_{\mathrm{res}}=\frac{0.001}{\sqrt{12}}=0.000289\ \mathrm{mm}
$$

不要把 resolution $d$ 誤當成 $\pm d$ 的 half-width。

## 6. 規格給定 $\pm a$

若 linearity specification 是：

$$
\pm2\ \mathrm{\mu m}
$$

且只有 bounds、區間內無其他資訊，則：

$$
u_{\mathrm{lin}}=\frac{2}{\sqrt3}=1.15\ \mathrm{\mu m}
$$

這裡 $2\ \mathrm{\mu m}$ 已是 half-width，所以除以 $\sqrt3$，不是 $\sqrt{12}$。

## 7. Distribution 必須反映已知資訊

例如環境溫度控制在：

$$
(20\pm1)\ ^\circ\mathrm C
$$

若只知道溫度落在此範圍，可採 rectangular：

$$
u(T)=\frac{1}{\sqrt3}=0.577\ ^\circ\mathrm C
$$

若實際監測資料顯示中央較常出現，才有理由改採 triangular 或其他 distribution。

又如標準件漂移範圍為 $\pm20\ \mathrm{nm}$，且已知最可能漂移量為零，教材以「中央最可能」的資訊引導 triangular assumption：

$$
u_{\mathrm{drift}}=\frac{20}{\sqrt6}=8.16\ \mathrm{nm}
$$

## 8. B 類自由度

教材依 GUM Annex G.4.2，以 standard uncertainty 本身的 relative uncertainty 估算自由度：

$$
R\%=\frac{\Delta u(x_i)}{u(x_i)}\times100\%
$$

$$
\boxed{\nu_i=\frac12\left(\frac{100}{R}\right)^2}
$$

| $R$ | $\nu_i$ |
|---:|---:|
| $0\%$ | $\infty$ |
| $5\%$ | $200$ |
| $10\%$ | $50$ |
| $20\%$ | $12.5$ |
| $25\%$ | $8$ |
| $50\%$ | $2$ |

$R$ 描述「對所估 standard uncertainty 有多不確定」，不是該 measurement quantity 的 relative standard uncertainty。

若完全採信明確的 bounds 或證書資料，教材常取 $R=0$、$\nu=\infty$；若證書提供自由度，直接引用通常比另行猜測更好。教材也提醒 $R$ 應有合理依據，不宜以超過 $50\%$ 的高度質疑仍勉強維持原估計。

## 9. B 類不是任意選分布

選擇順序應是：

1. 先讀清楚證書或規格定義；
2. 找出中心、bounds、coverage probability 與 factor；
3. 使用物理知識判斷哪裡較可能；
4. 只在沒有更多資訊時採 rectangular；
5. 記錄 assumption，讓 uncertainty budget 可追溯。

同一個 $\pm a$，可能是 absolute bounds、expanded uncertainty 或約 $3\sigma$ 的 normal interval，三者不可互換。

## 10. Stage 7 最小記憶包

$$
\boxed{u_{\mathrm{rect}}=\frac{a}{\sqrt3},\quad
u_{\mathrm{tri}}=\frac{a}{\sqrt6},\quad
u_{\mathrm U}=\frac{a}{\sqrt2}}
$$

$$
\boxed{u_{\mathrm{res}}=\frac{d}{\sqrt{12}}}
$$

$$
\boxed{u_{\mathrm{cal}}=\frac{U_{\mathrm{cal}}}{k}}
$$

$$
\boxed{\nu=\frac12\left(\frac{100}{R}\right)^2}
$$

一句話版本：

> **先理解可用資訊代表什麼，再用合理 distribution 把它換成一倍標準差。**

## Stage 7 完成條件

完成本 Stage 後，應能：

1. 說明 Type B 與 Type A 的差別；
2. 從 calibration certificate 正確取得 $u$ 與 $\nu$；
3. 區分 $a/\sqrt3$ 與 $d/\sqrt{12}$；
4. 依資訊選擇 rectangular、triangular、U-shaped 或 normal distribution；
5. 解釋 $R\%$ 的真正意義並估算自由度；
6. 不把所有寫成 $\pm a$ 的資訊都當成同一種分布。

---

下一 Stage：**Stage 8｜標準不確定度之組合**。將使用 sensitivity coefficient、covariance 與 Welch–Satterthwaite formula，把各 component 傳到 output。
