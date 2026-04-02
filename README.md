# Marketing Campaign Performance Analysis (PostgreSQL)

This project analyzes the performance of 2024 marketing campaigns across **Email**, **Social Media**, and **Paid Ads** channels. Using PostgreSQL and advanced SQL window functions, it evaluates revenue, conversion efficiency, channel performance, and month‑over‑month growth to help marketing teams make data‑driven decisions.

---

##  Project Overview

The dataset contains **15 marketing campaigns** with details on budget, revenue, clicks, conversions, and impressions.  
The analysis answers key business questions such as:

- Which campaigns generated the highest revenue  
- Which channels performed best  
- Which campaigns had the strongest conversion rates  
- How revenue changed month‑over‑month  
- How cumulative revenue grew throughout the year  

This project demonstrates strong SQL skills including **RANK(), LAG(), SUM OVER**, and analytical query design.

---

## Business Problem

Marketing teams often evaluate campaigns using surface-level metrics like revenue or clicks, which can hide declining performance trends or inefficient budget allocation.

This analysis aims to uncover:
- Which campaigns truly drive sustainable growth
- Which channels are most efficient
- Where performance is declining despite high revenue


---

## Dataset Structure

| Column | Description |
|--------|-------------|
| campaign_id | Unique campaign identifier |
| campaign_name | Name of the marketing campaign |
| channel | Email / Social Media / Paid Ads |
| start_date | Campaign start date |
| end_date | Campaign end date |
| budget | Total campaign spend |
| revenue | Revenue generated |
| clicks | Number of clicks |
| conversions | Number of conversions |
| impressions | Total impressions |

---

## SQL Concepts Used

- **Window Functions**  
  - `RANK()`  
  - `LAG()`  
  - `SUM() OVER`  
- **Partitioning by channel**  
- **Conversion rate calculations**  
- **Month‑over‑month revenue growth**  
- **Running totals**  
- **Data creation + sample inserts**

---

##  Key Insights

- **Paid Ads** campaigns generated the highest overall revenue.  
- **Email** campaigns showed the strongest conversion rates.  
- **Social Media** performance varied significantly month‑to‑month.  
- Running total analysis shows **steady revenue growth** across 2024.  
- Several campaigns delivered **high ROI relative to budget**.

---

##  Analytical Questions Answered

### **1. Highest Revenue Campaign**
Ranks all campaigns by revenue using `RANK()`.

### **2. Top Campaign per Channel**
Ranks campaigns within each channel using `PARTITION BY`.

### **3. Best Conversion Rate**
Calculates conversion rate and ranks campaigns by efficiency.

### **4. Month‑over‑Month Revenue Growth**
Uses `LAG()` to compare revenue with previous campaigns in the same channel.

### **5. Running Total Revenue**
Shows cumulative revenue progression throughout the year.

---

##  Project Structure

```
marketing-analysis/
│
├── marketing_campaign_analysis.sql   # Full SQL analysis
└── README.md                         # Project documentation
```

---

## Tools Used

- PostgreSQL  
- SQL Window Functions  
- Analytical Querying  
- Data Modeling Concepts  

---

##  Author

**Prithvi Raj Soni**  
MS Business Analytics — Montclair State University  
[LinkedIn](https://www.linkedin.com/in/prithvi-raj-soni-business-analytics/) | [GitHub](https://github.com/prajsoni)| 



