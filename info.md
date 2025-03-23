# Projektname

# ToC

- Todo .env variablen nochmal ändern

### Secret_Key generieren

Mit Docker eine Python umgebung starten und einen key ausgeben lassen.

```
docker run -it --rm python /bin/bash -c "pip -qq install Django; python -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())'"
# Output Example:
!c3aeljtwmcyh@^-dswmp0_z=8sdu4=3p6tod3a\*26)#at4$b^
```

Ausgabe kopieren und in der .env unter `SECRET_KEY` & `DOCKER_SECRET_KEY` angeben.

### Docker Image bauen für die

baut mit der `Dockerfile` ein Image um die Anwendung als Container laufen zu lassen.

```bash
docker build -t truck_signs .
```

---

### Netzwerk erstellen

```bash
docker network create truck_signs_network
```

---

### Datenbank starten

Docker Container starten für die Postgres Datenbank:

**Bash:**

```bash
docker run -d \
--name truck_signs_db \
--network truck_signs_network \
--env-file ./truck_signs_designs/settings/.env \
-v ./postgres_data:/var/lib/postgresql/data ` \
-p 5432:5432 \
--restart unless-stopped \
postgres:13
```

**PowerShell:**

```pwsh
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

### Django App starten

**Bash**

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

**PowerShell**

```pwsh
docker run -d `
--name truck_signs_web `
--network truck_signs_network `
--env-file ./truck_signs_designs/settings/.env `
-v .:/app `
-p 8020:5000 `
--restart on-failure `
truck_signs
```

---
