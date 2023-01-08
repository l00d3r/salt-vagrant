{%- set grains = salt['pillar.get']('grains', 'Undefined') %}
{% if grains != 'Undefined' %}
{% for grain, value in grains.items() %}
{{ grain }}:
  grains.present:
    - value: {{ value }}
{% endfor %}
{% endif %}