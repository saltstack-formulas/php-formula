include:
  - apt

{% if grains['os']=="Ubuntu" %}

php-mysql:
  pkg.installed:
    - name: php5-mysql
    - order: 180

{% endif %}
