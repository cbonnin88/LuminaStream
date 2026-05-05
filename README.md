# 📺 LuminaStream: End-to-End Product Analytics Pipeline

![Google BigQuery](https://img.shields.io/badge/Google_BigQuery-669DF6?style=for-the-badge&logo=google-cloud&logoColor=white)
![Looker Studio](https://img.shields.io/badge/Looker_Studio-4285F4?style=for-the-badge&logo=google&logoColor=white)
![Polars](https://img.shields.io/badge/Polars-CD792C?style=for-the-badge&logo=polars&logoColor=white)

## 📌 Project Overview
LuminaStream is a simulated end-to-end data pipeline and analytics portfolio project for a fictional video streaming service. 

As a Product Analyst, the goal of this project was to generate a realistic product dataset, optimize it within a modern cloud data warehouse, conduct deep-dive SQL exploratory data analysis (EDA), and build interactive dashboards to track user retention, feature adoption, and subscription conversions.

## 🛠️ The Tech Stack
* **Data Generation:** Python, Polars (`uuid`, `json`, `random`)
* **Data Warehousing:** Google BigQuery (Partitioning, Clustering)
* **BI & Visualization:** Google Looker Studio

---

## 🏗️ Project Architecture & Phases

### Phase 1: Synthetic Data Generation (Python + Polars)
Developed a Python script using the high-performance `Polars` library to generate a realistic user base and event stream.
* Generated **25,000 unique users** with demographic and subscription data.
* Simulated over **300,000 product events** (e.g., `session_start`, `view_channel`, `start_recording`, `app_crash`).
* Architected the schema to mirror enterprise standards, separating internal integer IDs from string-based UI display prefixes (`LS-1001`).
* Exported the data as **Newline Delimited JSON (NDJSON)** for optimized batch ingestion.

### Phase 2: Data Warehousing & Advanced SQL (BigQuery)
Uploaded the NDJSON files to Google BigQuery and optimized the tables for analytical querying.
* **Performance Optimization:** Implemented `DATE(timestamp)` partitioning and clustered the table by `event_type` and `device_type` to drastically reduce query latency and "bytes processed" costs.
* **SQL Exploratory Data Analysis (EDA):** Wrote advanced SQL queries utilizing:
  * **CTEs & Subqueries:** To build multi-step conversion funnels.
  * **Window Functions:** (`LAG()`, `LEAD()`) to calculate average time between sessions.
  * **Data Cleaning:** Utilized `COALESCE()` and `CAST()` to handle null values and format timestamps.
  * **String Manipulation:** Used `CONCAT()` to reconstruct customer-facing display IDs for mock support tickets.

### Phase 3: [Executive Dashboarding (Looker Studio)](https://datastudio.google.com/reporting/56627cb6-465e-4f16-bec6-c525fe382801)
Connected Looker Studio directly to BigQuery views to build **Lumina Pulse**, an interactive executive dashboard.
* **Executive Scorecards:** Real-time metrics for Monthly Recurring Revenue (MRR), Active Users, and Platform Crash Rates.
* **Engagement Trends:** Time-series charts tracking Daily Active Users (DAU) and feature popularity.
* **Interactive Filters:** Drop-down controls allowing stakeholders to slice data by Date Range, Country, and Device Type.

---

## 📂 Repository Structure
```text
├── data_generation/
│   ├── generator.py               # Python script (Polars) to build JSON files
│   ├── lumina_users_v3.json       # Generated user dimension table (Sample)
│   └── lumina_events_v3.json      # Generated product fact table (Sample)
├── sql_analysis/
│   ├── table_creation.sql         # DDL statements for Partitioning/Clustering
│   ├── funnel_conversion.sql      # CTEs for subscription upgrade rates
│   ├── session_spacing.sql        # Window functions for session intervals
│   └── cohort_sampling.sql        # Modulo logic for 10% API extraction
└── README.md
