#!/usr/bin/env bash
set -euo pipefail
ARTIFACT_URL='https://sdmntprwestus3.oaiusercontent.com/files/00000000-2bf0-81fd-955f-137ed17da23a/raw?se=2026-08-22T13%3A10%3A25Z&sp=r&sv=2026-02-06&sr=b&scid=a4940b2a-f8cb-5e83-8186-06f56e56722f&skoid=b869bb08-96ac-4184-ab38-9c45e2890c4c&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2026-08-22T00%3A36%3A42Z&ske=2026-08-23T00%3A36%3A42Z&sks=b&skv=2026-02-06&sig=xq0zRHpa8W6Ie5MkXi3hy0O7MfV/GXLC9RKxD60nQfA%3D'
mkdir -p apk icon
curl -fL "$ARTIFACT_URL" -o /tmp/hipmh-artifact.zip
rm -rf /tmp/hipmh-artifact
mkdir -p /tmp/hipmh-artifact
unzip -q /tmp/hipmh-artifact.zip -d /tmp/hipmh-artifact
cp /tmp/hipmh-artifact/tachiyomi-zh.hipmhprivate-v1.6.2.apk apk/
echo '0b84d045823d1de57385854cd681714f352b33dac384623b84b8ffdd6ed459ff  apk/tachiyomi-zh.hipmhprivate-v1.6.2.apk' | sha256sum -c -
cat > /tmp/icon.b64 <<'EOF'
iVBORw0KGgoAAAANSUhEUgAAAMAAAADACAIAAADdvvtQAAADA0lEQVR4nO3dy3EaQRRAUeNyRpN/CApn9l7IhRfauHz7BzonAYbuy2skNOhx3/cP+F8/d18Ar01AJAIiERCJgEgERCIgEgGRCIhEQCQCIhEQiYBIBEQiIBIBkQiIREAkAiIREImASAREIiCSX7sv4KrunZfwsv4+PjYfQl/PLbfWKibYntJ2wLSzVi7StoQkHTmWZ/R6jfR6plq/fKum0DSWWnZKFo0gdSz2LIFXxGQerZYs+zTA1LPRgsWf25A6tlu9hZMDEg9h5i6EbMCUs9R5m2HD1NJpgRk/Bxo0qaMD0g9x5qxNY4wksEBGT+HG75BJhCJgEhGBuT8egljt8kEIhEQybCAnF8vZOBmmUAkB90X9mnG32JunI5v9nS+MoFIBEQiIBIBkQiIREAkAiIREImASAREIiASAZEIiERAJAIiERCJgEgERCIgEgGRCIhEQCQCIhEQiYBIBEQiIBIBkQiIREAkAiIREImASAREctxX3M2w/r+pfx8mEImASAREIiASAZEIiERAJAIiERCJgEgERCIgEgGRCIhEQCQCIhEQiYBIBEQiIBIBkQiIREAkAiIREImASL7Frc3Xde166Le/q9oEIhEQiYBIBEQiIBIBkQiIREAkAiIREImASAREIiASAZEIiERAJAIiERCJgEgERCIgEgGRCIhEQCQCIhEQiYBIBEQiIBIBkQiIREAkAiIREMlxX3G38evoZnizp/PVsAn09l8G+E4GbpYjjERAJCMDcoq9hLHbZAKRCIhkcEBOscMN3yATiGR8QIbQsWZszZQJpKEDTdoURxjJrIAMoaPM246JE0hDh5i6EXOPMA1tN3sLpr8H0tBGCxZ/xZtoDW2xZtkX/RSmocWWLfjjvu81j/Tp7f9Cb7vFr9XVvwcyiqZav7yrJ9CTUTTWrlfmtoCelFRsn+j7A3pS0r/b3s3TQQHxinyYSiIgEgGRCIhEQCQCIhEQiYBIBEQiIBIBkQiIREAkAiIREImASAREIiASAZEIiERAJAIiERDJb0OQjdBRqITSAAAAAElFTkSuQmCC
EOF
tr -d '[:space:]' < /tmp/icon.b64 | base64 -d > icon/tachiyomi-zh.hipmhprivate.png
cat > repo.json <<'JSON'
{
  "index_v2": "https://raw.githubusercontent.com/SongJunguo/mihon-hipmh-store/main/index.json",
  "meta": {
    "name": "SongJunguo Hipmh",
    "shortName": "Hipmh",
    "website": "https://github.com/SongJunguo/mihon-hipmh-store",
    "signingKeyFingerprint": "5b6a2521c2e1f1f7c719b1af6a0a9d2edf524283df4d140cabee36c2e7076209"
  }
}
JSON
cat > index.json <<'JSON'
{
  "name": "SongJunguo Hipmh",
  "badgeLabel": "Hipmh",
  "signingKey": "5b6a2521c2e1f1f7c719b1af6a0a9d2edf524283df4d140cabee36c2e7076209",
  "contact": {
    "website": "https://github.com/SongJunguo/mihon-hipmh-store",
    "discord": null
  },
  "extensionList": {
    "extensions": [
      {
        "name": "Hipmh Private",
        "packageName": "eu.kanade.tachiyomi.extension.zh.hipmhprivate",
        "resources": {
          "apkUrl": "https://raw.githubusercontent.com/SongJunguo/mihon-hipmh-store/main/apk/tachiyomi-zh.hipmhprivate-v1.6.2.apk",
          "iconUrl": "https://raw.githubusercontent.com/SongJunguo/mihon-hipmh-store/main/icon/tachiyomi-zh.hipmhprivate.png"
        },
        "extensionLib": "1.6",
        "versionCode": 2,
        "versionName": "1.6.2",
        "contentWarning": "MIXED",
        "sources": [
          {
            "id": 3269986394831707997,
            "name": "嬉皮漫画 (私人)",
            "language": "zh",
            "homeUrl": "https://m.hipmh.com",
            "mirrorUrls": [],
            "message": null
          }
        ]
      }
    ]
  },
  "extensionListUrl": null
}
JSON
cat > README.md <<'MD'
# Mihon Hipmh Store

Private-source/public-distribution Mihon Extension Store for **Hipmh Private**.

Add this URL in Mihon as an Extension Store:

`https://raw.githubusercontent.com/SongJunguo/mihon-hipmh-store/main/repo.json`

The source code and signing private key are **not** stored in this public repository. APK updates must keep the same signing certificate fingerprint declared in `repo.json` / `index.json`.
MD
rm -f bootstrap.sh .github/workflows/bootstrap-store.yml
git config user.name 'github-actions[bot]'
git config user.email '41898282+github-actions[bot]@users.noreply.github.com'
git add -A
git commit -m 'publish: Hipmh Private v1.6.2 store'
git push
