#! /usr/bin/env bash

# mkdir /media/backup || exit 1
# mount btrfs volume containing the 15r rsync root subvolume as well as all of
# the snapshot subvolumes
# mount -t btrfs -o noatime -L Y2k1500SEAGATE111 /media/Y2k1500SEAGATE111 || exit 1


######
# mounting and folder creation gets handled automagically by udevil
######

bakroot="/media/Y2k1500SEAGATE111"
bakdatetime=$(date +%Y-%m-%dT%H:%M:%S%z)

data="${bakroot}/15r"
snap="${bakroot}/bak/15r/${bakdatetime}"

# backup current state
rsync -aAXvih --delete --progress /home/y2k/ $data >> $snap.log
sync


# make a read only snapshot
btrfs subvolume snapshot -r $data $snap
sync

# umount /media/backup
# sync
# rmdir /media/backup



