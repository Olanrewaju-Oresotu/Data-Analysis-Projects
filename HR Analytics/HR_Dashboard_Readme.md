
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
