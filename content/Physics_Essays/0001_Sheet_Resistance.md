# 片電阻量測與二維靜電學問題

## 1. 片電阻有何不同？

### 1.1 傳統體電阻的物理圖像

傳統的**體電阻**，暫且那麼稱呼吧，他的公式是
$$
R = \rho L/A = \frac {V}{I}
$$
假設我們現在就要量測一塊長方體狀的體電阻，其截面積是 $A$。其中的 insight 是這樣：我們在兩端接上電線，並給定電壓 $V$，接著就會有某個均勻的電流密度 $J$ 從一端截面完整地進去，接著這些電子平順地通過每個截面。最後我們由 $V, I(=JA)$ 兩個參數得到電阻。

但片電阻不是如此。如一塊 wafer，他是非常薄的，可以說是一塊準二維 (quasi-2D) 的材料。我們在接線時一定是將線**插到**材料上，接著再通入電流。但這時候電流密度顯然不會是均勻的，他會在 wafer 上**擴散**，離接點越遠處電流密度就越小。那這時候要如何定義上面的電阻呢？

### 1.2 定義片電阻

即便電流密度的擴散方式和體電阻情況不同，但整塊材料可能還是有固定的（或至少局部固定的）電阻率 $\rho$。現在考慮一個矩形薄膜，其厚度 $t$、寬 $W$、長 $L$，則其中一個截面是 $A=Wt$，故而有
$$
R=\rho \frac{L}{Wt}=\frac {\rho}{t} \frac {L}{W}
$$
則可定義片電阻為
$$
R_s = \frac {\rho}{t}
$$
故一塊正方形的薄膜（$L=W$），具有電阻 $R=R_s$。

這也是片電阻單位常寫成 $$\Omega/\square$$ 的原因。所謂「每方塊」並不是新的物理單位，而是提醒我們：對均勻薄膜而言，電阻由長寬比 $$L/W$$ 決定。換言之，片電阻可以理解為「長寬比為 1 的均勻薄膜，在兩側完整電極下量到的電阻」。

不過，這只是片電阻的幾何圖像。$$R_s$$ 更根本的意義是二維歐姆定律中的比例常數。

在三維導體中，歐姆定律可寫成
$$
\boldsymbol J=\frac{1}{\rho}\boldsymbol E,
$$
其中 $$\boldsymbol J$$ 是體電流密度，單位為 A/m$$^2$$。對厚度為 $$t$$ 的薄膜，我們可以定義面電流密度
$$
\boldsymbol K=t\boldsymbol J,
$$
其單位為 A/m。由於
$$
R_s=\frac{\rho}{t},
$$
可得
$$
\boldsymbol K=\frac{1}{R_s}\boldsymbol E.
$$
因此，片電阻可以視為薄膜中的二維電阻率。它描述的是：在薄膜平面內，電場 $$\boldsymbol E$$ 如何驅動面電流密度 $$\boldsymbol K$$。

這個觀點會成為後續分析的核心。片電阻的定義本身並不困難；真正困難的是，實際探針量測時電流會在二維平面內擴散，因此必須求出薄膜上的電位分布與電流場。

## 2. 四點量測法初探

為何要四端點？

其實這不是新聞。回到尋常體電阻的情況，我們也可以兩條線接到電源，這用以提供 $I$，又拿了兩條線接到電阻上，用以量測 $V$。但問題是 wafer 的情況沒有明顯的端點給我們。所以實際上是使用探針：中間兩個探針是伏特計、外圍兩個探針輸入電流。

I+        V+      V-        I- 

●-------●-------●-------●

四點探針法可以視為四端量測在薄膜樣品上的實作，關鍵是將電流路徑與電壓量測路徑分開。

對於便宜的三用電表，常常可以見到一對導線既供電又量電壓，但這時候線材等等的接觸電阻也會被量測，大概可以寫成
$$
R_{\text{measure}} 
= R_{\text{sample}}
+ R_{\text{lead}}
+ R_{\text{contact}}.
$$
這對於需要高精度量測的樣本而言是不好的。

## 3. 無限大片電阻

考慮一個無限大 wafer。

我們方才已經看到，歐姆定律已經被降為二維，有
$$
\boldsymbol {K}
=\frac {1}{R_s}\boldsymbol {E}
=-\frac {1}{R_s}\boldsymbol {\nabla}V
$$
當一個點電流源 $I$，自某點（不妨設為原點）注入此平面，顯然這已經成為了流體力學中的一個 source（如果是流入則為 sink），此時我們又有連續方程
$$
\bold{\nabla} \cdot \bold{K}=I\delta^{(2)}(\bold{r})
$$
對於二維情況，顯然是
$$
K=\frac{I}{2\pi r}
$$
則見有
$$
\frac{I}{2\pi r}=-\frac{1}{R_s} \frac{dV}{dr}
$$
因為旋轉對稱性，角度項完全消失。則見
$$
V(r)=-\frac{R_s I}{2\pi} \ln r + C
$$
注意這個式子會在無窮遠處發散，這是二維情況的一個問題，簡單作法是強迫一定要讓電流的流入、流出點成對出現。

