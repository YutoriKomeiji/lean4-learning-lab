# 第17章 — 実装する：章別実習資料

対応するBook本文：[`17` の章](https://github.com/YutoriKomeiji/zenn-content/blob/main/books/lean4-proof-engineering/17-implement.md)
共通実行環境：[engineering/README.md](../../README.md)

## この章でできるようになること
StateとCanStepのコンストラクタを読んで対応表を作る。

専用Leanソース：[Examples.lean](Examples.lean)（[CI実測記録](../../EVIDENCE.md)にある対象コミットで独立typecheck済み）

## 基本演習
1. 共通READMEから基準となる実習環境を用意し、使用したコミットSHAを記録する。
2. StateとCanStepのコンストラクタを読んで対応表を作る。
3. 変更前後のファイル、実際に実行したコマンド、終了結果を別々に記録する。実行できない場合は **NOT RUN** とする。

## 応用課題
禁止遷移を示す定理を追加するとき、定義を変えずに試す。

## 自己採点と解答の観点
- 設問への回答がコード・差分・観測記録と対応するか。
- コンストラクタが列挙されている範囲だけが対象。
- 作業を戻せる状態を保ったか。故意のエラーを含む版を成功済み基準版に混ぜていないか。

## 段階別ヒントと答え合わせ

**問題A（基本）：** `CanStep` の3つのコンストラクタを、許可する遷移と対応させましょう。

- 解答：`start` は idle→running、`stop` は running→stopped、`stayStopped` は stopped→stopped。

**問題B（発展）：** `stopped_cannot_step_to_running` が `cases h` で閉じるのはなぜでしょう。

- ヒント：`h : CanStep .stopped .running` を作れるコンストラクタを探す。
- 解答：宣言された `CanStep` にはその入力・出力に一致するコンストラクタがない。したがって仮定 `h` の場合分けに残るケースがなく、矛盾を示せる。

**問題C（境界）：** 第18章で `restart : CanStep .stopped .running` を追加した場合、同じ禁止定理を維持できますか。

- 解答：維持できない。禁止を主張する命題に反例となるコンストラクタが加わったため、定理の見直しが必要。これは実機で安全に再始動できることを証明するわけではない。

## 実行証拠と境界
**添付した専用Leanソース：CIで独立typecheck済み。** [検証記録](../../EVIDENCE.md)にある2026-10-20 run #39431843278・commit `e3dd74d706f1f4ae548fcd2cdb78298c8d74d4a8` に限定した判定。読者が変更したソースやすべての自由演習の成功を保証するものではない。

## 記録テンプレート
```text
chapter: 17
source commit:
working directory:
command:
observed result / NOT RUN:
files changed:
actual theorem or expected behavior:
not proven / unresolved:
```
