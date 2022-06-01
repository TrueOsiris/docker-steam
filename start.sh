#!/bin/bash
s=/mnt/steam/serverfiles
p=/mnt/steam/persistentdata
dedicated_server_id=""
if [ -z $TECH ]; then
	servertech="linux"
else 
	if [ $TECH == "wine" ]; then
		servertech="wine"
	else if [ $TECH == "wine64" ]; then
		servertech="wind64"
	else if [ $TECH == "mono" ]; then
		servertech="mono"
	else
		servertech="linux"
	fi
fi
if [ -z $DUMMYSCREEN ]; then
	DUMMYSCREEN=0
else
	if [ $DUMMYSCREEN == 1 || $DUMMYSCREEN == "true" || $DUMMYSCREEN == "TRUE" ]; then
		DUMMYSCREEN=1
	else 
		DUMMYSCREEN=0
	fi
fi
if [ -z $STEAMID ]; then
	echo "No STEAMID container parameter was set."
	echo "Exiting."
	exit 0
else
	dedicated_server_id=$STEAMID
fi
if [ -z $SERVERNAME ]; then
	SERVERNAME="trueosiris-steamserver"
fi
cd /tmp
rm -R /tmp/* 2>/dev/null
mkdir -p /root/.steam 2>/dev/null
chmod -R 777 /root/.steam 2>/dev/null
echo "Updating Dedicated Server files for steamid $dedicated_server_id"
/usr/bin/steamcmd +force_install_dir "$s" +login anonymous +app_update $dedicated_server_id +quit
echo "If succesfully updated/installed, we have an app id."
echo "steam_appid: "`cat $s/steam_appid.txt`
cd "$s"
echo "executables found:"
find . -iname "*.exe" -exec print "{}" \;
echo " "
if [ $DUMMYSCREEN == 1 ]; then
	echo "Trying to remove /tmp/.X0-lock"
	rm /tmp/.X0-lock 2>&1
	echo "Starting Xvfb"
	Xvfb :0 -screen 0 1024x768x16 &
fi
if [ -z EXECUTABLE ]; then
	echo "No EXECUTABLE parameter has been set"
	echo "Exiting."
	exit 0
fi
echo "Starting Dedicated Server with name \"$SERVERNAME\" using $servertech"
echo "Launching server"
echo " "
if [ $servertech == "wine64" ]; then
	if [ $DUMMYSCREEN == 1 ]; then
		DISPLAY=:0.0 wine64 $s/$EXECUTABLE -persistentDataPath $p -serverName "$SERVERNAME" -saveName "$WORLDNAME" 2>&1
	fi
fi
/usr/bin/tail -f /var/log/dpkg.log

