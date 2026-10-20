# 第8章 — Lakeを読む：章別実習資料

対応するBook本文：[`08` の章](https://github.com/YutoriKomeiji/zenn-content/blob/main/books/lean4-proof-engineering/08-read-lake.md)
共通実行環境：[engineering/README.md](../../README.md)

## この章でできるようになること
lean-toolchain、lakefile.tomlのdefaultTargetsとlean_libを照合する。

## 基本演習
1. 共通READMEから基準となる実習環境を用意し、使用したコミットSHAを記録する。
2. lean-toolchain、lakefile.tomlのdefaultTargetsとlean_libを照合する。
3. 変更前後のファイル、実際に実行したコマンド、終了結果を別々に記録する。実行できない場合は **NOT RUN** とする。

## 応用課題
ターゲットの指定漏れがどのファイルを未検査にするか説明する。

## 自己採点と解答の観点
- 設問への回答がコード・差分・観測記録と対応するか。
- ファイルが存在するだけでは実際にビルドされたことにならない。
- 作業を戻せる状態を保ったか。故意のエラーを含む版を成功済み基準版に混ぜていないか。

## 設定を実物と照合する演習

**問題A（基本）：** `engineering/lakefile.toml` の `defaultTargets` と `[[lean_lib]]` の `name` を比べてください。

- ヒント：大文字・小文字も含めて読む。
- 解答：現行教材の値はいずれも `ProofEngineeringLab`。設定の記述とbuild成功は別の情報なので、ログも参照する。

**問題B（発展）：** `engineering/chapters/02/Examples.lean` があるだけで、`lake build` の標準ターゲットに含まれるでしょうか。

- 解答：含まれるとは限らない。現行教材は `lake env lean chapters/02/Examples.lean` を追加チェックとして個別実行した。実際の対象は[検査スクリプト](../../scripts/verify-teaching-examples.sh)と[実行ログ](../../EVIDENCE.md)で照合する。

**問題C（境界）：** `lean-toolchain` が固定されている事実だけで、Windowsでも同じ結果だと証明できますか。

- 解答：できない。OS別の導入と実行観測は別の確認項目。

## 実行証拠と境界
**章別実習の独立した実行結果：NOT YET VERIFIED。** 既存の[CI成功記録](../../EVIDENCE.md)は基準Labの特定コミットに限る。本章の変更版や追加演習まで検査済みとはしない。

## 記録テンプレート
```text
chapter: 08
source commit:
working directory:
command:
observed result / NOT RUN:
files changed:
actual theorem or expected behavior:
not proven / unresolved:
```
