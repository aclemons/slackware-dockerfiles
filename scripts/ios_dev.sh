#! /bin/bash

sed -i "s/^#MIRRORPLUS\['alienbob'\]=http/MIRRORPLUS['alienbob']=http/g" /etc/slackpkg/slackpkgplus.conf

if [ ! -e /usr/lib64 ] ; then
    sed -i -r "s/([^x]+)(x86_64)/\1x86/g" /etc/slackpkg/slackpkgplus.conf
fi

slackpkg update gpg
slackpkg update

slackpkg install python3

python3 -m ensurepip

pip3 install conan