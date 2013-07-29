include:
  - core.apt

{% if grains['os']=="Ubuntu" %}

php5-gd:
  pkg.installed:
    - order: 180

{% endif %}
