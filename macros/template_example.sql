{% macro template_example(model) %}
    {% set query %}
        select true as boolean
    {% endset %}
    {% if execute %}
        {% set result = run_query(query).columns[0].values()[0]%}
        {{log('SQL results' ~ result, info=true)}}
        select {{result}} as _is_real
        from {{model}}
    {% endif %}

{% endmacro %}