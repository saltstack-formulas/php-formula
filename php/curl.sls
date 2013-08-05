include:
  - apt

{% if grains['os']=="Ubuntu" %}

php-curl:
  pkg.installed:
    - name: php5-curl
    - order: 180

{% endif %}
