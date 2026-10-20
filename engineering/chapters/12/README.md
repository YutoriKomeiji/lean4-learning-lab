# 第12章 — 再現できるREADME：章別実習資料

対応するBook本文：[`12` の章](https://github.com/YutoriKomeiji/zenn-content/blob/main/books/lean4-proof-engineering/12-reproducible-readme.md)
共通実行環境：[engineering/README.md](../../README.md)

## この章でできるようになること
前提、取得方法、ディレクトリ、コマンド、期待値、証拠の上限をREADME形式にまとめる。

## 基本演習
1. 共通READMEから基準となる実習環境を用意し、使用したコミットSHAを記録する。
2. 前提、取得方法、ディレクトリ、コマンド、期待値、証拠の上限をREADME形式にまとめる。
3. 変更前後のファイル、実際に実行したコマンド、終了結果を別々に記録する。実行できない場合は **NOT RUN** とする。

## 応用課題
第三者が迷う曖昧な操作を一つ選び、コマンドへ具体化する。

## 自己採点と解答の観点
- 設問への回答がコード・差分・観測記録と対応するか。
- 実行していない成功ログは書かない。
- 作業を戻せる状態を保ったか。故意のエラーを含む版を成功済み基準版に混ぜていないか。

## 最小READMEを書いて答え合わせ

**問題A（基本）：** 他人がLabを再現するために最低限必要な項目を挙げてください。

- 解答の観点：取得元URL、検査対象コミット、Lean toolchain、作業ディレクトリ、検査コマンド、期待する出力、実際に観測した出力、未検査範囲。

**問題B（実践）：** 次の例を元に、自分の結果を別欄へ記録してください。

```text
Repository: https://github.com/YutoriKomeiji/lean4-learning-lab
Working directory: engineering/
Lean toolchain: leanprover/lean4:v4.24.0
Known verified commit: e3dd74d706f1f4ae548fcd2cdb78298c8d74d4a8
Commands: lake build
          bash scripts/verify-teaching-examples.sh  (Bash環境用)
Recorded CI: https://github.com/YutoriKomeiji/lean4-learning-lab/actions/runs/39431843278
My execution: NOT RUN / (自分で実行した場合のみ埋める)
```

- 解答の観点：`git clone` の後に指定SHAをチェックアウトした場合だけ「対象コミットの再現」と書く。ZIPではGit操作は使えない。自分で未実行なら `NOT RUN` のまま。

**問題C（境界）：** 「全員の環境で成功する」とREADMEに書けますか。

- 解答：書けない。記載したCI実測は対象環境と対象ソースに限定される。

## 実行証拠と境界
**章別実習の独立した実行結果：NOT YET VERIFIED。** 既存の[CI成功記録](../../EVIDENCE.md)は基準Labの特定コミットに限る。本章の変更版や追加演習まで検査済みとはしない。

## 記録テンプレート
```text
chapter: 12
source commit:
working directory:
command:
observed result / NOT RUN:
files changed:
actual theorem or expected behavior:
not proven / unresolved:
```
