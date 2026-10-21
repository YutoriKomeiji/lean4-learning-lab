# 第1章 — 作業場を作る：章別実習資料

対応するBook本文：[`01` の章](https://github.com/YutoriKomeiji/zenn-content/blob/main/books/lean4-proof-engineering/01-workspace.md)
共通実行環境：[engineering/README.md](../../README.md)

## この章でできるようになること
公式インストール手順を確認し、公開Labのengineeringを取得して現在位置・toolchain・ビルド対象を記録する。

## 基本演習
1. 共通READMEから基準となる実習環境を用意し、使用したコミットSHAを記録する。
2. 公式インストール手順を確認し、公開Labのengineeringを取得して現在位置・toolchain・ビルド対象を記録する。
3. 変更前後のファイル、実際に実行したコマンド、終了結果を別々に記録する。実行できない場合は **NOT RUN** とする。

## 応用課題
CIで確認済みのコミットと現在のmainを区別し、手元の実行結果を別欄に書く。

## 自己採点と解答の観点
- 設問への回答がコード・差分・観測記録と対応するか。
- 端末がleanを見つけない場合は証明の欠陥と断定せず、導入・PATH・シェルを確認する。
- 作業を戻せる状態を保ったか。故意のエラーを含む版を成功済み基準版に混ぜていないか。

## 実行証拠と境界
**共通LabのCI検証は実測済み、本章で読者が行う追加操作は未実測。** [検証記録](../../EVIDENCE.md)に、特定コミットでの基準ビルドと選択した別教材の実行対象を記録しています。この章の**説明・設問・改変版の操作結果までCIで検証したわけではありません**。未実行なら `NOT RUN` のまま記録してください。

## 記録テンプレート
```text
chapter: 01
source commit:
working directory:
command:
observed result / NOT RUN:
files changed:
actual theorem or expected behavior:
not proven / unresolved:
```
