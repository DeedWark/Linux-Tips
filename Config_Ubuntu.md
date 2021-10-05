## Config Ubuntu

- Reconfigure the keyboard
```bash
dpkg)reconfigure keyboqrd)configurqtion
dpkg-reconfigure keyboard-configuration
```
- If this does not work
```bash
loadkeys fr
```

- Configure the Wi-Fi
```bash
vim /etc/netplan/50-cloud-init.yaml
```
```yaml
# BELOW
wifis:
   wlan0:
      optional: true
      access-points:
         "SSID-NAME-HERE"
            password: "PASSWORD"
      dhcp4: true
```
```bash
netplan apply
```

- Config network
```bash
vim /etc/netplan/99-config.yaml
```
```yaml
network:
   version: 2
   renderer: networkd
   ethernets:
      eth0:
         addresses:
            - 10.10.10.1/24
         gateway4: 10.10.10.254
         nameservers:
            addresses: [10.10.10.1, 1.1.1.1]
```
```
netplan apply
```
