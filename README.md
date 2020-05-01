# avahi-aliases

This is a compilation/cleanup of various Avahi mDNS aliasing scripts to ensure they run on Debian `buster` on the Raspberry Pi as of 2020, so as to make it easier to run several virtual hosts in [`piku`](https://github.com/piku)

## Installing

	make install

## Adding aliases

You can edit `/etc/avahi/aliases` (all aliases in a single line or groups of aliases per line) and restart the service or use the bundled scripts:

	sudo avahi-add-alias foobar.local

## Acknowledgements
1. [Original sources](http://www.avahi.org/wiki/Examples/PythonPublishAlias)
2. [Discussion on stackoverflow](http://stackoverflow.com/questions/775233/how-to-route-all-subdomains-to-a-single-host-using-mdns?answertab=votes#tab-top)
3. [Original repo](https://github.com/airtonix/avahi-aliases)
4. [Original systemd repo](https://github.com/5sw/avahi-aliases.git)
5. [Service implementation](https://gist.github.com/gnue/ba0e9e6e52eac2d324d73dacefb0b6cf)

