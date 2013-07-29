include:
  - core.apt

{% if grains['os']=="Ubuntu" %}

php5-mysql:
  pkg.installed:
    - order: 180

{% endif %}
