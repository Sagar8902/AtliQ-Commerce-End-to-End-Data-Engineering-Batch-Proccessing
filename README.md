# AtliQ Commerce – End-to-End Data Engineering Project

## Project Overview

An end-to-end batch data engineering project that builds a scalable data pipeline for an e-commerce business.

The project collects data from multiple sources, processes it using Azure services, transforms it into analytics-ready datasets, and makes it available for business reporting and decision-making.

## Architecture

```text
 Azure SQL Database       ADLS Gen2 Files
         |                       |
         +-----------+-----------+
                     |
                     v
             Azure Data Factory
              (Data Ingestion)
                     |
                     v
              ADLS Gen2
              Bronze Layer
                     |
                     v
          Azure Databricks + PySpark
          (Data Cleaning & Processing)
                     |
                     v
              Delta Lake
              Silver Layer
                     |
                     v
               dbt Core
          (Data Transformation
             & Data Testing)
                     |
                     v
              Gold Layer
          (Analytics-Ready Data)
                     |
                     v
           Microsoft Fabric
              / Power BI
          (Business Dashboards)

          GitHub Actions
             (CI/CD)
```

## Technology Stack

| Technology | Purpose |
|---|---|
| Azure SQL Database | Source database |
| Azure Data Lake Storage Gen2 | Cloud data storage |
| Azure Data Factory | Data ingestion and orchestration |
| Azure Databricks | Distributed data processing |
| PySpark | Data transformation |
| Delta Lake | Reliable data storage |
| dbt Core | Data modelling and testing |
| Microsoft Fabric | Analytics and reporting |
| Power BI | Business dashboards |
| Python | Data generation and automation |
| Git & GitHub | Version control |
| GitHub Actions | CI/CD automation |

## Project Workflow

**1. Data Sources**

Collect e-commerce data such as customers, products, orders, order items, and payments from Azure SQL Database. Additional supplier, marketing, and website activity data comes from files.

**2. Bronze Layer – Data Ingestion**

Use Azure Data Factory to ingest source data into Azure Data Lake Storage Gen2.

**3. Silver Layer – Data Processing**

Use Azure Databricks and PySpark to clean, standardise, deduplicate, and incrementally process the data using Delta Lake.

**4. Gold Layer – Data Modelling**

Use dbt Core to create fact and dimension tables, apply business transformations, and perform data quality tests.

**5. Reporting & Analytics**

Connect Microsoft Fabric to the Gold layer and build business dashboards to analyse e-commerce performance.

**6. Automation & CI/CD**

Use scheduled pipeline execution and GitHub Actions to automate dbt validation and testing.

## Key Business Insights

The project supports analysis of:

- Revenue and sales trends.
- Top-performing products and categories.
- Revenue by customer city.
- New vs. returning customers.
- Website purchase conversion funnel.

The dashboard includes date and product-category filters.

Revenue calculations should account for cancelled and returned orders according to the defined business rules.

## Run the dbt Project Locally

**1. Navigate to the dbt project:**

```bash
cd atliq_gold
```

**2. Configure environment variables:**

Set the following Databricks connection variables:

```env
DATABRICKS_HOST=your_databricks_workspace_host
DATABRICKS_HTTP_PATH=your_sql_warehouse_http_path
DATABRICKS_TOKEN=your_databricks_access_token
```

**3. Install dbt dependencies:**

```bash
dbt deps
```

**4. Build and test dbt models:**

```bash
dbt build --target dev
```

**Note:** Never commit `.env`, passwords, or access tokens. Use `.env.example` for configuration templates and GitHub repository secrets for CI/CD.

## Repository Structure

```text
Project_code/
│
├── .github/
│   └── workflows/
│       └── ci.yml
│
├── atliq_gold/
│   ├── analyses/
│   ├── dbt_packages/
│   ├── macros/
│   ├── models/
│   ├── seeds/
│   ├── snapshots/
│   ├── tests/
│   ├── dbt_project.yml
│   ├── profiles.yml
│   └── README.md
│
├── database data seed/
├── logs/
├── .env.example
├── .gitignore
├── daily_order_simulator.py
├── requirements.txt
└── README.md
```

## Data Quality & Reliability

The project incorporates:

- dbt data quality tests.
- Incremental data processing.
- Silver-layer data quality logging.
- Repeatable pipeline execution.
- GitHub Actions CI/CD validation.
- Environment-based secret management.

Additional production-readiness checks include nightly execution, failure alerts, audit logging, and idempotency validation.

## Project Goals

The main objective is to demonstrate practical end-to-end data engineering skills, including:

- Building automated data pipelines.
- Implementing Medallion Architecture (Bronze, Silver, Gold).
- Processing large datasets using PySpark.
- Developing analytics-ready data models with dbt.
- Implementing data quality and reliability checks.
- Automating testing and CI/CD workflows.
- Delivering business insights through dashboards.

---

**Project:** AtliQ Commerce – End-to-End Batch Data Engineering

**Architecture:** Azure Data Engineering + Medallion Architecture

**Focus:** Data Ingestion | Data Transformation | Data Modelling | Data Quality | CI/CD | Business Intelligence