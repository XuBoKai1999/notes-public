# Stage 4｜量測不確定度概論

> 對應講義：**(2-01) 不確定度概論**  
> 從本 Stage 開始正式進入 GUM 的 measurement uncertainty 主線。Stage 1–3 的統計與機率內容，都是後續 uncertainty evaluation 所需的工具。

---

## 1. 本 Stage 的核心問題

本 Stage 主要處理三個問題：

1. Measurement result 是什麼？
2. Measurement uncertainty 描述什麼？
3. Error 與 uncertainty 有什麼不同？

後續整套 GUM 架構，都建立在這三個概念之上。

---

# 2. Measurement result 不是「真值宣告」

假設量測某個電壓得到：

$$
10.000\ \mathrm{V}
$$

直覺上很容易把這理解成：

> 真實電壓就是 $10.000\ \mathrm{V}$。

但在 GUM 的觀點中，measurement result 是對 measurand value 的 **estimate**。

也就是：

$$
\boxed{
\text{measurement result 是我們對 measurand value 的最佳估計}
}
$$

而不是宣稱：

$$
\text{「我們已經知道 true value。」}
$$

即使已對已知 systematic effects 做 correction，measurement result 仍然只是 measurand value 的 estimate，因為仍可能存在 random effects，以及 correction 本身的不完整知識。

---

# 3. Measurand 是什麼？

Measurand 可理解為：

> **真正想要量測的 quantity。**

它不是單純的「儀器顯示值」。

例如：

- 某電阻在指定溫度下的 resistance；
- 某砝碼的 mass；
- 某工件在指定 reference temperature 下的 length；
- 某 voltage source 的 output voltage。

Measurand 必須定義清楚。

例如：

> 「這根鋼棒的長度」

可能仍然不夠完整，因為 length 會受到 temperature 影響。

更完整的 measurand definition 可能是：

> 「該鋼棒在 $20^\circ\mathrm C$ reference temperature 下的 length」。

因此：

$$
\boxed{
\text{measurand definition 本身就是 uncertainty analysis 的起點}
}
$$

如果 measurand 定義不完整，本身就可能形成 uncertainty source。

---

# 4. Measurement uncertainty 是什麼？

直覺上可以理解成：

> 根據目前掌握的所有資訊，我們對 measurand value 到底有多不確定。

也就是：

$$
\boxed{
\text{uncertainty reflects the lack of exact knowledge of the measurand value}
}
$$

假設：

$$
y=10.000\ \mathrm{V}
$$

並且：

$$
u(y)=0.002\ \mathrm{V}
$$

這並不是說：

> 「我們量錯了 $0.002\ \mathrm V$。」

而是說：

> 對 measurand value 的知識具有約 $0.002\ \mathrm V$ 的 standard-deviation scale。

因此 uncertainty 描述的是：

$$
\boxed{
\text{可合理歸給 measurand 的可能值有多分散}
}
$$

---

# 5. Error 與 uncertainty 完全不同

Error 的概念可以寫成：

$$
\boxed{
e=y-Y_{\mathrm{true}}
}
$$

也就是：

$$
\text{error}
=
\text{measurement result}
-
\text{true value}
$$

但真正的：

$$
Y_{\mathrm{true}}
$$

通常不知道。

因此真正的 error：

$$
e
$$

通常也不知道。

Measurement uncertainty 並不是在宣稱我們知道這個 unknown error 的大小。

---

# 6. Uncertainty 大，不代表 error 一定大

假設 measurement result：

$$
y=100.0
$$

而 standard uncertainty 很大：

$$
u=10
$$

但假設真正的 value 恰好是：

$$
Y_{\mathrm{true}}=100.01
$$

那麼實際 error：

$$
e
=
100.0-100.01
=
-0.01
$$

error 非常小，但 uncertainty 仍然是：

$$
u=10
$$

因此：

$$
\boxed{
\text{uncertainty 大}
\not\Rightarrow
\text{error 大}
}
$$

反過來，也可能評估得到很小的 uncertainty，但實際存在某個未辨識的重要 systematic effect，使真正 error 很大。

所以：

$$
\boxed{
\text{uncertainty 小}
\not\Rightarrow
\text{已知 error 小}
}
$$

Error 與 uncertainty 必須分開理解。

---

# 7. Known systematic effect 應該 correction

假設 thermometer 已知具有：

$$
+0.5^\circ\mathrm C
$$

的 bias，也就是 indication 偏高 $0.5^\circ\mathrm C$。

如果 reading 為：

$$
25.0^\circ\mathrm C
$$

則應進行 correction：

$$
y
=
25.0-0.5
=
24.5^\circ\mathrm C
$$

因此：

$$
\boxed{
\text{已辨識且可估計的 systematic effect 應進行 correction}
}
$$

不能因為最後會報 uncertainty，就故意保留已知 bias。

