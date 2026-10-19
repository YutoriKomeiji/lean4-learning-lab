# 第2章 — 最初の定義：章別実習資料

対応するBook本文：[`02` の章](https://github.com/YutoriKomeiji/zenn-content/blob/main/books/lean4-proof-engineering/02-first-definition.md)
共通実行環境：[engineering/README.md](../../README.md)

## この章でできるようになること
既存のdoubleを読み、double 3の予想と#evalの実測値を別々に記録する。

専用Leanソース：[Examples.lean](Examples.lean)（独立typecheck未実施）

## 基本演習
1. 共通READMEから基準となる実習環境を用意し、使用したコミットSHAを記録する。
2. 既存のdoubleを読み、double 3の予想と#evalの実測値を別々に記録する。
3. 変更前後のファイル、実際に実行したコマンド、終了結果を別々に記録する。実行できない場合は **NOT RUN** とする。

## 応用課題
double 0、double 4を調べ、有限個の評価では全入力の性質を証明しないと説明する。

## 自己採点と解答の観点
- 設問への回答がコード・差分・観測記録と対応するか。
- 定義の引数型と戻り値型がNatであることを読む。
- 作業を戻せる状態を保ったか。故意のエラーを含む版を成功済み基準版に混ぜていないか。

## 実行証拠と境界
**章別実習の独立した実行結果：NOT YET VERIFIED。** 既存の[CI成功記録](../../EVIDENCE.md)は基準Labの特定コミットに限る。本章の変更版や追加演習まで検査済みとはしない。

## 記録テンプレート
```text
chapter: 02
source commit:
working directory:
command:
observed result / NOT RUN:
files changed:
actual theorem or expected behavior:
not proven / unresolved:
```
