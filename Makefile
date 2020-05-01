deps:
	sudo apt install python-avahi python-dbus

install: deps install-binaries install-unit

install-binaries:
	sudo cp bin/avahi* /usr/local/bin

install-unit:
	@echo ">>> Installing systemd unit"
	sudo cp etc/avahi-alias.service /etc/systemd/system/
	sudo systemctl daemon-reload
	@echo ">>> Enabling systemd unit"
	sudo systemctl enable avahi-alias.service
	sudo systemctl restart avahi-alias.service
	sudo systemctl status avahi-alias.service
	@echo ">>> Install done.\n Add aliases to /etc/avahi/aliases or /etc/avahi/aliases.d/* and use\n    sudo systemctl <start|stop|status> avahi-alias.service\n"

uninstall-unit:
	@echo ">>> Uninstallling systemd unit"
	sudo systemctl stop avahi-alias.service
	sudo systemctl disable avahi-alias.service
	sudo rm /etc/systemd/system/avahi-alias.service
	sudo systemctl daemon-reload
	@echo ">>> Uninstall done."
