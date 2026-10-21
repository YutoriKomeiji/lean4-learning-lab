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

Windows PowerShellでは、同じ `engineering/` ディレクトリから次を実行します（上のBash/POSIXコマンドと**どちらか一方だけ**を使用）。

```powershell
New-Item -ItemType Directory -Path ProofEngineeringLab -Force
Copy-Item -Path chapters/07/Basic.lean -Destination ProofEngineeringLab/Basic.lean
Copy-Item -Path chapters/07/Examples.lean -Destination Chapter07Demo.lean
```

既に同名ファイルがある場合は、上書き前に内容を確認してください。PowerShell単体での**コピー手順**を示したもので、Windowsでのビルド成功を実測したという意味ではありません。

次に `ProofEngineeringLab.lean` だけを編集します。

1. 先頭に `import ProofEngineeringLab.Basic` を追加する。
2. 元の `def double (n : Nat) : Nat := n + n` を削除する。**定義を重複させない。**
3. `#check`・`#eval`・既存の例・状態遷移・定理は残す。

実行前に `git diff` で変更範囲を確認し、さらに `git status --short` で追加ファイルを確認します。`engineering/` から次を実行して各結果を記録してください。

```sh
lake build
lake env lean Chapter07Demo.lean
```

`Chapter07Demo.lean` は通常の `lake build` に自動的に含まれるとは限らないので、2行目で明示的に検査します。名前の衝突、import先や型の間違いを検査し、失敗したら実際のエラーを残してください。元の状態へ戻す前に成果と差分を確認してください。作業用コピーであれば元のフォルダーを残しておき、編集前の `ProofEngineeringLab.lean` と比較して、意図せぬ変更を残さないでください。元のリポジトリに直接作った場合は、`git diff` と `git status --short` で対象を確定し、自分で追加したファイルだけを取り消してください。ほかの作業ファイルを一括削除しないでください。

名前不整合の修正後、[Actions run #39431843278](https://github.com/YutoriKomeiji/lean4-learning-lab/actions/runs/39431843278) にて、隔離したコピーで `lake build` と `lake env lean Chapter07Demo.lean` が成功したことをログで確認しました。対象コミットは `e3dd74d706f1f4ae548fcd2cdb78298c8d74d4a8` です。

## 実行証拠と境界
**隔離した章別分割サンプル：CI実行検証済み（対象コミット限定）。** [実測ログと検証範囲](../../EVIDENCE.md)を参照してください。読者自身の変更版や全演習の結果までは保証しません。

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
