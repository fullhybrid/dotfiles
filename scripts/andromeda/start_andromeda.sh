#!/bin/bash
echo "Andromeda Start Shell Script by [projekt.] development team"
echo ""
echo "This requires projekt.andromeda to be installed on the device"
echo "Make sure the device is connected and ADB option enabled"
echo "Please only have one device connected at a time to use this!"
echo ""
read -n 1 -s -r -p "Press any key to continue..."
echo ""
echo ""

# Get the current directory of the device running this script 
ROOT=$(dirname $0)

# ADB specific commands for termination
adb kill-server
adb start-server

# Device configuration of the testing rack
ADB="adb shell"

# Let's first grab the location where Andromeda is installed
pkg=$($ROOT/$ADB pm path projekt.andromeda)
echo "$pkg"

# Due to the way the output is formatted, we have to strip 10 chars at the start
pkg=$(echo $pkg | cut -d : -f 2 | sed s/\\r//g)

# Now let's kill the running Andromeda services on the mobile device
kill=$($ROOT/$ADB pidof andromeda)

# Check if we need to kill the existing pids, then kill them if need be
if [[ "$kill" == "" ]]
then echo
$ROOT/$ADB << EOF
am force-stop projekt.substratum
appops set projekt.andromeda RUN_IN_BACKGROUND allow
appops set projekt.substratum RUN_IN_BACKGROUND allow
CLASSPATH=$pkg app_process /system/bin --nice-name=andromeda projekt.andromeda.Andromeda &
echo "You can now remove your device from the computer!"
exit
EOF
else echo
$ROOT/$ADB << EOF
am force-stop projekt.substratum
kill -9 $kill
appops set projekt.andromeda RUN_IN_BACKGROUND allow
appops set projekt.substratum RUN_IN_BACKGROUND allow
CLASSPATH=$pkg app_process /system/bin --nice-name=andromeda projekt.andromeda.Andromeda &
echo "You can now remove your device from the computer!"
exit
EOF
fi

# We're done!
adb kill-server