---

# 8. Correction 做完後為什麼仍然有 uncertainty？

因為 correction 本身通常也不是 exact。

例如 calibration certificate 給出：

$$
C=-0.50^\circ\mathrm C
$$

但 correction 的 standard uncertainty 是：

$$
u(C)=0.05^\circ\mathrm C
$$

Measurement model 中可以寫：

$$
y=x+C
$$

我們確實使用：

$$
C=-0.50^\circ\mathrm C
$$

進行 correction。

但是因為：

$$
u(C)\neq0
$$

所以 calibration correction 仍然對 final uncertainty 有 contribution。

因此：

$$
\boxed{
\text{correct known effect}
\neq
\text{effect disappears from uncertainty analysis}
}
$$

修正值進入 measurement equation，而修正值本身的 uncertainty 進入 uncertainty budget。

---

# 9. Error、correction 與 uncertainty 的分工

| Quantity / concept | 意義 | 處理方式 |
|---|---|---|
| Error | Measurement result 與 true value 的差 | 通常不知道，不能直接拿來計算 |
| Known systematic effect | 已辨識的偏差來源 | 估計並進行 correction |
| Uncertainty of correction | Correction 本身仍不精確 | 放入 uncertainty budget |
| Random variation | Repeated observations 的 scatter | 以 Type A 等方法評估 |

所以 GUM 的基本思路不是：

> 把 random error 與 systematic error 直接湊成一個 error bar。

而是：

$$
\boxed{
\text{先處理已知 effects，再評估剩餘的 uncertainty}
}
$$

---

# 10. Measurement uncertainty 的來源

典型 uncertainty sources 可以整理成以下幾類。

## 10.1 Measurand definition

例如：

- measurand definition 不完整；
- reference condition 沒有定清楚；
- sample 無法完整代表真正想描述的 quantity。

## 10.2 Instrument

例如：

- resolution；
- calibration uncertainty；
- instrument drift；
- discrimination threshold。

## 10.3 Environment

例如：

- temperature；
- humidity；
- pressure；
- vibration；
- electromagnetic environment。

## 10.4 Reference values 與 constants

例如：

- reference standard 本身的 uncertainty；
- material coefficient 不精確；
- correction parameter 不精確。

## 10.5 Measurement procedure / model

例如：

- approximation；
- simplification；
- alignment；
- sampling；
- operator reading；
- assumptions used in data reduction。

## 10.6 Repeated observations

即使 apparent conditions 相同：

$$
x_1,x_2,\ldots,x_n
$$

observations 仍可能產生 scatter。

---

# 11. Measurement uncertainty 不是只看 instrument specification

假設 caliper specification 為：

$$
\pm0.02\ \mathrm{mm}
$$

不能直接宣稱：

$$
U=0.02\ \mathrm{mm}
$$

因為 measurement uncertainty 還可能包含：

- repeatability；
- resolution；
- zero setting；
- temperature effect；
- alignment；
- contact force；
- calibration uncertainty；
- measurand definition；
- operator / measurement procedure。

因此：

$$
\boxed{
\text{instrument specification}
\neq
\text{measurement uncertainty}
}
$$

Measurement uncertainty 描述的是整個 measurement process，而不是單一 instrument specification。

---

# 12. GUM 的核心工程方法：建立 measurement model

現實上通常不可能把所有 influence quantities 都獨立做大量 experiments。

因此 GUM 的核心方法是建立 mathematical measurement model：

$$
\boxed{
Y=f(X_1,X_2,\ldots,X_N)
}
$$

其中：

- $Y$：output quantity，也就是 measurand；
- $X_i$：影響 measurement result 的 input quantities。

接著分別評估：

$$
x_i
$$

以及：

$$
u(x_i)
$$

最後再透過 measurement model 把 input uncertainties propagation 到 output。

因此 uncertainty evaluation 的主線是：

```text
Physical measurement process
        ↓
Measurement model
        ↓
Input quantities
        ↓
Standard uncertainties
        ↓
Uncertainty propagation
        ↓
Output uncertainty
```

---

# 13. 一個最小 measurement model

假設用某 instrument 量測工件長度。

最粗略的 model 可能是：

$$
Y=X
$$

但更現實的 model 可能寫成：

$$
Y
=
X
+
C_{\mathrm{cal}}
+
C_T
+
C_{\mathrm{align}}
$$

其中：

- $X$：instrument indication；
- $C_{\mathrm{cal}}$：calibration correction；
- $C_T$：temperature correction；
- $C_{\mathrm{align}}$：alignment correction。

每一個 input quantity 都需要：

1. 一個 estimate；
2. 一個 standard uncertainty。

也就是：

$$
x_i
$$

以及：

$$
u(x_i)
$$

---

# 14. Best estimate 是零，不代表 uncertainty 是零

