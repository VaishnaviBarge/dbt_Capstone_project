import holidays
def model(dbt, session):
    dbt.config(
        materialized="table",
        packages=["holidays","snowflake-connector-python[pandas]"]
    )

    germany_holidays = holidays.Germany()

    df = dbt.ref("date_spine").to_pandas()

    df["IS_HOLIDAY"] = df["DATE_DAY"].apply( lambda date: date in germany_holidays )

    return df