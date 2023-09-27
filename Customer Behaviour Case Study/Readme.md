
# Customer Behavior and Marketing Analysis - Case Study

## Data Source: Kaggle.com

### Background
A retail company is keen on understanding the spending habits of its customers. They have collected data on a sample of customers, including their income, marital status, and the amount they spend on different product categories.

The company uses a pivot table to analyze the data and has found a positive correlation between income and the amount spent on different product categories. This suggests that as income increases, the amount spent on various product categories also increases.

Additionally, the company has identified differences in spending habits between single and married customers. Single customers tend to spend more on wine, fruits, and meat products, while married customers tend to spend more on fish products, sweet products, and gold products.

### Objective
The objective of this analysis is to extract insights into customer behavior that can be used to improve marketing campaigns and product offerings.

### Data Dictionary

**People Attributes**
- `ID`: Customer's unique identifier
- `Year_Birth`: Customer's birth year
- `Education`: Customer's education level
- `Marital_Status`: Customer's marital status
- `Income`: Customer's yearly household income
- `Kidhome`: Number of children in the customer's household
- `Teenhome`: Number of teenagers in the customer's household
- `Dt_Customer`: Date of customer's enrollment with the company
- `Recency`: Number of days since the customer's last purchase
- `Complain`: 1 if the customer complained in the last 2 years, 0 otherwise

**Product Attributes**
- `MntWines`: Amount spent on wine in the last 2 years
- `MntFruits`: Amount spent on fruits in the last 2 years
- `MntMeatProducts`: Amount spent on meat in the last 2 years
- `MntFishProducts`: Amount spent on fish in the last 2 years
- `MntSweetProducts`: Amount spent on sweets in the last 2 years
- `MntGoldProds`: Amount spent on gold in the last 2 years

**Promotion Attributes**
- `NumDealsPurchases`: Number of purchases made with a discount
- `AcceptedCmp1`: 1 if the customer accepted the offer in the 1st campaign, 0 otherwise
- `AcceptedCmp2`: 1 if the customer accepted the offer in the 2nd campaign, 0 otherwise
- `AcceptedCmp3`: 1 if the customer accepted the offer in the 3rd campaign, 0 otherwise
- `AcceptedCmp4`: 1 if the customer accepted the offer in the 4th campaign, 0 otherwise
- `AcceptedCmp5`: 1 if the customer accepted the offer in the 5th campaign, 0 otherwise
- `Response`: 1 if the customer accepted the offer in the last campaign, 0 otherwise

**Place Attributes**
- `NumWebPurchases`: Number of purchases made through the company’s website
- `NumCatalogPurchases`: Number of purchases made using a catalogue
- `NumStorePurchases`: Number of purchases made directly in stores
- `NumWebVisitsMonth`: Number of visits to the company’s website in the last month

### Tailored Analysis

1. How many customers were involved in this marketing campaign?
2. What is the average income of customers?
3. What is the overall average of store purchases?
4. What are the most popular product categories?
5. What platforms do most people use?
6. What campaign was the most successful?
7. What is the customer distribution based on marriage?
8. What is the percentage proportion of customers who complained with those who do not?
9. How does the education level influence the above analysis?

**For Pivot tables and detailed analysis, please refer to the corresponding Excel workbook.**
