#!/bin/bash

#make the needed home folder mount and get permissions correct
sudo mkdir /home/.y2k
sudo chown y2k:y2k /home/.y2k
chmod 600 /home/.y2k

#to move where ecryptfs fs puts my home dir /home/.ecryptfs/y2k/Private.mnt

unionfs-fuse -o cow,stats,max_files=32767,use_ino,allow_root '/home/y2k/Documents'=RW:'/home/y2k/.Y2kMadData/Y2kBuffer'=RO '/home/y2k/BufferUnion'


worked
unionfs-fuse -o cow,max_files=32767,use_ino,allow_other /home/.y2k=RW:/media/.Y2kMadData=RO /home/y2k


#         the fstabway
#         unionfs-fuse#/home/sava/Dropbox=rw:/home/sava/Ubuntu\040One=rw /home/sava/MyCLOUD fuse cow,allow_other 0 0     this is the example
#         unionfs-fuse#/home/.y2k=RW:/media/.Y2kMadData=RO /home/y2k fuse cow,max_files=32767,use_ino,allow_others 0 0   this one is for me
