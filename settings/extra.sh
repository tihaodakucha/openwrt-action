#!/bin/bash

workdir=$(pwd)
confdir="$workdir/../settings"

### Add packages
mkdir package/external
cd package/external || return 1

### Add config
cat >> "$confdir/extra.conf" <<EOF

# 5G模组必备驱动
CONFIG_PACKAGE_kmod-usb-net-qmi-wwan=y
CONFIG_PACKAGE_kmod-usb-net-cdc-ether=y
CONFIG_PACKAGE_uqmi=y
CONFIG_PACKAGE_luci-proto-qmi=y
CONFIG_PACKAGE_kmod-usb-serial-option=y
CONFIG_PACKAGE_kmod-usb-serial-qualcomm=y
CONFIG_PACKAGE_comgt=y

# 中文界面
CONFIG_PACKAGE_luci-i18n-base-zh-cn=y
CONFIG_PACKAGE_luci-i18n-firewall-zh-cn=y

EOF

### Merge config
cd "$confdir" || return 1
cat extra.conf >> system.conf

cd "$workdir" || return 1
