# 第7章 — ファイルを分ける：章別実習資料

対応するBook本文：[`07` の章](https://github.com/YutoriKomeiji/zenn-content/blob/main/books/lean4-proof-engineering/07-split-files.md)
共通実行環境：[engineering/README.md](../../README.md)

## この章でできるようになること
doubleの定義をBasic.leanへ移しimportする編集案を作る。

## 基本演習
1. 共通READMEから基準となる実習環境を用意し、使用したコミットSHAを記録する。
2. doubleの定義をBasic.leanへ移しimportする編集案を作る。
3. 変更前後のファイル、実際に実行したコマンド、終了結果を別々に記録する。実行できない場合は **NOT RUN** とする。

## 応用課題
変更前後の命題と定義が同じかdiffで検査し、ビルドは独立に確認する。

## 自己採点と解答の観点
- 設問への回答がコード・差分・観測記録と対応するか。
- moduleの構造を整えることは定理の強化ではない。
- 作業を戻せる状態を保ったか。故意のエラーを含む版を成功済み基準版に混ぜていないか。

## 独立した分割演習（追加資料）

- [Basic.lean](Basic.lean)：移動先になる定義の候補。
- [Examples.lean](Examples.lean)：`import ProofEngineeringLab.Basic` を使う候補。

これらは**完成済みLake構成ではなく、編集用の素材**です。元のプロジェクトを保全し、作業用コピーで `engineering/ProofEngineeringLab/Basic.lean` を作成し、そこへ `Basic.lean` の内容を配置してください。元の `ProofEngineeringLab.lean` の `double` 定義だけを削除し、先頭へ `import ProofEngineeringLab.Basic` を追加します。状態遷移や既存の証明は残してください。別の `Examples.lean` は分割方法を理解する参考素材であり、**そのまま置いても既存 `lake build` が自動検査するとは限りません**。

実行前に `git diff` で定義が重複していないか確認し、`engineering/` から `lake build` して終了結果を記録します。定義の移動が数学的な主張の強化につながるわけではありません。この分割版の実行はまだ **NOT VERIFIED** です。

## 実行証拠と境界
**章別実習の独立した実行結果：NOT YET VERIFIED。** 既存の[CI成功記録](../../EVIDENCE.md)は基準Labの特定コミットに限る。本章の変更版や追加演習まで検査済みとはしない。

## 記録テンプレート
```text
chapter: 07
source commit:
working directory:
command:
observed result / NOT RUN:
files changed:
actual theorem or expected behavior:
not proven / unresolved:
```
