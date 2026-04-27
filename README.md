# myvimrc

Configurações pessoais de ambiente de desenvolvimento para Neovim, Vim, ZSH, TMUX e IdeaVim.

## Requisitos

- Ubuntu/Debian
- Git
- curl

## Instalação

```bash
git clone git@github.com:ksoaresk/vimrc.git ~/.myvimrc
cd ~/.myvimrc
chmod +x install.sh
./install.sh
```

O script instala e configura automaticamente:

- **Neovim / Vim** com vim-plug e symlink para `~/.config/nvim/init.vim`
- **ZSH** com Oh-My-Zsh, zsh-autosuggestions e zsh-syntax-highlighting
- **TMUX** com TPM e plugins de sessão
- **FZF** com integração ao shell
- **IdeaVim** (JetBrains IDEs)

Após a instalação, abra o Neovim e execute `:PlugInstall` para instalar os plugins.

## Estrutura

```
.myvimrc/
├── .vimrc              # Entry point — carrega todos os módulos
├── conf.vim            # Configurações gerais do editor
├── keys.vim            # Keybindings
├── plugins.vim         # Orquestrador de plugins (vim-plug)
├── fzf_config.vim      # Configurações do FZF
├── php_config.vim      # Configurações para PHP
├── plugins/
│   ├── essentials.vim           # Plugins essenciais
│   ├── codification-development.vim  # Plugins de desenvolvimento
│   └── themes.vim               # Temas e statusline
├── .zshrc              # Configuração do ZSH
├── .tmux.conf          # Configuração do TMUX
├── .ideavimrc          # Configuração do IdeaVim (JetBrains)
└── install.sh          # Script de instalação/atualização
```

## Plugins Vim

### Essenciais
| Plugin | Descrição |
|--------|-----------|
| NERDTree | Árvore de arquivos |
| vim-fugitive | Integração com Git |
| vim-gitgutter | Indicadores de diff no gutter |
| fzf + fzf.vim | Busca fuzzy de arquivos e texto |
| tcomment_vim | Comentar/descomentar código |
| auto-pairs | Fechamento automático de delimitadores |
| vim-surround | Manipulação de delimitadores |
| blamer.nvim | Git blame inline |

### Desenvolvimento
| Plugin | Descrição |
|--------|-----------|
| coc.nvim | LSP client (autocomplete, diagnósticos) |
| phpactor | Language server e refactoring PHP |
| vim-php-cs-fixer | PHP Code Style (PSR-2) |
| vim-php-namespace | Gerenciamento de namespaces PHP |
| typescript-vim | Suporte a TypeScript |
| vim-jsx-typescript | Suporte a TSX/JSX |
| vim-go | Suporte a Golang |
| emmet-vim | Expansão HTML/CSS |
| tagbar | Browser de símbolos/tags |

### Temas
gruvbox (padrão) · OceanicNext · Dracula · Solarized · VSCode · Darcula

## Keybindings principais

| Atalho | Ação |
|--------|------|
| `<Space>` | Leader key |
| `Ctrl+p` | FZF — git files |
| `Ctrl+i` | FZF — todos os arquivos |
| `Ctrl+e` | FZF — busca com ripgrep |
| `Ctrl+l` | FZF — linhas do buffer |
| `Shift+b` | FZF — buffers abertos |
| `F7` | Toggle NERDTree |
| `F8` | Toggle Tagbar |
| `F9` | Executar arquivo |
| `F12` | Toggle terminal |
| `Ctrl+s` | Salvar |
| `Ctrl+q` | Fechar todos |
| `gd` | Ir para definição (Coc) |
| `gr` | Referências (Coc) |
| `<leader>rn` | Renomear símbolo (Coc) |
| `<leader>bn/bp` | Próximo/anterior buffer |
| `<leader>gb` | Git blame |
| `<leader>dff` | Git diff |
| `<leader>pcf` | PHP CS Fixer — arquivo |
| `<leader>pcd` | PHP CS Fixer — diretório |
| `Alt+j/k` | Mover linha para baixo/cima |

## ZSH

- **Tema**: avit
- **Plugins**: git, git-flow, zsh-autosuggestions, zsh-syntax-highlighting
- **Ferramentas**: FZF, NVM, SDKMAN

## TMUX

| Plugin | Descrição |
|--------|-----------|
| tmux-sensible | Configurações padrão sensatas |
| tmux-yank | Cópia para clipboard do sistema |
| tmux-resurrect | Restauração manual de sessões |
| tmux-continuum | Salvamento automático a cada 15 min |

Navegação entre painéis com `h/j/k/l` (estilo Vi).
