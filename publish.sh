#!/usr/bin/env bash
# Publishes this folder as the GitHub Pages site https://awetomaition.github.io
# Needs: git, and the GitHub CLI (gh) signed in as AwetomAition  →  gh auth login
set -euo pipefail

OWNER="AwetomAition"
REPO="AwetomAition.github.io"

cd "$(dirname "$0")"

echo "› Checking GitHub sign-in…"
LOGIN="$(gh api user --jq .login)"
if [ "$(echo "$LOGIN" | tr '[:upper:]' '[:lower:]')" != "$(echo "$OWNER" | tr '[:upper:]' '[:lower:]')" ]; then
  echo "✗ gh is signed in as '$LOGIN', not '$OWNER'. Run: gh auth login   (and pick the $OWNER account)"
  exit 1
fi

echo "› Preparing the local git repository…"
if [ ! -d .git ]; then
  git init -q -b main
fi
git add -A
git -c user.name="$OWNER" -c user.email="$OWNER@users.noreply.github.com" \
  commit -q -m "Launch AwetomAItion blog" || echo "  (nothing new to commit)"

echo "› Creating the repository $OWNER/$REPO (public)…"
if gh repo view "$OWNER/$REPO" >/dev/null 2>&1; then
  echo "  (already exists — reusing it)"
  git remote get-url origin >/dev/null 2>&1 || git remote add origin "https://github.com/$OWNER/$REPO.git"
  git push -u origin main
else
  gh repo create "$OWNER/$REPO" --public --source . --remote origin --push \
    --description "AwetomAItion — practical AI and automation"
fi

echo "› Turning on GitHub Pages (source: GitHub Actions)…"
gh api -X POST "repos/$OWNER/$REPO/pages" -f build_type=workflow >/dev/null 2>&1 \
  || gh api -X PUT "repos/$OWNER/$REPO/pages" -f build_type=workflow >/dev/null 2>&1 \
  || echo "  (could not set it automatically — set Settings › Pages › Source to 'GitHub Actions')"

echo "› Starting the build…"
sleep 5
gh workflow run pages-deploy.yml --repo "$OWNER/$REPO" --ref main >/dev/null 2>&1 || true
sleep 10
RUN_ID="$(gh run list --repo "$OWNER/$REPO" --workflow pages-deploy.yml --limit 1 --json databaseId --jq '.[0].databaseId')"
gh run watch "$RUN_ID" --repo "$OWNER/$REPO" --exit-status

echo
echo "✓ Done! Your site is live at: https://awetomaition.github.io"
echo "  (If it shows 404, wait a minute and refresh.)"
