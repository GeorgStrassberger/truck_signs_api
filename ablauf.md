# 🚛 Truck signs API

Eine API zur Verwaltung und Bereitstellung von LKW-Schild-Daten.

---

## 📋 Inhaltsverzeichnis

- [Voraussetzungen](#voraussetzungen)
- [Projekt klonen](#projekt-klonen)
- [Konfiguration vorbereiten (.env)](#konfiguration-vorbereiten-env)
- [Docker Netzwerk erstellen](#docker-netzwerk-erstellen)
- [Postgres-Datenbank starten](#postgres-datenbank-starten)
- [Django App starten](#django-app-starten)
- [Django Admin aufrufen](#django-admin-aufrufen)
- [Wichtige Hinweise](#wichtige-hinweise)

---

## 🧰 Voraussetzungen

- [Git](https://git-scm.com/) muss installiert sein
- [Docker](https://www.docker.com/) muss installiert sein

---

## 📦 Projekt klonen

```bash
git clone https://github.com/GeorgStrassberger/truck_signs_api.git
cd truck_signs_api
```

---

## ⚙️ Konfiguration vorbereiten (.env)

1. Kopiere die Beispiel-Umgebungsdatei:

```bash
cp ./truck_signs_designs/settings/simple_env_config.env ./truck_signs_designs/settings/.env
```

2. Generiere einen neuen `SECRET_KEY`:

```bash
docker run -it --rm python /bin/bash -c "pip -qq install Django; python -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())'"
```

3. Öffne die `.env`-Datei und trage die Variablen ein:

```bash
nano ./truck_signs_designs/settings/.env
```

```env
SECRET_KEY=!dein_secret_key!

POSTGRES_DB=trucksigns_db
POSTGRES_USER=trucksigns_user
POSTGRES_PASSWORD=supertrucksignsuser!
POSTGRES_HOST=truck_signs_db
POSTGRES_PORT=5432

# Django settings
SUPERUSER_USERNAME=admin
SUPERUSER_EMAIL=admin@admin.com
SUPERUSER_PASSWORD=admin
```

---

## 🌐 Docker Netzwerk erstellen

```bash
docker network create truck_signs_network
```

---

## 🗃️ Postgres-Datenbank starten

**Bash:**

```bash
docker run -d \
--name truck_signs_db \
--network truck_signs_network \
--env-file ./truck_signs_designs/settings/.env \
-v ./postgres_data:/var/lib/postgresql/data \
-p 5432:5432 \
--restart unless-stopped \
postgres:13
```

**PowerShell:**

```powershell
docker run -d `
--name truck_signs_db `
--network truck_signs_network `
--env-file ./truck_signs_designs/settings/.env `
-v ./postgres_data:/var/lib/postgresql/data `
-p 5432:5432 `
--restart unless-stopped `
postgres:13
```

---

## 🚀 Django App starten

Zuerst das Docker Image bauen:

```bash
docker build -t truck_signs .
```

Dann den Container starten:

**Bash:**

```bash
docker run -d \
--name truck_signs_app \
--network truck_signs_network \
--env-file ./truck_signs_designs/settings/.env \
-v .:/app \
-p 8020:5000 \
--restart on-failure \
truck_signs
```

**PowerShell:**

```powershell
docker run -d `
--name truck_signs_app `
--network truck_signs_network `
--env-file ./truck_signs_designs/settings/.env `
-v .:/app `
-p 8020:5000 `
--restart on-failure `
truck_signs
```

---

## 🔐 Django Admin aufrufen

Öffne im Browser:

- [http://localhost:8020](http://localhost:8020) – sollte zunächst einen Fehler anzeigen
- [http://localhost:8020/admin](http://localhost:8020/admin) – Django Admin Interface

Superuser ist in der `.env` definiert und sollte beim Start automatisch erstellt werden (ansonsten `createsuperuser` ausführen).

---

## ⚠️ Wichtige Hinweise

- Der Datenbank-Hostname **muss überall identisch** sein: `truck_signs_db`

  - In `.env`, Docker-Run-Command, `entrypoint.sh`, etc.

- Die **Ports** müssen zusammenpassen:
  - `Dockerfile`: `EXPOSE 5000`
  - `entrypoint.sh`: bindet `0.0.0.0:5000`
  - Docker-Run: `-p 8020:5000`

---

Fertig 🎉 Jetzt läuft deine Truck signs API in Docker!
