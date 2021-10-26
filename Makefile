deps:
	sudo apt install -y python3-avahi python3-dbus

install: install-binaries install-unit

install-binaries: deps
	@echo ">>> Create /etc/avahi/aliases"
	sudo touch /etc/avahi/aliases
	@echo ">>> Install executables to /usr/local/bin"
	sudo cp bin/avahi-* /usr/local/bin

install-unit:
	@echo ">>> Install systemd unit"
	sudo cp etc/avahi-alias.service /etc/systemd/system/
	sudo chmod -x /etc/systemd/system/avahi-alias.service
	@echo ">>> Enable systemd unit"
	sudo systemctl daemon-reload
	sudo systemctl enable avahi-alias.service
	@echo ">>> Start systemd unit"
	sudo systemctl restart avahi-alias.service
	sudo systemctl status avahi-alias.service
	@echo ">>> Install complete."
	@echo ">>> Add aliases to /etc/avahi/aliases."
    @echo ">>> Use sudo systemctl <start|stop|status> avahi-alias.service\n"

uninstall: uninstall-unit uninstall-binaries

uninstall-binaries:
	@echo ">>> Remove executables from /usr/local/bin"
	sudo rm -f avahi-add-alias
	sudo rm -f avahi-list-aliases
	sudo rm -f avahi-publish-aliases
	sudo rm -f avahi-publish-domain-alias
	sudo rm -f avahi-uninstall-alias
	@echo ">>> /etc/avahi/aliases and /etc/avahi/aliases.d have NOT been removed."

uninstall-unit:
	@echo ">>> Uninstall systemd unit"
	sudo systemctl stop avahi-alias.service
	sudo systemctl disable avahi-alias.service
	sudo rm /etc/systemd/system/avahi-alias.service
	sudo systemctl daemon-reload
