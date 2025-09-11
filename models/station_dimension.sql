WITH BIKE as (

select
distinct
START_STATIO_ID as station_id,
start_station_name as station_name,
START_LAT as station_lat,
START_LNG as start_station_lng

from {{ source('demo','bike') }}

where RIDE_ID != 'ride_id'

)

select
*
from BIKE