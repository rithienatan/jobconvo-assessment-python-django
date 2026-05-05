# django-rest-api

Minimal Django REST starter project.

Quick start

1. Create and activate a virtualenv

```bash
python -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
```

2. Run migrations and start server

```bash
python manage.py migrate
python manage.py runserver
```

Health endpoint: http://127.0.0.1:8000/api/health/
