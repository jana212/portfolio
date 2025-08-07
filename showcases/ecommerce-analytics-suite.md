
# E-Commerce Analytics Suite

**Projektart**: Konzept & Dashboard-Design  
**Rolle**: Senior Business Analystin  
**Tools**: SQL, Tableau, BigQuery, dbt, Python  
**Zeitraum**: April 2025  
**Kontext**: Strategische Analyse- und Dashboard-Initiativen für CRM, Retention und Black Friday Forecasting

---

## 1. Black Friday Forecast

**Ziel:** Prognosemodell für Produktverfügbarkeit und Umsatzentwicklung während der Black-Friday-Kampagne

- Berücksichtigte Variablen:
  - Historische Verkaufsdaten, Lagerbestand, Lead Times, Kampagnen
  - Konkurrenzverhalten, Produktlebenszyklus, Kundenpräferenzen
- Methoden:
  - Time Series Forecasts
  - Machine Learning (z. B. Regression, Decision Trees)
- Ergebnis:
  - Weekly Forecast mit optionaler Tages- und Monatsansicht
  - Fokus auf Topseller, Kampagnenprodukte und Engpassvermeidung

---

## 2. CRM & Retention

**Ziel:** Analyse von Churn-Faktoren und Optimierung der Kundenbindung

- Metriken:
  - Retention Rate, Churn Rate, CLV, Average Order Value, Engagement Rate
- Methodik:
  - Customer Cohort Analysis in SQL
  - Splits nach Kundentyp, Produktkategorie, Region, Kampagne
- Ergebnis:
  - Interaktive Dashboards zur Verhaltensanalyse
  - Datengestützte Ableitung von Retention-Strategien

---

## 3. Executive Dashboard

**Ziel:** High-Level-Kennzahlen für das Management klar und einheitlich darstellen

- Vorgehen:
  - KPI-Abstimmung mit Führungsebene (z. B. Revenue, CAC, CSAT)
  - Entwicklung eines iterativen Mockup-Prozesses mit Feedback
  - Einbindung von Echtzeitdaten und Drilldown-Links
- Erfolgsfaktoren:
  - „Less is more“: Fokussierung auf Kernkennzahlen
  - Hover-Text, responsive Design und KPI-Textboxen

---

## 4. Technische Optimierung (Query Performance)

**Ziel:** Verbesserung der Ladegeschwindigkeit und Skalierbarkeit von Reports

- Herausforderungen:
  - Große Datenmengen in Tableau, langsame Dashboards
  - Verteilte Berechnungen in mehreren Berichten
- Lösungen:
  - Einsatz von Materialized Views, Partitionierung & Clustering
  - Aufbau einer Reporting-Datenbank als „Single Point of Truth“ via dbt
  - Umstellung auf inkrementelle Ladeprozesse
  - GitHub-basierte Versionierung und Testbarkeit

---

## Learnings & Highlights

- Verknüpfung von analytischem Denken mit technischer Umsetzung
- Nutzerzentriertes Dashboard-Design für verschiedene Zielgruppen
- End-to-End-Konzept: von Forecasting über CRM bis zur technischen Skalierung

---

## Tags

`Ecommerce` `Forecasting` `CRM` `Retention` `Dashboard` `SQL` `dbt` `BigQuery` `Tableau`
