# avahi-aliases

The [Avahi System](https://avahi.org/) facilitates service discovery on local networks using the
[Multicast DNS](https://en.wikipedia.org/wiki/Multicast_DNS)/[DNS-SD](https://en.wikipedia.org/wiki/Zero-configuration_networking#DNS-SD)
protocol suite.

The current implementation of Avahi (v0.8) does not yet support aliases (i.e.,
[CNAME records](https://en.wikipedia.org/wiki/CNAME_record)). Avahi-alias, in its many
variations, fills this gap.

This variation of avahi-alias provides:

- Python 3 compatibility,
- Avahi v0.8 compatibility,
- Systemd compatibility, and
- Full install and remove capability.

## Prerequisites

For proper installation and execution of this variation of avahi-alias, the following are
required:

  - [Python 3](https://www.python.org/). Python 3 is now the defacto version distributed with
    nearly all Linux distributions.

  - [Avahi v0.8](https://github.com/lathiat/avahi/releases/tag/v0.8). Avahi v0.8, released
    Feb 18, 2020, includes Python 3 bindings. Its availability varies across Linux
    distributions. In particular, many long-term support releases (e.g., Ubuntu 20.04 LTS) still include Avahi v0.7. (Although in the case of Ubuntu 20.04 LTS, it appears the Avahi v0.8
    packages available for
    [Debian Bulleye](https://packages.debian.org/search?keywords=avahi&searchon=names&suite=stable&section=all)
    can replace the v0.7 packages transparently. This has not been well tested!)

  - [Systemd](https://systemd.io/). The install and uninstall make targets work with Systemd.
    A rudimentary [init system](https://en.wikipedia.org/wiki/Init) script is also include.

## Installing and Removing

From the avahi-alias directory, run `make install`. This will install the scripts to
`/usr/local/bin`, setup systemd services, and start the service. Installation and removal
options include:

  - `make install` performs full installation (and reinstallation).
  - `make install-binaries` creates the `/etc/avahi/aliases` files and installes the
    scripts to `/usr/local/bin`.
  - `make install-unit` installs and starts the systemd service.
  - `make remove` performs a full removal.
  - `make remove-binaries` removes the scripts from `/usr/local/bin`.
  - `make remove-unit` stops and removes the systemd service.

*Note:* The install and remove make targets assume the current user has sudo rights and
executes most steps using `sudo`.

## Adding and removing aliases

Aliases are stored in `/etc/avahi/aliases`. Add and remove aliases by editing
`/etc/avahi/aliases` directly. Althernatively, use the `avahi-add-alias` and
`avahi-remove-alias` scripts. Examples:

  - `sudo avahi-add-alias alias1.local` adds `alias1.local` to `/etc/avahi/aliases`.
  - `sudo avahi-remove-alias alias1.local` removes `alias1.local` from `/etc/avahi/aliases`.

## Acknowledgements

- [Original Python 2 sources](http://www.avahi.org/wiki/Examples/PythonPublishAlias) (This is
  now offline. [Archive.org](https://archive.org) has an
  [archived copy](https://web.archive.org/web/20150902232833/http://www.avahi.org/wiki/Examples/PythonPublishAlias).)
- [Discussion](https://stackoverflow.com/questions/775233/how-to-route-all-subdomains-to-a-single-host-using-mdns?answertab=votes#tab-top)
  on Stack Overflow.
- [Original repo](https://github.com/airtonix/avahi-aliases) on GitHub.
- [Original systemd repo](https://github.com/5sw/avahi-aliases.git) on GitHub.
- [Service implementation](https://gist.github.com/gnue/ba0e9e6e52eac2d324d73dacefb0b6cf) gist.
