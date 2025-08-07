# Case Study: Sales Dashboard und Data Modeling

**Projekttyp**: Bewerbungsaufgabe
**Rolle**: Senior Business Analystin
**Tools**: Databricks (SQL), Power BI
**Zeitraum**: Juli 2025
**Datengrundlage**: CRM- und ERP-Daten im Silver Layer

---

## Ziel

Entwicklung eines Sales-Dashboards auf Basis eines sauberen Datenmodells (Gold Layer), das schnelle und interaktive Auswertungen zu Umsätzen, Kunden, Produkten und Opportunities ermöglicht.

---

## Umsetzung

### 1. Gold-Layer Datenmodell (in Databricks)

* Modelltyp: Snowflake Schema
* Fakt-Tabellen:

  * `orders` – Kundenaufträge inkl. Datum, Betrag, Produktbezug
  * `order_items` – Positionen einzelner Produkte pro Auftrag
  * `opportunities` – Sales-Pipeline-Objekte mit Statusverlauf
* Dimensionstabellen:

  * `dim_customer`, `dim_product`, `dim_invoice`, `dim_funnel`, `dim_date`
* Begründung:

  * Normalisierung für Wartbarkeit und Flexibilität
  * Trennung von Fakten und Stammdaten für klare Struktur

Kommentar: Ein gut strukturiertes Snowflake-Modell fördert Performance und ist leicht erweiterbar.

---

### 2. SQL-Logik im Gold Layer

Der Gold Layer wurde mithilfe strukturierter SQL-Statements in Databricks aufgebaut. Dabei lag der Fokus auf einer performanten und wartbaren Modellierung, die speziell auf BI-Anwendungen wie Power BI zugeschnitten ist.

Die Fakt- und Dimensionstabellen wurden aus den Silver-Layer-Quellen extrahiert, bereinigt verknüpft und um berechnete Felder ergänzt. Für das Reporting wurden zusätzlich materialisierte Views erstellt, die die wichtigsten KPIs voraggregiert und performant bereitstellen.

Die umgesetzten Schwerpunkte im Überblick:

* Aufbau von Fakt- und Dimensionstabellen über klare Joins und Feldberechnungen
* Materialisierte Views für zentrale Kennzahlen, unter anderem:

  * Umsatz pro Monat (`revenue_per_month`)
  * Umsatz nach Produkt oder Region (`revenue_by_product`)
  * Anzahl Opportunities je Funnel-Schritt (`opportunities_by_stage`)
* Optimierung der Views für Reportingzwecke durch:

  * Zeitfilterung (z. B. letzte 12 Monate)
  * Rolling-Window-Konzepte
  * gezielte Voraggregationen zur Entlastung von Frontend-Abfragen

Ein kommentierter SQL-Auszug ist im Repository verfügbar:
[`goldlayer_sql_commented.sql`](sql/goldlayer_sql_commented.sql)

Die Datei enthält:

* `CREATE TABLE`-Statements zur Erstellung des dimensionalen Modells
* `CREATE VIEW`-Statements für alle zentralen KPIs
* Kommentierungen mit Begründungen zu Joins, Attributauswahl und Performance-Strategien

> Hinweis: Die Views wurden so gestaltet, dass sie direkt im Dashboard eingesetzt werden können – mit minimaler Ladezeit und klarer Trennung nach Analysezweck.

---

### 3. Power BI Dashboard-Design

* Zentrale Elemente:

  * Zeitreihenanalyse der Umsätze
  * Funnel-Darstellung für Opportunities
  * Umsatzverteilung nach Produkt, Land, Branche
* Interaktive Filter:

  * Zeiträume, Märkte, Produktkategorien
* Weitere Details:

  * KPI-Switch (z. B. Orders statt Umsatz)
  * Tooltips für aktuelle Funnel-Status
  * Übersichtlicher Header mit Titel, Aktualisierungsdatum, Ansprechpartner

Kommentar: Das Dashboard orientiert sich an Entscheidende mit Bedarf an Überblick und Detailanalyse.

---

## Designprinzipien und Learnings

* Self-Service-fähiges Modell durch klare Trennung von Schichten
* Performance durch Voraggregation und effektive Filterlogik
* Wartbarkeit durch konsistente Benennung und modulare SQL-Struktur
* Skalierbarkeit durch lose Kopplung von Datenmodell und Visualisierung

---

## Verweise

Die vollständige Ausarbeitung inklusive SQL und Power BI-Entwurf ist auf Anfrage verfügbar. Bei Interesse sende ich gern anonymisierte Screenshots oder Beispielcode zu.

---

## Tags

`CaseStudy` `SalesAnalytics` `Databricks` `PowerBI` `DataModeling` `SQL` `DashboardDesign`
