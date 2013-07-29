include:
  - apt

{% if grains['os']=="Ubuntu" %}

php:
  pkg.installed:
    - name: php5
    - order: 175

{% endif %}
