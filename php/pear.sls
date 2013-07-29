include:
  - core.apt

{% if grains['os']=="Ubuntu" %}

php-pear:
  pkg.installed:
    - order: 180

{% endif %}
