#!/usr/bin/env bash
set -e

if [ "$EUID" -ne "0" ] ; then
  echo "Script must be run as root." >&2
  exit 1
fi

if which puppet > /dev/null ; then
  echo "Puppet is already installed"
else
  echo "Installing Puppet repo for CentOS/RHEL 6.4"
  rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
  yum update -y
  echo Installing puppet
  yum install -y puppet
  echo "Puppet installed!"
fi

# ensure hiera is able to find our stuff
if [ ! -d "/etc/puppet" ]
then
  echo "Y" | mkdir /etc/puppet
fi
# cp /vagrant/puppet/hiera.yaml /etc/puppet/hiera.yaml
# cp /vagrant/puppet/hiera.yaml /etc/hiera.yaml
