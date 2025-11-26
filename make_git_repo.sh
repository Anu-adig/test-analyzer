#!/usr/bin/env bash
# make_git_repo.sh
# Usage:
#   chmod +x make_git_repo.sh
#   ./make_git_repo.sh <your-github-remote-url>
#
# This script will:
# - initialize a git repository
# - create a sensible multi-commit history representing development steps
# - optionally add your GitHub remote and push to 'main'
#
set -e
REMOTE_URL="$1"
if [ -z "$REMOTE_URL" ]; then
  echo "No remote provided. The script will create a local repository with commits only."
  echo "To push to GitHub pass the remote URL as the first argument."
fi
git init
git config user.name "Your Name"
git config user.email "you@example.com"

# Commit 1: Initial scaffold (README + license placeholder)
git add README.md
git commit -m "chore: initial README and project scaffold"

# Commit 2: Add backend scaffold
git add backend/task_analyzer settings.py backend/manage.py backend/task_analyzer/urls.py backend/task_analyzer/wsgi.py
git commit -m "feat(backend): add minimal Django backend scaffold and settings"

# Commit 3: Add core scoring algorithm and tasks app
git add backend/tasks/scoring.py backend/tasks/views.py backend/tasks/serializers.py backend/tasks/urls.py backend/tasks/__init__.py
git commit -m "feat(tasks): implement priority scoring algorithm, API endpoints and validation"

# Commit 4: Add frontend
git add frontend/
git commit -m "feat(frontend): add simple UI for input and displaying suggestions"

# Commit 5: Add tests and requirements
git add tests/ requirements.txt
git commit -m "test: add unit tests and requirements"

# Commit 6: Add backend README and project README improvements
git add backend/README_BACKEND.md
git add README.md
git commit -m "docs: expand backend README and add usage instructions"

# Finalize branch
git branch -M main

if [ -n "$REMOTE_URL" ]; then
  git remote add origin "$REMOTE_URL"
  echo "Pushing to remote 'origin' branch 'main'..."
  git push -u origin main
  echo "Push complete. If push failed, ensure your remote URL is correct and you have permission."
else
  echo "Local git repository created with multi-commit history. No remote configured."
fi

echo "Done. Use 'git log --oneline' to see the commit history."
