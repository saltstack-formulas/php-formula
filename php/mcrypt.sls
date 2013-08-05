include:
  - apt

{% if grains['os']=="Ubuntu" %}

php-mcrypt:
  pkg.installed:
    - name: php5-mcrypt
    - order: 180

{% endif %}
