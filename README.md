# CatFly's dotfiles

AKA. [Operation Phoenix](https://rickandmorty.fandom.com/wiki/Operation_Phoenix)

![Rick and Morty: Rick's backup vet](https://vignette.wikia.nocookie.net/rickandmorty/images/9/92/ProjectPheonix.png/revision/latest?cb=20150914192404)

# Installation

Clone this project to `$HOME` as a bare repo

```
git clone --bare https://github.com/CatFlyFlyFly/dotfiles $HOME/.dotfiles
```

Install brew

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install everything else

```
brew bundle
```

## Optional: regain zsh_history

```
cp .zsh_history.backup .zsh_history
```

Be sure to backup this from time to time!

# Update This

Just replace `git` with `dotfiles` and use it like git

```
dotfiles add Brewfile
dotfiles status
dotfiles commit -m "add more cask to Brewfile"
dotfiles push origin master
```

to hide other files in `$HOME` from dotfiles repo, use

```
dotfiles config --local --add status.showUntrackedFiles no
```
