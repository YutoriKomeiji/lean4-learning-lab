# Mathlib Learning Lab — DAN-106 新刊用・独立した実習環境（作業ブランチ）

**Status: CANDIDATE / NOT TYPECHECKED in this writing run / NOT a published Book release.**

このディレクトリは、同じ公開リポジトリ内の**第3の独立したLakeプロジェクト**です。

- Repository root `/`：入門編の形式証明実験（Lean `v4.33.1`、凍結）。変更しません。
- `engineering/`：公開済み技術編の実習（Lean `v4.24.0`）。依存関係・検証記録を変更しません。
- **`mathlib/`：新刊『はじめてのMathlib――Lean 4で数学の道具箱を開こう』用の候補実習**。

## 版と依存関係

- Lean toolchain：`leanprover/lean4:v4.24.0`
- Mathlib：GitHub `leanprover-community/mathlib4` の `v4.24.0` タグをLake設定で指定。
- 2026-11-18参照時点で、当該Mathlibタグはcommit `f897ebcf72cd16f89ab4577d0c826cd14afaafc7` を指し、上流タグの `lean-toolchain` は同じLean `v4.24.0` を指定していました。
- **未固定の点：** `lake-manifest.json` は生成・保存していません。依存関係の推移的な解決状態について、再現可能なlockfile完成をまだ主張しません。

[Mathlib公式Wiki「Using mathlib4 as a dependency」](https://github.com/leanprover-community/mathlib4/wiki/Using-mathlib4-as-a-dependency)のLake/TOML設定とcache利用案内に準じています。

## 実行手順（未実行の候補）

まずLean公式の手順に従ってelan/Lean/Lakeを導入してください： https://lean-lang.org/install/

```sh
git clone https://github.com/YutoriKomeiji/lean4-learning-lab.git
cd lean4-learning-lab
git checkout work/dan106-mathlib-lab-20261118
cd mathlib
cat lean-toolchain
lake --version
lake update
lake exe cache get
lake build
```

`lake exe cache get` はMathlibの既存のビルド成果物を取得するための推奨手順であり、実行環境・接続状況に応じてダウンロードのコストがかかります。毎回の無駄なフルビルドを避けてください。

**重要：** 上記は読者・制作者向けの再現候補です。この執筆環境には `lean`、`lake`、`elan` が存在せず、今回のファイルはまだLeanで検査していません。実行ログ／終了コード／対象SHAがそろうまでは `VERIFIED` としません。

初回成功後、依存解決された `lake-manifest.json`、対象commit SHA、Lean/Lake/Mathlibの版、使用環境、実行ログ、終了コード、検査範囲を`EVIDENCE.md`に記録します。追加のGitHub Actions実行は、workflow・コスト・最新失敗状況を事前点検してから行います。

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

## 公開・証拠の境界

本ディレクトリは**公開リポジトリ内の作業ブランチに置いた候補ソース**であり、Zenn Bookの公開・mainへのmerge・検証完了を意味しません。凍結済みのroot、公開技術編、既存の証拠ファイルは変更しません。
