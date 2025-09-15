with cte as (
select *
from {{ source('us_crime', 'URBAN_CRIME_INCIDENT_LOG') }}
where CITY = 'New York' and OFFENSE_CATEGORY in ('Theft', 'Driving Under The Influence')
)
select
OFFENSE_CATEGORY,
{{get_season('DATE')}} AS SEASON,
{{day_type('DATE')}} AS DAY_TYPE,
count(*) as NUMBER_OF_OCCURRENCES
from cte 
group by 1, 2, 3
order by 4 desc