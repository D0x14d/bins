#!/usr/bin/bash
set -e

#installing dependencies
if ! command -v curl git wget &>/dev/null; then
	echo "Installing dependencies"
	sudo apt update
	sudo apt install curl git wget -y
fi

#space for future dependencies
function space {
	echo -e "\n"
}

clear

printf "\e[0;34m1.lsd \n2.bat \n3.fd \n4.ripgrep \n5.fzf \n6.jq \n7.sd \n8.cheat \n9.tldr \n10.zoxide \n\e[0m\n"
printf '\e[1;33m[Note]: \e[0m\e[1;32mAll tools install automatically \e[0m\n'

# checking os for installing tools
if [ -f /etc/apt/sources.list ]; then
	echo -e "\e[1;32mDebian based OS detected\e[0m"
fi

#installing tools user choice number of tools installation
read -p $'\n\e[1;34mEnter the number of tools you want to install\e[0m[eg: 1 3 5 6]: ' -a install_tools

for i in "${install_tools[@]}"; do
	case $i in
	1)
		printf "\e[1;33m[Note]: \e[0m\e[1;31mInstalling lsd \e[0m\n"
		wget https://github.com/Peltoche/lsd/releases/download/0.23.1/lsd_0.23.1_amd64.deb && sudo dpkg -i lsd_0.23.1_amd64.deb
		rm -rf lsd_0.23.1_amd64.deb
		space
		;;
	2)
		printf "\e[1;33m[Note]: \e[0m\e[1;31mInstalling bat \e[0m\n"
		wget https://github.com/sharkdp/bat/releases/download/v0.22.1/bat_0.22.1_amd64.deb && sudo dpkg -i bat_0.22.1_amd64.deb
		rm -rf bat_0.22.1_amd64.deb
		space
		;;
	3)
		printf "\e[1;33m[Note]: \e[0m\e[1;31mInstalling fd \e[0m\n"
		wget https://github.com/sharkdp/fd/releases/download/v8.4.0/fd_8.4.0_amd64.deb && sudo dpkg -i fd_8.4.0_amd64.deb
		rm -rf fd_8.4.0_amd64.deb
		space
		;;
	4)
		printf "\e[1;33m[Note]: \e[0m\e[1;31mInstalling ripgrep \e[0m\n"
		wget https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb && sudo dpkg -i ripgrep_13.0.0_amd64.deb
		rm -rf ripgrep_13.0.0_amd64.deb
		space
		;;
	5)
		printf "\e[1;33m[Note]: \e[0m\e[1;31mInstalling fzf \e[0m\n"
		sudo apt install fzf
		space
		;;
	6)
		printf "\e[1;33m[Note]: \e[0m\e[1;31mInstalling jq \e[0m\n"
		sudo apt install -y jq
		space
		;;
	7)
		printf "\e[1;33m[Note]: \e[0m\e[1;31mInstalling sd \e[0m\n"
		read -p "Depanding on cargo packagemanger .Do yout want to install [y/n] " sd
		case $sd in
		[yY][eE][sS] | [yY])
			sudo apt install -y cargo
			cargo install sd
			echo "export PATH=$PATH:$HOME/.cargo/bin" >>~/.bashrc && echo "export PATH=$PATH:$HOME/.cargo/bin" >>~/.zshrc
			echo "Relaod your terminal"
			space
			;;
		[nN][oO] | [nN])
			printf "\e[1;33m[Note]: \e[0m\e[1;32mSkipping sd \e[0m\n"
			;;

		esac

		;;
	8)
		printf "\e[1;33m[Note]: \e[0m\e[1;31mInstalling cheat \e[0m\n"
		sudo apt install gzip
		wget https://github.com/cheat/cheat/releases/download/4.3.3/cheat-linux-amd64.gz && gunzip cheat-linux-amd64.gz
		sudo mv cheat-linux-amd64 /usr/bin/cheat
		sudo chmod +x /usr/bin/cheat
		space
		;;
	9)
		printf "\e[1;33m[Note]: \e[0m\e[1;31mInstalling tldr \e[0m\n"
		curl -fsSL https://fnm.vercel.app/install | bash
    echo 'eval "$(fnm env --use-on-cd)"' >> ~/.bashrc && echo 'eval "$(fnm env --use-on-cd)"' >> ~/.zshrc
		sudo npm install -g tldr || npm install -g tldr
		space
		;;
	10)
		printf "\e[1;33m[Note]: \e[0m\e[1;31mInstalling zoxide \e[0m\n"
		wget https://github.com/ajeetdsouza/zoxide/releases/download/v0.8.3/zoxide_0.8.3_amd64.deb && sudo dpkg -i zoxide_0.8.3_amd64.deb
		rm -rf zoxide_0.8.3_amd64.deb
		printf '\e[1;33m[Note]: \e[0m\e[1;32mAdd this line to your .bashrc or .zshrc file [eval $(zoxide init (bash/zsh))] \e[0m\n'
		echo 'eval "$(zoxide init bash)"' >>~/.bashrc && echo 'eval "$(zoxide init zsh)"' >>~/.zshrc
		source ~/.bashrc || source ~/.zshrc
		space
		;;
	*)
		printf "\e[1;31m[Error]: \e[0m\e[1;32mInvalid option \e[0m\n"
		;;
	esac
done

#repor for any issues on github page
echo -e "\e[1;33m[Note]: \e[0m\e[1;32mIf you have any issues please report on github page \e[0m\n"
echo -e "\e[1;33m[Note]: \e[0m\e[1;32mhttps://github.com/aunknownwhoami \e[0m\n"
