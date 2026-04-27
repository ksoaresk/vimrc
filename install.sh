#!/bin/bash

####################################################################################################
#																								   #
# author Carlos Alberto<karloswebmaster@gmail.com												   #
#																								   #
# Este programa fará a instalação das configurações para uso no nvim                               #
# Version: 1 Versão inicial                                                                        #
# Version: 2 -> Implementação do download do gerenciado de plugins Vunddle					       #
#																								   #
####################################################################################################

readonly TEXT_HELP="Uso: $(basename ${0}) [-h | --help]\n\n
	-h --help Mostra esta tela de ajuda\n
	-v --version Mostra a versão da aplicação"

case "$1" in
	-h | --help)
		echo -e $TEXT_HELP
		exit 0;
		;;
	-v | --version)
		echo -e "\n\n"
		grep "^# Versio" $0 | tr -d \# | tr -d : | tail -1
		echo -e "\n\n"
		exit 0;
		;;
	*)
		if test -n "$1"
		then
			echo "Opção inválida."
			exit 1;
		fi
		;;
esac

echo -e "Atualizando o sistema"
sudo apt update && sudo apt upgrade -y
sudo apt install powerline fonts-powerline -y

echo -e "Instalando uuid-runtime"
sudo apt-get install uuid-runtime -y 

if [ ! -d ~/.vim/plugged ];
then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ ! -d ~/.config/nvim ];
then
	sudo apt-get install -y neovim
	mkdir -p ~/.config/nvim
fi

rm -rf ~/.config/nvim/init.vim
ln -s ~/.myvimrc/.vimrc ~/.config/nvim/init.vim 

echo -e "Configuração NVIM realizada com sucesso. Agora abra o seu NVIM e digite no modo normal \033[01;32m:PlugInstall\033[01;37!"

	
rm -rf ~/.vimrc
ln -s ~/.myvimrc/.vimrc ~/.vimrc

echo -e "Configuração VIM realizada com sucesso.
	Agora abra o seu VIM e digite no modo normal \033[01;32m:PlugInstall\033[01;37!"

rm -rf ~/.ideavimrc
ln -s ~/.myvimrc/.ideavimrc ~/.ideavimrc

echo -e "Configuração IDEAVIM realizada com sucesso." 

if [ ! -d ~/.fzf ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

echo  "Configuração FZF realizada com sucesso." 

#sudo apt install zsh -y
sudo apt install zsh wget git fonts-powerline -y
if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

rm -rf ~/.zshrc
ln -s ~/.myvimrc/.zshrc ~/.zshrc 

echo -e "Configuração ZSH realizada com sucesso." 

if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi
echo "ZSH: Plugin AutoComplete"

if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi
echo "ZSH: Plugin Hilight"

rm -rf ~/.tmux.conf
ln -s ~/.myvimrc/.tmux.conf ~/.tmux.conf
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
tmux source ~/.tmux.conf 2>/dev/null || true

echo -e "Configuração do TMUX executada com sucesso." 
