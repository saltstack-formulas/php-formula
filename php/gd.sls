include:
  - apt

{% if grains['os']=="Ubuntu" %}

php-gd:
  pkg.installed:
    - name: php5-gd
    - order: 180

{% endif %}
