.. _readme:

php-formula
===========

|img_travis| |img_sr|

.. |img_travis| image:: https://travis-ci.com/saltstack-formulas/php-formula.svg?branch=master
   :alt: Travis CI Build Status
   :scale: 100%
   :target: https://travis-ci.com/saltstack-formulas/php-formula
.. |img_sr| image:: https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg
   :alt: Semantic Release
   :scale: 100%
   :target: https://github.com/semantic-release/semantic-release

Formula to set up and configure php

.. list-table::
   :name: banner-breaking-changes-v1.0.0
   :header-rows: 1
   :widths: 1

   * - WARNING: BREAKING CHANGES SINCE ``v1.0.0``
   * - Prior to
       `v1.0.0 <https://github.com/saltstack-formulas/php-formula/releases/tag/v1.0.0>`_,
       this formula provided two methods for managing PHP;
       the old method under ``php`` and the new method under ``php.ng``.
       The old method has now been removed and ``php.ng`` has been promoted to
       be ``php`` in its place.

       If you are not in a position to migrate, please pin your repo to the final
       release tag before
       `v1.0.0 <https://github.com/saltstack-formulas/php-formula/releases/tag/v1.0.0>`_,
       i.e.
       `v0.40.1 <https://github.com/saltstack-formulas/php-formula/releases/tag/v0.40.1>`_.

       To migrate from ``php.ng``, simply modify your pillar to promote the
       entire section under ``php:ng`` so that it is under ``php`` instead.
       So with the editor of your choice, highlight the entire section and then
       unindent one level.  Finish by removing the ``ng:`` line.

       To migrate from the old ``php``, first convert to ``php.ng`` under
       `v0.40.1 <https://github.com/saltstack-formulas/php-formula/releases/tag/v0.40.1>`_.
       and then follow the steps laid out in the paragraph directly above.

.. contents:: **Table of Contents**

General notes
-------------

See the full `SaltStack Formulas installation and usage instructions
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

If you are interested in writing or contributing to formulas, please pay attention to the `Writing Formula Section
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#writing-formulas>`_.

If you want to use this formula, please pay attention to the ``FORMULA`` file and/or ``git tag``,
which contains the currently released version. This formula is versioned according to `Semantic Versioning <http://semver.org/>`_.

See `Formula Versioning Section <https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#versioning>`_ for more details.

Contributing to this repo
-------------------------

**Commit message formatting is significant!!**

Please see `How to contribute <https://github.com/saltstack-formulas/.github/blob/master/CONTRIBUTING.rst>`_ for more details.

Available states
----------------

Please provide feedback by filing issues,
discussing in ``#salt`` in Freenode and the mailing list as normal.

**Note:** php states require the merge parameter of salt.modules.pillar.get(),
first available in the Helium release.

.. contents::
    :local:

``php``
^^^^^^^^^^

Installs the php package.

``php.adodb``
^^^^^^^^^^^^^^^^

Installs the php-adodb package.

``php.apache2``
^^^^^^^^^^^^^^^^^^

Meta-state that combines `php.apache2.install`_ and `php.apache2.ini`_.

``php.apache2.ini``
^^^^^^^^^^^^^^^^^^^^^^

Manages the apache2 php.ini file

``php.apache2.install``
^^^^^^^^^^^^^^^^^^^^^^^^^^

Installs the apache2 and libapache2-mod-php5 package. Debian Only.

``php.apc``
^^^^^^^^^^^^^^

Installs the php-apc package.
Disabled on opensuse need server:php repo

``php.apcu``
^^^^^^^^^^^^^^^

Installs the php-apcu package.
Disabled on opensuse need server:php repo

``php.auth-sasl``
^^^^^^^^^^^^^^^^^^^^

Installs the php-auth-sasl package.

``php.bcmath``
^^^^^^^^^^^^^^^^^

Installs the php-bcmath package.

``php.bz2``
^^^^^^^^^^^^^^

