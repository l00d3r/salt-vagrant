{%- set client = salt['pillar.get']('grains:client', 'Undefined') %}
{%- set project = salt['pillar.get']('grains:project', 'Undefined') %}
{%- set roles = salt['pillar.get']('grains:roles', 'Undefined') %}
base:
  '*':
    - general.grains
    - general.packages

{% if client != 'Undefined' %}
  'client:{{ client }}':
    {% if salt['state.sls_exists']('clients.{0}'.format(client)) %}

    - clients.{{ client }}

    {% endif %}

    {% if project != 'Undefined' %}
      {% if salt['state.sls_exists']('clients.{0}.{1}'.format(client, project)) %}

    - clients.{{ client }}.{{ project }}

      {% endif %}
    {% endif %}

    {% if roles != 'Undefined' %}
      {% for role in roles %}
        {% if salt['state.sls_exists']('clients.{0}.{1}.{2}'.format(client, project, role)) %}

    - clients.{{ client }}.{{ project }}.{{ role }}

        {% endif %}
      {% endfor %}
    {% endif %}


    - match: grain
{% endif %}
