#!/bin/bash
cd "$(dirname "$0")"
git add index.html
git diff --cached --quiet && echo "Nothing to push — file unchanged." && exit 0
git commit -m "Update AI Arena — $(date '+%b %d %Y')"
git push
echo "✅ Live at https://vanzosoai.github.io/ai-arena"
