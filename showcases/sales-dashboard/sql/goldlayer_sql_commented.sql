-- Allgemeine SQL-Struktur
CREATE ## tables als Basis ##

-- Tabelle: Kundenbestellungen (Header)
-- Enthält Bestell-ID, Datum, Gesamtbetrag und Kundenbezug
CREATE table gold_facts_orders AS
  SELECT
    so.order_id
    , so.order_date
    , so.status AS order_status
    , so.item_count
    , so.net_value_eur
    , so.customer_id
  FROM silver_sap_sales_order AS so
  ;

-- Tabelle: Einzelne Produktpositionen je Bestellung
-- Enthält Preis, Menge, Rabatt, Produkt- und Kundenbezug
CREATE table gold_facts_orders_items AS
    SELECT
      soi.order_items_id
      , soi.order_id
      , so.status AS order_status
      , soi.product_id
      , soi.quantity
      , soi.discount_pct
      , soi.unit_price_eur
      , cc.customer_id
    FROM silver_sap_order_items AS soi
    LEFT JOIN silver_sap_sales_order so
      ON soi.order_id = so.order_id
    LEFT JOIN silver_crm_customers AS cc
      ON so.customer_id = cc.customer_id
;

-- Tabelle: Opportunities im Sales Funnel
-- Enthält Status, Branche, Dauer und Zuordnung zum Kunden
CREATE table gold_fact_opportunities AS
  SELECT
    co.opportunity_id
    , co.stage
    , co.customer_id
    , cc.industry
    , cc.country_code
    , cc.status
    , co.created_date
    , DATEDIFF(co.created_date-co.closed_date) AS dauer_opportunity
  FROM silver_crm_opportunities AS co
  LEFT JOIN silver_crm_customers AS cc
    ON co.customer_id = cc.customer_id
;

-- Allgemeine SQL-Struktur
CREATE table gold_dim_products AS
  SELECT
    sp.product_id
    , sp.product_name
    , sp.product_type
    , sp.list_price_eur
    , sp.category
    , sp.subcategory
  FROM silver_sap_products AS sp
;

-- Allgemeine SQL-Struktur
CREATE table gold_dim_customers AS
  SELECT
    cc.customer_id
    , cc.industry
    , cc.status
    , cc.country_code
    , DATEDIFF(CURRENT_DATE() - cc.created_date) AS days_customer #abhängig, ob Tabelle regelmäßig neu erzeugt, sonst Monat/Jahr created
    , COUNT(DISTINCT co.opportunity_id) AS count_opportunities
    , COUNT(DISTINCT ca.activity_id) AS count_activities
  FROM silver_crm_customers AS cc
  LEFT JOIN silver_crm_opportunities AS co
    ON cc.customer_id = co.customer_id
  LEFT JOIN silver_crm_activites as ca
    ON cc.customer_id = ca.customer_id
;

-- Allgemeine SQL-Struktur
CREATE table gold_dim_invoices AS
  SELECT
    si.invoice_id
    , si.status
    , si.invoice_date
    , si.total_amount_eur
    , si.net_amount_eur
    , si.vat_amount_eur
    , si.order_id
    , so.customer_id
    , cc.industry
    , cc.country_code

  FROM silver_sap_invoices AS si
  LEFT JOIN silver_sap_sales_order AS so
    ON si.order_id = so.order_id
  LEFT JOIN silver_crm_customers cc
    ON so.customer_id = cc.customer_id
;

### views für Performance / Dashboards ###

-- Weitere View zur Kennzahlenermittlung
CREATE view gold_vw_monthly_orders AS
  SELECT
    DATEPART(YEAR, fo.order_date) AS jahr
    , DATEPART(MONTH, fo.order_date) AS monat
    , fo.order_status
    , dc.industry
    , dc.country_code
    , COUNT(DISTINCT fo.order_id) AS anzahl_orders
    , SUM(fo.item_count) AS anzahl_produkte
    , SUM(fo.total_amount_eur) AS total_amount_eur
    , SUM(fo.net_amount_eur) AS net_amount_eur
    , SUM(fo.vat_amount_eur) AS vat_amount_eur
  FROM gold_facts_orders AS fo
  LEFT JOIN gold_dim_customers AS dc
    ON fo.customer_id = dc.customer_id
  GROUP BY DATEPART(YEAR, fo.order_date)
  , DATEPART(MONTH, fo.order_date)
  , fo.order_status
  , dc.industry
  , dc.country_code
;

-- Weitere View zur Kennzahlenermittlung
CREATE view gold_vw_orders_per_customer AS
  SELECT
    fo.status
    , fo.customer_id
    , dc.industry
    , dc.country_code
    , COUNT(DISTINCT fo.order_id) AS anzahl_orders
    , SUM(fo.item_count) AS anzahl_produkte
    , SUM(fo.total_amount_eur) AS total_amount_eur
    , SUM(fo.net_amount_eur) AS net_amount_eur
    , SUM(fo.vat_amount_eur) AS vat_amount_eur
    , (SUM(fo.item_count) / COUNT(DISTINCT fo.order_id)) AS produkte_per_order
    , AVG(fo.total_amount_eur) AS avg_total_amount_eur

  FROM gold_facts_orders AS fo
  LEFT JOIN gold_dim_customers AS dc
    ON fo.customer_id = dc.customer_id
  GROUP BY fo.status
  , fo.customer_id
  , dc.industry
  , dc.country_code
;

-- Weitere View zur Kennzahlenermittlung
CREATE view gold_vw_orders_per_product AS
  SELECT
    foi.order_status
    , foi.product_id
    , dp.product_name
    , dp.product_type
    , dp.category
    , dp.subcategory
    , foi.category
    , foi.subcategory
    , dc.industry
    , dc.country_code
    , SUM(foi.item_count) AS anzahl_produkte
    , SUM(foi.total_amount_eur) AS total_amount_eur
    , SUM(foi.net_amount_eur) AS net_amount_eur
    , SUM(foi.vat_amount_eur) AS vat_amount_eur
  FROM gold_facts_orders_items AS foi
  LEFT JOIN gold_dim_customers AS dc
    ON foi.customer_id = dc.customer_id
  LEFT JOIN gold_dim_products AS dp
    ON foi.product_id = sp.product_id

  GROUP BY    foi.order_status
    , foi.product_id
    , foi.product_name
    , foi.category
    , foi.subcategory
    , dc.industry
    , dc.country_code