Deployment README - Quick Guide
================================
This guide helps you deploy the Task Analyzer API quickly on a Linux server (using gunicorn + nginx) or run with Docker.

1) Quick local run (development)
   - python -m venv venv
   - source venv/bin/activate
   - pip install -r requirements.txt
   - cd backend
   - python manage.py runserver 0.0.0.0:8000
   - Open frontend/index.html and point API base to http://localhost:8000/api/tasks/

2) Docker (simple)
   - Create a Dockerfile in backend/ that installs requirements and runs the app with gunicorn.
   - Build and run:
       docker build -t task-analyzer-backend backend/
       docker run -p 8000:8000 task-analyzer-backend
   - Serve frontend via any static file server (nginx or GitHub Pages).

3) Production (gunicorn + nginx)
   - Install system packages, set SECRET_KEY in settings, and configure allowed hosts.
   - Use gunicorn to serve: gunicorn task_analyzer.wsgi:application --bind 127.0.0.1:8000
   - Configure nginx as reverse proxy and serve frontend as static files.
