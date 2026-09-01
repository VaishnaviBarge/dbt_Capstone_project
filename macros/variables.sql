{% macro learn_variable() %}

{# this is the example of jinja variabe #}
{% set your_name_jinja = "Vaish"%}
{{ log("Hello "~ your_name_jinja, info=True)}}

{# this is the example of dbt variabe #}
{{log("Hello dbt user " ~ var("user_name","NO_USER_NAME_IS_PASSED_2") ~ "!",info=True)}}

{#we can give the var value in command dbt run-operation learn_variable --vars '{user_name: vaish}' #}
{% endmacro %}