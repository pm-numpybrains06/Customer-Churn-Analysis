# 📊 End-to-End Customer Churn Analytics & Predictive Retention Engine
An end-to-end churn analytics pipeline integrating MySQL, Python (Scikit-Learn), and Power BI. Features a predictive machine learning model that forecasts active subscriber drop-off risk, dynamic DAX metrics, and an enterprise-grade "Retention Playbook" dashboard wrapped in a custom UI layout designed for strategic corporate decision-making.

Welcome to the **Customer Churn Analytics Pipeline**! 🚀 This repository contains a production-ready, data-driven system designed to identify historical churn trends and predict future customer drop-offs before they happen. 

By combining relational database management (**MySQL**), machine learning (**Python/Scikit-Learn**), and executive-level business intelligence (**Power BI**), this system shifts corporate strategy from reactive reporting to proactive customer retention.



## 🛠️ System Architecture & Data Pipeline

The data engineering and data science pipeline functions across four key stages:
1. **📥 Data Ingestion & Storage:** Raw subscriber profiles are structured, cleaned, and stored inside a relational MySQL database.
2. **🤖 Machine Learning Processing:** A Python pipeline connects to MySQL via SQLAlchemy, extracts active subscriber records, and uses a trained predictive model to calculate individual churn probabilities.
3. **📋 Strategic Playbook Assignment:** Customers are dynamically segmented into specific risk tiers (*VIP Concierge, Automated Push, Feature Campaigns*) based on their risk exposure and financial value.
4. **🎨 BI Deployment:** Data is fed via a live database connector into an enterprise Power BI dashboard wrapped in a custom-designed, executive-ready UI theme.



## 🖥️ Dashboard Walkthrough & Business Insights

### 📈 Tab 1: Executive Churn Overview

This page is designed for high-level stakeholders to evaluate macro trends, product infrastructure vulnerabilities, and seasonal revenue loss.

📸 *======= cc1.png=======* 📸



* **⏳ Revenue Stability:** Month-to-month contracts represent the highest revenue volatility, highlighting a critical need to incentivize long-term renewals at sign-up.
* **🌐 Infrastructure Risk:** Fiber Optic connections demonstrate a disproportionately high churn rate compared to DSL lines, indicating operational quality friction or uncompetitive pricing models.
* **⏳ Retention Lifecycle:** Customer drop-off peaks aggressively within the first 0 to 6 months of the customer lifecycle, proving that early onboarding engagement dictates multi-year customer loyalty.

---

### 🕹️ Tab 2: Predictive Action Playbook

This operational workspace turns predictive machine learning data into direct business actions for customer success teams to clear daily.

📸 *======= cc2.png =======* 📸


* **🎛️ The Strategy Slicer:** Allows Customer Success Teams to filter active users instantly by their assigned retention workflow button.
* **💰 Financial Priority:** Calculates the precise `Total Revenue at Risk` live based on selected cohorts, ensuring high-value accounts are prioritized first.
* **📋 Operational Call List:** Provides an exportable, interactive data grid containing specific customer IDs, their exact churn probabilities, and monthly billing metrics for immediate outreach.



## 🧰 Tech Stack & Tools Used
* **Database:** 🛢️ MySQL (Relational Schema Design, Data Segregation)
* **Languages:** 🐍 Python 3.x, 📝 SQL, 🔢 DAX
* **Data Science Libraries:** 🐼 Pandas, 🔢 NumPy, 🤖 Scikit-Learn, 🔌 SQLAlchemy
* **Visualization:** 📊 Power BI Desktop, 🎨 Microsoft PowerPoint (Custom UI Canvas Grid Layouts)



## 🚀 How to Run This Project Locally

### 1. 🛢️ Database Setup
Execute the SQL script inside your MySQL Instance to establish the base environment:
```sql
CREATE DATABASE churn_project_database;
-- Import data using your MySQL import wizard or command line
