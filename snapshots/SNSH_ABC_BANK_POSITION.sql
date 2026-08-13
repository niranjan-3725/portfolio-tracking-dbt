{% snapshot SNSH_ABC_BANK_POSITION %}
{{ 
    config( 
            target_database='PORTFOLIO_TRACKING',
            target_schema='SNAPSHOTS',
            unique_key= 'POSITION_HKEY',
            strategy='check',
            check_cols=['POSITION_HDIFF'],
            invalidate_hard_deletes=True, 
            )
}}

select * from {{ ref('STG_ABC_BANK_POSITION') }} 

{% endsnapshot %}