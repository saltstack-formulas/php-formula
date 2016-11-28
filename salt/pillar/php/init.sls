php:
  use_ppa: True
  ppa_name: 'ondrej/php'
  version: '5.6'
  ng:
    version: '7.0'
    fpm:
      service:
        enabled: True
        opts:
          reload: True
      config:
        ini:
          opts:
            recurse: True
          settings:
            PHP:
              cgi.fix_pathinfo: 0
              expose_php: 'Off'
              memory_limit: '2048M'
              error_reporting: 'E_ALL & ~E_NOTICE & ~E_DEPRECATED & ~E_STRICT & ~E_USER_DEPRECATED'
              always_populate_raw_post_data: '-1'
            Date:
              date.timezone: 'America/Los_Angeles'
        conf:
          opts:
            recurse: True
      pools:
        'www.conf':
          enabled: True
          opts:
             replace: True
          settings:
            www:
              listen.mode: 0660
              pm: dynamic
              pm.max_children: 5
              pm.start_servers: 2
              pm.min_spare_servers: 1
              pm.max_spare_servers: 3
              clear_env: 'no'
              chdir: '/'
