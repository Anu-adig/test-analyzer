# Submission README - How to push and obtain a GitHub URL to submit

1. Configure repo name and GitHub account:
   - Choose a repository name, e.g., `task-analyzer`.

2. Create repository on GitHub (empty) or use the make_git_repo.sh script to push directly.

3. Create local git history and push (recommended):
   ```bash
   cd /path/to/task-analyzer
   chmod +x make_git_repo.sh prepare_submission.sh
   ./make_git_repo.sh https://github.com/<your-username>/<repo-name>.git
   # OR run prepare_submission.sh which will create a bundle you can transfer
   ./prepare_submission.sh
   ```

4. After pushing, your repository URL will be:
   `https://github.com/<your-username>/<repo-name>`
   Use this URL to submit.

5. Optional: Enable GitHub Pages for the frontend (Settings -> Pages) to host static frontend (index.html).
   - Or serve frontend via docker-compose (frontend available at http://localhost:8080 when running docker-compose up).

6. CI & Container Registry:
   - CI workflow runs pytest on push to `main` (already included).
   - To publish Docker image to GHCR, add secrets to the repository:
     - `GHCR_USERNAME` : your GitHub username
     - `GHCR_TOKEN` : a Personal Access Token with `write:packages` and `read:packages` scopes
