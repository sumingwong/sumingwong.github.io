#!/bin/bash
# deploy.sh — 一键提交并部署到 GitHub Pages
# 用法：./deploy.sh "提交说明"

set -e

cd "$(dirname "$0")"

MESSAGE="${1:-更新博客}"

if git diff --quiet && git diff --cached --quiet; then
  echo "没有改动，无需部署。"
  exit 0
fi

echo "→ 提交改动..."
git add -A
git commit -m "$MESSAGE"

echo "→ 推送到 GitHub..."
git push origin main

echo "✓ 已推送，GitHub Actions 正在自动部署。"
