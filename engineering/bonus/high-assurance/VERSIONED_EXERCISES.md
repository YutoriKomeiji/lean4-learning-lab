# Bonus 03 — 仕様変更後に古い承認を再利用してよい？

本ファイルは[VersionBoundApproval.lean](VersionBoundApproval.lean)の**教育用演習**。実行・typecheck未確認の候補。

## 中学生向け：バージョンを比べよう
ある変更依頼の現在の版を `3` とし、承認Aには `2`、承認Bには `3` と書いてある。両方をそのまま使ってよいと判定されるだろうか？

**ヒント：** `a.version = d.currentVersion` と `b.version = d.currentVersion` の両方を満たす必要がある。

**解答の観点：** 現モデルではAの数字が一致しないので `ValidPair` の条件を満たさない。ただし、数字を照合するモデルであり、実在の承認を検証する仕組みではない。

## 発展：何を追加した？
Bonus 02の `TwoPersonGate.lean` と比較し、`Approval.version`、`ChangeRequest.currentVersion`、2件のversion照合を見つけよう。

**解答：** 二者が異なるだけでなく、同じ依頼の現在版に紐づける制約を追加した。仕様の版が変わったなら、旧版の数値だけでは一致条件を満たさない。

## 設計・監査：数字だけ書き換えたら？
第三者が版数欄を `3` に書き換えたとき、Leanのモデルは本人性・署名の真正性まで保証できる？

**解答：** できない。モデルには電子署名、改ざん検知、本人確認、失効、信頼できる発行元が存在しない。値が一致しても現実の承認とは限らない。

## 追加課題
- 同じリクエストIDでも対象の仕様内容が変わったとき、内容のハッシュ・同一性をどう扱う？
- 承認が取り消された場合、どの時点の情報を参照する？
- 実行直前の再評価を入れるなら、形式モデル・外部システムそれぞれに何が要る？

## 観測シート
```text
source commit:
toolchain:
command:
actual exit status / NOT RUN:
actual diagnostic / NOT OBSERVED:
model claim:
missing real-world evidence:
```
