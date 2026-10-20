# Proof Engineering Lab — 実行・再現手順

このディレクトリが技術編『中学生でも作れる Lean 4』の演習用プロジェクトです。**ソースコードと手順があり、GitHub Actionsで技術編のビルド成功を確認済みです。** 対象コミットと検証範囲は [EVIDENCE.md](EVIDENCE.md) に記録しています。以下は読者自身の環境で再現するための手順であり、手元での成功を保証するものではありません。

## 0. 準備するもの

- ターミナル（Windows: PowerShell / macOS・Linux: Terminal）
- Lean公式のインストーラー **elan** と Lean 4。公式入口: https://lean-lang.org/install/
- エディター（VS Code + Lean 4拡張は便利ですが、以下のCLI検査には必須ではありません）
- 本リポジトリを取得する手段（GitまたはGitHubのZIPダウンロード）

**注意:** elanのインストールはOSごとに異なるため、必ず公式ページのそのOS向け手順を使用してください。インストールコマンドを出所不明のWebページからコピーしないでください。

## 1. 作業ディレクトリへ移動する

Gitで取得するなら、ターミナルで次を実行します。

```sh
git clone https://github.com/YutoriKomeiji/lean4-learning-lab.git
cd lean4-learning-lab/engineering
```

Windows PowerShellも、Gitをインストール済みなら同じGitと`cd`のコマンドを使えます。ZIPで取得した場合は、展開先の `lean4-learning-lab/engineering` へ移動します。

移動後、フォルダー内に `lean-toolchain`, `lakefile.toml`, `ProofEngineeringLab.lean` があるか確かめてください。

## 1.5 再現する対象コミットを選ぶ

