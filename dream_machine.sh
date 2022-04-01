#!/bin/bash
# Description: From fresh Linux install to dream machine
# Author: DeedWark <github.com/DeedWark>
# Date: 2022-03-05
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

tmux_config() {
	$(which curl) -s "https://raw.githubusercontent.com/DeedWark/Linux-Tips/main/tmux.conf" \
		-o ${HOME}/.tmux.conf
}

vim_config() {
	mkdir -p ${HOME}/.vim/autoload ${HOME}/.vim/colors

	# Install Plug VIm
	$(which curl) -sfLo ${HOME}/.vim/autoload/plug.vim --create-dirs \
		"https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

	# Install ayu-theme
	$(which curl) -s "https://raw.githubusercontent.com/ayu-theme/ayu-vim/master/colors/ayu.vim" \
		-o ${HOME}/.vim/colors/ayu.vim

	# Install my .vimrc
	$(which curl) -s "https://raw.githubusercontent.com/DeedWark/Linux-Tips/main/vimrc" \
		-o ${HOME}/.vimrc
	sed -i 's/^" //g' ${HOME}/.vimrc
	sed -i 's/colorscheme koehler/" colorscheme koehler/g' ${HOME}/.vimrc
}

aliases_config() {
	# Check if .bash_aliases is set in .bashrc
	if [[ -f "${HOME}/.bashrc" ]]; then

		if grep -Eq "^if \[ .+bash_aliases" ${HOME}/.bashrc; then
			continue
		else
			echo -ne "\nif [ -f ~/.bash_aliases ]; then\n\t. ~/.bash_aliases\nfi" >>${HOME}/.bashrc
		fi

		if [[ -f "${HOME}/.bash_aliases" ]]; then
			echo "" >>${HOME}/.bash_aliases
			$(which curl) -s \
				"https://raw.githubusercontent.com/DeedWark/Linux-Tips/main/bash_aliases" \
				>>${HOME}/.bash_aliases
		else
			$(which curl) -s \
				"https://raw.githubusercontent.com/DeedWark/Linux-Tips/main/bash_aliases" \
				-o ${HOME}/.bash_aliases
		fi

	fi
}

man_pp() {
	$(which curl) -s "https://raw.githubusercontent.com/DeedWark/Linux-Tips/main/man%2B%2B" \
		-o ${HOME}/manify
	mv ${HOME}/manify /usr/bin/manify
	if [[ -f "${HOME/.bash_aliases/}" ]]; then
		if grep -qE "^if \[ -f ~/.bash_aliases" ${HOME}/.bashrc; then
			echo "alias man='manify'" >>${HOME}/.bash_aliases
		fi
	elif [[ -f "${HOME}/.bashrc" ]]; then
		echo "alias man='manify'" >>${HOME}/.bashrc
	else
		echo "You does not have any .bashrc/.bash_aliases files."
		echo "Add manually \"alias man='manify'\" to your .<shell>rc file."
	fi
}

main() {
	check_uid
	pkg_mngr
	tmux_config
	vim_config
  aliases_config
	man_pp
	echo
	echo "Setup done \!"
	echo
}

main "$@"
