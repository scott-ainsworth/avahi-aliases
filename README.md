Avahi Aliases!
==============

Do this:
--------

### Install and setup

    sudo ./install-systemd.sh
    #add aliases to /etc/avahi/aliases
    sudo avahi-publish-aliases

### Uninstall

    sudo ./uninstall-systemd.sh

### systemd

Included is an installer for a systemd service. Tested this on Ubuntu 18.x.

    sudo ./install-systemd


### Ubuntu 18+, Debian
Requires python-dbus, python-avahi


Usage
-----

### Daemon Control:

```
	sudo service avahi-alias start
	sudo service avahi-alias restart
	sudo service avahi-alias stop
```

### Creating Aliases
1. `sudo nano /etc/avahi/aliases.d/default`
2. insert something.local on a new line
3. save
4. ???
5. profit

### Notes:
	* aliases must end in `.local`
	* One alias per line
	* blank lines are ignored
	* lines prefixed with `#` are ignored
	* you must manually restart the daemon after modifying alias files
    
Contributions & acknowledgements :
----------------------------------
1. Original sources from avahi: http://www.avahi.org/wiki/Examples/PythonPublishAlias
2. Discussion on stackoverflow: http://stackoverflow.com/questions/775233/how-to-route-all-subdomains-to-a-single-host-using-mdns?answertab=votes#tab-top
3. Original github repo: https://github.com/airtonix/avahi-aliases
4. Original systemd repo : https://github.com/5sw/avahi-aliases.git
5. Service implementation : https://gist.github.com/gnue/ba0e9e6e52eac2d324d73dacefb0b6cf

