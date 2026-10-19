# Proof Engineering — 章別教材マップ

技術編Book：[`zenn-content/books/lean4-proof-engineering/`](https://github.com/YutoriKomeiji/zenn-content/tree/main/books/lean4-proof-engineering)

## 運用の区別

- **各章専用の学習資料** は20章分存在する。個別演習・発展課題・解答の観点・記録欄を持つ。
- **各章専用のLeanソース** は段階的に増やす。現段階で5章に追加したコードは候補であり、専用typecheck結果は未取得。残る15章に実行ソースがあるとは主張しない。
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
| 07 | ファイルを分ける | [章別演習](chapters/07/README.md) | 本文・既存共通Labを参照。専用ソースは未実装 |
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
| 18 | 壊してみる | [章別演習](chapters/18/README.md) | 本文・既存共通Labを参照。専用ソースは未実装 |
| 19 | CIと再現手順 | [章別演習](chapters/19/README.md) | 本文・既存共通Labを参照。専用ソースは未実装 |
| 20 | AUDITして完成させる | [章別演習](chapters/20/README.md) | 本文・既存共通Labを参照。専用ソースは未実装 |

## 応用編の候補

1. **状態遷移の形式化**：3状態からパラメータ付き遷移・不変条件・禁止遷移へ発展させる。
2. **仕様変更の破壊実験**：許可する遷移を追加し、過去の定理が破れる条件を観測・修復する。
3. **AI生成コード監査**：虚構API、弱い命題へのすり替え、CIカバレッジ不足をそれぞれ実例とログ付きで示す。
4. **第三者再現パック**：固定SHA、導入手順、実行コマンド、ログ、異常系、AUDITの完全な組を作る。

この応用編は設計候補。実装・実行・第三者再現が済むまで完成扱いしない。

## 次の実装順

1. 各章READMEから正確なBook章と専用ソースへリンクを張る。
2. 候補Leanソース5点を固定toolchainで個別typecheckし、ログとSHAを記録する。
3. 第4・7・18章の失敗・修復を、正常系と隔離された実験資産として追加・実測する。
4. 残る章のコード・設定・監査用資料を補完し、演習問題と模範解答を分離する。
5. 章別の証拠、Bookの全章リンク、第三者再現、Zenn表示を確認して公開判定する。
