# 第6章 — 通るけれど意図が違う定理：章別実習資料

対応するBook本文：[`06` の章](https://github.com/YutoriKomeiji/zenn-content/blob/main/books/lean4-proof-engineering/06-passing-but-wrong-theorem.md)
共通実行環境：[engineering/README.md](../../README.md)

## この章でできるようになること
現実の安全性を連想させる名前と実際には弱い命題を比較する。

専用Leanソース：[Examples.lean](Examples.lean)（[CI実測記録](../../EVIDENCE.md)にある対象コミットで独立typecheck済み）

## 基本演習
1. 共通READMEから基準となる実習環境を用意し、使用したコミットSHAを記録する。
2. 現実の安全性を連想させる名前と実際には弱い命題を比較する。
3. 変更前後のファイル、実際に実行したコマンド、終了結果を別々に記録する。実行できない場合は **NOT RUN** とする。

## 応用課題
Actual theorem、Assumptions、Proof Ceiling、NOT provenを4欄で記録する。

## 自己採点と解答の観点
- 設問への回答がコード・差分・観測記録と対応するか。
- 通る形式命題と自然言語の期待が一致するかは別の検証課題。
- 作業を戻せる状態を保ったか。故意のエラーを含む版を成功済み基準版に混ぜていないか。

## 実行証拠と境界
**添付した専用Leanソース：CIで独立typecheck済み。** [検証記録](../../EVIDENCE.md)にある2026-10-20 run #39431843278・commit `e3dd74d706f1f4ae548fcd2cdb78298c8d74d4a8` に限定した判定。読者が変更したソースやすべての自由演習の成功を保証するものではない。

## 記録テンプレート
```text
chapter: 06
source commit:
working directory:
command:
observed result / NOT RUN:
files changed:
actual theorem or expected behavior:
not proven / unresolved:
```
