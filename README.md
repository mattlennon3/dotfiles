# My Dotfiles

Config backups, helpful scripts etc

## Cloning to a new machine:
- `mkdir $HOME/git/dots/`
- `cd $HOME/git/dots/`
- `git clone --bare git@github.com:mattlennon3/dotfiles.git --branch macbook my-symlinked-dotfiles`

For a local non-bare copy of the repo:
- `cd $HOME/git/dots/; git clone --bare git@github.com:mattlennon3/dotfiles.git --branch macbook`
- `alias dotf='/usr/bin/git --git-dir=$HOME/git/dots/my-symlinked-dotfiles/ --work-tree=$HOME'`
- `dotf config --local status.showUntrackedFiles no`
- `cd $HOME`

Restore core files: (.gitignore is very important to stop all untracked files showing when you run `dotf status` .zshrc and .bash_aliases are good to restore too):
- `dotf restore --staged .gitignore; dotfiles checkout .gitignore`
- `dotf restore --staged .zshrc; dotfiles checkout .zshrc`
- `dotf restore --staged .bash_aliases; dotfiles checkout .bash_aliases`

Continue restoring files

## Dotfile setup info/sources
https://www.atlassian.com/git/tutorials/dotfiles
https://www.youtube.com/watch?v=tBoLDpTWVOM
https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b
