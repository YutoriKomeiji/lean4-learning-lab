# 第11章 — CIでbuildする：章別実習資料

対応するBook本文：[`11` の章](https://github.com/YutoriKomeiji/zenn-content/blob/main/books/lean4-proof-engineering/11-ci-build.md)
共通実行環境：[engineering/README.md](../../README.md)

## この章でできるようになること
既存のActions runと対象SHA、対象コマンドを読み比べる。

## 基本演習
1. 共通READMEから基準となる実習環境を用意し、使用したコミットSHAを記録する。
2. 既存のActions runと対象SHA、対象コマンドを読み比べる。
3. 変更前後のファイル、実際に実行したコマンド、終了結果を別々に記録する。実行できない場合は **NOT RUN** とする。

## 応用課題
新しい未実行ファイルがCIの対象に入っているかを監査する。

## 自己採点と解答の観点
- 設問への回答がコード・差分・観測記録と対応するか。
- green CIはそのrunで実行された検査の証拠に限る。
- 作業を戻せる状態を保ったか。故意のエラーを含む版を成功済み基準版に混ぜていないか。

## 実在するCIログで答え合わせ

[2026-10-20のEngineering lab build](https://github.com/YutoriKomeiji/lean4-learning-lab/actions/runs/39431843278)を開いてください。

**問題A（基本）：** 実行されたソースコミットとLeanの版は？

- 解答：`e3dd74d706f1f4ae548fcd2cdb78298c8d74d4a8`、Lean v4.24.0。これらは当該runに限定した値。

**問題B（発展）：** 緑色の結果だけで、全20章の教材ファイルが直接typecheckされたと言えますか。

- ヒント：`Build engineering project` と `Verify book chapter and bonus examples` のステップを分けて読む。
- 解答：言えない。CIログに `TYPECHECK_PASS` と表示されたファイル、および分割版と故意の失敗の検査が対象。説明文・設問・未指定ソース全体は対象外。

**問題C（境界）：** わざと失敗させるLeanコードが拒否されたのに、CI全体が成功したのはなぜ？

- 解答：検査スクリプトはその拒否を期待結果として判定し、成功対象のビルドとは分離している。失敗したLeanコード自体が成功したわけではない。

## 実行証拠と境界
**この章が参照する既存のCI記録は実測済み。** [検証記録](../../EVIDENCE.md)では、基準Labの `lake build` と、指定章別Leanコード・分割版・期待される拒否を、対象SHA・実行コマンド付きで確認できます。ただし**この章の読者用演習の操作・解答・改変版を個別に実行検証したわけではありません**。読者自身が実行していなければ `NOT RUN` と記録してください。

## 記録テンプレート
```text
chapter: 11
source commit:
working directory:
command:
observed result / NOT RUN:
files changed:
actual theorem or expected behavior:
not proven / unresolved:
```
