# Proof Engineering — 章別教材マップ

技術編Book：[`zenn-content/books/lean4-proof-engineering/`](https://github.com/YutoriKomeiji/zenn-content/tree/main/books/lean4-proof-engineering)

## 運用の区別

- **各章専用の学習資料** は20章分存在する。個別演習・発展課題・解答の観点・記録欄を持つ。
- **各章専用のLeanソース** は段階的に増やす。現段階で第2・3・6・7・16・17・18章に追加したコードは候補であり、専用typecheck結果は未取得。残る13章に独立実行ソースがあるとは主張しない。
- 既存の `engineering/ProofEngineeringLab.lean` のCI成功は、[EVIDENCE.md](EVIDENCE.md)に記録された**特定コミット**に限られる。新教材はその証拠を流用しない。
- 章別ソースは現状の `lake build` ターゲットに自動的に組み込まれていない。検証時には対象パスを指定して実行し、その後build targetの範囲を監査する。
- 意図的失敗は成功対象と分離する。Book公開は別のHuman Gateであり、未公開を維持。

## 章ごとの対応

| 章 | 主題 | 章別資料 | 独立ソースの状態 |
|---|---|---|---|
| 01 | 作業場を作る | [章別演習](chapters/01/README.md) | 本文・既存共通Labを参照。専用ソースは未実装 |
| 02 | 最初の定義 | [章別演習](chapters/02/README.md) | [Examples.lean](chapters/02/Examples.lean)（未独立検証） |
| 03 | 最初の定理 | [章別演習](chapters/03/README.md) | [Examples.lean](chapters/03/Examples.lean)（未独立検証） |
| 04 | 赤いエラーを読む | [章別演習](chapters/04/README.md) | 本文・既存共通Labを参照。専用ソースは未実装 |
| 05 | AIに修正を頼む | [章別演習](chapters/05/README.md) | 本文・既存共通Labを参照。専用ソースは未実装 |
| 06 | 通るけれど意図が違う定理 | [章別演習](chapters/06/README.md) | [Examples.lean](chapters/06/Examples.lean)（未独立検証） |
| 07 | ファイルを分ける | [章別演習](chapters/07/README.md) | [Basic.lean](chapters/07/Basic.lean) / [Examples.lean](chapters/07/Examples.lean)（編集候補・未検証） |
| 08 | Lakeを読む | [章別演習](chapters/08/README.md) | 本文・既存共通Labを参照。専用ソースは未実装 |
| 09 | テストと証明を分ける | [章別演習](chapters/09/README.md) | 本文・既存共通Labを参照。専用ソースは未実装 |
| 10 | Gitで変更を残す | [章別演習](chapters/10/README.md) | 本文・既存共通Labを参照。専用ソースは未実装 |
| 11 | CIでbuildする | [章別演習](chapters/11/README.md) | 本文・既存共通Labを参照。専用ソースは未実装 |
| 12 | 再現できるREADME | [章別演習](chapters/12/README.md) | 本文・既存共通Labを参照。専用ソースは未実装 |
| 13 | 仕様を小さく切る | [章別演習](chapters/13/README.md) | 本文・既存共通Labを参照。専用ソースは未実装 |
| 14 | AIに実装させ検査する | [章別演習](chapters/14/README.md) | 本文・既存共通Labを参照。専用ソースは未実装 |
| 15 | AIの『できた』を監査する | [章別演習](chapters/15/README.md) | 本文・既存共通Labを参照。専用ソースは未実装 |
| 16 | 小さな仕様プロジェクト | [章別演習](chapters/16/README.md) | [Examples.lean](chapters/16/Examples.lean)（未独立検証） |
| 17 | 実装する | [章別演習](chapters/17/README.md) | [Examples.lean](chapters/17/Examples.lean)（未独立検証） |
| 18 | 壊してみる | [章別演習](chapters/18/README.md) | [基準候補](chapters/18/Before.lean) / [故意の失敗](chapters/18/AfterIntentionalFailure.lean) / [修復候補](chapters/18/AfterRepaired.lean)（未検証） |
| 19 | CIと再現手順 | [章別演習](chapters/19/README.md) | 本文・既存共通Labを参照。専用ソースは未実装 |
| 20 | AUDITして完成させる | [章別演習](chapters/20/README.md) | 本文・既存共通Labを参照。専用ソースは未実装 |

## 応用編の候補

1. **状態遷移の形式化**：3状態からパラメータ付き遷移・不変条件・禁止遷移へ発展させる。
2. **仕様変更の破壊実験**：許可する遷移を追加し、過去の定理が破れる条件を観測・修復する。
3. **AI生成コード監査**：虚構API、弱い命題へのすり替え、CIカバレッジ不足をそれぞれ実例とログ付きで示す。
4. **読者が再現できる教材パック**：固定SHA、導入手順、実行コマンド、実測ログ、異常系、AUDITの完全な組を作る。第三者の独立実行は歓迎するが公開の必須条件ではない。

この応用編は設計候補。対象コードの実行・検証と読者向け再現手順が揃うまで完成扱いしない。独立第三者による再現は未実施なら未実施と表示するが、公開自体の必須条件にはしない。

## おまけLean — 本編とは別の発展ルート

本編の中学生向け到達目標は変更しない。[おまけの学習入口](bonus/README.md)を用意した。追加した[Bonus 01：承認ルールの形式モデル](bonus/access-control/AccessControl.lean)は、役割・操作・許可関係を表し、「誰が承認できるか」という形式命題を扱う。専用の[問題・解答](bonus/access-control/EXERCISES.md)と[監査表](bonus/access-control/AUDIT.md)を別々に保管。

**Bonus 01 は未typecheckの候補**。実サービスのアクセス制御や認証を実装したという主張はしない。既存のCI成功Evidenceをこの追加ファイルへ流用しない。本編とは独立に発展させ、公開品質は別途判定する。

追加の[Bonus 02：高責任領域の二者承認モデル](bonus/high-assurance/README.md)は、医療・金融・重要インフラ・AI外部操作を題材にした共通の責任境界を学ぶためのもの。[Lean候補コード](bonus/high-assurance/TwoPersonGate.lean)と[監査資料](bonus/high-assurance/AUDIT.md)を分離。**本番認可・安全性・適法性は未証明、typecheck未実施。**

続編の[Bonus 03：版数に紐づく承認](bonus/high-assurance/VersionBoundApproval.lean)では、承認時の仕様版と現在の仕様版が一致する条件をモデル化する。[段階別演習](bonus/high-assurance/VERSIONED_EXERCISES.md)と[監査表](bonus/high-assurance/VERSIONED_AUDIT.md)を別に用意。**コードは未typecheck、現実の承認再利用可否は本モデルだけでは確定しない。**

## 次の実装順

1. 各章READMEの個別Book章リンクをreadback監査し、Book側からも対応する章別教材へ双方向リンクを付ける。
2. 候補Leanソース（第2・3・6・7・16・17・18章）を固定toolchainで個別typecheckし、ログとSHAを記録する。
3. 第4・7・18章の失敗・修復を、正常系と隔離された実験資産として追加・実測する。
4. 残る章のコード・設定・監査用資料を補完し、演習問題と模範解答を分離する。
5. 章別の実測証拠、Bookの全章リンク、読者が試せる再現手順、Zenn表示を確認して公開判定する。独立第三者による実施状況は別欄に記録する。
