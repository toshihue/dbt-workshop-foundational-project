with source as (

    select * from {{ source('tpch', 'part_update_dt') }}

),

renamed as (

    select
        p_partkey as part_key,
        p_name as part_name,
        p_mfgr as manufacturer_name,
        p_brand as brand_name,
        p_type as part_type,
        p_size as part_size,
        p_container as container_type,
        p_retailprice as retail_price,
        p_comment as comment,
        update_dt as update_dt
    from source

)

select * from renamed
