#!/bin/bash
# Description: From fresh Linux install to dream machine
# Author: DeedWark <github.com/DeedWark>
# Date: 2022-03-05
# Version: 1.0.0


pkg_mngr() {
  PACKAGES="curl wget vim git tmux"
	os_id=$(grep -iE '^ID=("|)' /etc/os-release)
	case ${os_id} in
	*debian* | *ubuntu*)
		apt-get update && \
		apt-get install -y ${PACKAGES}
		;;
	*centos* | *rhel* | *fedora* | *photon* | *amzn*)
		yum update && \
		yum install -y ${PACKAGES}
    ;;
	*arch* | *manjaro*)
		pacman -Syy --noconfirm && \
		pacman -S --noconfirm ${PACKAGES}
		;;
	*alpine*)
		apk update && \
		apk add --no-cache ${PACKAGES}
		;;
	*solus*)
		eopkg update-repo && \
		eopkg install -y ${PACKAGES}
		;;
	*opensuse*)
		zypper update -y && \
		zypper install -y ${PACKAGES}
		;;
	*gentoo*)
		emerge --sync && \
		emerge ${PACKAGES}
		;;
	*clear-linux-os*)
		swupd update && \
		swupd bundle-add ${PACKAGES}
		;;
	*mageia*)
		dnf update -y && \
		dnf install -y ${PACKAGES}
		;;
	esac
}

tmux_config() {
  curl -s "https://raw.githubusercontent.com/DeedWark/Linux-Tips/main/tmux.conf" \
       -o ${HOME}/.tmux.conf
}

vim_config() {
  mkdir -p ${HOME}/.vim/autoload ${HOME}/.vim/colors

  # Install Plug VIm
  curl -sfLo ${HOME}/.vim/autoload/plug.vim --create-dirs \
       "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

  # Install ayu-theme
  curl -s "https://raw.githubusercontent.com/ayu-theme/ayu-vim/master/colors/ayu.vim" \
       -o ${HOME}/.vim/colors/ayu.vim

  # Install my .vimrc
  curl -s "https://raw.githubusercontent.com/DeedWark/Linux-Tips/main/vimrc" \
       -o ${HOME}/.vimrc
  sed -i 's/colorscheme koehler/" colorscheme koehler/g' ${HOME}/.vimrc
  sed -i 's/^" //g' ${HOME}/.vimrc
}

main() {
	pkg_mngr
  tmux_config
  vim_config
  echo "Setup done | To configure vim: $> vim && \":PlugInstall\""
}

main "$@"
