# 第14章 — AIに実装させ検査する：章別実習資料

対応するBook本文：[`14` の章](https://github.com/YutoriKomeiji/zenn-content/blob/main/books/lean4-proof-engineering/14-ai-implement-human-check.md)
共通実行環境：[engineering/README.md](../../README.md)

## この章でできるようになること
Book第13〜14章の独立した練習題材 `addTwo` について、AIへの最小実装依頼と採用条件を作る。後半の状態遷移プロジェクトは発展課題として区別する。

## 基本演習
1. 共通READMEから基準となる実習環境を用意し、使用したコミットSHAを記録する。
2. `addTwo` の要求・型・変更可能ファイル・確認方法を固定した最小AI依頼を作る。
3. 変更前後のファイル、実際に実行したコマンド、終了結果を別々に記録する。実行できない場合は **NOT RUN** とする。

## 応用課題
生成案の型・差分・実行結果・命題の意味を別々に審査する。

## 自己採点と解答の観点
- 設問への回答がコード・差分・観測記録と対応するか。
- 生成候補を採用するには独立した観測が要る。
- 作業を戻せる状態を保ったか。故意のエラーを含む版を成功済み基準版に混ぜていないか。

## 変更範囲を固定する練習

**問題A（基本）：** AIへの最小依頼文を書きましょう。

> `ProofEngineeringLab.lean` に、2つの自然数を受け取ってその和を返す `def addTwo (a b : Nat) : Nat := a + b` の候補を提案してください。既存の定義や定理は変更しないでください。変更対象と差分、`lake build` での確認方法、実行済みか未実行かを分けて報告してください。追加した定義が通常のビルド対象ファイル内にあるかも確認してください。

**問題B（発展・第16〜18章への予告）：** 状態遷移モデルに `restart : CanStep .stopped .running` を追加すると、どの古い命題を再評価するべきですか。これは `addTwo` とは別の後半プロジェクトの例です。

- 解答：`stopped_cannot_step_to_running : ¬ CanStep .stopped .running`。この命題を維持したまま新しいコンストラクタを加えると衝突する。第18章の隔離した故意の失敗教材でLeanの拒否を実測している。

**問題C（境界）：** AIが変更後のコードで成功したと言った場合、採用判定に必要なものは？

- 解答：実際のソース差分、実行環境・コマンド・ログ、旧仕様との相違、意味の変更に対する人間の判断。AIの説明文は実測証拠ではない。

## 実行証拠と境界
**章別実習の独立した実行結果：NOT YET VERIFIED。** 既存の[CI成功記録](../../EVIDENCE.md)は基準Labの特定コミットに限る。本章の変更版や追加演習まで検査済みとはしない。

## 記録テンプレート
```text
chapter: 14
source commit:
working directory:
command:
observed result / NOT RUN:
files changed:
actual theorem or expected behavior:
not proven / unresolved:
```
