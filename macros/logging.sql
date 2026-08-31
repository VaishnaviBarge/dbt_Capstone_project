{% macro learn_logging()%}
    {{ log("Call your mom !", info=True) }}
   {# -- {{ log("Call your didi !", info=True) }} -- is a SQL comment, not a Jinja comment dbt/Fusion processes Jinja before SQL comments are applied. #}
   {# therefore we use jinja comment #}
{% endmacro %}