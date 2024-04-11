
# Enhanced HR Performance and Employee Distribution Analysis Dashboard 

## Project Overview

This project involves an extensive examination of Human Resources data collected from the year 2000 to 2020. The data includes over 22,000 rows, which will provide insights into the operations of a large-scale organization. The project begins by importing data, followed by data preparation, cleaning, transformation, and analysis using SQL Server. Finally, the project concludes with advanced data visualization using Power BI. This multifaceted approach will enable a thorough exploration of various HR metrics that can have a significant impact on the strategic management decisions of the organization.

## Data Utilized

**Data Source:**
- The project leverages a dataset titled "HR Data," containing over 22,000 rows of detailed employee records covering a period from 2000 to 2020.

**Data Preparation and Analysis:**
- **SQL Server:** This platform was utilized to import, prepare, clean, transform, and analyze data by writing relevant queries. The main tasks involved creating and querying the HR database, importing data from CSV format to table in SQL server, performing data preparation and cleaning operations such as renaming columns, checking for duplicates, converting birthdate and termination date data types, transformation by adding calculated fields for new metrics for analysis such as employee age, age group and tenure, and executing relevant queries to uncover insights into KPIs and workforce measures. Each result of the queries was saved in a CSV file format for visualization with Power BI.

**Data Visualization:**
- **Power BI:** The analysis results were imported and presented in a dynamic and interactive dashboard using Power BI, displaying primary and secondary metrics with robustness and rigour.

## Key Questions and Insight Summary

The project employed a series of SQL queries to answer critical HR questions, yielding insights into employee demographics, job distribution, tenure, and turnover rates, among others. These questions guided the analysis:


    What is the gender breakdown of employees in the company?
    What is the race/ethnicity breakdown of employees in the company?
    What is the age distribution of employees in the company?
    How many employees work at headquarters versus remote locations?
    What is the average length of employment for employees who have been terminated?
    How does the gender distribution vary across departments and job titles?
    What is the distribution of job titles across the company?
    Which department has the highest turnover rate?
    What is the distribution of employees across locations by state?
    How has the company's employee count changed over time based on hire and term dates?
    What is the tenure distribution for each department?


**Answers to the Key Questions**


# HR Database Analysis

This document outlines the SQL queries used for setting up, cleaning, and analyzing an HR database. The database, named `HR`, contains employee data that is subjected to various data cleaning techniques before analysis. The analysis covers several Key Performance Indicators (KPIs) and demographic insights.

## Getting Started
### Pre-requisites
SQL Server Management Studio (SSMS) or any SQL database management tool.
Access to HR database with read permissions.
Setting up the Environment
Create the HR database if it doesn't already exist:

### Creating Database

```sql
CREATE DATABASE HR;
GO
USE HR;
```

## Data cleaning and Preparation

### Viewing Data Sample

To verify and preview the data importation:

```sql
-- Import Data Table (for checking)
SELECT TOP 1000 *
FROM hr_data;
```

### Data Cleaning

1. Rename Columns:

```sql
SP_RENAME 'hr_data.id', 'emp_id', 'column';
```

2. Convert `termdate` into DateTime Format:

```sql
UPDATE hr_data
SET termdate = FORMAT(CONVERT(DATETIME, LEFT(termdate, 19), 120), 'yyyy-mm-dd');
```

3. Add and Populate `new_termdate` Column:

```sql
ALTER TABLE hr_data
ADD new_termdate DATE;

UPDATE hr_data
SET termdate = TRY_CONVERT(DATETIME, termdate)
WHERE termdate IS NOT NULL AND ISDATE(termdate) = 0;

UPDATE hr_data
SET new_termdate = CASE 
                    WHEN termdate IS NOT NULL THEN CAST(termdate AS DATETIME)
                    ELSE NULL
                  END;
```

4. Create and Calculate `age` Column:

```sql
ALTER TABLE hr_data
ADD age INT;

UPDATE hr_data
SET age = DATEDIFF(YEAR, birthdate, GETDATE());
```

## Analysis

### Primary KPIs Analysis
This section focuses on core metrics that provide an overview of the workforce status.

1. Number of Terminated Employees:

```sql
SELECT COUNT(*) AS terminated_employees
FROM hr_data
WHERE new_termdate IS NOT NULL AND new_termdate <= GETDATE();
```

2. Number of Working Employees:

```sql
SELECT COUNT(*) AS Working_Employees
FROM hr_data
WHERE new_termdate IS NULL;
```

3.  Number of Job Titles

```sql
SELECT COUNT(DISTINCT jobtitle) AS Count
FROM hr_data;
```

