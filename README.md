

# 🛒 From Transactions to Strategy: An End-to-End Retail Analytics Project

> **What drives revenue growth?**
>
> Is it products?
>
> Is it customers?
>
> Is it geography?
>
> Or are a few hidden factors quietly responsible for most of the business?

Using SQL and Python, this project transforms raw transaction data from the **Online Retail II dataset** into business decisions through statistical analysis, customer behavior analysis, and strategic recommendations.

Rather than stopping at dashboards and charts, this project focuses on answering **why things happen** and **what actions the business should take next**.

---

# 🎯 Project Objective

Most analytics projects answer:

> **What happened?**

This project goes further:

* Why did it happen?
* Are the findings statistically significant?
* Which customers truly drive the business?
* Which markets deserve attention?
* Where are the risks?
* What should management do?

---

# Dataset

**Source:** Online Retail II Dataset 
 https://archive.ics.uci.edu/dataset/502/online+retail+ii

### Time Period

* December 2009 – December 2011

### Features

* Invoice
* StockCode
* Description
* Quantity
* InvoiceDate
* Price
* Customer ID
* Country

---

# Tech Stack

### SQL

* CTEs
* Window Functions
* Ranking
* Aggregations

### Python

* Pandas
* NumPy
* Matplotlib
* SciPy
* Statsmodels

---

# Project Workflow

```text
Raw Transactions
        ↓
Revenue Trend Analysis
        ↓
Statistical Validation
        ↓
Customer Value Analysis
        ↓
Revenue Concentration Analysis
        ↓
Root Cause Analysis
        ↓
Geographic Analysis
        ↓
Time-Series Analysis
        ↓
Recommendations
```

---

# Phase 1: Revenue Driver Analysis

### Business Question

> Why is revenue growing?

---

## Trend Analysis

Monthly analysis revealed recurring year-end peaks and beginning-of-year slowdowns.

Revenue growth appeared to be driven by increasing business activity rather than pricing.

---

## Correlation Analysis

Revenue exhibited strong relationships with:

* Orders
* Customers
* Quantity

However, correlation does not imply causation.

---

## Statistical Validation

Pearson significance tests showed that these relationships were statistically significant.

---

## Multicollinearity Investigation

Variance Inflation Factor (VIF) analysis revealed severe multicollinearity among explanatory variables.

As a result:

> Regression analysis was intentionally abandoned to avoid drawing misleading conclusions.

---

### Key Finding

Revenue growth appears to be volume-driven rather than price-driven.

---

# Phase 2: Customer Value Analysis

### Business Question

> Are all customers equally valuable?

---

## Revenue Distribution

Customer revenue exhibited extreme inequality.

---

## Pareto Analysis

| Segment | Revenue Contribution |
| ------- | -------------------: |
| Top 1%  |               27.01% |
| Top 5%  |               48.53% |
| Top 10% |               60.12% |
| Top 20% |               73.69% |

---

## Lorenz Curve and Gini Coefficient

**Gini Coefficient = 0.80**

This indicates extremely concentrated customer value.

---

## Root Cause Analysis

Compared to the bottom 90%, top customers:

* Purchased more frequently.
* Bought larger quantities.
* Had larger basket sizes.
* Stayed active longer.

Welch's t-tests confirmed that these differences were statistically significant.

---

### Key Finding

Revenue concentration is driven by behavioral differences rather than randomness.

---

# Phase 3: Product Analysis

### Business Question

> Does the business depend on a few products?

Contrary to expectations, revenue was broadly distributed across the product portfolio.

No strong 80/20 relationship was observed.

---

### Key Finding

The business is customer-concentrated, not product-concentrated.

---

# Phase 4: Geographic Analysis

### Business Question

> Which markets drive performance?

---

### United Kingdom

Highest total revenue.

Growth driven by customer volume.

---

### EIRE and Netherlands

Fewer customers but significantly higher revenue per customer.

Growth driven by customer value.

---

### Key Finding

Two distinct growth mechanisms emerged:

* Scale-driven markets.
* Value-driven markets.

---

# Phase 5: Time Series Analysis

Recurring peaks were observed during the final quarter of each year.

November consistently produced the highest revenue.

Because only two years of data were available, seasonality could not be conclusively established.

---

## Anomaly Detection

No extreme anomalies were detected.

Observed spikes corresponded to recurring year-end peaks, suggesting seasonal effects rather than isolated events.

---

# Major Challenges Encountered

## Encoding Issues

The dataset initially failed to load due to:

```text
'utf-8' codec can't decode byte 0xa3
```

Resolved by importing with the appropriate encoding.

---

## Empty Tables After Import

Data appeared in pgAdmin but returned no rows through SQL.

The import process was corrected and validated.

---

## Regression Assumptions Violated

Severe multicollinearity prevented meaningful interpretation of regression coefficients.

Instead of forcing a model, the analysis was halted and documented as a limitation.

---

## Forecasting Challenges

Holt-Winters Exponential Smoothing failed to converge because only two years of observations were available.

Rather than forcing predictions, the project focused on trend and anomaly analysis.

---

## Missing Values During Statistical Tests

NaN values caused Welch's t-tests to fail initially.

Data quality checks and recalculation of customer-level metrics resolved the issue.

---

# Executive Recommendations

### Retain High-Value Customers

The top 10% of customers contribute over 60% of revenue.

---

### Increase Purchase Frequency

Encourage repeat purchases through loyalty and retention programs.

---

### Increase Basket Size

Use bundling, upselling, and cross-selling strategies.

---

### Differentiate Geographic Strategy

* UK → Focus on customer acquisition.
* EIRE and Netherlands → Focus on premium customer experience.

---

### Prepare for Year-End Demand

Repeated Q4 peaks suggest inventory and logistics planning should be strengthened.

---

# Limitations

* Only two years of data were available.
* Revenue was analyzed instead of profit.
* Marketing and promotional data were unavailable.
* Statistical significance does not imply causation.
* Seasonality could not be conclusively established.

---

# Skills Demonstrated

### SQL

* CTEs
* Window Functions
* Ranking
* Segmentation

### Python

* Data Cleaning
* Visualization
* Statistical Analysis

### Advanced Analytics

* Correlation Analysis
* VIF Analysis
* Pareto Analysis
* Lorenz Curve
* Gini Coefficient
* Hypothesis Testing
* Root Cause Analysis
* Geographic Analysis
* Time-Series Analysis
* Anomaly Detection

### Business Thinking

* Revenue Drivers
* Customer Concentration
* Risk Analysis
* Strategic Recommendations
* Limitations and Assumptions

---

# Final Takeaway

> Revenue concentration in this business is driven primarily by customers rather than products. A small group of customers generates a disproportionate share of revenue and exhibits fundamentally different purchasing behaviors. Geographic analysis revealed both scale-driven and value-driven markets, while recurring year-end peaks highlighted operational planning opportunities. Throughout the project, statistical validation and explicit limitations were used to avoid overconfident conclusions and ensure that insights translated into actionable business recommendations.

---

⭐ **If you found this project interesting, feel free to star the repository and connect with me.**
