select *
from {{ ref('daily_weather') }}
limit 10