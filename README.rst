===
php
===

Formulas to set up and configure php and various php libraries.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/topics/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``php``
-------

Installs the php package.

``php.apc``
-----------

Installs the php-apc package.

``php.curl``
------------

Installs the php5-curl package on Debian, and ensures that curl itself is
installed for RedHat systems, this is due to the curl libs being provided by
php-common, which will get installed with the main php package.

``php.fpm``
-----------

Installs the php-fpm package, starts the service, and enables it.

``php.gd``
----------

Installs the php-gd package.

``php.mcrypt``
--------------

Installs the php-mcrypt package.

``php.mysql``
-------------

Installs the php-mysql package.

``php.pear``
------------

Installs the php-pear package.
