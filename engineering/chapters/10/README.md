# 第10章 — Gitで変更を残す：章別実習資料

対応するBook本文：[`10` の章](https://github.com/YutoriKomeiji/zenn-content/blob/main/books/lean4-proof-engineering/10-git-changes.md)
共通実行環境：[engineering/README.md](../../README.md)

## この章でできるようになること
演習前後のgit diffとコミットSHAの記録方法を確認する。

## 基本演習
1. 共通READMEから基準となる実習環境を用意し、使用したコミットSHAを記録する。
2. 演習前後のgit diffとコミットSHAの記録方法を確認する。
3. 変更前後のファイル、実際に実行したコマンド、終了結果を別々に記録する。実行できない場合は **NOT RUN** とする。

## 応用課題
AIが仕様や定理を密かに弱める変更をdiffで検出する練習をする。

## 自己採点と解答の観点
- 設問への回答がコード・差分・観測記録と対応するか。
- コミットが存在してもコードの正しさは保証されない。
- 作業を戻せる状態を保ったか。故意のエラーを含む版を成功済み基準版に混ぜていないか。

## 差分から仕様変更を検出する練習

**問題A（基本）：** 作業を始める前後で `git status --short` と `git diff` を使う目的は？

- 解答：どのファイルの何が変わったかを確認するため。どちらもLeanの定理の正しさを証明するコマンドではない。

**問題B（発展）：** 以下は説明用の架空の差分です。依頼が「proofだけ直す」だった場合に採用できますか。

```diff
-theorem double_three : double 3 = 7 := by
+theorem double_three : double 3 = 6 := by
   rfl
```

- 解答：証明対象の命題の変更なので、そのまま「proofだけの修正」としては採用できない。元の仕様が `7` なら先に仕様の誤りかどうか確認する。差分は教育用の例で、実際のAI変更ログではない。

**問題C（境界）：** commit SHAを記録しただけで、CIで何が検査されたか確定できますか。

- 解答：いいえ。対応するrun、workflow、対象ファイル、実行コマンドと出力も必要。

## 実行証拠と境界
**共通LabのCI検証は実測済み、本章で読者が行う追加操作は未実測。** [検証記録](../../EVIDENCE.md)に、特定コミットでの基準ビルドと選択した別教材の実行対象を記録しています。この章の**説明・設問・改変版の操作結果までCIで検証したわけではありません**。未実行なら `NOT RUN` のまま記録してください。

## 記録テンプレート
```text
chapter: 10
source commit:
working directory:
command:
observed result / NOT RUN:
files changed:
actual theorem or expected behavior:
not proven / unresolved:
```
