
CREATE DATABASE churn_project;
USE churn_project;

CREATE TABLE customer_churn (
    customerID VARCHAR(50) PRIMARY KEY,
    gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(5),
    Dependents VARCHAR(5),
    tenure INT,
    PhoneService VARCHAR(5),
    MultipleLines VARCHAR(25),
    InternetService VARCHAR(25),
    OnlineSecurity VARCHAR(25),
    OnlineBackup VARCHAR(25),
    DeviceProtection VARCHAR(25),
    TechSupport VARCHAR(25),
    StreamingTV VARCHAR(25),
    StreamingMovies VARCHAR(25),
    Contract VARCHAR(25),
    PaperlessBilling VARCHAR(5),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10, 2),
    TotalCharges VARCHAR(50), -- Kept as VARCHAR temporarily because raw data has blank spaces for new users
    Churn VARCHAR(5)
);
SELECT COUNT(*) FROM customer_churn; 

SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND((SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS overall_churn_rate
FROM customer_churn;

SELECT 
    CASE 
        WHEN tenure <= 6 THEN '0-6 Months (New)'
        WHEN tenure <= 12 THEN '7-12 Months'
        WHEN tenure <= 24 THEN '1-2 Years'
        ELSE '2+ Years (Loyal)'
    END AS customer_tenure_segment,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND((SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY customer_tenure_segment
ORDER BY churn_rate DESC;

SELECT 
    TechSupport,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND((SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY TechSupport;

SELECT 
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND((SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS churn_rate
FROM customer_churn
GROUP BY Contract
ORDER BY churn_rate DESC;
SELECT COUNT(*) FROM active_customer_risk_scores;
SELECT * FROM active_customer_risk_scores
ORDER BY Churn_Probability_Score DESC
LIMIT 10;

SELECT 
    CASE 
        WHEN Churn_Probability_Score >= 0.70 THEN 'High Risk (Score >= 70%)'
        WHEN Churn_Probability_Score >= 0.30 THEN 'Medium Risk (30% - 69%)'
        ELSE 'Low Risk (Score < 30%)'
    END AS risk_tier,
    COUNT(*) AS total_customers,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_bill,
    ROUND(AVG(tenure), 1) AS avg_tenure_months
FROM active_customer_risk_scores
GROUP BY risk_tier
ORDER BY risk_tier;

SELECT 
    Playbook_Action,
    COUNT(*) AS customer_count,
    ROUND(AVG(Churn_Probability_Score) * 100, 1) AS avg_risk_percentage,
    ROUND(SUM(MonthlyCharges), 2) AS total_monthly_revenue_at_risk
FROM active_customer_risk_scores
GROUP BY Playbook_Action
ORDER BY total_monthly_revenue_at_risk DESC;