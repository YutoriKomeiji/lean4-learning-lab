# 第9章 — テストと証明を分ける：章別実習資料

対応するBook本文：[`09` の章](https://github.com/YutoriKomeiji/zenn-content/blob/main/books/lean4-proof-engineering/09-test-and-proof.md)
共通実行環境：[engineering/README.md](../../README.md)

## この章でできるようになること
#eval double 3、example : double 3 = 6、一般命題を比較する。

## 基本演習
1. 共通READMEから基準となる実習環境を用意し、使用したコミットSHAを記録する。
2. #eval double 3、example : double 3 = 6、一般命題を比較する。
3. 変更前後のファイル、実際に実行したコマンド、終了結果を別々に記録する。実行できない場合は **NOT RUN** とする。

## 応用課題
各主張に適切なEvidenceを1対1で対応させる。

## 自己採点と解答の観点
- 設問への回答がコード・差分・観測記録と対応するか。
- 有限のテスト結果は自動的に一般命題の証明にならない。
- 作業を戻せる状態を保ったか。故意のエラーを含む版を成功済み基準版に混ぜていないか。

## 4段階を見分ける演習

**問題A（基本）：** 次の3つを分類しましょう。

| コード | 対象 |
|---|---|
| `#eval double 3` | 特定入力の評価 |
| `example : double 3 = 6 := by rfl` | 特定命題の証明 |
| `theorem double_eq_add_self (n : Nat) : double n = n + n := by rfl` | 任意の自然数 `n` に関する命題の証明候補 |

**問題B（発展）：** 上の一般命題が本当に受理されるか試すには？

- ヒント：既存の `double` の定義があるソースへ定理部分だけを足す。
- 解答の観点：変更差分、`lake build`、使用toolchainと対象SHAを記録。**この新規追加定理の実測は、個別ログがない限り主張しない**。

**問題C（境界）：** 一般命題が受理されたら実装目的と一致すると言えるか。

- 解答：言えない。自然言語の要求が `n+n` だったかどうか、モデルと仕様を別途照合する。

## 実行証拠と境界
**共通LabのCI検証は実測済み、本章で読者が行う追加操作は未実測。** [検証記録](../../EVIDENCE.md)に、特定コミットでの基準ビルドと選択した別教材の実行対象を記録しています。この章の**説明・設問・改変版の操作結果までCIで検証したわけではありません**。未実行なら `NOT RUN` のまま記録してください。

## 記録テンプレート
```text
chapter: 09
source commit:
working directory:
command:
observed result / NOT RUN:
files changed:
actual theorem or expected behavior:
not proven / unresolved:
```
