{% from "php/ng/map_ng.jinja" import php with context %}

php-ini:
  file.managed:
    - name: {{ php.lookup.php_ini }}
    - source: salt://php/ng/files/php.ini.jinja
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - context:
      config: {{ php.ini_settings }}