假設 alignment correction 的最佳估計是：

$$
C_{\mathrm{align}}=0
$$

這可能只是表示：

> 沒有證據顯示應該往正方向或負方向進行 correction。

但 alignment effect 仍然可能存在不確定性，例如：

$$
u(C_{\mathrm{align}})
=
0.01\ \mathrm{mm}
$$

因此：

$$
\boxed{
x_i=0
\not\Rightarrow
u(x_i)=0
}
$$

另一個例子是 temperature deviation。

假設最佳估計：

$$
\Delta T=0
$$

但 temperature measurement 本身仍有：

$$
u(\Delta T)>0
$$

則 thermal correction 的 estimate 可以是零，但其 uncertainty contribution 未必為零。

---

# 15. Type A 與 Type B 的正式概念

GUM 將 uncertainty components 依照 **evaluation method** 分為 Type A 與 Type B。

## Type A evaluation

由 statistical analysis of series of observations 評估。

例如 repeated measurements：

$$
u_A(\bar x)
=
\frac{s}{\sqrt n}
$$

## Type B evaluation

由其他 available information 評估，例如：

- calibration certificate；
- manufacturer's specification；
- resolution；
- previous measurement data；
- handbook value；
- engineering knowledge / judgment。

最重要的是：

$$
\boxed{
\text{Type A / Type B 是 evaluation method 的分類}
}
$$

而不是 physical effect 的分類。

---

# 16. Type A 不等於 random，Type B 不等於 systematic

這是非常常見的誤解。

$$
\boxed{
\text{Type A / Type B}
\neq
\text{random / systematic}
}
$$

同一個 physical effect 可以根據 available information 使用不同 evaluation method。

例如 instrument zero drift。

如果擁有大量 historical data，可以進行 statistical analysis：

$$
\rightarrow\text{Type A evaluation}
$$

如果沒有 repeated data，只知道 engineering specification：

$$
\pm0.2\ \mathrm{mV}
$$

則可能採用 Type B evaluation。

Physical source 都是 zero drift，但 evaluation method 不同。

---

# 17. Type A 與 Type B 最後都要變成 standard uncertainty

Type A 得到：

$$
u_A(x)
$$

Type B 得到：

$$
u_B(x)
$$

但最後全部都要表達成 standard-deviation scale：

$$
\boxed{
u(x_i)
}
$$

概念上：

```text
Type A repeated data ───────→ u(x1)
Calibration certificate ────→ u(x2)
Resolution ─────────────────→ u(x3)
Specification ──────────────→ u(x4)

                              ↓

                    standard uncertainties

                              ↓

                         combination
```

所以後續 combination 時，不再因為它原本是 Type A 或 Type B 而使用兩套不同數學。

---

# 18. Standard uncertainty、combined standard uncertainty、expanded uncertainty

這三個名詞必須開始區分。

## 18.1 Standard uncertainty

單一 quantity 的 standard-deviation-scale uncertainty：

$$
\boxed{
u(x_i)
}
$$

## 18.2 Combined standard uncertainty

所有 input uncertainties 經 measurement model propagation 到 output 後得到：

$$
\boxed{
u_c(y)
}
$$

它仍然是 standard-deviation scale。

## 18.3 Expanded uncertainty

為了給出較大的 coverage interval，定義：

$$
\boxed{
U=ku_c(y)
}
$$

其中 $k$ 是 coverage factor。

最後可能報告：

$$
Y=(100.00\pm0.20)\ \mathrm{V}
$$

並註明：

$$
k=2
$$

---

# 19. 一個完整但暫時不做 propagation 的例子

假設使用 digital thermometer 測量某物體 temperature。

Instrument indication：

$$
25.1^\circ\mathrm C
$$

第一步不是直接報：

$$
T=25.1^\circ\mathrm C
$$

而是先定義 measurand。

例如：

$$
T
=
\text{物體在指定 measurement condition 下的 temperature}
$$

接著建立 measurement model，例如：

$$
T
=
T_{\mathrm{ind}}
+
C_{\mathrm{cal}}
+
C_{\mathrm{res}}
+
C_{\mathrm{env}}
$$

其中：

- $T_{\mathrm{ind}}$：instrument indication；
- $C_{\mathrm{cal}}$：calibration correction；
- $C_{\mathrm{res}}$：resolution-related correction；
- $C_{\mathrm{env}}$：environmental correction。

每個 input quantity 都需要 estimate：

$$
x_i
$$

以及 standard uncertainty：

$$
u(x_i)
$$

之後才有資格計算：

$$
u_c(T)
$$

最後再視需求得到：

$$
U=ku_c(T)
$$

---

# 20. Uncertainty evaluation 本質上首先是 modeling problem

Measurement uncertainty analysis 最重要的問題並不是：

> Excel 要按哪一條公式？