Installs the php-bz2 package.

``php.cache-lite``
^^^^^^^^^^^^^^^^^^^^^

Installs the php-cache-lite package.

``php.cgi``
^^^^^^^^^^^^^^

Installs the php-cgi package.
Disabled on opensuse only php5-fastcgi available.

``php.cli``
^^^^^^^^^^^^^^

Meta-state that combines `php.cli.install`_ and `php.cli.ini`_.

``php.cli.ini``
^^^^^^^^^^^^^^^^^^

Manages the php-cli ini file.

``php.cli.install``
^^^^^^^^^^^^^^^^^^^^^^

Installs the php-cli package.

``php.composer``
^^^^^^^^^^^^^^^^^^^

Installs [composer](https://getcomposer.org) and keeps it updated.

``php.console-table``
^^^^^^^^^^^^^^^^^^^^^^^^

Installs the php-console-table package.

``php.ctype``
^^^^^^^^^^^^^^^^

Installs the php-ctype package.

``php.curl``
^^^^^^^^^^^^^^^

Installs the php5-curl package on Debian, and ensures that curl itself is
installed for RedHat systems, this is due to the curl libs being provided by
php-common, which will get installed with the main php package.

``php.dba``
^^^^^^^^^^^^^^

Installs the php-dba package.

``php.dev``
^^^^^^^^^^^^^^

Installs the php5-dev and build-essential package.

``php.filter``
^^^^^^^^^^^^^^^^^

Installs the php-filter package.

``php.fpm``
^^^^^^^^^^^^^^

Meta-state that combines all php.fpm states.

``php.fpm.config``
^^^^^^^^^^^^^^^^^^^^^

Manages the (non-pool) php-fpm config files.

``php.fpm.install``
^^^^^^^^^^^^^^^^^^^^^^

Installs the php-fpm package.

``php.fpm.pools``
^^^^^^^^^^^^^^^^^^^^

Meta-state that combines `php.fpm.service`_ and `php.fpm.pools_config`_

``php.fpm.pools_config``
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Manages php-fpm pool config files.

``php.fpm.service``
^^^^^^^^^^^^^^^^^^^^^^

Manages the php-fpm service.

``php.gd``
^^^^^^^^^^^^^

Installs the php-gd package.

``php.gearman``
^^^^^^^^^^^^^^^^^^

Installs the php-gearman package.

``php.geoip``
^^^^^^^^^^^^^^^^

Installs the php-geoip package.

``php.geshi``
^^^^^^^^^^^^^^^^

Installs the php-geshi package.

``php.gettext``
^^^^^^^^^^^^^^^^^^

Installs the php-gettext package.

``php.gmp``
^^^^^^^^^^^^^^

Installs the php-gmp package. Debian Only.

``php.hash``
^^^^^^^^^^^^^^^

Installs the php-hash package.

``php.http``
^^^^^^^^^^^^^^^

Installs the php-http package.

``php.hhvm``
^^^^^^^^^^^^^^^

Meta-state that combines php.hhvm states

``php.hhvm.config``
^^^^^^^^^^^^^^^^^^^^^^

Manages the php-hhvm config files

``php.hhvm.install``
^^^^^^^^^^^^^^^^^^^^^^^

Installs the php-hhvm package

``php.hhvm.repo``
^^^^^^^^^^^^^^^^^

Configures the hhvm repo for debian/ubuntu

``php.hhvm.service``
^^^^^^^^^^^^^^^^^^^^^^^

Manages the php-hhvm service.

``php.igbinary``
^^^^^^^^^^^^^^^^^^^

Installs the php-igbinary package.

``php.imagick``
^^^^^^^^^^^^^^^^^^

Installs the php-imagick package.
Disabled on opensuse no package.

``php.imap``
^^^^^^^^^^^^^^^

Installs the php-imap package.

``php.intl``
^^^^^^^^^^^^^^^

Installs the php-intl package.

``php.json``
^^^^^^^^^^^^^^^

Installs the php-json package.

``php.ldap``
^^^^^^^^^^^^^^^

Installs the php-ldap package.

``php.mail``
^^^^^^^^^^^^^^^

Installs the php-mail package.

``php.mbstring``
^^^^^^^^^^^^^^^^^^^

Installs the php-mbstring package.

``php.mcrypt``
^^^^^^^^^^^^^^^^^

Installs the php-mcrypt package.

``php.mdb2``
^^^^^^^^^^^^^^^

Installs the php-mdb2 package.

``php.mdb2-driver-mysql``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Installs the php-mdb2-driver-mysql package.

``php.mdb2-driver-pgsql``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Installs the php-mdb2-driver-pgsql package.

``php.memcache``
^^^^^^^^^^^^^^^^^^^

Installs the php-memcache package.
Disabled on opensuse need server:php:extensions repo

``php.memcached``
^^^^^^^^^^^^^^^^^^^^

Installs the php-memcached package.
Disabled on opensuse need server:php:extensions repo

``php.modules``
^^^^^^^^^^^^^^^^^^

Calls ``php.<name>`` for each entry in ``php:modules`` if available, or
try to install the matching packages that can be set via from
``php:lookup:pkgs``

``php.mongo``
^^^^^^^^^^^^^^^^

Installs the php-mongo package.

``php.mongodb``
^^^^^^^^^^^^^^^^^^

Installs the php-mongodb package.

``php.msgpack``
^^^^^^^^^^^^^^^^^^

Installs the php-msgpack package.

``php.mysql``
^^^^^^^^^^^^^^^^

Installs the php-mysql package.

``php.mysqlnd``
^^^^^^^^^^^^^^^^^^

Installs the php-mysqlnd package.
Disabled on opensuse no package.

``php.net-smtp``
^^^^^^^^^^^^^^^^^^^

Installs the php-net-smtp package.

``php.net4``
^^^^^^^^^^^^^^^

Installs the php-net4 package.

``php.net6``
^^^^^^^^^^^NET6

Installs the php-net6 package.

``php.oauth``
^^^^^^^^^^^^^^^^

Installs the php-oauth package.

``php.opcache``
^^^^^^^^^^^^^^^^^^

Installs the php-opcache package.

``php.openssl``
^^^^^^^^^^^^^^^^^^

Installs the php-openssl package.

``php.pear``
^^^^^^^^^^^^^^^

Installs the php-pear package.

``php.pgsql``
^^^^^^^^^^^^^^^^

Installs the php-pgsql package.

``php.phar``
^^^^^^^^^^^^^^^

Installs the php-phar package.

``php.posix``
^^^^^^^^^^^^^^^^

Installs the php-posix package.

``php.pspell``
^^^^^^^^^^^^^^^^^

Installs the php-pspell package.

``php.readline``
^^^^^^^^^^^^^^^^^^^

Installs the php-readline package.

``php.redis``
^^^^^^^^^^^^^^^^

Installs the php-redis package.
Disabled on opensuse need server:php:extensions repo

``php.seclib``
^^^^^^^^^^^^^^^^^

Installs the php-seclib package.

``php.session``
^^^^^^^^^^^^^^^^^^

Installs the php-session package.

``php.snmp``
^^^^^^^^^^^^^^^

Installs the php-snmp package.

``php.soap``
^^^^^^^^^^^^^^^

Installs the php-soap package.

``php.sqlite``
^^^^^^^^^^^^^^^^^

Installs the php-sqlite package,

``php.ssh2``
^^^^^^^^^^^^^^^

Installs the php-ssh2 package,

``php.suhosin``
^^^^^^^^^^^^^^^^^^

Installs the php-suhosin package.

``php.svn``
^^^^^^^^^^^^^^

Installs the php-svn package.

``php.sybase``
^^^^^^^^^^^^^^^^^

Installs the php-sybase package.

``php.tcpdf``
^^^^^^^^^^^^^^^^

Installs the php-tcpdf package.

``php.tidy``
^^^^^^^^^^^^^^^

Installs the php-tidy package.

``php.uuid``
^^^^^^^^^^^^^^^

Installs the php-uuid package.

``php.xcache``
^^^^^^^^^^^^^^^^^

Meta-state that combines `php.xcache.install`_ and `php.xcache.ini`_.

``php.xcache.ini``
^^^^^^^^^^^^^^^^^^^^^

Manages the php-xcache ini file

``php.xcache.install``
^^^^^^^^^^^^^^^^^^^^^^^^^

Installs the php-xcache package.
Disabled on opensuse need server:php:extensions repo

``php.xdebug``
^^^^^^^^^^^^^^^^^

Installs the php-xdebug package.

``php.xml``
^^^^^^^^^^^^^^

Installs the php-xml package.

``php.xsl``
^^^^^^^^^^^^^^

Installs the php-xsl package.

``php.zip``
^^^^^^^^^^^^^^

Installs the php-zip package.

Testing
-------

Linux testing is done with ``kitchen-salt``.

Requirements
^^^^^^^^^^^^

* Ruby
* Docker

.. code-block:: bash

   $ gem install bundler
   $ bundle install
   $ bin/kitchen test [platform]

Where ``[platform]`` is the platform name defined in ``kitchen.yml``,
e.g. ``debian-9-2019-2-py3``.

``bin/kitchen converge``
^^^^^^^^^^^^^^^^^^^^^^^^

Creates the docker instance and runs the ``php`` main states, ready for testing.

``bin/kitchen verify``
^^^^^^^^^^^^^^^^^^^^^^

Runs the ``inspec`` tests on the actual instance.

``bin/kitchen destroy``
^^^^^^^^^^^^^^^^^^^^^^^

Removes the docker instance.

``bin/kitchen test``
^^^^^^^^^^^^^^^^^^^^

Runs all of the stages above in one go: i.e. ``destroy`` + ``converge`` + ``verify`` + ``destroy``.

``bin/kitchen login``
^^^^^^^^^^^^^^^^^^^^^

Gives you SSH access to the instance for manual testing.

Testing with Vagrant
--------------------

Windows/FreeBSD/OpenBSD testing is done with ``kitchen-salt``.

Requirements
^^^^^^^^^^^^

* Ruby
* Virtualbox
* Vagrant

Setup
^^^^^

.. code-block:: bash

   $ gem install bundler
   $ bundle install --with=vagrant
   $ bin/kitchen test [platform]

Where ``[platform]`` is the platform name defined in ``kitchen.vagrant.yml``,
e.g. ``windows-81-latest-py3``.

Note
^^^^

When testing using Vagrant you must set the environment variable ``KITCHEN_LOCAL_YAML`` to ``kitchen.vagrant.yml``.  For example:

.. code-block:: bash

   $ KITCHEN_LOCAL_YAML=kitchen.vagrant.yml bin/kitchen test      # Alternatively,
   $ export KITCHEN_LOCAL_YAML=kitchen.vagrant.yml
   $ bin/kitchen test

Then run the following commands as needed.

``bin/kitchen converge``
^^^^^^^^^^^^^^^^^^^^^^^^

Creates the Vagrant instance and runs the ``php`` main states, ready for testing.

``bin/kitchen verify``
^^^^^^^^^^^^^^^^^^^^^^

Runs the ``inspec`` tests on the actual instance.

``bin/kitchen destroy``
^^^^^^^^^^^^^^^^^^^^^^^

Removes the Vagrant instance.

``bin/kitchen test``
^^^^^^^^^^^^^^^^^^^^

Runs all of the stages above in one go: i.e. ``destroy`` + ``converge`` + ``verify`` + ``destroy``.

``bin/kitchen login``
^^^^^^^^^^^^^^^^^^^^^

Gives you RDP/SSH access to the instance for manual testing.
