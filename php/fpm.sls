include:
  - apt

{% if grains['os']=="Ubuntu" %}

php-fpm:
  pkg.installed:
    - name: php5-fpm
    - order: 175
  service.running:
    - name: php5-fpm
    - enable: True
    - order: 455

{% endif %}
