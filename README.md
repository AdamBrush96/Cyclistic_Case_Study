# Google Data Analytics Capstone - Cyclistic Case Study

## Introduction:

In this case study I will be acting as a junior data analyst for the fictional company Cyclistic, a bike-share company in Chicago with more than 5,800 bikes and 600 docking stations across the city. The company offers single-ride or full-day passes for casual riders and annual memberships for members. The director of marketing believes that the company’s future success depends on maximizing the number of annual memberships as they are the most profitable. She believes there’s a greater chance of converting casual riders to members than attracting new users to become members. Therefore, my team is looking to understand how casual riders and members use the bikes differently to help us design a marketing strategy to convert casual riders into members.

I have been tasked with answering the following question:

  How do annual members and casual riders use Cyclistic bikes differently?

And with the following deliverables:

	1. A clear statement of the business task
  2. A description of all data sources used
  3. Documentation of any cleaning or manipulation of data
  4. A summary of your analysis
  5. Supporting visualizations and key findings
  6. Your top three recommendations based on your analysis

## A Clear Statement of the Business Task:

Determine how annual members and casual riders each use Cyclistic in order to gather information for a marketing campaign to convert casual riders into annual members.

## A Description of All Data Sources Used:

I will be using Cyclistic’s historical data from January 2022 to December 2022 (found here: https://divvy-tripdata.s3.amazonaws.com/index.html). The data has been made available by Motivate International Inc. under this license (https://divvybikes.com/data-license-agreement). 

The data sets contain information about every ride taken in each month of 2022, including ride ID, bike type, start time, end time, start station, end station, start location, end location, and whether the rider was a member or not.

Please note that since this is a private data set made publicly available, some information has been removed, specifically any personally identifiable data about the riders. This means we won’t be able to see if any riders used day passes on multiple occasions or gather any information on the demographics of members versus casual riders.

## Documentation of any cleaning or manipulation of data: 

For all data cleaning and manipulation I will be using Google’s BigQuery, a serverless data warehouse that supports querying with SQL. Each step below was completed with a SQL query. Please see the end of this document for the exact SQL code used. To combine, clean, and manipulate the data and make it useable I followed these steps:
* The data was separated into monthly data sets so I first had to combine all 12 sets into one large data set.
* I checked the data set for duplicates by counting the distinct values in the ride_id column and making sure the result matched the total rows in the data set. There were no duplicate rides. 
* I checked to ensure all the ride IDs were 16 characters to see if there were any errors in the data set. There were none.
* I checked each column for null values and found over 1 million between the start and end station names and IDs.
* I created a new table, dropping all rows with null values (about 1.3 million rows) as they would interfere with our analysis and would still leave us with over 4 million rows of data.
* I used my new table to add a column for ride length which would show the duration of each ride in minutes.
* Finally, I added two more columns to track the day of the week and the month the ride was taken in. In this step I also dropped any rides that were under a minute or over 600 minutes (10 hours) as they were likely to be mistakes either by the system or the rider and may skew the data.






## A summary of your analysis:

Now that I have a clean table with more relevant columns, I can begin to analyze the data and see how casual riders and members use the service differently. I hypothesized that members were likely using the bikes to commute while casual members were using them for recreation. To test this theory, I performed the following analysis with the queries listed at the end of this document in the Analysis section:
* I found the average number of rides casual riders and members were taking by time of day, day of the week, and month.
* I found the average duration of each group's rides by time of day, day of week, and month.
* I found the total number of rides started and ended at each station by each group.
