# 第18章 — 壊してみる：章別実習資料

対応するBook本文：[`18` の章](https://github.com/YutoriKomeiji/zenn-content/blob/main/books/lean4-proof-engineering/18-break-it.md)
共通実行環境：[engineering/README.md](../../README.md)

## この章でできるようになること
CanStepへstopped→runningを追加し、従来の禁止遷移命題との衝突を調べる。

## 基本演習
1. 共通READMEから基準となる実習環境を用意し、使用したコミットSHAを記録する。
2. CanStepへstopped→runningを追加し、従来の禁止遷移命題との衝突を調べる。
3. 変更前後のファイル、実際に実行したコマンド、終了結果を別々に記録する。実行できない場合は **NOT RUN** とする。

## 応用課題
故意の破壊と復元の両方を別の実験記録にする。

## 自己採点と解答の観点
- 設問への回答がコード・差分・観測記録と対応するか。
- 失敗ログは実測してから記す。
- 作業を戻せる状態を保ったか。故意のエラーを含む版を成功済み基準版に混ぜていないか。

## 仕様変更の比較教材（追加資料）

- [Before.lean](Before.lean)：禁止遷移の定理を含む元の候補モデル。
- [AfterIntentionalFailure.lean](AfterIntentionalFailure.lean)：`restart` を許可したのに、古い禁止遷移定理を残した**意図的な失敗候補**。
- [AfterRepaired.lean](AfterRepaired.lean)：新仕様に合わせ、許可された遷移を明示する定理へ変更した候補。

3つを同じビルドターゲットへまとめないでください。別々のファイルを意図的に指定して検査し、各対象のコマンド、toolchain、終了結果、ログ、SHAを記録します。**失敗版が失敗すると予想されることは、実際に失敗したEvidenceではありません。** 現時点で追加ファイルの独立検証はすべて **NOT VERIFIED** です。

解答の重要点は、元の定理を証明できるようにモデルの新仕様を勝手に戻すことではありません。再始動を許す仕様なら、禁止遷移を主張し続けてはいけません。モデル変更後の定理も現実世界の安全性までは証明しません。

## 実行証拠と境界
**章別実習の独立した実行結果：NOT YET VERIFIED。** 既存の[CI成功記録](../../EVIDENCE.md)は基準Labの特定コミットに限る。本章の変更版や追加演習まで検査済みとはしない。

## 記録テンプレート
```text
chapter: 18
source commit:
working directory:
command:
observed result / NOT RUN:
files changed:
actual theorem or expected behavior:
not proven / unresolved:
```
