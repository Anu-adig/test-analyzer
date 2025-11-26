#!/usr/bin/env bash
# prepare_submission.sh
# Creates git history (if none), creates a git bundle, and shows how to push to GitHub.
set -e
PROJECT_ROOT="$(cd "$(dirname "$0")" && pwd)"
echo "Project root: $PROJECT_ROOT"
if [ ! -d ".git" ]; then
  echo "Initializing git via make_git_repo.sh (this will create several commits)"
  chmod +x make_git_repo.sh
  ./make_git_repo.sh
else
  echo "Git already initialized. Creating bundle from current branch."
fi
BUNDLE="/tmp/task-analyzer-$(date +%Y%m%d%H%M%S).bundle"
git bundle create "$BUNDLE" main
echo "Bundle created at: $BUNDLE"
echo ""
echo "To push to GitHub (HTTPS):"
echo "  git remote add origin https://github.com/<your-username>/<repo-name>.git || true"
echo "  git push -u origin main"
echo ""
echo "To import the bundle on another machine:"
echo "  git clone $BUNDLE -b main <folder>  # or use git fetch then checkout"
echo ""
echo "If you want me to prepare the GitHub URL in a README, replace <your-username> and <repo-name> accordingly."
