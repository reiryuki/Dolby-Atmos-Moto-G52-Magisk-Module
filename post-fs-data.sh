mount -o rw,remount /data
MODPATH=${0%/*}

# log
exec 2>$MODPATH/debug-pfsd.log
set -x

# var
ABI=`getprop ro.product.cpu.abi`

# function
permissive() {
if [ "`toybox cat $FILE`" = 1 ]; then
  chmod 640 $FILE
  chmod 440 $FILE2
  echo 0 > $FILE
fi
}
magisk_permissive() {
if [ "`toybox cat $FILE`" = 1 ]; then
  if [ -x "`command -v magiskpolicy`" ]; then
	magiskpolicy --live "permissive *"
  else
	$MODPATH/$ABI/libmagiskpolicy.so --live "permissive *"
  fi
fi
}
sepolicy_sh() {
if [ -f $FILE ]; then
  if [ -x "`command -v magiskpolicy`" ]; then
    magiskpolicy --live --apply $FILE 2>/dev/null
  else
    $MODPATH/$ABI/libmagiskpolicy.so --live --apply $FILE 2>/dev/null
  fi
fi
}

# selinux
FILE=/sys/fs/selinux/enforce
FILE2=/sys/fs/selinux/policy
#1permissive
chmod 0755 $MODPATH/*/libmagiskpolicy.so
#2magisk_permissive
FILE=$MODPATH/sepolicy.rule
#ksepolicy_sh
FILE=$MODPATH/sepolicy.pfsd
sepolicy_sh

# run
. $MODPATH/copy.sh
. $MODPATH/.aml.sh

# directory
DIR=/data/vendor/dolby
mkdir -p $DIR
chmod 0770 $DIR
chown 1013.1013 $DIR
chcon u:object_r:vendor_data_file:s0 $DIR

# permission
DIRS=`find $MODPATH/vendor\
           $MODPATH/system/vendor -type d`
for DIR in $DIRS; do
  chown 0.2000 $DIR
done
chcon -R u:object_r:system_lib_file:s0 $MODPATH/system/lib*
chcon -R u:object_r:vendor_configs_file:s0 $MODPATH/system/odm/etc
if [ -L $MODPATH/system/vendor ]\
&& [ -d $MODPATH/vendor ]; then
  chmod 0751 $MODPATH/vendor/bin
  chmod 0751 $MODPATH/vendor/bin/hw
  chmod 0755 $MODPATH/vendor/odm/bin
  chmod 0755 $MODPATH/vendor/odm/bin/hw
  FILES=`find $MODPATH/vendor/bin\
              $MODPATH/vendor/odm/bin -type f`
  for FILE in $FILES; do
    chmod 0755 $FILE
    chown 0.2000 $FILE
  done
  chcon -R u:object_r:vendor_file:s0 $MODPATH/vendor
  chcon -R u:object_r:vendor_configs_file:s0 $MODPATH/vendor/etc
  chcon -R u:object_r:vendor_configs_file:s0 $MODPATH/vendor/odm/etc
  chcon u:object_r:vendor_hal_file:s0 $MODPATH/vendor/lib*/hw
#  chcon u:object_r:hal_dms_default_exec:s0 $MODPATH/vendor/bin/hw/vendor.dolby*.hardware.dms*@*-service
#  chcon u:object_r:hal_dms_default_exec:s0 $MODPATH/vendor/odm/bin/hw/vendor.dolby*.hardware.dms*@*-service
else
  chmod 0751 $MODPATH/system/vendor/bin
  chmod 0751 $MODPATH/system/vendor/bin/hw
  chmod 0755 $MODPATH/system/vendor/odm/bin
  chmod 0755 $MODPATH/system/vendor/odm/bin/hw
  FILES=`find $MODPATH/system/vendor/bin\
              $MODPATH/system/vendor/odm/bin -type f`
  for FILE in $FILES; do
    chmod 0755 $FILE
    chown 0.2000 $FILE
  done
  chcon -R u:object_r:vendor_file:s0 $MODPATH/system/vendor
  chcon -R u:object_r:vendor_configs_file:s0 $MODPATH/system/vendor/etc
  chcon -R u:object_r:vendor_configs_file:s0 $MODPATH/system/vendor/odm/etc
  chcon u:object_r:vendor_hal_file:s0 $MODPATH/system/vendor/lib*/hw
#  chcon u:object_r:hal_dms_default_exec:s0 $MODPATH/system/vendor/bin/hw/vendor.dolby*.hardware.dms*@*-service
#  chcon u:object_r:hal_dms_default_exec:s0 $MODPATH/system/vendor/odm/bin/hw/vendor.dolby*.hardware.dms*@*-service
fi

# function
mount_odm() {
DIR=$MODPATH/system/odm
FILES=`find $DIR -type f -name $AUD`
for FILE in $FILES; do
  DES=/odm`echo $FILE | sed "s|$DIR||g"`
  if [ -f $DES ]; then
    umount $DES
    mount -o bind $FILE $DES
  fi
done
}
mount_my_product() {
DIR=$MODPATH/system/my_product
FILES=`find $DIR -type f -name $AUD`
for FILE in $FILES; do
  DES=/my_product`echo $FILE | sed "s|$DIR||g"`
  if [ -f $DES ]; then
    umount $DES
    mount -o bind $FILE $DES
  fi
done
}

# mount
if [ -d /odm ] && [ "`realpath /odm/etc`" == /odm/etc ]\
&& ! grep /odm /data/adb/magisk/magisk\
&& ! grep /odm /data/adb/magisk/magisk64\
&& ! grep /odm /data/adb/magisk/magisk32; then
  mount_odm
fi
if [ -d /my_product ]\
&& ! grep /my_product /data/adb/magisk/magisk\
&& ! grep /my_product /data/adb/magisk/magisk64\
&& ! grep /my_product /data/adb/magisk/magisk32; then
  mount_my_product
fi

# patch manifest
M=/system/etc/vintf/manifest.xml
rm -f $MODPATH$M
FILE="/*/etc/vintf/manifest.xml /*/*/etc/vintf/manifest.xml
      /*/etc/vintf/manifest/*.xml /*/*/etc/vintf/manifest/*.xml"
if ! grep -A2 vendor.dolby.hardware.dms $FILE | grep 2.0; then
  cp -af $M $MODPATH$M
  if [ -f $MODPATH$M ]; then
    sed -i '/<manifest/a\
    <hal format="hidl">\
        <name>vendor.dolby.hardware.dms</name>\
        <transport>hwbinder</transport>\
        <fqname>@2.0::IDms/default</fqname>\
    </hal>' $MODPATH$M
    umount $M
    mount -o bind $MODPATH$M $M
    killall hwservicemanager
  fi
fi

# function
mount_bind_file() {
for FILE in $FILES; do
  umount $FILE
  mount -o bind $MODFILE $FILE
done
}
mount_bind_to_apex() {
for NAME in $NAMES; do
  MODFILE=$MODPATH/system/lib64/$NAME
  if [ -f $MODFILE ]; then
    FILES=`find /apex /system/apex -path *lib64/* -type f -name $NAME`
    mount_bind_file
  fi
  MODFILE=$MODPATH/system/lib/$NAME
  if [ -f $MODFILE ]; then
    FILES=`find /apex /system/apex -path *lib/* -type f -name $NAME`
    mount_bind_file
  fi
done
}

# mount
NAMES="libhidlbase.so libutils.so"
mount_bind_to_apex

# cleaning
FILE=$MODPATH/cleaner.sh
if [ -f $FILE ]; then
  . $FILE
  mv -f $FILE $FILE.txt
fi









