php
======
DEPENDENCIES:
  These formulas are required:

	1) apt

ORDERING:

The ordering of the states for php falls into block ranges which are:

	1)  php will use 1-500 for ordering
	2)  php will reserve 1  -100 as unused
	3)  php will reserve 101-150 for pre pkg install
	4)  php will reserve 151-200 for pkg install
	5)  php will reserve 201-250 for pkg configure
	6)  php will reserve 251-300 for downloads, git stuff, load data
	7)  php will reserve 301-400 for unknown purposes
	8)  php will reserve 401-450 for service restart-reloads
	9)  php WILL reserve 451-460 for service.running
	10) php will reserve 461-500 for cmd requiring operational services

PILLARS:

	No Pillars are used in this formula as of yet.
