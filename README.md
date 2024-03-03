# bde-ml
分子の結合解離エネルギー（BDE）を予測する回帰モデルを作成するプログラムおよび実行環境

## 回帰モデルについて
- 分子の構造をSMILES形式で与えることで、結合のBDEを予測する。
- 精密に計算すると数時間かかるBDEを瞬時に予測できる。
- C, N, H, Oのみを含む分子が対象。
- BDEを予測できるのは、「単結合」かつ「環状構造に含まれない結合」

## 解析の流れ
[解析の流れ](./work/解析の流れ.drawio.svg)と`.ipynb`のコメントを参照。

## 実行手順
1. 実行環境を起動する。
   ```bash
   docker compose up
   ```

2. ブラウザで[http://localhost:8888/lab](http://localhost:8888/lab)にアクセス。

3. `0_create_training_data.ipynb`, `1_training.ipynb`, `2_use_trained_model.ipynb`の順で実行。  
   ※ `0_create_training_data.ipynb`の実行には非常に時間がかかる。  
   ※ 順に実行しなくても動作する。1から実行したり、2のみ実行しても動作する。

## 参考
- 結合解離エネルギーデータ  
  https://doi.org/10.6084/m9.figshare.10248932  
  St. John, P.C., Guan, Y., Kim, Y. et al. Prediction of organic homolytic bond dissociation enthalpies at near chemical accuracy with sub-second computational cost. Nat Commun 11, 2328 (2020). https://doi.org/10.1038/s41467-020-16201-z
- 特徴量化プログラム  
  http://sourceforge.net/projects/unlpredict  
  Qu, X., Latino, D.A. & Aires-de-Sousa, J. A big data approach to the ultra-fast prediction of DFT-calculated bond energies. J Cheminform 5, 34 (2013). https://doi.org/10.1186/1758-2946-5-34
  