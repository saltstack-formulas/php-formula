# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Evaluating as `False` by default, using this method since `defaults.yaml` not available in this repo #}
{%- if not salt['config.get']('php').get('warning_messages', {}).get('v1.0.0', {}).get('mute_upcoming', False) %}
php-deprecated-in-v1.0.0-test-succeed:
  test.succeed_without_changes:
    - name: |


        ################################################################################
        #                                                                              #
        #            WARNING: BREAKING CHANGES IN UPCOMING VERSION `v1.0.0`            #
        #                                                                              #
        ################################################################################
        #                                                                              #
        # This formula currently provides two methods for managing PHP; the old method #
        # under `php` and the new method under `php.ng`. In upcoming `v1.0.0`, the old #
        # method will be removed and `php.ng` will be promoted to `php` in its place.  #
        #                                                                              #
        # If you are not in a position to migrate, you will need to pin your repo to   #
        # the final release tag before `v1.0.0`, which is expected to be `v0.40.0`.    #
        #                                                                              #
        # If you are currently using `php.ng`, there is nothing to do until `v1.0.0`   #
        # is released.                                                                 #
        #                                                                              #
        # To migrate from the old `php`, the first step is to convert to `php.ng`,     #
        # before `v1.0.0` is released.                                                 #
        #                                                                              #
        # To prevent this message being displayed again, set the pillar/config value:  #
        #                                                                              #
        # ```                                                                          #
        # php:                                                                         #
        #   warning_messages:                                                          #
        #     v1.0.0:                                                                  #
        #       mute_upcoming: True                                                    #
        # ```                                                                          #
        #                                                                              #
        ################################################################################
{%- endif %}
