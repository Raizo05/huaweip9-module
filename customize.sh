##########################################################################################
#
# MMT Extended Config Script
#
##########################################################################################

##########################################################################################
# Config Flags
##########################################################################################

# Uncomment and change 'MINAPI' and 'MAXAPI' to the minimum and maximum android version for your mod
# Uncomment DYNLIB if you want libs installed to vendor for oreo+ and system for anything older
# Uncomment DEBUG if you want full debug logs (saved to /sdcard)
#MINAPI=21
#MAXAPI=25
#DYNLIB=true
#DEBUG=true

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# Check the documentations for more info why you would need this

# Construct your list in the following format
# This is an example
REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here
REPLACE="
"

##########################################################################################
# Permissions
##########################################################################################

set_permissions() {
  : # Remove this if adding to this function

  # Note that all files/folders in magisk module directory have the $MODPATH prefix - keep this prefix on all of your files/folders
  # Some examples:
  
  # For directories (includes files in them):
  # set_perm_recursive  <dirname>                <owner> <group> <dirpermission> <filepermission> <contexts> (default: u:object_r:system_file:s0)
  
  # set_perm_recursive $MODPATH/system/lib 0 0 0755 0644
  # set_perm_recursive $MODPATH/system/vendor/lib/soundfx 0 0 0755 0644

  # For files (not in directories taken care of above)
  # set_perm  <filename>                         <owner> <group> <permission> <contexts> (default: u:object_r:system_file:s0)
  
  # set_perm $MODPATH/system/lib/libart.so 0 0 0644
  # set_perm /data/local/tmp/file.txt 0 0 644
  set_perm_recursive $MODPATH/system/app/NfcNci 000
  set_perm $MODPATH/system/bin/hw/vendor.huawei.hardware.graphics.displayeffect@1.0-service 755
  set_perm $MODPATH/system/bin/hw/vendor.huawei.hardware.graphics.mediacomm@2.0-service 755
  set_perm $MODPATH/system/etc/init/vendor.huawei.hardware.graphics.mediacomm@2.0-service.rc 644
  set_perm $MODPATH/system/lib/vendor.huawei.hardware.graphics.displayeffect@1.0.so 644
  set_perm $MODPATH/system/lib/vendor.huawei.hardware.graphics.gpucommon@1.0.so 644
  set_perm $MODPATH/system/lib/vendor.huawei.hardware.graphics.mediacomm@2.0.so 644
  set_perm $MODPATH/system/lib/hw/hwcomposer.hi3650.so 644
  set_perm $MODPATH/system/lib/hw/vendor.huawei.hardware.graphics.displayeffect@1.0-impl.so 644
  set_perm $MODPATH/system/lib/hw/vendor.huawei.hardware.graphics.mediacomm@2.0-impl.so 644
  set_perm $MODPATH/system/lib64/vendor.huawei.hardware.graphics.displayeffect@1.0.so 644
  set_perm $MODPATH/system/lib64/vendor.huawei.hardware.graphics.gpucommon@1.0.so 644
  set_perm $MODPATH/system/lib64/vendor.huawei.hardware.graphics.mediacomm@2.0.so 644
  set_perm $MODPATH/system/lib64/hw/hwcomposer.hi3650.so 644
  set_perm $MODPATH/system/lib64/hw/vendor.huawei.hardware.graphics.displayeffect@1.0-impl.so 644
  set_perm $MODPATH/system/lib64/hw/vendor.huawei.hardware.graphics.mediacomm@2.0-impl.so 644
}

##########################################################################################
# MMT Extended Logic - Don't modify anything after this
##########################################################################################

SKIPUNZIP=1
unzip -qjo "$ZIPFILE" 'common/functions.sh' -d $TMPDIR >&2
. $TMPDIR/functions.sh
