#!/bin/sh

yum -y install git

git clone git://github.com/sstephenson/rbenv.git /usr/local/rbenv
echo '' >> /etc/profile
echo 'export RBENV_ROOT="/usr/local/rbenv"' >> /etc/profile
echo 'export PATH="${RBENV_ROOT}/bin:${PATH}"' >> /etc/profile
echo 'eval "$(rbenv init -)"' >> /etc/profile
source /etc/profile

mkdir /usr/local/rbenv/plugins
git clone git://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build
/usr/local/rbenv/plugins/ruby-build/install.sh

yum -y install openssl-devel
yum -y install readline-devel
yum -y install sqlite-devel
rbenv install 2.6.0
rbenv global 2.6.0
rbenv rehash
