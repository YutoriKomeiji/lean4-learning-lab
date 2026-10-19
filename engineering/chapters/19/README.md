# 第19章 — CIと再現手順：章別実習資料

対応するBook本文：[`19` の章](https://github.com/YutoriKomeiji/zenn-content/tree/main/books/lean4-proof-engineering)
共通実行環境：[engineering/README.md](../../README.md)

## この章でできるようになること
基準版と変更版を別SHAで記録し、第三者が同じbuild targetを確認できる手順を書く。

## 基本演習
1. 共通READMEから基準となる実習環境を用意し、使用したコミットSHAを記録する。
2. 基準版と変更版を別SHAで記録し、第三者が同じbuild targetを確認できる手順を書く。
3. 変更前後のファイル、実際に実行したコマンド、終了結果を別々に記録する。実行できない場合は **NOT RUN** とする。

## 応用課題
workflowの対象パス、コマンド、ログ取得導線を監査する。

## 自己採点と解答の観点
- 設問への回答がコード・差分・観測記録と対応するか。
- 第三者が実施していなければ再現済みとしない。
- 作業を戻せる状態を保ったか。故意のエラーを含む版を成功済み基準版に混ぜていないか。

## 実行証拠と境界
**章別実習の独立した実行結果：NOT YET VERIFIED。** 既存の[CI成功記録](../../EVIDENCE.md)は基準Labの特定コミットに限る。本章の変更版や追加演習まで検査済みとはしない。

## 記録テンプレート
```text
chapter: 19
source commit:
working directory:
command:
observed result / NOT RUN:
files changed:
actual theorem or expected behavior:
not proven / unresolved:
```
