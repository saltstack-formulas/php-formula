# Create upstart service for multiple fpm configs
{% from "php/ng/map.jinja" import php with context %}


# Simple path concatenation.
{% macro path_join(file, root) -%}
  {{ root ~ '/' ~ file }}
{%- endmacro %}


{% for pool, config in php.lookup.multi_fpm.iteritems() %}
{% if pool == 'defaults' %}{% continue %}{% endif %}

{% set state = config.service ~ '_systemd_unit' %}
{% set name = '/etc/systemd/system/' ~ config.service ~ '.service' %}
{% set conf_path = path_join(pool, php.lookup.multi_fpm.defaults.conf) %}

{{ state }}:
  file.managed:
    - name: {{ name }}
    - source: salt://php/ng/files/systemd.service
    - template: jinja
    - context:
        fpm_conf: {{ conf_path }}
        pid: {{ config.settings.global.pid }}
  module.run:
    - name: service.systemctl_reload
    - onchanges:
      - file: {{ state }}

{% set service_status = config.service ~ '_running' %}
{{ service_status }}:
  service.running:
    - name: {{ config.service }}
    - watch:
      - module: {{ state }}
{% endfor %}
