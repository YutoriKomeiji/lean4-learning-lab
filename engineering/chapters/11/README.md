# 第11章 — CIでbuildする：章別実習資料

対応するBook本文：[`11` の章](https://github.com/YutoriKomeiji/zenn-content/blob/main/books/lean4-proof-engineering/11-ci-build.md)
共通実行環境：[engineering/README.md](../../README.md)

## この章でできるようになること
既存のActions runと対象SHA、対象コマンドを読み比べる。

## 基本演習
1. 共通READMEから基準となる実習環境を用意し、使用したコミットSHAを記録する。
2. 既存のActions runと対象SHA、対象コマンドを読み比べる。
3. 変更前後のファイル、実際に実行したコマンド、終了結果を別々に記録する。実行できない場合は **NOT RUN** とする。

## 応用課題
新しい未実行ファイルがCIの対象に入っているかを監査する。

## 自己採点と解答の観点
- 設問への回答がコード・差分・観測記録と対応するか。
- green CIはそのrunで実行された検査の証拠に限る。
- 作業を戻せる状態を保ったか。故意のエラーを含む版を成功済み基準版に混ぜていないか。

## 実行証拠と境界
**章別実習の独立した実行結果：NOT YET VERIFIED。** 既存の[CI成功記録](../../EVIDENCE.md)は基準Labの特定コミットに限る。本章の変更版や追加演習まで検査済みとはしない。

## 記録テンプレート
```text
chapter: 11
source commit:
working directory:
command:
observed result / NOT RUN:
files changed:
actual theorem or expected behavior:
not proven / unresolved:
```
