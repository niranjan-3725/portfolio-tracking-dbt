{% snapshot SNSH_ABC_BANK_EXCHANGE %}
    {{
        config(
            unique_key="ID_HKEY",
            strategy="check",
            check_cols=["ID_HDIFF"],
        )
    }}

    select *
    from {{ ref("STG_ABC_Bank_EXCHANGE") }}

{% endsnapshot %}