4.  Number of Cities

```sql
SELECT COUNT(DISTINCT location_city) AS Number_of_cities
FROM hr_data;
```

5.  Number of States

```sql
SELECT COUNT(DISTINCT location_state) AS Number_of_states
FROM hr_data;
```

6.  Number of Departments

```sql
SELECT COUNT(DISTINCT department) AS Number_of_departments
FROM hr_data;
```

7.  Year since first hire

```sql
SELECT DATEDIFF(YEAR, MIN(hire_date), GETDATE()) AS Years_since_first_hire
FROM hr_data;
```

### Secondary KPIs Analysis
The following queries delve into detailed metrics for a deeper understanding of the workforce dynamics and extract specific insights, informing strategies for diversity, inclusion, and organizational growth.

#### Workforce Composition
This section delves into nuanced metrics for an in-depth comprehension of workforce dynamics.

1. Age Distribution in the Organisation:

```sql
SELECT MIN(age) AS Youngest, MAX(age) AS Oldest
FROM hr_data
WHERE new_termdate IS NOT NULL;
```

2. Age group distribution:

```sql
SELECT age_group, COUNT(*) AS Age_count
FROM
(SELECT CASE
WHEN age BETWEEN 22 AND 30 THEN '22-30'
WHEN age BETWEEN 31 AND 40 THEN '31-40'
WHEN age BETWEEN 41 AND 50 THEN '41-50'
ELSE '50+'
END AS age_group
FROM hr_data
WHERE new_termdate IS NULL) AS SUBQUERY
GROUP BY age_group
ORDER BY age_group ASC;
```

3. Employee Distribution of Age by Gender:

```sql
SELECT age_group, gender, COUNT(*) AS Age_group_count
FROM
(SELECT CASE
WHEN age BETWEEN 22 AND 30 THEN '22-30'
WHEN age BETWEEN 31 AND 40 THEN '31-40'
WHEN age BETWEEN 41 AND 50 THEN '41-50'
ELSE '50+'
END AS age_group, gender
FROM hr_data
WHERE new_termdate IS NULL) AS SUBQUERY
GROUP BY age_group, gender
ORDER BY age_group, gender;;
```

4. Employee Gender Breakdown:

```sql
SELECT gender, COUNT(emp_id) AS gender_count
FROM hr_data
WHERE new_termdate IS NULL
GROUP BY gender
ORDER BY gender_count DESC;
```

5. Employee Gender Variation Across Departments and Job Titles

```sql
-- Across Departments
SELECT department, gender, COUNT(gender) AS gender_count
FROM hr_data
WHERE new_termdate IS NULL
GROUP BY department, gender
ORDER BY gender_count DESC;

-- Across Job Titles
SELECT department, jobtitle, gender, COUNT(emp_id) AS gender_count
FROM hr_data
WHERE new_termdate IS NULL
GROUP BY department, jobtitle, gender
ORDER BY gender_count DESC;
```

6. Employee Race Distribution in the Company

```sql
SELECT race, COUNT(emp_id) AS race_count
FROM hr_data
WHERE new_termdate IS NULL
GROUP BY race
ORDER BY race_count DESC;
```

7. Employee Distribution in Each Department

```sql
SELECT department, COUNT(emp_id) AS Total_Emp
FROM hr_data
GROUP BY department
ORDER BY Total_Emp DESC;
```

8. Employee Average Length of Employment/Tenure

```sql
SELECT AVG(DATEDIFF(YEAR, hire_date, new_termdate)) AS Tenure
FROM hr_data
WHERE new_termdate IS NOT NULL AND new_termdate <= GETDATE();
```

9. Average Tenure Distribution for Each Department

```sql
SELECT department, AVG(DATEDIFF(YEAR, hire_date, new_termdate)) AS Tenure
FROM hr_data
WHERE new_termdate IS NOT NULL AND new_termdate <= GETDATE()
GROUP BY department
ORDER BY Tenure DESC;
```

10. Department with Highest Turnover/Attrition Rate

```sql
SELECT department, COUNT(emp_id) AS Total_count,
SUM(CASE WHEN new_termdate IS NOT NULL AND new_termdate <= GETDATE() THEN 1 ELSE 0 END) AS Terminated_count,
ROUND((CAST(SUM(CASE WHEN new_termdate IS NOT NULL AND new_termdate <= GETDATE() THEN 1 ELSE 0 END) AS float) / COUNT(emp_id)) * 100, 2) AS Attrition_rate
FROM hr_data
GROUP BY department
ORDER BY Attrition_rate DESC;
```

