## Overview

This is a major update to the `php-formula` that has been needed since the release of the updated `ondrej/php` PPA formula. When updating this formula, I attempted to keep much of the existing logic intact, while allowing for the new structure introduced by the PPA.

## Issues Solved

 - Issue 108 -> https://github.com/saltstack-formulas/php-formula/issues/108
   - Defaults for versions are now set so that the states `php.ng.cli.ini` and `php.ng.apache2.ini` work provided you run the parent SLS.

 - Issue 93 -> https://github.com/saltstack-formulas/php-formula/issues/93
 - Issue 92 -> https://github.com/saltstack-formulas/php-formula/issues/92
 - Issue 90 -> https://github.com/saltstack-formulas/php-formula/issues/90
   - Most of the changes solve these issues with versioning.

## Changes
 - Changed the `map.jinja` files to use the following decision logic centered around the PPA, and the specific version named in the Pillar file:

>     # If OS is Ubuntu (PPA only supports Ubuntu)
>       # If the user wants to use the PPA
>         # If the Ubuntu version is 16.04 or greater
>           # Use >= 16.04 PPA map
>         # Else
>           # Use < 16.04 PPA map
>         # EndIf
>       # Else
>         # If the Ubuntu version is 16.04 or greater
>           # Use the >= 16.04 native OS package map
>         # Else
>           # Use the < 16.04 native OS package map
>         # EndIf
>       # EndIf
>     # Else
>       # Use other OS package map
>     # EndIf

 - Updated `suhosin` states to compile from and use corresponding Git repositories (PHP 5.X or 7.X)
 - Updated `mongo` states to compile from PECL (needed build packages and corresponding `phpenmod` commands)
 - Updated all regular `php` states to include the main `php.init.sls`
 - Updated the `php.ng.composer` state to download from Composer website just as the `php.composer` state does
 - Removed `php.ng.ffpmeg` as it's an older module, and FFMPEG support can be obtained by using a Composer dependency (https://github.com/PHP-FFMpeg/PHP-FFMpeg)
 - Removed `php.ng.twig` since can be obtained by using a Composer dependency (http://twig.sensiolabs.org/doc/intro.html)
 - Updated `php/ng/installed.jinja` to account for the newer PPA strucutre and naming

## Help Needed

 - How to handle states like `gearman`, `gmp`, `net4` which, without a PPA, has an installation candidate in Ubuntu Trusty and below, but not in Ubuntu Xenial? And also not in CentOS?
 - Does the structure in the newer `map.jinja` files make sense?