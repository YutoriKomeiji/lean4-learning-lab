# 第19章 — CIと再現手順：章別実習資料

対応するBook本文：[`19` の章](https://github.com/YutoriKomeiji/zenn-content/blob/main/books/lean4-proof-engineering/19-ci-reproduction.md)
共通実行環境：[engineering/README.md](../../README.md)

## この章でできるようになること
基準版と変更版を別SHAで記録し、第三者が同じbuild targetを確認できる手順を書く。

## 基本演習
1. 共通READMEから基準となる実習環境を用意し、使用したコミットSHAを記録する。
2. 基準版と変更版を別SHAで記録し、第三者が同じbuild targetを確認できる手順を書く。
3. 変更前後のファイル、実際に実行したコマンド、終了結果を別々に記録する。実行できない場合は **NOT RUN** とする。

## 応用課題
workflowの対象パス、コマンド、ログ取得導線を監査する。

## 自己採点と解答の観点
- 設問への回答がコード・差分・観測記録と対応するか。
- 第三者が実施していなければ再現済みとしない。
- 作業を戻せる状態を保ったか。故意のエラーを含む版を成功済み基準版に混ぜていないか。

## 対象SHAを固定した再現演習

**問題A（基本）：** [run #39431843278](https://github.com/YutoriKomeiji/lean4-learning-lab/actions/runs/39431843278) の対象ソースと命令を記録してください。

- 解答：SHA `e3dd74d706f1f4ae548fcd2cdb78298c8d74d4a8`、working directory `engineering`、Lean v4.24.0、`lake build` と `bash scripts/verify-teaching-examples.sh`。
- 読者はGitで取得後に指定コミットへ切り替えてから実行する。実行していない場合は `NOT RUN` のままにする。

**問題B（発展）：** このrunの失敗試験と通常ビルドはどう区別される？

- 解答：通常の `lake build` は正常系。第18章の故意の失敗は検査スクリプト内で明示的に拒否を期待し、正常系ターゲットへ混在させない。

**問題C（境界）：** CIの成功が第三者のWindowsやmacOSでの成功も意味するか。

- 解答：意味しない。対象runはGitHub-hosted Ubuntuでの記録。OS別実行は別のEvidenceを要するが、独立した第三者再現は公開必須条件ではない。

## 実行証拠と境界
**この章が参照する既存のCI記録は実測済み。** [検証記録](../../EVIDENCE.md)では、基準Labの `lake build` と、指定章別Leanコード・分割版・期待される拒否を、対象SHA・実行コマンド付きで確認できます。ただし**この章の読者用演習の操作・解答・改変版を個別に実行検証したわけではありません**。読者自身が実行していなければ `NOT RUN` と記録してください。

## 記録テンプレート
```text
chapter: 19
source commit:
working directory:
command:
observed result / NOT RUN:
files changed:
actual theorem or expected behavior:
not proven / unresolved:
```