11. Work location Distribution 

```sql
SELECT location, COUNT(emp_id) Location_count
FROM hr_data
WHERE new_termdate IS NULL
GROUP BY location;
```

12. Percentage Distribution of Employee Work Location

```sql
SELECT Work_location, COUNT(*) AS counts,
ROUND(CAST((COUNT(*) * 100) AS float) / (SELECT COUNT(*) FROM hr_data WHERE new_termdate IS NULL), 2) AS Percentage
FROM (SELECT CASE
WHEN location = 'Headquarters' THEN 'Headquarters'
ELSE 'Remote'
END AS Work_location
FROM hr_data
WHERE new_termdate IS NULL) AS subquery
GROUP BY Work_location;
```

## Conclusion
The following Insights were generated as results through the visualization of the query results 

1. **What is the gender breakdown of employees in the company?:**
   - The dashboard indicates that the company has a relatively even distribution of employees across genders, with **male** employees forming the majority, followed by **female** employees, and employees with **non-conforming** gender being the smallest group. This suggests that the company has a diverse workforce, but also indicates that there is room for improvement in terms of gender balance.

2. **What is the race/ethnicity breakdown of employees in the company?:**
   - A significant diversity in race and ethnicity is noted, with the majority being **White**, followed by individuals identifying with **two or more** races, then **black or black Americans** and Native **Hawaiian or Other Pacific Islander**. This suggests a multicultural workforce, though efforts to increase representation from underrepresented groups could be beneficial.

3. **Age Distribution:**
   - The majority of employees fall within the 50+ age group, followed by those in the 41-50 and 31-40 age brackets. This indicates a mature workforce with extensive experience and knowledge, potentially pointing to the need for succession planning and attracting younger talent.

4. **Headquarters vs. Remote Work Locations:**
   - A substantial 75.2% of employees work from the headquarters, with the remainder working remotely. This distribution underscores the company's traditional office-centric culture but also its adaptability to flexible work arrangements.

5. **Average Tenure of Terminated Employees:**
   - The average tenure of employees who have been terminated stands at 7 years, reflecting a relatively long period of employment before termination. This suggests that the company benefits from prolonged employee contributions but may also need to examine the factors contributing to eventual separations.

6. **Gender Distribution Across Departments and Job Titles:**
   - Gender distribution varies significantly across departments and job titles, with some areas showing greater gender diversity than others. This variance highlights areas where gender inclusivity can be improved.

7. **Job Title Distribution:**
   - A wide range of job titles is present, with Research Consultant II being the most populous. This diversity in roles supports a broad spectrum of operational and strategic functions within the company.

8. **Department with the Highest Turnover Rate:**
   - The Auditing department has the highest turnover rate, suggesting potential issues with job satisfaction or career advancement opportunities within this department.

9. **Employee Distribution Across Locations by State:**
   - Ohio has the highest number of employees, indicating a significant geographical concentration of the workforce. This could influence recruitment strategies and operational decisions.

10. **Company's Employee Count Change Over Time:**
    - The analysis of hire and term dates reveals a stable increase in employee count over time, with a consistently high hiring rate and a relatively low termination rate, indicating effective workforce retention practices.

11. **Tenure Distribution by Department:**
    - Tenure varies by department, with some departments showing longer average tenures than others. This could reflect on departmental management practices and employee satisfaction levels.


## Recommendations for Each Chart in the HR Report

**Gender and Race/Ethnicity Distribution:**
- **Recommendation:** Implement targeted diversity and inclusion initiatives to balance gender representation and increase the diversity of underrepresented groups.

**Age and Tenure Distribution:**
- **Recommendation:** Develop programs for succession planning and attracting younger talent to ensure knowledge transfer and sustain the organization's future growth.

**Departmental Turnover and Job Title Distribution:**
- **Recommendation:** Investigate departments with high turnover rates to identify and address underlying issues. Additionally, evaluate job title distributions to ensure alignment with organizational needs and employee career progression.

**Location-Based Employee Distribution:**
- **Recommendation:** Assess the impact of geographic concentration on recruitment and operational strategies, considering expansion or diversification of workforce locations to tap into wider talent pools.

**Work Location Preferences (Headquarters vs. Remote):**
- **Recommendation:** Explore flexible work arrangements further to accommodate employee preferences, potentially enhancing job satisfaction and retention.

In summary, the dashboard provides a wealth of insights that can guide strategic HR initiatives. By addressing the identified areas for improvement, the organization can enhance its workforce management strategies, fostering a more diverse, inclusive, and satisfied workforce.
