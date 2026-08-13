WITH src_data as ( 
    SELECT
        *
        ,'SEED.ABC_Bank_EXCHANGE' as RECORD_SOURCE
    FROM
        {{ source('seeds', 'ABC_Bank_EXCHANGE') }}
),

hashed as ( SELECT 
            concat_ws('|', ID) as ID_HKEY
            , concat_ws('|', ID, NAME ,COUNTRY ,CITY ,ZONE ,DELTA ,OPEN ,CLOSE ,LUNCH ) as ID_HDIFF 
            , * EXCLUDE LOAD_TS 
            , LOAD_TS as LOAD_TS_UTC 
        FROM 
            src_data )

SELECT * FROM hashed