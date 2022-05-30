#!/bin/bash
# Description: From fresh Linux install to dream machine (package installer) - root needed
# Author: DeedWark <github.com/DeedWark>
# Date: 2022-05-30
# Version: 1.0.0

check_uid() {
	[[ "${UID}" -ne 0 ]] &&
		echo 'You are not root!' &&
		exit 1
}

pkg_mngr() {
	PACKAGES="curl wget vim git tmux"
	os_id=$(grep -iE '^ID=("|)' /etc/os-release)

	case ${os_id} in
	*debian* | *ubuntu*)
		apt-get update &&
			apt-get install -y ${PACKAGES}
		;;
	*centos* | *rhel* | *fedora* | *photon* | *amzn* | *oracle* | *ol*)
		yum update &&
			yum install -y ${PACKAGES}
		;;
	*arch* | *manjaro*)
		pacman -Syy --noconfirm &&
			pacman -S --noconfirm ${PACKAGES}
		;;
	*alpine*)
		apk update &&
			apk add --no-cache ${PACKAGES}
		;;
	*solus*)
		eopkg update-repo &&
			eopkg install -y ${PACKAGES}
		;;
	*opensuse*)
		zypper update -y &&
			zypper install -y ${PACKAGES}
		;;
	*gentoo*)
		emerge --sync &&
			emerge ${PACKAGES}
		;;
	*clear-linux-os*)
		swupd update &&
			swupd bundle-add ${PACKAGES}
		;;
	*mageia*)
		dnf update -y &&
			dnf install -y ${PACKAGES}
		;;
	esac
}
