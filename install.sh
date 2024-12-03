#!/usr/bin/env bash


# dotfiles directory
#dotfiledir="${HOME}/dotfiles"
dotfiledir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# list of files/folders to symlink in ${homedir}
files=(bashrc bash_aliases tmux.conf)

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd "${dotfiledir}" || exit

# create symlinks (will overwrite old dotfiles)
for file in "${files[@]}"; do
    echo "Creating symlink to ${dotfiledir}/.${file} in ${HOME}/.${file}"
    #ln -sf "${dotfiledir}/.${file}" "${HOME}/.${file}"
done

echo "Installation Complete!"
