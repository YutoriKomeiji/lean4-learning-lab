# 第7章 — ファイルを分ける：章別実習資料

対応するBook本文：[`07` の章](https://github.com/YutoriKomeiji/zenn-content/blob/main/books/lean4-proof-engineering/07-split-files.md)
共通実行環境：[engineering/README.md](../../README.md)

## この章でできるようになること
doubleの定義をBasic.leanへ移しimportする編集案を作る。

## 基本演習
1. 共通READMEから基準となる実習環境を用意し、使用したコミットSHAを記録する。
2. doubleの定義をBasic.leanへ移しimportする編集案を作る。
3. 変更前後のファイル、実際に実行したコマンド、終了結果を別々に記録する。実行できない場合は **NOT RUN** とする。

## 応用課題
変更前後の命題と定義が同じかdiffで検査し、ビルドは独立に確認する。

## 自己採点と解答の観点
- 設問への回答がコード・差分・観測記録と対応するか。
- moduleの構造を整えることは定理の強化ではない。
- 作業を戻せる状態を保ったか。故意のエラーを含む版を成功済み基準版に混ぜていないか。

## 独立した分割演習（追加資料）

- [Basic.lean](Basic.lean)：移動先になる定義の候補。
- [Examples.lean](Examples.lean)：`import ProofEngineeringLab.Basic` を使う候補。

これらは元のLabを壊さずにファイル分割を学ぶための素材です。`Basic.lean` は**名前空間なしの `double`** を定義しています。Book本文と同じ名前なので、元のファイルにある `#check double` と `example : double 3 = 6` を変更する必要はありません。

**元の作業を保護するため、まずリポジトリの作業用コピーで実施してください。** `engineering/` にいる状態から、次の2つのファイルを適切な位置にコピーします。

```sh
mkdir -p ProofEngineeringLab
cp chapters/07/Basic.lean ProofEngineeringLab/Basic.lean
cp chapters/07/Examples.lean Chapter07Demo.lean
```

Windows PowerShellなら `New-Item -ItemType Directory -Force ProofEngineeringLab` でフォルダーを作り、`Copy-Item` でファイルをコピーしてください。上記の `mkdir -p` はPowerShell向けのコマンドではありません。

次に `ProofEngineeringLab.lean` だけを編集します。

1. 先頭に `import ProofEngineeringLab.Basic` を追加する。
2. 元の `def double (n : Nat) : Nat := n + n` を削除する。**定義を重複させない。**
3. `#check`・`#eval`・既存の例・状態遷移・定理は残す。

実行前に `git diff` で変更範囲を確認し、`engineering/` から次を実行して各結果を記録してください。

```sh
lake build
lake env lean Chapter07Demo.lean
```

`Chapter07Demo.lean` は通常の `lake build` に自動的に含まれるとは限らないので、2行目で明示的に検査します。名前の衝突、import先や型の間違いを検査し、失敗したら実際のエラーを残してください。元の状態へ戻す前に成果と差分を確認してください。

今回、分割教材とbook側の名前不整合は修正しましたが、**この変更の実行成功ログはまだ未取得**です。GitHub Actionsの追加チェックも、成功が観測されるまでは完了扱いにしません。

## 実行証拠と境界
**章別実習の独立した実行結果：NOT YET VERIFIED。** 既存の[CI成功記録](../../EVIDENCE.md)は基準Labの特定コミットに限る。本章の変更版や追加演習まで検査済みとはしない。

## 記録テンプレート
```text
chapter: 07
source commit:
working directory:
command:
observed result / NOT RUN:
files changed:
actual theorem or expected behavior:
not proven / unresolved:
```