若電流從A注入、從B流出，則
$$
\begin{align}
V(P)
&= -\frac{R_s I}{2\pi} \ln|P-A|
+\frac{R_s I}{2\pi} \ln|P-B|
+C \\
&= \frac{R_s I}{2\pi} \ln \frac{|P-B|}{|P-A|} + C
\end{align}
$$
可以見到 $P \rightarrow \infty$ 時候，$\ln$ 項趨近於 $0$。

現在考慮四探針的情況，

I+        V+      V-        I- 

●-------●-------●-------●

A        M        N        B

設四探針皆相隔距離 $s$，則中央兩點電位分別為
$$
\begin{align}
&V_+=\frac{R_s I}{2\pi} \ln \frac{|M-B|}{|M-A|} 
=\frac{R_s I}{2\pi} \ln 2
\\
&V_-=\frac{R_s I}{2\pi} \ln \frac{|N-B|}{|N-A|} 
=-\frac{R_s I}{2\pi} \ln 2
\end{align}
$$
則電位差是
$$
\Delta V = V_+-V_-
=\frac{R_s I}{\pi} \ln 2
$$
故得
$$
R_s=\frac {\pi}{\ln 2} \frac {\Delta V}{I}
$$

## 4. 圓形 wafer 的幾何修正

現在來看一真實案例。設有一圓形 wafer，其半徑為 $R$。相較於無窮大平面之情況，現在因為電流不能穿過 wafer 邊緣，所以有邊界條件
$$
\boldsymbol {K} \cdot \hat{\boldsymbol n} = 0
$$
或看到
$$
\boldsymbol {K}
=\frac {1}{R_s}\boldsymbol {E}
=-\frac {1}{R_s}\boldsymbol {\nabla}V
$$
則有
$$
\frac{\partial V}{\partial n}=0
$$
這是 Neumann 邊界條件。

先將面電流密度重寫成
$$
\boldsymbol K (\boldsymbol r, \boldsymbol {r'}) 
= \frac {I}{2\pi} \frac {\boldsymbol r - \boldsymbol {r'}}{|\boldsymbol r - \boldsymbol {r'}|^2}

\vec {K}
$$
其中 $\boldsymbol r$ 是相對於於圓心之位置、$\boldsymbol {r'}$ 是某電流源之位置。又看到歐姆定律
$$
\boldsymbol {K}
=-\frac {1}{R_s}\boldsymbol {\nabla}V
$$
注意到現在對於在 wafer 上的任意點，$V$ 並無旋轉對稱性。但一般性的，注意到還是有恆等式
$$
\boldsymbol \nabla \ln |\bold{r-r'}|
= \frac {\bold{r-r'}}{|\bold{r-r'}|^2}
$$
於是現在電位之形式為
$$
V(\boldsymbol r, \boldsymbol r')=-\frac{R_s I}{2\pi} \ln |\bold{r-r'}| + C
$$
這樣我們將 $\boldsymbol K$ 與 $V$ 推廣為有方向性的形式。但這並沒有新東西，他實際上是在說明電流是以注入點為圓心，往徑向流動，故而 $\boldsymbol \nabla V$ 之方向當然也是徑向方向，這和我們之前的 insight 相同。實際上，從 dimension analysis，我們已經可以猜到，片電阻的形式一定是
$$
R_s = \frac {\pi}{\ln 2} \frac {\Delta V}{I} F_{geo}
$$
其中，$F_{geo}$ 是幾何修正因子，他會和 wafer 的幾何形狀有關係。

---

現在，很容易回想到電磁學中的情況。在大學時，我們使用了**鏡像電荷法**來解決此問題（但當時是 Dirichlet 邊界條件，$V=0$），在此我們也可以使用**鏡像電流**來如法炮製。

但注意，由 $\boldsymbol \nabla \cdot \boldsymbol K = I$，如果圓盤內只有一個 source，怎麼也不可能使得邊界的法向分量為 $0$，所以我們一定要同時考慮 source 和 sink，或者說，使內部的淨 source 為零，這也和真實情境相符。不妨設真實 source 有電流 $+I$，位於 $\boldsymbol r_+$；真實 sink 有電流 $-I$，位於 $\boldsymbol r_-$。

現在我們應該把電位寫成
$$
V=V_+ + V_-
$$
其中 $V_+$ 是 source 造成的、$V_-$ 是 sink 造成的。我們不可能讓 $V_i$ 在邊界上的法向分量為零，但如果能設法讓其和角度無關，或者說讓她變成一個常數，可能會比較現實。下面我們就嘗試這麼做。



## 5. 任意形狀的情況

