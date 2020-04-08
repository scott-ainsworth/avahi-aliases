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


Ubuntu 18+, Debian
------------------
Requires python-dbus, python-avahi

