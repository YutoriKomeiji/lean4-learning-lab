# 第20章 — AUDITして完成させる：章別実習資料

対応するBook本文：[`20` の章](https://github.com/YutoriKomeiji/zenn-content/blob/main/books/lean4-proof-engineering/20-audit-complete.md)
共通実行環境：[engineering/README.md](../../README.md)

## この章でできるようになること
Actual theorem、Definitions、Assumptions、build evidence、Proof Ceilingを実プロジェクトから埋める。

## 基本演習
1. 共通READMEから基準となる実習環境を用意し、使用したコミットSHAを記録する。
2. Actual theorem、Definitions、Assumptions、build evidence、Proof Ceilingを実プロジェクトから埋める。
3. 変更前後のファイル、実際に実行したコマンド、終了結果を別々に記録する。実行できない場合は **NOT RUN** とする。

## 応用課題
公開許可と技術的Evidenceを混ぜず、未解決項目を列挙する。

## 自己採点と解答の観点
- 設問への回答がコード・差分・観測記録と対応するか。
- 完成という編集判断はkernelが生成しない。
- 作業を戻せる状態を保ったか。故意のエラーを含む版を成功済み基準版に混ぜていないか。

## 最終AUDITを記入する演習

**問題A（基本）：** `stopped_cannot_step_to_running` の形式命題を明示してください。

- 解答：`¬ CanStep .stopped .running`。3状態モデル内の`CanStep`で表現される1回の直接遷移が構成できないという主張。

**問題B（発展）：** 次の項目を分離して監査してください。

| 項目 | この教材での判定 |
|---|---|
| 形式モデルのコード | GitHubの対象ソースを閲覧できる |
| 基準版CIビルド | [run #39051025427](https://github.com/YutoriKomeiji/lean4-learning-lab/actions/runs/39051025427) で成功を観測 |
| 章別・分割・故意の失敗 | [run #39431843278](https://github.com/YutoriKomeiji/lean4-learning-lab/actions/runs/39431843278) の対象に限定して観測 |
| 全20章の自由演習 | 包括的な実行検証は未完了 |
| 外部の機械・運用上の安全性 | 未検証 |
| 独立した第三者再現 | 未実施（任意） |
| 採用・公開のAuthority | 技術Evidenceからは発生しない |

**問題C（境界）：** 「ビルド成功なので安全システムとして採用してよい」という宣言を審査してください。

- 解答：却下。CIは設定されたLeanソースの検査結果を示すが、現実の安全性・要件妥当性・採用権限は別の判断経路を要する。

## 実行証拠と境界
**章別実習の独立した実行結果：NOT YET VERIFIED。** 既存の[CI成功記録](../../EVIDENCE.md)は基準Labの特定コミットに限る。本章の変更版や追加演習まで検査済みとはしない。

## 記録テンプレート
```text
chapter: 20
source commit:
working directory:
command:
observed result / NOT RUN:
files changed:
actual theorem or expected behavior:
not proven / unresolved:
```
