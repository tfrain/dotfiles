## Dotfiles
Installing brew, git. configure git config and ssh, then download this repo.
After cloning this repo, run `./install` to automatically set up your development
config.

**NB**: .zshrc and .gitconfig will be forcibly replaced. and it only tested in macbook
m1.

## Using the config
You need to execute a series of commands
```bash
1. sudo chsh -s /bin/zsh <username>
2. source ~/.zshrc
3. use link:
   https://raw.githubusercontent.com/tfrain/dotfiles/master/surfingkeys.js for
   surfingkeys
3. brew install neovim node tmux git-delta in macos or sudo apt install neovim tmux in
   linux
4. cd nvim && sh install.sh
5. python3 -m pip install --user --upgrade pynvim # for defx
6. npm i -g bash-language-server # for bash
```
If you want to use vim mode copy content to clipboard, you need to choose General->Selection->Applications in terminal... in iterm2.
<center>
  <img src="https://user-images.githubusercontent.com/39027451/218295128-ed1894df-99b2-4f8f-90a9-08836e1caf93.png" height="500", weight="800"/>
</center>
