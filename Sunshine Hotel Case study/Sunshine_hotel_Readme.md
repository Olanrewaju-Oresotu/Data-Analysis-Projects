
# SUNSHINE RESORT - Case Study Analysis and Dashboard 

## Project Overview

This project involves a comprehensive analysis of the Sunshine Resort's operational data. The objective is to utilize Microsoft Excel's advanced analytical capabilities to uncover insights that can improve customer service, optimize hotel operations, and enhance revenue generation.

**Sunshine Resort** A high-end hotel management company that caters to both leisure and business travellers is looking to improve its customer service by gaining deeper insights into its reservation data. To achieve this, the hotel management team has collected and organized data related to bookings, cancellations, customer preferences, and revenue, as part of their commitment to continuous improvement.

### Objective

The resort aims to gather valuable insights and data-driven recommendations to enhance guest experiences, optimize hotel operations, and boost revenue.

## Data Source and Collection

The dataset for Sunshine Resort was sourced from Kaggle.com, a popular platform for data analytics and machine learning competitions. The data encompasses various aspects of hotel operations, including booking details, customer demographics, length of stay, revenue, and room preferences.

## Data Cleaning and Transformation

Several functions within Excel were employed to clean and process the data:

- **Duplicates Removal**: Ensured that all entries were unique to maintain data integrity.
- **Text Functions**: Used to standardize the text entries, such as TRIM.
- **Date Functions**: Analyzed to extract year, month, and weekday information from arrival_date_year.
- **Logical Functions**: IF statements were used for creating new calculated columns and for cleaning categorical data.
- **Lookup Functions**: VLOOKUP to merge data from different sheets or to match and retrieve data.
- **Pivot Tables**: Created for dynamic data summarization, which was crucial for the analysis of booking trends, revenue, ADR, and guest demographics.


### Data Dictionary

To better understand the dataset, let's review the key attributes:

- **hotel**: Type of hotel (e.g., Resort Hotel).
- **is_canceled**: Binary variable indicating if the reservation was canceled (0 = Not canceled, 1 = Canceled).
- **lead_time**: Number of days between the booking date and the arrival date.
- **arrival_date_year**: Year of arrival date.
- **stays_in_weekend_nights**: Number of weekend nights (Saturday or Sunday) the guest stayed.
- **stays_in_week_nights**: Number of weeknights (Monday to Friday) the guest stayed.
- **adults**: Number of adults included in the reservation.
- **children**: Number of children included in the reservation.
- **babies**: Number of babies included in the reservation.
- **meal**: Type of meal booked (e.g., Bed and Breakfast).
- **country**: Country of origin.
- **market_segment**: Market segment designation (e.g., Direct).
- **distribution_channel**: Distribution channel designation (e.g., Direct).
- **is_repeated_guest**: Binary variable indicating if the guest is a repeated guest (0 = Not repeated guest, 1 = Repeated guest).
- **previous_cancellations**: Number of previous bookings that were canceled.
- **previous_bookings_not_canceled**: Number of previous bookings that were not canceled.
- **reserved_room_type**: Code of the room type reserved.
- **assigned_room_type**: Code of the room type assigned.
- **booking_changes**: Number of changes made to the booking.
- **deposit_type**: Type of deposit made for the reservation.
- **agent**: ID of the travel agency making the booking.
- **company**: ID of the company/entity making the booking.
- **days_in_waiting_list**: Number of days the booking was on the waiting list.
- **customer_type**: Type of booking (e.g., Transient).
- **adr**: Average daily rate (price per room).
- **required_car_parking_spaces**: Number of car parking spaces required by the guest.
- **total_of_special_requests**: Number of special requests made by the guest.
- **reservation_status**: Reservation status (e.g., Check-Out).
- **reservation_status_date**: Date when the reservation status was set.


## Data Analysis Using Pivot Tables

The data analysis is performed in Excel, utilizing Pivot Tables to analyze and summarize data to derive insights. These insights include the average length of stay, number of bookings per week and month, ADR for various booking sources, and room preference patterns derived from the tailored analysis.


### Tailored Analysis

In this case study, tailored analysis is performed to answer specific questions and provide valuable insights from the Sunshine Resort dataset:

1. **How many customers are in the hotel resort database?**
2. **What is the average length of stay for guests at Sunshine Resort for weekend and weekday nights?**
3. **What is the distribution of guests by country?**
4. **What is the average ADR for guests who booked through a corporate travel agent?**
5. **Which months experience the highest number of bookings?**
6. **Which weeks experience the highest number of bookings?**
7. **Which room types are most frequently reserved by guests at Sunshine Resort?**
8. **How often do guests make changes to their bookings, and what types of changes are most common?**
9. **Do guests who make more changes tend to have longer or shorter stays?**
10. **What are the preferred types of deposits usually made?**
11. **How many visitors are repeated guests?**
12. **Filter Dashboard by hotel column and/or customer type**

The detailed analysis and Reporting Dashboard in the  Sunshine Resort dataset is used to provide actionable recommendations to help the hotel management team make informed decisions based on the data insights/findings.


## Dashboard Creation

The dashboard provides a visual representation of key findings from the data:

1. **Total Guests**: 119,390 guests are registered in the Sunshine Resort database.
2. **Length of Stay**: Guests stay on average 3 nights on weekdays and 1 night on weekends.
3. **Guest Demographics**: The majority of guests come from Portugal, followed by the UK and France.
4. **ADR Analysis**: Corporate agents offer the second-lowest ADR on average at £69.
5. **Booking Trends**: August is the peak month for arrivals, while the 7th and 53rd weeks are the peak weeks for arrivals.
6. **Room Preferences**: Room Types A, D, and E have the highest number of reservations.
7. **Booking Changes**: Insights on how often and what type of changes are made could be extrapolated by further analysis of the booking changes data.
8. **Deposit Preferences**: Reservations are more frequently completed without a deposit than non-refundable or refundable deposits.
9. **Repeated Guests**: Only 3% of the guests are repeated, suggesting room for improvement in customer retention.

## Recommendations and Conclusions

- **Optimization of Operations**: To better cater to the needs during peak times and develop strategies for off-peak seasons.
- **Targeted Marketing**: Develop culturally tailored experiences and partnerships in countries with the highest guest demographics.
- **Pricing Strategy**: Evaluate the pricing structure, especially corporate rates, to ensure profitability.
- **Customer Retention**: Design special packages and incentives to increase the percentage of repeat guests.

## Limitations

- **Scope of Data**: Data may not represent the complete picture if not all reservations are captured.
- **External Factors**: Seasonal or external factors that could influence bookings and ADR are not accounted for.
- **Dynamic Pricing**: ADR does not account for dynamic pricing strategies over time or during special events.

The insights gained through this analysis are crucial for strategic decision-making and have the potential to significantly impact Sunshine Resort's business performance. The use of Excel for data cleaning, analysis, and dashboard creation demonstrates the tool's robust capabilities in handling and interpreting complex datasets.
