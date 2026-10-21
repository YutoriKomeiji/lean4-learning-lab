# 第2章 — 最初の定義：章別実習資料

対応するBook本文：[`02` の章](https://github.com/YutoriKomeiji/zenn-content/blob/main/books/lean4-proof-engineering/02-first-definition.md)
共通実行環境：[engineering/README.md](../../README.md)

## この章でできるようになること
既存のdoubleを読み、double 3の予想と#evalの実測値を別々に記録する。

専用Leanソース：[Examples.lean](Examples.lean)（[CI実測記録](../../EVIDENCE.md)にある対象コミットで独立typecheck済み）

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

## 段階別ヒントと答え合わせ

**問題A（基本）：** `double 3` の結果を実行前に予想し、`#eval double 3` と比較しましょう。

- ヒント：`double n` の右辺は `n + n`。
- 解答：予想値は `6`。基準LabのCIログでは `ProofEngineeringLab.lean` 内の `#eval double 3` が `6` を出力した。専用 `chapters/02/Examples.lean` のCIではtypecheck成功を確認したが、その評価値の標準出力はログへ個別表示されていない。これは入力 `3` の評価であり、全入力に関する定理ではない。

**問題B（発展）：** `double 0` と `double 4` の結果を予想して、ソースを検査しましょう。

- ヒント：同じ式へ `0`、`4` を代入する。
- 解答：定義から予想される値はそれぞれ `0`、`8`。専用ソースには `#eval double 0` と `#eval double 4` があるが、確認済みCIログは `TYPECHECK_PASS` のみを表示しており、`0` と `8` の数値出力を個別に保存した証拠ではない。実際の値を記録する場合は、自分で `lake env lean chapters/02/Examples.lean` を実行して出力を記録する。有限個の評価は一般命題の証明ではない。

**問題C（境界）：** `example : double 3 = 6 := by rfl` は、何について証明したか。

- 解答：この定義による `double 3 = 6` という具体的命題。現実の別の計算機プログラムが正しいという主張ではない。

## 実行証拠と境界
**添付した専用Leanソース：CIで独立typecheck済み。** [検証記録](../../EVIDENCE.md)にある2026-10-20 run #39431843278・commit `e3dd74d706f1f4ae548fcd2cdb78298c8d74d4a8` に限定した判定。読者が変更したソースやすべての自由演習の成功を保証するものではない。

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
