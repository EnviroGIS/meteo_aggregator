# meteo_aggregator
The main goal is to make a code that obtain a weather info from the global weather web-services and convert it to ready-for-analysis output. For biologists, ecologists, geographers, agriculturers etc.
Scripts for aggregation data from Weather archive (corrently work only with http://rp5.ua/Weather_in_the_world).

http://rp5.ua/ is a web service provides weather forecasts for 500'000 locations, as well as observational data, reported from 8'400 SYNOP weather stations and 5'200 METAR weather stations (see http://rp5.ua/docs/about/en for more info). But for default anyone can upload data from rp5.ua as archived XLS or CSV files which contains a bulk of unnecessary information and cann't be analysed immediately. 

daily_aggregator.R (written by Oleh Prylutskyi aka strobilurus) is an R script allows transform .csv file obtained from http://rp5.ua/ to R-dataframe with daily output: mean, max or min temprerature, mean station pressure, air humidity, sum of rainfall etc. Finally it can be export as CSV which contains only numerical variables ready to further processing using any analytical software.

flashback.py (written by Mykola Kozyr) is a Python script which uses for input the CSV file with weather daily aggregation obtained from the previous step (only one variables) and output the retrospective summary (summ and average for a previous days) for each day.
