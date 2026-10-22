# AIとLeanの失敗事例集 — 証拠を混同しないための監査資料

**位置づけ：公開前の教材整備中。AI実会話の再現記録ではありません。** この文書で示す「AIの発言」は説明用の**想定例**であり、実際にAIが生成した発言・実験データを捏造しません。Leanを実行した根拠は指定されたGitHub Actionsのソース・コマンド・ログに限定します。第三者による独立再現は未実施です（任意）。

## 共通する実行Evidence

- [Engineering Lab run #39431843278](https://github.com/YutoriKomeiji/lean4-learning-lab/actions/runs/39431843278)
- **対象ソースSHA**: `e3dd74d706f1f4ae548fcd2cdb78298c8d74d4a8`
- Ubuntu 24.04.5 / Lean v4.24.0 / 作業ディレクトリ `engineering/`
- `lake build`、`bash scripts/verify-teaching-examples.sh` を実行したジョブログの実測。詳細は [EVIDENCE.md](EVIDENCE.md)。
- このrunの成功は、選択されたLeanファイルのtypecheck、隔離分割版のbuild、意図したエラーの検知を意味します。下記の**想定AI出力がそのまま実際に生成されたこと**は意味しません。

## Case A — 正しく通るが、そもそもの命題が弱い【Lean実測あり／AI会話未実施】

**想定される危険な説明（模擬）：**「`FormalSafetyGuarantee` がLeanを通ったので、このシステムの実環境での安全性が正式に保証された」

**実際のソース:** [chapters/06/Examples.lean](chapters/06/Examples.lean)

```lean
namespace Chapter06
def isSafe (_ : Nat) : Prop := True
theorem FormalSafetyGuarantee (n : Nat) : isSafe n := by
  trivial
end Chapter06
```

**実際に確認した範囲:** 上記SHAに対する検査スクリプトの `lake env lean chapters/06/Examples.lean` が `TYPECHECK_PASS: chapters/06/Examples.lean` と記録され、ジョブも成功。**定義 `isSafe` が常に `True` になること**と**実世界の安全性が認められること**は別物です。

**修正の観点:** `theorem` 名を根拠に強い主張をしない。自然言語の要求→形式定義→定理の対応を監査し、「この命題は定義上 `True` とされた `isSafe n` を示す」とだけ説明します。**実サービスの安全を証明したものではありません。**

**リカバリの記録欄:** 本来の安全要求、形式モデルの対象、対象外の事象、定義変更に必要な承認、修正後の再検証ログ。このケースでは本来の安全要件へ対応する**別の強い定義・実装の修復実験は未実施**。

## Case B — CIは緑でも、ファイルが検査対象外になり得る【CI実測・静的範囲照合あり／AI会話未実施】

**想定される危険な説明（模擬）：**「GitHub Actionsが緑なので、Bookの全20章のLeanコードと読者演習はすべて検証済み」

**確認する実物:**
- [engineering-build.yml](https://github.com/YutoriKomeiji/lean4-learning-lab/blob/main/.github/workflows/engineering-build.yml)
- [verify-teaching-examples.sh](scripts/verify-teaching-examples.sh)
- [章別教材マップ](CHAPTER_MATERIALS.md)

実際のworkflowには基本 `lake build` と追加の `bash scripts/verify-teaching-examples.sh` があり、追加スクリプトは章02/03/06/16/17、章18の正常系2ファイル、Bonus3ファイル、章07の隔離分割版、章18の意図的失敗ファイルを明示的に扱います。**これ以外の演習解答、Book文章、読者が新規作成したファイル、全OSでの再現まで自動検証したわけではありません。**

**実測:** 上記runの `TYPECHECK_PASS`、`SPLIT_VARIANT_PASS`、`EXPECTED_FAILURE_OBSERVED` とジョブ成功。これらのログにない任意のファイルの成功は導けません。

**修正・復旧:** 「緑色」を一括評価せず、workflowの対象・スクリプトの明示パス・実行SHA・各コマンドのログを1対1で照合します。追加ファイルを検査したい場合は、対象ファイルを意図的にtypecheckする手順を別に設計し、実際の結果を取得してからだけステータスを更新します。**CIから漏れた架空の変更ファイルをこのrunで実際に失敗させたとは主張しません。**

## Case C — 実在しないAPI・tacticをAIが提示する【設計のみ／未実行】

**想定される危険な説明（模擬）：**「Lean 4にこの便利なtacticがあるはずだから、コードへ書けば証明できます」

この種の誤りを実例として載せるには、(1)実際に提案されたコードの逐語保存、(2)Lean 4版とSHA、(3)該当ソースだけの実行コマンドとコンパイラ診断、(4)修正差分、(5)修正後の再実行、が必要です。

**現時点の判定：NOT RUN / NOT OBSERVED。** 提案コードやエラーメッセージを創作し、Leanが拒否した実績として載せてはいけません。実測が揃った時点でこの節を置き換えること。AIとの実会話を記録していない場合は、あくまで**著者設計の対照教材**と明記して区別します。

## 参考 — 意図したLean拒否は別の実例として実測済み

[chapters/18/AfterIntentionalFailure.lean](chapters/18/AfterIntentionalFailure.lean) では `restart : CanStep .stopped .running` を追加しながら古い `¬ CanStep .stopped .running` を維持したため、[run #39431843278](https://github.com/YutoriKomeiji/lean4-learning-lab/actions/runs/39431843278) に `error: unsolved goals` / `⊢ False`、`EXPECTED_FAILURE_OBSERVED` が記録されています。修復版 [AfterRepaired.lean](chapters/18/AfterRepaired.lean) は同runで `TYPECHECK_PASS`。これは**形式仕様変更が旧命題に与える影響の実測**であり、「AIのtactic捏造」を実測した事例に読み替えてはいけません。

## 公開前のゲート

本資料で「実際のAI補助による失敗・復旧を3件観測した」とは主張できません。AI失敗ケースブックの公開基準を満たすには、特にCase Cの再現実験、およびAIの提案内容と実測結果を結びつける一次記録が残課題です。既存のLean実行Evidenceを尊重し、根拠のない成功・失敗ログを増やさないでください。