而是：

> 哪些 quantities 真正會影響我們所定義的 measurand？

如果正確的 model 應該是：

$$
Y=f(X_1,X_2,\ldots,X_N,X_{N+1})
$$

但分析時漏掉重要的：

$$
X_{N+1}
$$

那麼後續 propagation 算得再精確，也無法補救 model omission。

因此：

$$
\boxed{
\text{uncertainty analysis 首先是 physics / modeling，之後才是 statistics}
}
$$

良好的 measurement procedure、experiment design 與 measurement model，是 reliable uncertainty evaluation 的前提。

---

# 21. Uncertainty 不是把所有 mistake 都塞進去

例如原本應輸入：

$$
1.00\ \mathrm V
$$

卻誤輸入成：

$$
10.0\ \mathrm V
$$

這屬於 mistake / blunder。

不能說：

> 把 uncertainty 放大到足以涵蓋這種錯誤即可。

Uncertainty evaluation 預設 measurement procedure 被合理執行，並對已辨識 effects 做合理處理。

因此：

$$
\boxed{
\text{measurement uncertainty}
\neq
\text{防止所有人為失誤的保險範圍}
}
$$

接錯線、使用錯誤單位、抄錯數字等 gross mistakes，應由 measurement procedure、verification 與 quality control 處理，而不是用 uncertainty budget 吸收。

---

# 22. 為什麼 measurement result 必須搭配 uncertainty？

假設兩個 laboratories 都得到：

$$
R=100.000\ \Omega
$$

Laboratory A：

$$
U=0.001\ \Omega
$$

Laboratory B：

$$
U=1.000\ \Omega
$$

兩者 central value 完全相同，但 measurement result 所包含的資訊品質顯然完全不同。

只報：

$$
100.000\ \Omega
$$

無法表達這項差異。

因此 uncertainty 對以下工作都很重要：

- calibration；
- comparison；
- traceability；
- quality assurance；
- conformity assessment；
- scientific comparison；
- standards comparison。

---

# 23. 整套 GUM workflow

到這裡，可以把整門課重新整理成：

```text
Define measurand
        ↓
Build measurement model
        ↓
Y = f(X1, X2, ..., XN)
        ↓
Identify uncertainty sources
        ↓
Evaluate each u(xi)
        ↓
Propagate and combine
        ↓
uc(y)
        ↓
Choose coverage factor k
        ↓
U = k uc(y)
        ↓
Report y ± U
```

Stage 4 真正要求掌握的是前半段：

$$
\boxed{
\text{Define measurand}
\rightarrow
\text{Build model}
\rightarrow
\text{Identify uncertainty sources}
}
$$

後面的數學會在後續 Stages 逐步展開。

---

# 24. Stage 4 最小記憶包

第一句：

$$
\boxed{
\text{Measurement result 是 measurand value 的 estimate，不是真值宣告。}
}
$$

第二句：

$$
\boxed{
\text{Measurement uncertainty 描述對 measurand value 缺乏精確認知的程度。}
}
$$

第三句：

$$
\boxed{
\text{Error 與 uncertainty 不同。}
}
$$

第四句：

$$
\boxed{
\text{已知 systematic effect 應 correction；correction 本身仍可有 uncertainty。}
}
$$

第五句：

$$
\boxed{
\text{Type A / Type B 是 evaluation method，不是 random / systematic 的同義詞。}
}
$$

最後是整套 GUM 的核心 measurement model：

$$
\boxed{
Y=f(X_1,X_2,\ldots,X_N)
}
$$

也就是：

> **先定義到底在量什麼，再建立 measurement model；model 確立後，才有資格建立 uncertainty budget。**

---

## Stage 4 完成條件

完成本 Stage 後，應能：

1. 解釋 measurand 與 instrument indication 的差別；
2. 解釋 measurement result 為什麼是 estimate；
3. 區分 error 與 uncertainty；
4. 說明 known systematic effect 為什麼應進行 correction；
5. 說明 correction 做完後為什麼仍可能存在 uncertainty；
6. 說明 instrument specification 為什麼不等於 measurement uncertainty；
7. 說明 Type A / Type B 是 evaluation method 的分類；
8. 不再把 Type A / Type B 等同 random / systematic；
9. 理解 estimate 為零不代表 standard uncertainty 為零；
10. 說明為什麼 uncertainty evaluation 首先是 measurement modeling problem；
11. 認得 standard uncertainty $u(x_i)$、combined standard uncertainty $u_c(y)$ 與 expanded uncertainty $U$；
12. 說出整套 GUM workflow 的主線。

---

下一 Stage：**Stage 5｜量測方程式**。  
將正式處理如何從實際 measurement process 建立 $Y=f(X_1,\ldots,X_N)$、如何找 input quantities，以及 sensitivity coefficient 為什麼會自然出現。
