# Changelog

## [1.3.1](https://github.com/saltstack-formulas/php-formula/compare/v1.3.0...v1.3.1) (2020-04-20)


### Documentation

* add example to use a specific php version when using multiple ones ([53068f7](https://github.com/saltstack-formulas/php-formula/commit/53068f73b0bc0e40ce80fea4eac1e8fb0f159808))

# [1.3.0](https://github.com/saltstack-formulas/php-formula/compare/v1.2.3...v1.3.0) (2020-02-27)


### Bug Fixes

* **libtofs:** “files_switch” mess up the variable exported by “map.jinja” [skip ci] ([dca51de](https://github.com/saltstack-formulas/php-formula/commit/dca51de154d8dcbe5e141673322d39c4e1b6f7a6))
* **map.jinja:** fix pid file location for debian ([393d69e](https://github.com/saltstack-formulas/php-formula/commit/393d69eb0fda49f3598d5f9040be5d3bad59b5dd))


### Continuous Integration

* **gemfile:** restrict `train` gem version until upstream fix [skip ci] ([d7c188e](https://github.com/saltstack-formulas/php-formula/commit/d7c188e73c0fd9a109f997c52aa84e5c30a0bbf6))
* **kitchen:** avoid using bootstrap for `master` instances [skip ci] ([dd796b0](https://github.com/saltstack-formulas/php-formula/commit/dd796b070c3922f043078b181922d8a4ba0c33b2))
* **travis:** use `major.minor` for `semantic-release` version [skip ci] ([109df07](https://github.com/saltstack-formulas/php-formula/commit/109df0781d6832d46cd48162280ead4976ec403d))


### Documentation

* **readme:** fix broken sub-heading [skip ci] ([51dd6e9](https://github.com/saltstack-formulas/php-formula/commit/51dd6e9bf292e7b13e19a7aa81df21045ebeb99b))


### Features

* **odbc:** add odbc module support ([8b69034](https://github.com/saltstack-formulas/php-formula/commit/8b69034c5b59dda60ac1ef128e4d381eec2db52b))

## [1.2.3](https://github.com/saltstack-formulas/php-formula/compare/v1.2.2...v1.2.3) (2019-12-02)


### Bug Fixes

* **map.jinja:** fix useflags regex (gentoo) ([39b1307](https://github.com/saltstack-formulas/php-formula/commit/39b130767104a5486c99f14df593669ee3705f01))
* **release.config.js:** use full commit hash in commit link [skip ci] ([d8f279f](https://github.com/saltstack-formulas/php-formula/commit/d8f279f9cd75e30f1276c7f5dae6b48827670421))


### Continuous Integration

* **kitchen:** use `debian-10-master-py3` instead of `develop` [skip ci] ([fc9ad29](https://github.com/saltstack-formulas/php-formula/commit/fc9ad298747d2df6714c3bcc3f4c166a0fae6630))
* **kitchen:** use `develop` image until `master` is ready (`amazonlinux`) [skip ci] ([97b7a36](https://github.com/saltstack-formulas/php-formula/commit/97b7a36aa7a22278c86ea81853d32a6a0172a481))
* **kitchen+travis:** upgrade matrix after `2019.2.2` release [skip ci] ([85e1f0e](https://github.com/saltstack-formulas/php-formula/commit/85e1f0ec25fe3ec0b99271a053f41ea7657f4d15))
* **travis:** apply changes from build config validation [skip ci] ([3862c37](https://github.com/saltstack-formulas/php-formula/commit/3862c37d06f3a57202d7b5b42a572aa6bbfaa839))
* **travis:** opt-in to `dpl v2` to complete build config validation [skip ci] ([0bb68c5](https://github.com/saltstack-formulas/php-formula/commit/0bb68c5b1796087215c254afde7b63fbed893fb2))
* **travis:** quote pathspecs used with `git ls-files` [skip ci] ([0090c91](https://github.com/saltstack-formulas/php-formula/commit/0090c91b606f6d4ed5926d1b1985f2a1867b49af))
* **travis:** run `shellcheck` during lint job [skip ci] ([298a7d6](https://github.com/saltstack-formulas/php-formula/commit/298a7d61c26902c0193c887705e290158e866d23))
* **travis:** update `salt-lint` config for `v0.0.10` [skip ci] ([5c7d1aa](https://github.com/saltstack-formulas/php-formula/commit/5c7d1aa5016705da9645161e96e6be676866bc41))
* **travis:** use build config validation (beta) [skip ci] ([bcc0690](https://github.com/saltstack-formulas/php-formula/commit/bcc0690c8ac5f462d1dd5fb28d4f563987126a28))
* merge travis matrix, add `salt-lint` & `rubocop` to `lint` job ([75f8d4d](https://github.com/saltstack-formulas/php-formula/commit/75f8d4dcb8cc6431f9bbc43dab97ece141d16d74))


### Documentation

* **contributing:** remove to use org-level file instead [skip ci] ([8aee949](https://github.com/saltstack-formulas/php-formula/commit/8aee949cab703e4d989c20c000a628bfbf1c6fcb))
* **readme:** update link to `CONTRIBUTING` [skip ci] ([05d112f](https://github.com/saltstack-formulas/php-formula/commit/05d112f63b5ebf0e117d2c181fdc02cf8ea6dbac))


### Performance Improvements

* **travis:** improve `salt-lint` invocation [skip ci] ([56d7314](https://github.com/saltstack-formulas/php-formula/commit/56d73148b31bb2f81adedb023748cd8a461ee0e3))

## [1.2.2](https://github.com/saltstack-formulas/php-formula/compare/v1.2.1...v1.2.2) (2019-10-10)


### Bug Fixes

* **composer.sls:** fix `salt-lint` errors ([](https://github.com/saltstack-formulas/php-formula/commit/4e48a7a))
* **map.jinja:** fix `salt-lint` errors ([](https://github.com/saltstack-formulas/php-formula/commit/01f5ede))
* **repo.sls:** fix `salt-lint` errors ([](https://github.com/saltstack-formulas/php-formula/commit/b4d994c))


### Continuous Integration

* merge travis matrix, add `salt-lint` & `rubocop` to `lint` job ([](https://github.com/saltstack-formulas/php-formula/commit/a5a8a95))

## [1.2.1](https://github.com/saltstack-formulas/php-formula/compare/v1.2.0...v1.2.1) (2019-10-07)


### Bug Fixes

* **pillar.example:** fix `yamllint` error ([1b1747a](https://github.com/saltstack-formulas/php-formula/commit/1b1747a)), closes [/travis-ci.org/myii/php-formula/builds/594703019#L208-L210](https://github.com//travis-ci.org/myii/php-formula/builds/594703019/issues/L208-L210)


### Continuous Integration

* **kitchen:** change `log_level` to `debug` instead of `info` ([b86237e](https://github.com/saltstack-formulas/php-formula/commit/b86237e))
* **kitchen:** install required packages to bootstrapped `opensuse` [skip ci] ([20be85a](https://github.com/saltstack-formulas/php-formula/commit/20be85a))
* **kitchen:** use bootstrapped `opensuse` images until `2019.2.2` [skip ci] ([f70ebd2](https://github.com/saltstack-formulas/php-formula/commit/f70ebd2))
* **platform:** add `arch-base-latest` (commented out for now) [skip ci] ([55d5df1](https://github.com/saltstack-formulas/php-formula/commit/55d5df1))

# [1.2.0](https://github.com/saltstack-formulas/php-formula/compare/v1.1.1...v1.2.0) (2019-09-13)


### Continuous Integration

* use `dist: bionic` & apply `opensuse-leap-15` SCP error workaround ([76a2f76](https://github.com/saltstack-formulas/php-formula/commit/76a2f76))
* **yamllint:** add rule `empty-values` & use new `yaml-files` setting ([6f6d4bc](https://github.com/saltstack-formulas/php-formula/commit/6f6d4bc))


### Features

* **tofs:** implementation for all file.managed ([8e79a35](https://github.com/saltstack-formulas/php-formula/commit/8e79a35))

## [1.1.1](https://github.com/saltstack-formulas/php-formula/compare/v1.1.0...v1.1.1) (2019-09-05)


### Continuous Integration

* **kitchen+travis:** replace EOL pre-salted images ([c9eea17](https://github.com/saltstack-formulas/php-formula/commit/c9eea17))


### Tests

* **suse:** update version to `7.0` for `opensuse-leap-15` ([fd67570](https://github.com/saltstack-formulas/php-formula/commit/fd67570))

# [1.1.0](https://github.com/saltstack-formulas/php-formula/compare/v1.0.1...v1.1.0) (2019-09-05)


### Bug Fixes

* **fpm:** be sure to restart all Php instances in case of multi-versions ([d4772f9](https://github.com/saltstack-formulas/php-formula/commit/d4772f9))
* **tests:** don't test services on Suse and RedHat ([23214bf](https://github.com/saltstack-formulas/php-formula/commit/23214bf))
* **xdebug:** fix xdebug package name ([496ec28](https://github.com/saltstack-formulas/php-formula/commit/496ec28))
* **yamllint:** use separate suite for `ubuntu` ([6cba4af](https://github.com/saltstack-formulas/php-formula/commit/6cba4af)), closes [#174](https://github.com/saltstack-formulas/php-formula/issues/174)


### Code Refactoring

* **macro:** extract file_requisites macro ([d26c4f8](https://github.com/saltstack-formulas/php-formula/commit/d26c4f8))


### Continuous Integration

* **kitchen:** add test pillars for Debian and call some states ([d4fc842](https://github.com/saltstack-formulas/php-formula/commit/d4fc842))


### Features

* **repo:** add repo pattern so we can set distro repo during tests ([3c9efc7](https://github.com/saltstack-formulas/php-formula/commit/3c9efc7))


### Styles

* **spec:** remove empty lines ([dc12a0b](https://github.com/saltstack-formulas/php-formula/commit/dc12a0b))


### Tests

* **config:** add tests on Php config ([6555cf0](https://github.com/saltstack-formulas/php-formula/commit/6555cf0))
* **package:** fix package spec in case of multi Php versions ([59f648c](https://github.com/saltstack-formulas/php-formula/commit/59f648c))
* **service:** add tests on Php services ([baeac04](https://github.com/saltstack-formulas/php-formula/commit/baeac04))
* **ubuntu:** fix tests on Ubuntu distro ([b13bed2](https://github.com/saltstack-formulas/php-formula/commit/b13bed2))

## [1.0.1](https://github.com/saltstack-formulas/php-formula/compare/v1.0.0...v1.0.1) (2019-08-26)


### Bug Fixes

* **pillar:** fix pillar.get still looking under 'ng' namespace ([378b5b1](https://github.com/saltstack-formulas/php-formula/commit/378b5b1))

# [1.0.0](https://github.com/saltstack-formulas/php-formula/compare/v0.41.1...v1.0.0) (2019-08-26)


### Features

* **ng:** promote NG formula ([57b37dd](https://github.com/saltstack-formulas/php-formula/commit/57b37dd)), closes [#183](https://github.com/saltstack-formulas/php-formula/issues/183)


### BREAKING CHANGES

* **ng:** all previous `php` based configurations must be reviewed;
`php.ng` usage must be promoted to `php` and any uses of the original
`php` will have to be converted.

## [0.41.1](https://github.com/saltstack-formulas/php-formula/compare/v0.41.0...v0.41.1) (2019-08-26)


### Documentation

* **readme:** remove duplicate contents (local) ([f16796a](https://github.com/saltstack-formulas/php-formula/commit/f16796a))

# [0.41.0](https://github.com/saltstack-formulas/php-formula/compare/v0.40.1...v0.41.0) (2019-08-26)


### Features

* **ng:** promote NG formula ([f1b71d0](https://github.com/saltstack-formulas/php-formula/commit/f1b71d0))

## [0.40.1](https://github.com/saltstack-formulas/php-formula/compare/v0.40.0...v0.40.1) (2019-08-17)


### Bug Fixes

* **map:** fix missing value for php.lookup.fpm.user in multi-php mode ([f91d942](https://github.com/saltstack-formulas/php-formula/commit/f91d942))

# [0.40.0](https://github.com/saltstack-formulas/php-formula/compare/v0.39.2...v0.40.0) (2019-08-17)


### Features

* **yamllint:** include for this repo and apply rules throughout ([571cc4b](https://github.com/saltstack-formulas/php-formula/commit/571cc4b))

## [0.39.2](https://github.com/saltstack-formulas/php-formula/compare/v0.39.1...v0.39.2) (2019-08-13)


### Bug Fixes

* **tests:** fix package name for debian ([4f75eac](https://github.com/saltstack-formulas/php-formula/commit/4f75eac))

## [0.39.1](https://github.com/saltstack-formulas/php-formula/compare/v0.39.0...v0.39.1) (2019-08-12)


### Bug Fixes

* **installed.jinja:** remove `include` to prevent conflicting IDs ([cb11784](https://github.com/saltstack-formulas/php-formula/commit/cb11784)), closes [#188](https://github.com/saltstack-formulas/php-formula/issues/188)

# [0.39.0](https://github.com/saltstack-formulas/php-formula/compare/v0.38.1...v0.39.0) (2019-08-07)


### Bug Fixes

* **php/ng:** don't iterate on string, make sure list is not string ([dbb542c](https://github.com/saltstack-formulas/php-formula/commit/dbb542c))


### Documentation

* **pillar.example:** add example for alternatives with multiversion ([23a6ec1](https://github.com/saltstack-formulas/php-formula/commit/23a6ec1))
* **pillar.example:** example of versions ([a98aa7e](https://github.com/saltstack-formulas/php-formula/commit/a98aa7e))


### Features

* **php/ng:** support for php cli multiversion ([bb4a077](https://github.com/saltstack-formulas/php-formula/commit/bb4a077))
* **php/ng:** support the use of a list of php versions ([b303239](https://github.com/saltstack-formulas/php-formula/commit/b303239)), closes [#138](https://github.com/saltstack-formulas/php-formula/issues/138)


### Styles

* **pillar.example:** add line break ([38fe58f](https://github.com/saltstack-formulas/php-formula/commit/38fe58f))

## [0.38.1](https://github.com/saltstack-formulas/php-formula/compare/v0.38.0...v0.38.1) (2019-08-03)


### Bug Fixes

* update deprecation version number in `semantic-release` run ([a87fb91](https://github.com/saltstack-formulas/php-formula/commit/a87fb91)), closes [/github.com/saltstack-formulas/php-formula/pull/175#issuecomment-517492613](https://github.com//github.com/saltstack-formulas/php-formula/pull/175/issues/issuecomment-517492613) [/github.com/saltstack-formulas/php-formula/pull/185#issuecomment-517603898](https://github.com//github.com/saltstack-formulas/php-formula/pull/185/issues/issuecomment-517603898)

# [0.38.0](https://github.com/saltstack-formulas/php-formula/compare/v0.37.1...v0.38.0) (2019-08-01)


### Features

* **map:** add xmlrpc package for xml module, as it was done for SUSE ([a09ef92](https://github.com/saltstack-formulas/php-formula/commit/a09ef92))

## [0.37.1](https://github.com/saltstack-formulas/php-formula/compare/v0.37.0...v0.37.1) (2019-08-01)


### Bug Fixes

* add warning message for ng states ([d45bae8](https://github.com/saltstack-formulas/php-formula/commit/d45bae8))
* allow muting deprecation warning via. pillar/config entry ([8e7471e](https://github.com/saltstack-formulas/php-formula/commit/8e7471e))
* change message to warn about upcoming deprecation ([e97eeae](https://github.com/saltstack-formulas/php-formula/commit/e97eeae))
* warn formula users ng states will be promoted in `v1.0.0` ([d033381](https://github.com/saltstack-formulas/php-formula/commit/d033381))
* **pillar_from_files:** use `{}` pillar files to ensure tests pass ([1a5d734](https://github.com/saltstack-formulas/php-formula/commit/1a5d734))
* **readme:** add warning in  docs/README.rst ([3ac59e4](https://github.com/saltstack-formulas/php-formula/commit/3ac59e4))

# [0.37.0](https://github.com/saltstack-formulas/php-formula/compare/v0.36.0...v0.37.0) (2019-07-09)


### Bug Fixes

* **mods:** fixup for [#181](https://github.com/saltstack-formulas/php-formula/issues/181) ([e2d7b4b](https://github.com/saltstack-formulas/php-formula/commit/e2d7b4b))


### Features

* **mods:** added some mods support for FreeBSD ([3f6c0bc](https://github.com/saltstack-formulas/php-formula/commit/3f6c0bc))

# [0.36.0](https://github.com/saltstack-formulas/php-formula/compare/v0.35.1...v0.36.0) (2019-06-29)


### Documentation

* **readme:** update with modules, bz2 & dba ([5e04187](https://github.com/saltstack-formulas/php-formula/commit/5e04187))


### Features

* add 'bz2' and 'dba' module support ([758ae88](https://github.com/saltstack-formulas/php-formula/commit/758ae88))

## [0.35.1](https://github.com/saltstack-formulas/php-formula/compare/v0.35.0...v0.35.1) (2019-06-28)


### Documentation

* merge latest changes from `template-formula` ([4af569a](https://github.com/saltstack-formulas/php-formula/commit/4af569a)), closes [#179](https://github.com/saltstack-formulas/php-formula/issues/179)

# [0.35.0](https://github.com/saltstack-formulas/php-formula/compare/v0.34.0...v0.35.0) (2019-06-27)


### Features

* **semantic-release:** add support of semantic-release ([cdd206a](https://github.com/saltstack-formulas/php-formula/commit/cdd206a))
