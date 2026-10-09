{% macro clean_price(column_name) %}
    REPLACE({{ column_name }}, '$')::NUMBER(10,2)
{% endmacro %}