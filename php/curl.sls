include:
  - apt

{% if grains['os']=="Ubuntu" %}

php5-curl:
  pkg.installed:
    - order: 180

{% endif %}
