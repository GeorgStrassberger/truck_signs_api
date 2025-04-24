# Inhalt der Checkliste

**Inhalt der Checkliste	1**

**Projektabgabe Truck Signs API	2**

[1\. Repository	2](#repository)

.gitignore Datei	[2](#vorhandene-dateien)

Dockerfile	[2](https://docs.google.com/document/d/1whQ7-U7zSC-RRAu5XTU07rexOpNDWHl_szmpyXvGYMA/edit#heading=h.5j89uj5mjirh)

README.md	[2](https://docs.google.com/document/d/1whQ7-U7zSC-RRAu5XTU07rexOpNDWHl_szmpyXvGYMA/edit#heading=h.5j89uj5mjirh)

[2\. Dokumentation](#hinweise)	3

      3[. Hinweise](#hinweise)	3

# 

# 

# 

# Projektabgabe \- Truck Signs API {#projektabgabe---truck-signs-api}

Bitte erfülle alle Punkte auf dieser Liste, bevor du das Projekt einreichst. Solltest du weitere Extras eingebaut haben, erwähne das kurz, damit sich die Mentoren dies bei Bedarf anschauen können.

1. ## **Repository** {#repository}

### **Vorhandene Dateien** {#vorhandene-dateien}

- [x] Es wurde eine Dockerfile Datei angelegt, die das entstehende Container-Image beschreibt. Das Dockerfile genügt den nachstehend formulierten Anforderungen  
- [x] Eine Datei namens README.md ist vorhanden und entsprechend der Kriterien unten erweitert worden  
- [x] Es befinden sich keine weiteren Dateien im Repository, ohne dass diese explizit in der README.md benannt und beschrieben werden.

### **Dockerfile**

- [x] Du hast ein passendes Base-Image als Grundlage deines eigenen Container Images definiert  
- [x] Du hast einen Port des Containers exposed, sodass der Container vom Internet aus erreichbar ist  
- [x] Du hast alle benötigten Schritte als Teil des Image-Builds Prozesses definiert, sodass die Anwendung ohne zusätzlichen Aufwand gestartet wird  
      - [x] Dein Entrypoint erledigt die migrations, collectstatic, sowie createsuperuser Befehle

### **README.md**

- [x] Die README sollte ein Inhaltsverzeichnis a.k.a. eine Table-of-Contents (ToC) enthalten  
      - [x] Die einzelnen Sektionen sind in der ToC verlinkt  
- [x] Eine Sektion mit einer Beschreibung des Repositories muss vorhanden sein. In dieser Beschreibung sollte genannt werden was die wesentlichen Inhalte sind, was der Zweck des Repositories ist  
- [x] Eine Sektion "Quickstart" sollte als Teil der README enthalten sein. Hier sollen kurz die Voraussetzungen genannt und eine Schnellstart-Anleitung beschrieben sein.  
      - [x] es sollte hierbei eine sektion how-to-build-the-image geben  
- [x] Es soll eine ausführliche Variante der vorgenannten Sektion als "Usage" enthalten sein. Hier soll genauer auf die Konfiguration und Konfigurierbarkeit eingegangen werden, d.h. es soll auch erklärt werden, wie relevante Passagen modifiziert werden können, um andere Resultate zu erzielen.  
      - [x] Es muss dokumentiert sein, wie ein Container image erzeugt werden kann  
      - [x] Der **docker run** Befehl muss dokumentiert sein \- env-variablen oder andere sensitive information sollte durch Platzhalter ersetzt werden

2. ## **Dokumentation**

Die Dokumentation des Codes, sowie des Projektes soll im Repository in Form einer README Datei stattfinden.  
Die Dokumentationssprache für alle Projekte (und zugehörige Unterlagen) ist englisch.

3. ## **Hinweise** {#hinweise}

### **Allgemeine Hinweise**

- [x] Die Container sollen hierbei **NICHT** mit docker compose gestartet werden.  
- [x] Die Datenbank sollte auch in einem Container betrieben werden  
      - [x] Das Backend sollte mit der Datenbank kommunizieren können, dazu müssen die Container im selben Netzwerk (network) sein  
      - [x] Container im selben Netzwerk können sich gegenseitig mittels des hostnames/container namens erreichen

### **Sicherheitshinweise**

- [x] Speichere keine SSH-Keys im Workspace deines Git-Repositories  
- [x] Speichere keine Passwörter, Tokens, oder Benutzernamen in deinem Code. Verwende hierfür stattdessen Environment-Variablen  
- [x] Speichere keine IP-Adressen, oder sonstigen sensiblen Informationen in einem Git Repository

### **Code-Konventionen**

- [x] Für build-args, environment Variablen und Shell-Variablen gilt folgende Namenskonvention: UPPER\_CASE\_WITH\_UNDERSCORE  
- [x] Bei einer Referenz auf eine Variable sollte immer die {}-Notation verwendet werden um Fehler in der Interpretation zu vermeiden: ${SOME\_VAR\_VALUE}, statt: $SOME\_VAR\_VALUE  
- [x] Es sollten für Build-args, oder Environment Variablen "Default"-Werte konfiguriert werden, allerdings nur dann, wenn dies Sinn ergibt.  
- [x] Kritische Konfiguration wie Tokens, Passwörter oder ähnliches sollte nicht im Code-Repository gespeichert sein, sondern bspw. durch die Verwendung eines .env-files in einen Container hineingegeben werden

### **Testing**

Bevor Du dein Projekt einreichst, solltest du die folgenden Dinge sicherstellen und getestet haben:

- [x] Die Truck Signs API ist erreichbar unter der IP-Adresse deiner Cloud-VM auf Port 8020  
- [x] Dein ENTRYPOINT startet die WSGI Applikation, KEINEN dev-server.  
- [x] Nach einem Neustart des Setups, sind die konfigurierten Daten noch vorhanden und werden nicht gelöscht oder überschrieben  
- [x] Die Container werden neu gestartet, sobald ein Fehler passiert, der zum Terminieren des Containers führt.

#### 