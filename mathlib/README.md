# Mathlib Learning Lab — DAN-106 新刊用・独立した実習環境（作業ブランチ）

**Status: CANDIDATE BOOK / LAB BUILD VERIFIED on 2026-11-22 for the tested commit / NOT a published Book release.**

このディレクトリは、同じ公開リポジトリ内の**第3の独立したLakeプロジェクト**です。

- Repository root `/`：入門編の形式証明実験（Lean `v4.33.1`、凍結）。変更しません。
- `engineering/`：公開済み技術編の実習（Lean `v4.24.0`）。依存関係・検証記録を変更しません。
- **`mathlib/`：新刊『はじめてのMathlib――Lean 4で数学の道具箱を開こう』用の候補実習**。

## 版と依存関係

- Lean toolchain：`leanprover/lean4:v4.24.0`
- Mathlib：GitHub `leanprover-community/mathlib4` の `v4.24.0` タグをLake設定で指定。
- 2026-11-18参照時点で、当該Mathlibタグはcommit `f897ebcf72cd16f89ab4577d0c826cd14afaafc7` を指し、上流タグの `lean-toolchain` は同じLean `v4.24.0` を指定していました。
- **解決済み依存：** Actionsで生成された[`lake-manifest.json`](lake-manifest.json)（9パッケージ、blob SHA `30a064dbe9c31c8f7736034998bf986bc9856bde`）をこの作業ブランチに保存しました。元の実行artifactとの一致を確認済みです。固定版でのLabビルドと独立した探索実験の実測は[`EVIDENCE.md`](EVIDENCE.md)を参照してください。

[Mathlib公式Wiki「Using mathlib4 as a dependency」](https://github.com/leanprover-community/mathlib4/wiki/Using-mathlib4-as-a-dependency)のLake/TOML設定とcache利用案内に準じています。

## 読者用の再現手順（制作側ではCIで限定的に実測済み）

まずLean公式の手順に従ってelan/Lean/Lakeを導入してください： https://lean-lang.org/install/

```sh
git clone https://github.com/YutoriKomeiji/lean4-learning-lab.git
cd lean4-learning-lab
git checkout work/dan106-mathlib-lab-20261118
cd mathlib
cat lean-toolchain
lake --version
test -f lake-manifest.json  # 配布された依存固定ファイルがあることを確認
lake exe cache get
lake build MathlibLearningLab
```

`lake exe cache get` はMathlibの既存のビルド成果物を取得するための推奨手順であり、実行環境・接続状況に応じてダウンロードのコストがかかります。毎回の無駄なフルビルドを避けてください。

**検証範囲：** 制作側は2026-11-22にGitHub Actionsで`lake build MathlibLearningLab`成功を実測しました。記録は[`EVIDENCE.md`](EVIDENCE.md)に保存されています。上記のclone手順を第三者の別環境で追試した結果は未取得です。執筆環境のLean実行可否と、GitHub Actions上でのtypecheck結果を混同しません。

実行済みの対象commit SHA、版、manifest、CIログ・検査範囲は[`EVIDENCE.md`](EVIDENCE.md)に記録しました。依存変更を意図しない通常の再現では無条件に`lake update`を行わず、固定manifestを利用してください。

## 教材の入り口

[MathlibLearningLab.lean](MathlibLearningLab.lean)で次の3つを学びます。

1. `#check` で既存定理の型を読む。
2. `Nat.add_comm` を指定して交換法則を使う（これはLeanの標準的な定理でもあり、Mathlib固有の成果と誇張しない）。
3. `ring` で多項式恒等式を確認し、`mul_le_mul_of_nonneg_right` で仮定付きの不等式を扱う。

### 正しく使うためのチェック

- 実際にチェックされた**命題**は何か。
- 使用する定理の**仮定や型クラス条件**は何か。
- 自分の数学的対象への適用は正しいか。
- 現実世界への説明を足す場合、その対応を支える**別の証拠**はあるか。

「Mathlibをimportした」「Leanのビルドが通った」だけで実世界の安全性・法的適合・運用成果・認証を証明したことにはなりません。詳しい考え方は既刊[Proof Literacy入門Book](https://zenn.dev/dantarg/books/lean4-proof-literacy)に譲り、このLabでは定理検索と実際の適用を主題にします。

## 第05〜14章のコード候補を収録（2026-11-18）

[MathlibLearningLab.lean](MathlibLearningLab.lean)を拡張し、第05章の`rw`/`simp only`から第14章の前提付き不等式まで、**20個の`example`候補と自作補題2件**を含めました（既存の3例も含む）。

このファイルは`[[lean_lib]] name = "MathlibLearningLab"`で宣言された**default target**であり、`mathlib/`からのビルド成功を実測済みです。第10章の`exact?`/`apply?`は独立ファイルで実行され、提案と終了コードを[`EVIDENCE.md`](EVIDENCE.md)へ記録しました。別の命題や版でも同じ提案になるとは限りません。

**重要：** `MathlibLearningLab.lean`内に実際に含まれる例と定理については、固定版のLabビルド成功を確認しています。ただし、書籍の第05〜14章の**全コードブロックをそれぞれ独立したファイルとして検査したわけではありません**。教材の文章や現実の数学的モデルへの一般化は、別途レビューが必要です。

## 公開・証拠の境界

本ディレクトリは**公開リポジトリ内の作業ブランチに置いた候補ソース**であり、Zenn Bookの公開・mainへのmerge・検証完了を意味しません。凍結済みのroot、公開技術編、既存の証拠ファイルは変更しません。
