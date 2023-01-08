include:

{% for role in grains['roles'] %}
   - .{{ role }}
{% endfor %}
