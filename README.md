# Task Analyzer - Smart Task Analyzer (Assignment)

## Overview
This repository contains a complete implementation of the "Smart Task Analyzer" assignment described in the provided PDF. The backend is implemented in Django (API endpoints use Django REST Framework patterns), and a simple frontend (HTML/CSS/JS) is provided to interact with the API.

## What is included
- backend/: Django-like project scaffold (no migration requirement)
- backend/tasks/scoring.py: The core priority scoring algorithm and helpers
- backend/tasks/serializers.py, views.py, urls.py: API endpoint implementations (analyze & suggest)
- frontend/: index.html, styles.css, script.js (calls the API endpoints)
- requirements.txt
- tests/: unit tests for scoring algorithm (pytest compatible)
- README explains the algorithm, design decisions, and how to run locally.

## How to create a GitHub repo and push (example)
1. Create a new repository on GitHub (e.g., `task-analyzer`).
2. From this project folder run:
   ```bash
   git init
   git add .
   git commit -m "Initial commit - Task Analyzer assignment"
   git branch -M main
   git remote add origin https://github.com/<your-username>/<repo-name>.git
   git push -u origin main
   ```
Replace `<your-username>` and `<repo-name>` accordingly.

## Running locally (quick)
1. Ensure Python 3.8+ installed.
2. Create virtualenv and install deps:
   ```bash
   python -m venv venv
   source venv/bin/activate  # or venv\Scripts\activate on Windows
   pip install -r requirements.txt
   ```
3. Run Django development server:
   ```bash
   cd backend
   python manage.py runserver
   ```
4. Open `frontend/index.html` in a browser and use the UI. By default the frontend expects the API at `http://127.0.0.1:8000/api/tasks/analyze/` and `http://127.0.0.1:8000/api/tasks/suggest/`.

## Notes
- The backend is intentionally simple: it accepts task lists in the request body and returns computed scores (no DB necessary).
- Unit tests for the scoring algorithm are available in `tests/test_scoring.py` (use `pytest` to run).

## Algorithm Summary
See `backend/tasks/scoring.py` and the detailed explanation in the project README included inside the backend folder.
