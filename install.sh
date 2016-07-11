#!/bin/bash

set -o errexit -o nounset -o pipefail
SCRIPT_PATH="$(dirname $(readlink -f "$0"))"

if [[ $1 = zshrc || $1 = zsh ]]; then
	echo '#This file was generated from dotfiles' > ~/.zshrc
    echo '#All changes made here will be overwritten on update' >> ~/.zshrc

    cat "$SCRIPT_PATH"/zsh/other.zsh >> ~/.zshrc

    echo '# history setup --------------------------------------------------------' >> ~/.zshrc
    cat "$SCRIPT_PATH"/zsh/history.zsh >> ~/.zshrc
    echo '# ----------------------------------------------------------------------' >> ~/.zshrc
    echo '' >> ~/.zshrc

    echo '# key bindings ---------------------------------------------------------' >> ~/.zshrc
    cat "$SCRIPT_PATH"/zsh/key_bindings.zsh >> ~/.zshrc
    echo '# ----------------------------------------------------------------------' >> ~/.zshrc
    echo '' >> ~/.zshrc

    echo '# prompt setup ---------------------------------------------------------' >> ~/.zshrc
    cat "$SCRIPT_PATH"/zsh/prompt.zsh >> ~/.zshrc
    echo '# ----------------------------------------------------------------------' >> ~/.zshrc
    echo '' >> ~/.zshrc

    echo '# window title setup ---------------------------------------------------' >> ~/.zshrc
    cat "$SCRIPT_PATH"/zsh/window_title.zsh >> ~/.zshrc
    echo '# ----------------------------------------------------------------------' >> ~/.zshrc
    echo '' >> ~/.zshrc

    echo '# aliases --------------------------------------------------------------' >> ~/.zshrc
    cat "$SCRIPT_PATH"/zsh/aliases.zsh >> ~/.zshrc
    echo '# ----------------------------------------------------------------------' >> ~/.zshrc
    echo '' >> ~/.zshrc

    echo '# functions setup ------------------------------------------------------' >> ~/.zshrc
    cat "$SCRIPT_PATH"/zsh/functions.zsh >> ~/.zshrc
    echo '# ----------------------------------------------------------------------' >> ~/.zshrc
fi
