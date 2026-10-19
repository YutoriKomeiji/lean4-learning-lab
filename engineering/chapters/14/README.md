# 第14章 — AIに実装させ検査する：章別実習資料

対応するBook本文：[`14` の章](https://github.com/YutoriKomeiji/zenn-content/blob/main/books/lean4-proof-engineering/14-ai-implement-human-check.md)
共通実行環境：[engineering/README.md](../../README.md)

## この章でできるようになること
一つの状態遷移だけを追加する最小AI依頼を作る。

## 基本演習
1. 共通READMEから基準となる実習環境を用意し、使用したコミットSHAを記録する。
2. 一つの状態遷移だけを追加する最小AI依頼を作る。
3. 変更前後のファイル、実際に実行したコマンド、終了結果を別々に記録する。実行できない場合は **NOT RUN** とする。

## 応用課題
生成案の型・差分・実行結果・命題の意味を別々に審査する。

## 自己採点と解答の観点
- 設問への回答がコード・差分・観測記録と対応するか。
- 生成候補を採用するには独立した観測が要る。
- 作業を戻せる状態を保ったか。故意のエラーを含む版を成功済み基準版に混ぜていないか。

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
