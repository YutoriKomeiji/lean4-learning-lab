# Bonus 01 — exercises, hints, answer guidance

## A. やってみよう（中学生向け）

**問題:** guest/editor/admin のうち、`approve` を許される役割をコードから探そう。

**ヒント:** `Allowed` の `adminApprove` を見つける。定理名ではなく**定義**を読む。

**解答:** 現在の `Allowed` の許可規則では admin にだけ approve のコンストラクタがある。ただし、これは企業の実際の権限管理の観測ではない。

## B. なぜ成り立つ？（発展）

**問題:** `guest_cannot_approve` の `intro h` と `cases h` は何を検査させようとしている？

**ヒント:** `h` は「guest に approve が許される」という証拠。どのコンストラクタがそれを作れるか調べる。

**解答の観点:** 現在のコンストラクタでは、guest approve を作る手段がないことを示す構造。Leanが実際に受理したかはtypecheckが必要。

## C. 仕様変更実験（上級）

**問題:** `Allowed` へ `guestApprove : Allowed .guest .approve` を追加すると、旧定理には何が起きるか予想する。

**ヒント:** 仕様そのものが変わった。証明だけを直して旧主張を維持することは適切？

**予想される結論:** 旧モデルに対する `guest_cannot_approve` と `approve_implies_admin` は新仕様では維持できない。**実際のエラーログはまだ未取得。** 実際に試したら、元の版と分けて記録する。

## D. 設計・監査編（経験者向け）

**問題:** 現実にこのモデルを適用する前に何を追加検証するべきか、3項目以上挙げる。

**解答例:** 認証、Role割当、失効、資源ごとの権限、実システムとのモデル対応、運用上の承認経路。コードに含めない項目を「形式証明済み」と呼ばない。

## 記録シート

```text
exercise:
model version / commit SHA:
source changed:
expected behavior:
actual command:
observed result / NOT RUN:
what remains unknown:
```
