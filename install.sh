#!/bin/bash

####################################################################################################
#																								   #
# author Carlos Alberto<karloswebmaster@gmail.com												   #
#																								   #
# Este programa fará a instalação das configurações para uso no nvim                               #
# Version: 1 Versão inicial                                                                        #
# Version: 2 -> Implementação do download do gerenciado de plugins Vunddle					       #
# Version: 3 -> Correção de bugs e suporte a atualização das versões mais recentes                 #
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

# Clona um repositório ou atualiza para a versão mais recente se já existir
git_install_or_update() {
    local repo="$1"
    local dir="$2"
    local extra_flags="${3:-}"
    if [ -d "$dir/.git" ]; then
        echo "Atualizando $(basename $dir)..."
        git -C "$dir" pull
    else
        git clone $extra_flags "$repo" "$dir"
    fi
}

echo -e "Atualizando o sistema"
sudo apt update && sudo apt upgrade -y
sudo apt install powerline fonts-powerline uuid-runtime zsh wget git fonts-powerline -y

# vim-plug: sempre baixa a versão mais recente
echo "Instalando/atualizando vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# neovim
if [ ! -d ~/.config/nvim ]; then
    sudo apt-get install -y neovim
    mkdir -p ~/.config/nvim
else
    sudo apt-get install -y --only-upgrade neovim 2>/dev/null || true
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

# fzf
git_install_or_update https://github.com/junegunn/fzf.git ~/.fzf "--depth 1"
~/.fzf/install --all --no-update-rc
echo "Configuração FZF realizada com sucesso."

# oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "Atualizando oh-my-zsh..."
    git -C ~/.oh-my-zsh pull
fi

rm -rf ~/.zshrc
ln -s ~/.myvimrc/.zshrc ~/.zshrc

echo -e "Configuração ZSH realizada com sucesso."

# zsh plugins
git_install_or_update \
    https://github.com/zsh-users/zsh-autosuggestions \
    "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
echo "ZSH: Plugin AutoComplete"

git_install_or_update \
    https://github.com/zsh-users/zsh-syntax-highlighting.git \
    "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
echo "ZSH: Plugin Hilight"

# tmux
rm -rf ~/.tmux.conf
ln -s ~/.myvimrc/.tmux.conf ~/.tmux.conf
git_install_or_update https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf 2>/dev/null || true

echo -e "Configuração do TMUX executada com sucesso."
