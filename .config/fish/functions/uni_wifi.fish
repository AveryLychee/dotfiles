function uni_wifi
	sudo pkill NetworkManager
sudo wpa_supplicant -B -d nl80211 -i wlp1s0 -c /etc/wpa_supplicant.conf
sudo dhcpcd
end
