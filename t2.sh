#!/bin/sh

PATH=/usr/local/bin:$PATH
PATH=/bin:$PATH

VBoxManage controlvm recipe8 poweroff 2>/dev/null

# http://dl.dropbox.com/u/9140609/sb/ephemeral/74-bad.7z
wget --timestamping http://dl.dropbox.com/u/9140609/sb/ephemeral/aws-good.7z
7z x -y aws-good.7z
cp -R "aws-good/c/Program Files (x86)/Windows Embedded Standard 7/Tools/IBW/x86/"* d:/ibw/v0.1-416-gda649e9-w7

#cd c:/cygwin/home/Administrator/pdev/win7
#sh -x iso

ln -s -f d:/ibw/v0.1-416-gda649e9-w7.iso d:/MDTDSTesttmp/v0.1-416-gda649e9-w7.iso
pushd c:/cygwin/home/Administrator/pdev/virtualbox-automation/t3
make r8
popd
vboxmanage startvm recipe8

exit

sleep 30
make -C c:/cygwin/home/Administrator/pdev/virtualbox-automation/t3 r8
