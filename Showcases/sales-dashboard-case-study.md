# Case Study: Sales Dashboard und Data Modeling

**Projekttyp**: Bewerbungsaufgabe
**Rolle**: Data Analystin
**Tools**: Databricks (SQL), Power BI
**Zeitraum**: Juli 2025
**Datengrundlage**: CRM- und ERP-Daten im Silver Layer

---

## Ziel

Entwicklung eines Sales-Dashboards auf Basis eines sauberen Datenmodells (Gold Layer), das schnelle und interaktive Auswertungen zu Umsätzen, Kunden, Produkten und Opportunities ermöglicht.

---

## Umsetzung

### 1. Gold-Layer Datenmodell (in Databricks)

- Modelltyp: Snowflake Schema
- Fakt-Tabellen:
  - `orders` – Kundenaufträge inkl. Datum, Betrag, Produktbezug
  - `order_items` – Positionen einzelner Produkte pro Auftrag
  - `opportunities` – Sales-Pipeline-Objekte mit Statusverlauf
- Dimensionstabellen:
  - `dim_customer`, `dim_product`, `dim_invoice`, `dim_funnel`, `dim_date`
- Begründung:
  - Normalisierung für Wartbarkeit und Flexibilität
  - Trennung von Fakten und Stammdaten für klare Struktur

Kommentar: Ein gut strukturiertes Snowflake-Modell fördert Performance und ist leicht erweiterbar.

---

### 2. SQL-Logik im Gold Layer

- Erstellung der Tabellen via SQL aus Silver-Layer-Tabellen (inkl. Joins und Berechnungen)
- Aufbau von Materialized Views für KPIs wie:
  - Umsatz pro Monat (`revenue_per_month`)
  - Umsatz nach Produkt oder Region (`revenue_by_product`)
  - Anzahl Opportunities je Funnel-Schritt (`opportunities_by_stage`)
- Optimierung durch:
  - Zeitfilterung (Rolling Windows)
  - Reduktion der Datenmenge (z. B. letzte 12 Monate)
  - Voraggregationen zur Beschleunigung von Power BI-Abfragen

Kommentar: Die Views sind speziell auf Dashboards zugeschnitten – schnell ladend und fokussiert.

---

### 3. Power BI Dashboard-Design

- Zentrale Elemente:
  - Zeitreihenanalyse der Umsätze
  - Funnel-Darstellung für Opportunities
  - Umsatzverteilung nach Produkt, Land, Branche
- Interaktive Filter:
  - Zeiträume, Märkte, Produktkategorien
- Weitere Details:
  - KPI-Switch (z. B. Orders statt Umsatz)
  - Tooltips für aktuelle Funnel-Status
  - Übersichtlicher Header mit Titel, Aktualisierungsdatum, Ansprechpartner

Kommentar: Das Dashboard orientiert sich an Entscheidende mit Bedarf an Überblick und Detailanalyse.

---

## Designprinzipien und Learnings

- Self-Service-fähiges Modell durch klare Trennung von Schichten
- Performance durch Voraggregation und effektive Filterlogik
- Wartbarkeit durch konsistente Benennung und modulare SQL-Struktur
- Skalierbarkeit durch lose Kopplung von Datenmodell und Visualisierung

---

## Verweise

Die vollständige Ausarbeitung inklusive SQL und Power BI-Entwurf ist auf Anfrage verfügbar. Bei Interesse sende ich gern anonymisierte Screenshots oder Beispielcode zu.

---

## Tags

`CaseStudy` `SalesAnalytics` `Databricks` `PowerBI` `DataModeling` `SQL` `DashboardDesign`
