# 📊 Subscription Analytics End-to-End Data Analytics Project

## 🚀 Project Overview

This project demonstrates a complete end-to-end data analytics workflow using Python, MySQL, SQL, and Power BI.

The main objective of this project was to clean, transform, analyze, and visualize subscription-based user data to generate meaningful business insights related to:

* User acquisition
* Customer engagement
* Conversion performance
* Revenue trends
* Retention behavior
* Course performance

The final output is an interactive 4-page Power BI dashboard built using business-focused KPIs and analytics.

---

## 🌟 Why I Built This Project

I created this project to practice a complete end-to-end data analytics workflow using Python, MySQL, SQL, and Power BI.

Instead of using a fully cleaned dataset, I worked with self-generated subscription analytics data containing inconsistencies, missing values, duplicate records, and formatting issues to simulate real-world business data challenges.

The goal of this project was not only to build dashboards but also to understand the entire analytics pipeline:

* Data cleaning using Python
* Database integration with MySQL
* Business analysis using SQL
* Interactive dashboard creation in Power BI

During this project, I improved my skills in:

* Data preprocessing
* Feature engineering
* SQL analytics
* KPI development
* Data modeling
* Business storytelling through dashboards

One of the most valuable learning experiences was solving Month-on-Month revenue analysis and creating meaningful engagement and retention metrics from raw subscription data.

---

# 🛠️ Tech Stack

| Tool           | Purpose                       |
| -------------- | ----------------------------- |
| Python         | Data cleaning & preprocessing |
| Pandas & NumPy | Data transformation           |
| SQLAlchemy     | MySQL database connection     |
| MySQL          | Database storage & querying   |
| SQL            | Business analytics            |
| Power BI       | Dashboarding & visualization  |
| Excel/CSV      | Raw data source               |

---

# 📂 Project Workflow

## 1️⃣ Data Collection

Two raw CSV datasets related to subscription analytics were imported into Python using Pandas.

### Datasets Used

* dirty_app_subscription_analytics.csv
* subscriptions_sample_500.csv

---

## 2️⃣ Data Cleaning & Transformation using Python

The datasets were merged and cleaned using Python.

### Cleaning Steps Performed

* Removed duplicate records
* Handled missing values
* Standardized inconsistent region names
* Fixed negative watch-time values
* Converted date columns into datetime format
* Created derived business columns

### Feature Engineering

Additional business metrics were created:

* Signup Month
* Signup Year
* Engagement Level
* Retention Score
* Retention Category
* Course Allocation

---

# 🐍 Python Libraries Used

```python id="hggv3n"
import pandas as pd
import numpy as np
from pathlib import Path
from sqlalchemy import create_engine
```

---

# 🗄️ MySQL Database Integration

The cleaned dataset was transferred into MySQL using SQLAlchemy.

### Database Created

```sql id="mnv3mp"
CREATE DATABASE subscription_analytics;
```

### Main Tables

* cleaned_subscriptions
* courses

### Database Operations Performed

* Added primary keys
* Created foreign key relationships
* Validated table structure
* Connected MySQL with Power BI

---

# 📈 SQL Business Analysis

Advanced SQL queries were written to analyze business performance and customer behavior.

## Key Business Analysis Areas

### User & Revenue KPIs

* Total users
* Paid users
* Conversion rate
* Total revenue

### Trend Analysis

* Monthly signup trends
* Revenue growth trends
* Running revenue totals
* Month-on-Month revenue growth

### Customer Analytics

* Engagement analysis
* Retention segmentation
* Regional performance
* Acquisition channel performance

### Course Analytics

* Course conversion performance
* Teacher performance
* Revenue by course

### Advanced SQL Concepts Used

* CTEs
* Window Functions
* LAG()
* Aggregate Functions
* CASE Statements
* GROUP BY
* JOIN Operations

---

# 📊 Power BI Dashboard

An interactive 4-page Power BI dashboard was created to visualize business insights and KPIs.

## Dashboard Pages

### ## Dashboard Pages

### 1️⃣ Executive Summary

This page provides a high-level overview of overall business performance and key KPIs.

Key insights included:

* Total Users
* Paid Users
* Conversion Rate
* Total Revenue
* Acquisition Channel Performance
* Region-wise Revenue Analysis
* Subscription Tier Revenue Distribution
* Revenue Trend Analysis

---

### 2️⃣ Customer Analytics

This page focuses on customer behavior, engagement, and retention analysis.

Key insights included:

* User Persona Segmentation
* Retention Category Analysis
* Engagement Level Distribution
* High Retention but Unpaid Users
* Customer Behavior Insights

---

### 3️⃣ Course & Teacher Analytics

This page analyzes course performance and teacher contribution.

Key insights included:

* Top Courses by Revenue
* Top Performing Teachers
* Average Retention by Course
* Course Conversion Analysis
* Course & Teacher Performance Summary Tables

---

### 4️⃣ Financial & Growth Analytics

This page focuses on business growth and financial trend analysis.

Key insights included:

* Month-on-Month (MoM) Revenue Growth
* Revenue vs Users Trend Analysis
* Revenue Growth Tracking
* Financial Performance Trends
* Cumulative Revenue Analysis

# 🔑 Key Business Insights

* Identified top-performing acquisition channels
* Measured customer conversion efficiency
* Segmented users based on engagement levels
* Analyzed high-retention unpaid users
* Tracked revenue growth patterns over time
* Compared course-level business performance

---

# 📌 Skills Demonstrated

## Data Analytics

* Data Cleaning
* Data Transformation
* KPI Analysis
* Business Intelligence
* Dashboard Design

## Python

* Pandas
* NumPy
* SQLAlchemy

## SQL

* Joins
* CTEs
* Window Functions
* Aggregations

## Power BI

* Data Modeling
* DAX Measures
* Dashboard Design
* Interactive Visualization

---

# 📷 Dashboard Preview

## Executive Overview
![Executive Overview](Screenshots/Executive%20Overview.png)

## Customer & Engagement Analysis
![Customer & Engagement Analysis](Screenshots/Customer%20&%20Engagement%20Analysis.png)

## Course & Teacher Analytics
![Course & Teacher Analytics](Screenshots/Course%20&%20Teacher%20Analytics.png)

## Financial & Growth Analysis
![Financial & Growth Analysis](Screenshots/Financial%20&%20Growth%20Analysis.png)

---

# 📁 Project Structure

```plaintext id="cqf1xp"
Subscription-Analytics-Project/
│
├── data/
│   ├── dirty_app_subscription_analytics.csv
│   ├── subscriptions_sample_500.csv
│   └── cleaned_subscriptions.csv
│
├── python/
│   └── data_cleaning_script.py
│
├── sql/
│   └── business_queries.sql
│
├── powerbi/
│   └── Subscription_Analytics_Dashboard.pbix
│
├── screenshots/
│
└── README.md
```

---

# ✅ Conclusion

This project demonstrates a complete real-world analytics pipeline starting from raw data preprocessing to business intelligence dashboarding.

The project helped strengthen practical skills in:

* Python data cleaning
* SQL business analytics
* Database integration
* Power BI dashboard development
* Business storytelling through data

Overall, this project reflects an end-to-end analytics workflow commonly used in real-world data analytics and business intelligence environments.