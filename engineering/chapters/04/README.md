# 第4章 — 赤いエラーを読む：章別実習資料

対応するBook本文：[`04` の章](https://github.com/YutoriKomeiji/zenn-content/blob/main/books/lean4-proof-engineering/04-read-red-errors.md)
共通実行環境：[engineering/README.md](../../README.md)

## この章でできるようになること
既存のdouble 3 = 6を一時的にdouble 3 = 7へ変え、エラーを記録して戻す。

## 基本演習
1. 共通READMEから基準となる実習環境を用意し、使用したコミットSHAを記録する。
2. 既存のdouble 3 = 6を一時的にdouble 3 = 7へ変え、エラーを記録して戻す。
3. 変更前後のファイル、実際に実行したコマンド、終了結果を別々に記録する。実行できない場合は **NOT RUN** とする。

## 応用課題
変更差分、コマンド、ログを残し、仮説と実測を分ける。

## 自己採点と解答の観点
- 設問への回答がコード・差分・観測記録と対応するか。
- 失敗を意図したコードは正常教材とは別に扱い、復元後のビルドを確認する。
- 作業を戻せる状態を保ったか。故意のエラーを含む版を成功済み基準版に混ぜていないか。

## 段階別ヒントと答え合わせ

**問題A（基本）：** 基準版の `example : double 3 = 6 := by rfl` を、作業用コピーで `double 3 = 7` に変更する。何が変わったか説明しましょう。

- ヒント：`def double` は変更していない。`double 3` は定義により `6` になる。
- 解答：変更したのは証明したい命題の右辺だけであり、定義ではない。`rfl` のままで受理されるとは期待できない。ただし**具体的なエラー文は実際に実行した結果だけを記す**。

**問題B（実験）：** 元の `6` へ戻し、差分を確かめた後に `lake build` を実行する。

- ヒント：`git diff` と実行ログの両方を見る。未実行なら `NOT RUN`。
- 答え合わせ：実験前後のソースとコマンド・結果が記録され、意図した失敗版を基準版に残していないこと。

**問題C（境界）：** 「失敗したのでLean 4は壊れている」は正しい結論ですか。

- 解答：いいえ。命題・proof・定義・環境のどこで失敗したのかをログから切り分ける必要がある。

## 実行証拠と境界
**章別実習の独立した実行結果：NOT YET VERIFIED。** 既存の[CI成功記録](../../EVIDENCE.md)は基準Labの特定コミットに限る。本章の変更版や追加演習まで検査済みとはしない。

## 記録テンプレート
```text
chapter: 04
source commit:
working directory:
command:
observed result / NOT RUN:
files changed:
actual theorem or expected behavior:
not proven / unresolved:
```
