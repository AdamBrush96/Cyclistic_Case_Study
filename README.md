# Google Data Analytics Capstone - Cyclistic Case Study

## Introduction:

In this case study I will be acting as a junior data analyst for the fictional company Cyclistic, a bike-share company in Chicago with more than 5,800 bikes and 600 docking stations across the city. The company offers single-ride or full-day passes for casual riders and annual memberships for members. The director of marketing believes that the company’s future success depends on maximizing the number of annual memberships as they are the most profitable. She believes there’s a greater chance of converting casual riders to members than attracting new users to become members. Therefore, my team is looking to understand how casual riders and members use the bikes differently to help us design a marketing strategy to convert casual riders into members.

I have been tasked with answering the following question:

  How do annual members and casual riders use Cyclistic bikes differently?

And with the following deliverables:

1. A clear statement of the business task
2. A description of all data sources used
3. Documentation of any cleaning or manipulation of data
4. A summary of my analysis
5. Supporting visualizations and key findings
6. My top three recommendations based on my analysis

## A Clear Statement of the Business Task:

Determine how annual members and casual riders each use Cyclistic in order to gather information for a marketing campaign to convert casual riders into annual members.

## A Description of All Data Sources Used:

I will be using Cyclistic’s historical data from January 2022 to December 2022 (found here: https://divvy-tripdata.s3.amazonaws.com/index.html). The data has been made available by Motivate International Inc. under this license (https://divvybikes.com/data-license-agreement). 

The data sets contain information about every ride taken in each month of 2022, including ride ID, bike type, start time, end time, start station, end station, start location, end location, and whether the rider was a member or not.

Please note that since this is a private data set made publicly available, some information has been removed, specifically any personally identifiable data about the riders. This means we won’t be able to see if any riders used day passes on multiple occasions or gather any information on the demographics of members versus casual riders.

## Documentation of any cleaning or manipulation of data: 

For all data cleaning and manipulation I will be using Google’s BigQuery, a serverless data warehouse that supports querying with SQL. Each step below was completed with a SQL query. Please see Combining_and_Cleaning.sql for the exact SQL code used. To combine, clean, and manipulate the data and make it useable I followed these steps:
* The data was separated into monthly data sets so I first had to combine all 12 sets into one large data set.
* I checked the data set for duplicates by counting the distinct values in the ride_id column and making sure the result matched the total rows in the data set. There were no duplicate rides. 
* I checked to ensure all the ride IDs were 16 characters to see if there were any errors in the data set. There were none.
* I checked each column for null values and found over 1 million between the start and end station names and IDs.
* I created a new table, dropping all rows with null values (about 1.3 million rows) as they would interfere with our analysis and would still leave us with over 4 million rows of data.
* I used my new table to add a column for ride length which would show the duration of each ride in minutes.
* Finally, I added two more columns to track the day of the week and the month the ride was taken in. In this step I also dropped any rides that were under a minute or over 600 minutes (10 hours) as they were likely to be mistakes either by the system or the rider and may skew the data.

## A summary of my analysis:

Now that I have a clean table with more relevant columns, I can begin to analyze the data and see how casual riders and members use the service differently. I hypothesized that members were likely using the bikes to commute while casual members were using them for recreation. To test this theory, I performed the following analysis with the queries listed at the end of this document in the Analysis section:
* I found the average number of rides casual riders and members were taking by time of day, day of the week, and month.
* I found the average duration of each group's rides by time of day, day of week, and month.
* I found the total number of rides started and ended at each station by each group.

## Supporting visualizations and key findings: 

The above analysis led to some insights that would be much better explained by visuals. I moved the data created by those queries to Tableau and created the following visualizations to more clearly identify any trends present. First, we see the number of trips each group took by time of day, day of the week, and month:
![image](https://github.com/AdamBrush96/Cyclistic_Case_Study/assets/147767594/999c9145-95e7-4b4f-b78e-14dd7d26986d)
From this data we can see that members use the bikes more often than casual users and have spikes in use from 6 AM to 9 AM and 4 PM to 7 PM. Members also use the bikes Monday through Friday and dip in use on the weekends. Casual riders tend to use them more as the day goes on until about 5 PM and their usage spikes on the weekends. Both groups see a notable downturn in use in the colder months. These observations point towards members using the bikes to commute while casual riders are using the bikes for recreation.

Next, we can look at how long each groups rides typically last:

![image](https://github.com/AdamBrush96/Cyclistic_Case_Study/assets/147767594/48bef11c-2d3a-42e9-a65f-c5fc891074ad)

As we can see from this data, although the members use the bikes more often, their rides are consistently shorter than those the casual riders take. They also remain about the same length in the winter while the casual riders' trips drop off in length in the winter months and peak in the spring and summer. This combined with the casual riders longer ride durations on the weekend suggests that casual riders are using the bikes for recreation in the nice weather and weekends.

Finally, we can look at the start and end locations most commonly used by each group:
![image](https://github.com/AdamBrush96/Cyclistic_Case_Study/assets/147767594/9c3d3dea-08d1-421c-93ce-b40eefbc6465)
![image](https://github.com/AdamBrush96/Cyclistic_Case_Study/assets/147767594/c336aab4-0c33-4219-9606-314cb7ddd8a2)
We can tell from this map that the casual riders tend to start and end near recreational areas like museums, aquariums, parks, and beaches while members have a much more spread out usage, often going deep into residential areas. This shows that they are likely using the bikes to commute to and from their homes. Members also often go to and from the University of Illinois at Chicago, suggesting that students and faculty are using the bikes to get to and from school each day. These observations once again confirm the hypothesis that members are using the bikes to commute while casual riders are using them for recreation mostly.

## My top three recommendations based on my analysis:

From my analysis there are a few conclusions we can draw. Members are using the bikes for commuting while the casual riders are using them for recreation, the casual riders are much more likely to use the bikes in the warmer months, and the casual riders typically use the bikes near high tourist traffic destinations.

Based on these observations I have the following recommendations:

1. Promote the use of the bikes for more than just recreation. Create an ad campaign designed to show the costs of commuting via other methods versus the costs of an annual membership. You can also mention the health benefits of biking to and from work, the grocery store, school, etc.
2. Some riders may not be interested in using the bikes in the winter regardless of the commuting benefits so a “Warm Weather Pass” would be a great option to encourage the casual riders to use the bikes more. This could be a 6 month membership from April to September for a cheaper price than the annual membership.
3. The advertisements should be posted at the highest traffic areas for casual riders. This means museums, parks, beaches, and any other tourist areas. This gives you the best chance of your advertising being seen by casual users. Additionally, posting these in the spring and summer gives you an even better chance of being seen by casual members.

