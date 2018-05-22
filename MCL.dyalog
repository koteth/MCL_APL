
matrix ← ⎕csv 'PATH TO MATRIX/matrix.csv'
InflateCoef ← 2

M ← ⍎¨ matrix
id←{⍵ ⍵⍴1,⍵⍴0}
Nor←{+⌿⍵}
Nmat ← {( ( ⍴ ⍵) ⍴ (Nor ⍵)) }
NormColumn ← {( ⍴ ⍵ ) ⍴ ((×/⍴⍵) ⍴⍵)÷((×/⍴⍵)  ⍴ Nmat  ⍵ )}

Expand ← {⍵ +.× ⍵}
Inflate  ←  NormColumn {  (⍴⍺) ⍴ (  (×/⍴⍺) ⍴  ⍺) * ⍵ } 

M2 ← NormColumn (M + id (≢ M))
Markov ←  { ( Expand (NormColumn ⍵) ) Inflate InflateCoef }

FP ← (Markov ⍣ ≡ ⊢ M2)

R ← ((+/FP) >0) ⌿ FP
ClustMap ← ⌽↑⍸R