この本の実測証拠は、対象コミットが `f445a1ee5efb33f1c88d316158b6c5586f11ff0f` の[GitHub Actions run #39051025427](https://github.com/YutoriKomeiji/lean4-learning-lab/actions/runs/39051025427)です。**同じソース状態を確かめたい場合**は、上の `git clone` を実行した後、リポジトリのルートで次を実行してください。

```sh
git checkout f445a1ee5efb33f1c88d316158b6c5586f11ff0f
cd engineering
lake build
```

すでに `engineering/` に移動している場合は、先に `cd ..` でリポジトリのルートへ戻ります。これはGitで取得した場合の手順です。ZIPで取得した場合、`git checkout` は使えません。GitHubのコミット画面から該当revisionのZIPを取得してください。

`main` の最新版を実行する場合は、まず `git rev-parse HEAD` でSHAを記録してください。最新mainの成功と過去の特定runの成功は、同じ観測ではありません。

## 2. LeanとLakeの存在を確かめる

```sh
lean --version
lake --version
```

このプロジェクトは `lean-toolchain` で `leanprover/lean4:v4.24.0` を指定しています。elanが必要なtoolchainを初回取得する場合はネットワーク接続が必要です。バージョンが想定と異なる場合は、別フォルダーから実行していないか、elan経由で起動しているかを確かめてください。

`lean: command not found` / `lake: command not found` 相当のエラーなら、まだインストールできていないか、PATH設定・ターミナル再起動が必要です。**Leanの証明が間違ったという意味ではありません。**

## 3. 最初のビルド

```sh
lake build
```

`lakefile.toml` に宣言されたライブラリ `ProofEngineeringLab` を対象としてビルドする設定です。**GitHub Actionsではビルド成功を確認しています。ただし、読者の端末での成功は各自で確認してください。** 出たメッセージと終了コードを確認してください。

POSIXシェルでは直後に `echo $?`、Windows PowerShellでは `$LASTEXITCODE` で終了コードを確認できます。一般に `0` はプロセス正常終了ですが、何が検査されたかはコマンド・ターゲット・ログと一緒に読みます。

## 4. ソースを読んで改造する

`ProofEngineeringLab.lean` には `double`、`#check`、`#eval`、3状態 `State` と許可遷移 `CanStep`、そして `stopped_cannot_step_to_running` という命題候補があります。

```lean
def double (n : Nat) : Nat := n + n
#eval double 3
example : double 3 = 6 := by
  rfl
```

**実測:** [run #39051025427](https://github.com/YutoriKomeiji/lean4-learning-lab/actions/runs/39051025427) のログには `ProofEngineeringLab.lean:4:0: 6` と表示されています。これは対象コミットのCI環境での結果です。読者自身の環境では改めて確認してください。

### わざと壊して直す練習

1. 元のファイルのコピーを手元に残します。
2. `example : double 3 = 6 := by` の `6` を `7` に変更します。
3. `lake build` を実行して、**実際に返された**エラーを読みます。エラー文は環境で変わり得るのでここには捏造しません。
4. `7` を `6` へ戻し、再度 `lake build` で確かめます。
5. 「定義が変わったのか、確かめたい命題が変わったのか」を日本語で説明してください。

注意: `#eval` の値が想定通りでも、それだけではあらゆる入力の一般命題が成り立つ証明になりません。

## 5. 検証結果を残す

CIでの成功と読者自身の環境での再現は別です。手元での成功記録を書くには **実際の実行観測** が必要です。少なくとも以下を記録してください。

```text
date/time:
OS / shell:
Git commit SHA:
Lean / Lake versions:
working directory:
command:
exit code:
stdout / stderr relevant excerpt:
build target(s):
what was NOT verified:
```

実行が失敗しても、失敗した条件とログは役立つEvidenceです。失敗を無理に成功へ読み替えないでください。

## 6. どこまで証明できたか

仮に `lake build` が成功しても、その事実だけで「現実の機械が安全」「AIの説明が正しい」「設計全体が正しい」「公開の承認を得た」とは言えません。読んだ命題、定義、依存関係、対象のbuildに限定して評価してください。

## 追加教材を検査する（編集者向け）

このBookには、基本Labとは別に[章別ソースとおまけLean](CHAPTER_MATERIALS.md)があります。基本の `lake build` は、これらの独立したサンプルを**すべて自動で検査するわけではありません**。

Lean v4.24.0を導入済みのmacOS/LinuxまたはBash環境から、`engineering/` で以下を実行すると、追加のサンプルのtypecheck、分割練習のコピー上でのbuild、意図した失敗例の拒否を個別に確認できます。

```sh
lake build
bash scripts/verify-teaching-examples.sh
```

このスクリプトはBash、`mktemp`、`sed`、`cp` などを使用します。Windows PowerShell単体からそのまま実行することを想定していません。WindowsではGit Bash/WSLなどの適切な環境を使用するか、各章READMEにあるLeanコマンドを個別に試してください。

**重要：** このスクリプトとCIの追加検査ステップをGitHubへ保存した事実と、最新のCIがそれを成功させた事実は別です。検証ログと対象コミットが確認できるまで、追加ファイルのstatusは **NOT YET VERIFIED** とします。期待どおりの失敗も、ログなしでPASSとはしません。CI結果を確認するときは[ActionsのEngineering lab build](https://github.com/YutoriKomeiji/lean4-learning-lab/actions/workflows/engineering-build.yml)を参照してください。

## 分からないことがあったら（GitHub Issues）

手元で動かした結果や質問は、[GitHub Issuesの新規作成画面](https://github.com/YutoriKomeiji/lean4-learning-lab/issues/new/choose)から報告できます。

- **「教材への質問・改善提案」**：言葉の意味、説明、図、手順について質問する。
- **「動作・再現結果の報告」**：成功・失敗の両方を報告する。章番号、OS、Leanの版、使ったソースのSHA、実際のコマンド・結果は分かる範囲でよい。

気軽に質問してください。読者による独立した実行報告がまだないことは、この本を公開できない理由にはしません。Issueを書くだけで実行検証済みになるわけでもありません。

**公開上の注意：** コマンドやログへ認証情報、氏名、顧客情報などが含まれている場合は必ず削除してください。

## 検証ステータス

- リポジトリのソースと手順: **作成済み**
- 設定の静的整合レビュー: **実施済み**（Lake default targetを宣言済みライブラリ名に合わせた）
- GitHub Actions `lake build`: **SUCCESS**（run #39051025427、対象コミット `f445a1ee5efb33f1c88d316158b6c5586f11ff0f`）
- 別環境での第三者再現: **NOT VERIFIED**
- GitHub CIでのlab実行: **SUCCESS**（[run #39051025427](https://github.com/YutoriKomeiji/lean4-learning-lab/actions/runs/39051025427)、Build engineering project step 成功）
