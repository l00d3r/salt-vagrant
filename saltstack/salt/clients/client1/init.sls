{%- set project = salt['grains.get']('project', 'Undefined') %}
include:
  - .{{ project }}