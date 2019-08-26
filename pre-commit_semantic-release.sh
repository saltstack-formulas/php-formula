#!/bin/sh

###############################################################################
# (A) Update `FORMULA` with `${nextRelease.version}`
###############################################################################
sed -i -e "s_^\(version:\).*_\1 ${1}_" FORMULA


###############################################################################
# (B) Use `m2r` to convert automatically produced `.md` docs to `.rst`
###############################################################################

# Install `m2r`
sudo -H pip install m2r

# Copy and then convert the `.md` docs
cp *.md docs/
cd docs/
m2r --overwrite *.md

# Change excess `H1` headings to `H2` in converted `CHANGELOG.rst`
sed -i -e '/^=.*$/s/=/-/g' CHANGELOG.rst
sed -i -e '1,4s/-/=/g' CHANGELOG.rst

# Use for debugging output, when required
# cat AUTHORS.rst
# cat CHANGELOG.rst

# Return back to the main directory
cd ..


###############################################################################
# (C) Update last version before `v1.0.0` with `${nextRelease.version}`
###############################################################################
# Only apply this while the version number is below `v1.0.0`!
V_REPR=v${1}
MAJOR=$(echo ${V_REPR} | cut -c-2)
if [ ${MAJOR} = "v0" ]; then
    sed -i -e "s@^\(\s\+\`\).*\(\s<https://github.com/saltstack-formulas/php-formula/releases/tag/\).*\(>\`_\.\)@\1${V_REPR}\2${V_REPR}\3@" docs/README.rst
fi
