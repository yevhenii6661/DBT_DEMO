with cte as (
select
  to_timestamp(STARTED_AT) as STARTED_AT,
  DATE(to_timestamp(STARTED_AT)) as DATE_STARTED_AT,
  HOUR(to_timestamp(STARTED_AT)) as HOUR_STARTED_AT,

{{day_type('STARTED_AT')}} AS DAY_TYPE,
{{get_season('STARTED_AT')}} AS STATION_OF_YEAR

from {{ source('demo', 'bike') }}
where STARTED_AT != 'started_at'
)
select *
from cte