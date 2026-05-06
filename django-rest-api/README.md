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

2. Configure PostgreSQL and run migrations

```bash
export POSTGRES_DB=django
export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
export POSTGRES_HOST=127.0.0.1
export POSTGRES_PORT=5432
```

3. Install dependencies, run migrations and start server

```bash
pip install -r requirements.txt
python manage.py migrate
python manage.py runserver
```

Health endpoint: http://127.0.0.1:8000/api/health/

The default database is now PostgreSQL via `DATABASES['default']` in `api/settings.py`.
