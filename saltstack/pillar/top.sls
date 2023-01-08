{%- set client = salt['grains.get']('client', 'Undefined') %}
base:
  '*':
    - schedule
    - common
  '{{grains["id"]}}':
     - hosts.{{ grains["id"] | replace(".", "_") }}
     - ignore_missing: True

{% if client != 'Undefined' %}
  'client:{{ grains.client }}':
     - clients.{{ grains.client }}
#   - clients.{{ grains.client }}.{{ grains.host }}
#     - ignore_missing: True
     - match: grain
{% endif %}
