# 第1章 — 作業場を作る：章別実習資料

対応するBook本文：[`01` の章](https://github.com/YutoriKomeiji/zenn-content/tree/main/books/lean4-proof-engineering)
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
**章別実習の独立した実行結果：NOT YET VERIFIED。** 既存の[CI成功記録](../../EVIDENCE.md)は基準Labの特定コミットに限る。本章の変更版や追加演習まで検査済みとはしない。

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
