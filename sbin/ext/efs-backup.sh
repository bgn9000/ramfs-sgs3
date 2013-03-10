#!/sbin/busybox sh
if [ ! -f /data/.shun/efsbackup.tar.gz ];
then
  mkdir /data/.shun
  chmod 777 /data/.shun
  /sbin/busybox tar zcvf /data/.shun/efsbackup.tar.gz /efs
  /sbin/busybox cat /dev/block/mmcblk0p3 > /data/.shun/efsdev-mmcblk0p3.img
  /sbin/busybox gzip /data/.shun/efsdev-mmcblk0p3.img
  /sbin/busybox cp /data/.shun/efs* /data/media
  chmod 777 /data/media/efsdev-mmcblk0p3.img
  chmod 777 /data/media/efsbackup.tar.gz
fi

