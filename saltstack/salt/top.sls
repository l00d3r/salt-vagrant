{%- set client = salt['grains.get']('client', 'Undefined') %}
base:
{% if client != 'Undefined' %}
  'client:{{ grains.client }}':
   - clients.{{ grains.client }}
   - ignore_missing: True
   - match: grain
{% endif %}
