# 第16章 — 小さな仕様プロジェクト：章別実習資料

対応するBook本文：[`16` の章](https://github.com/YutoriKomeiji/zenn-content/blob/main/books/lean4-proof-engineering/16-small-spec-project.md)
共通実行環境：[engineering/README.md](../../README.md)

## この章でできるようになること
idle、running、stoppedの意味と許可する遷移を文章と表にする。

専用Leanソース：[Examples.lean](Examples.lean)（[CI実測記録](../../EVIDENCE.md)にある対象コミットで独立typecheck済み）

## 基本演習
1. 共通READMEから基準となる実習環境を用意し、使用したコミットSHAを記録する。
2. idle、running、stoppedの意味と許可する遷移を文章と表にする。
3. 変更前後のファイル、実際に実行したコマンド、終了結果を別々に記録する。実行できない場合は **NOT RUN** とする。

## 応用課題
禁止遷移と未定義遷移を分け、ユースケースから漏れを探す。

## 自己採点と解答の観点
- 設問への回答がコード・差分・観測記録と対応するか。
- 状態モデルは現実システムの安全性をまだ保証しない。
- 作業を戻せる状態を保ったか。故意のエラーを含む版を成功済み基準版に混ぜていないか。

## 段階別ヒントと答え合わせ

**問題A（基本）：** `State` が表す状態を列挙してください。

- 解答：`idle`、`running`、`stopped` の3つ。

**問題B（発展）：** ソースの `CanStep` コンストラクタに対応する許可遷移を表にしてください。

| 遷移 | このモデルでの扱い |
|---|---|
| idle → running | `start` で許可 |
| running → stopped | `stop` で許可 |
| stopped → stopped | `stayStopped` で許可 |
| stopped → running | 許可を構成するコンストラクタがない |

**問題C（境界）：** 実機で停止後の再始動が物理的に不可能と証明されたでしょうか。

- 解答：いいえ。このソースは選択した形式モデルの遷移関係を定義しただけで、実機の仕様との対応は別途検証が必要。

## 実行証拠と境界
**添付した専用Leanソース：CIで独立typecheck済み。** [検証記録](../../EVIDENCE.md)にある2026-10-20 run #39431843278・commit `e3dd74d706f1f4ae548fcd2cdb78298c8d74d4a8` に限定した判定。読者が変更したソースやすべての自由演習の成功を保証するものではない。

## 記録テンプレート
```text
chapter: 16
source commit:
working directory:
command:
observed result / NOT RUN:
files changed:
actual theorem or expected behavior:
not proven / unresolved:
```
