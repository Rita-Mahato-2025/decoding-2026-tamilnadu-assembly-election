INSERT INTO dim_constituency (

    constituency_number,
    constituency_name

)

SELECT DISTINCT

    constituency_number,
    constituency_name

FROM stg_tn_2026_results;