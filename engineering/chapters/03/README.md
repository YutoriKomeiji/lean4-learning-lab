# 第3章 — 最初の定理：章別実習資料

対応するBook本文：[`03` の章](https://github.com/YutoriKomeiji/zenn-content/blob/main/books/lean4-proof-engineering/03-first-theorem.md)
共通実行環境：[engineering/README.md](../../README.md)

## この章でできるようになること
double 3 = 6のexampleの命題とrflの役割を読み、同じ型の名前付きtheoremを自作する。

専用Leanソース：[Examples.lean](Examples.lean)（[CI実測記録](../../EVIDENCE.md)にある対象コミットで独立typecheck済み）

## 基本演習
1. 共通READMEから基準となる実習環境を用意し、使用したコミットSHAを記録する。
2. double 3 = 6のexampleの命題とrflの役割を読み、同じ型の名前付きtheoremを自作する。
3. 変更前後のファイル、実際に実行したコマンド、終了結果を別々に記録する。実行できない場合は **NOT RUN** とする。

## 応用課題
定理名だけを安全そうな名前にしても命題は強くならないと説明する。

## 自己採点と解答の観点
- 設問への回答がコード・差分・観測記録と対応するか。
- 証明の成立範囲はその命題と使用した定義に限る。
- 作業を戻せる状態を保ったか。故意のエラーを含む版を成功済み基準版に混ぜていないか。

## 段階別ヒントと答え合わせ

**問題A（基本）：** `example` と名前付き `theorem` の違いを説明しましょう。

- ヒント：どちらも命題とその証明を書くが、名前付き定理は後からその名前で参照できる。
- 解答例：`theorem double_three : double 3 = 6 := by rfl` は `double_three` という名前を持つ命題の証明。書いた定理名自体には証明内容を強める力はない。

**問題B（発展）：** `rfl` が通る理由を、定義の展開に触れて説明しましょう。

- 解答：`double 3` は定義に従って `3 + 3` と計算され、`6` に簡約されるので、両辺が定義上等しいことを確かめられる。

**問題C（境界）：** 定理を `SafeSystem` と名付けたら安全性の証明になるか。

- 解答：ならない。命題が `double 3 = 6` のままなら、その命題以上を主張できない。

## 実行証拠と境界
**添付した専用Leanソース：CIで独立typecheck済み。** [検証記録](../../EVIDENCE.md)にある2026-10-20 run #39431843278・commit `e3dd74d706f1f4ae548fcd2cdb78298c8d74d4a8` に限定した判定。読者が変更したソースやすべての自由演習の成功を保証するものではない。

## 記録テンプレート
```text
chapter: 03
source commit:
working directory:
command:
observed result / NOT RUN:
files changed:
actual theorem or expected behavior:
not proven / unresolved:
```
