# dotfiles

## how to install

1. install `stow` with your package manager:
```
sudo apt install stow
```
```
sudo dnf install stow
```
```
sudo pacman -S stow
```

2. get submodules:
```
git submodule update --init --remote --recursive
```

3. run stow:
```
stow -t ~ */
```
