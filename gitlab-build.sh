#!/bin/bash

set -x -e -o pipefail

export DEBEMAIL='maintainers@faucet.nz'
export DEBFULLNAME='Faucet Maintainers'
export DEBIAN_FRONTEND=noninteractive

apt-get update && apt-get -y upgrade
apt-get install -y equivs devscripts dpkg-dev quilt curl apt-transport-https \
    apt-utils ssl-cert ca-certificates gnupg lsb-release debhelper git


mk-build-deps -i -r -t 'apt-get -f -y --force-yes'
dpkg-buildpackage -b -us -uc -rfakeroot -j4
