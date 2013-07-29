include:
  - core.apt

{% if grains['os']=="Ubuntu" %}

php5-fpm:
  pkg.installed:
    - order: 175
  service.running:
    - enable: True
    - order: 455

{% endif %}
