# 第15章 — AIの『できた』を監査する：章別実習資料

対応するBook本文：[`15` の章](https://github.com/YutoriKomeiji/zenn-content/blob/main/books/lean4-proof-engineering/15-audit-ai-done.md)
共通実行環境：[engineering/README.md](../../README.md)

## この章でできるようになること
AI回答の変更ファイル、実行コマンド、実ログ、未検査経路を照合する。

## 基本演習
1. 共通READMEから基準となる実習環境を用意し、使用したコミットSHAを記録する。
2. AI回答の変更ファイル、実行コマンド、実ログ、未検査経路を照合する。
3. 変更前後のファイル、実際に実行したコマンド、終了結果を別々に記録する。実行できない場合は **NOT RUN** とする。

## 応用課題
存在しないコマンド実行や架空のCI緑を見抜く監査表を完成させる。

## 自己採点と解答の観点
- 設問への回答がコード・差分・観測記録と対応するか。
- 発話や自己申告から実行Evidenceは生まれない。
- 作業を戻せる状態を保ったか。故意のエラーを含む版を成功済み基準版に混ぜていないか。

## 監査表を使う模擬演習（実測AI会話ではない）

**架空のAI報告例：** 「Leanコードを全部検証しました。GitHub Actionsも緑なので、現実の装置が安全であることが形式証明されています。」

実在する[Engineering lab build run #39431843278](https://github.com/YutoriKomeiji/lean4-learning-lab/actions/runs/39431843278) と照合して、次を埋めてください。

| 監査対象 | 模範判定 |
|---|---|
| GitHub Actionsの実行が成功した | 対象SHA・該当workflowについて観測済み |
| Labの標準 `lake build` | 対象runで成功 |
| 全20章の全コード・演習 | 未検証部分あり。包括的成功とは言えない |
| 意図的失敗の検知 | Chapter 18の対象ファイルで拒否を実測 |
| 現実の装置の安全性 | ここで使う形式モデル・CIからは証明できない |
| AIの説明そのものの信頼性 | AI発話のみではEvidenceなし |

**応用問題：** 「検証しました」という発話を、どの証拠があれば受理しますか。

- 解答：どのファイル・命題についての主張かを固定し、対象ソース、コミット、実際のコマンドとログ、実行結果、未検査範囲を照合する。ソース中の命題と現実の仕様が一致するかは別の判定。

## 実行証拠と境界
**章別実習の独立した実行結果：NOT YET VERIFIED。** 既存の[CI成功記録](../../EVIDENCE.md)は基準Labの特定コミットに限る。本章の変更版や追加演習まで検査済みとはしない。

## 記録テンプレート
```text
chapter: 15
source commit:
working directory:
command:
observed result / NOT RUN:
files changed:
actual theorem or expected behavior:
not proven / unresolved:
```
