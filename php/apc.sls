include:
  - core.apt

{% if grains['os']=="Ubuntu" %}

php-apc:
  pkg.installed:
    - order: 180

{% endif %}
