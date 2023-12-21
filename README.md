# Colorize
 
 Zsh plugin that add color configs for various apps. It improves the output of `gcc`, `grep` and some coreutils apps

## How to install

### This plugin depends on [zsh-colors](https://github.com/zpm-zsh/colors)

If you don't use [zpm](https://github.com/zpm-zsh/zpm), install it manually and activate it before this plugin. 
If you use zpm you don’t need to do anything

### [zpm](https://github.com/zpm-zsh/zpm)

Add the following to your .zshrc file somewhere after you source zpm.

```sh
zpm load zpm-zsh/colorize
```

### [oh-my-zsh](http://github.com/robbyrussell/oh-my-zsh)

* Download the script or clone this repository in [oh-my-zsh](http://github.com/robbyrussell/oh-my-zsh) plugins directory:

```sh
cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zpm-zsh/colorize.git
```

* Activate the plugin in `~/.zshrc`:

```sh
plugins=( [plugins...] colorize [plugins...])
```

* Restart shell

### [antigen](https://github.com/zsh-users/antigen)

Add `antigen bundle zpm-zsh/colorize` to your .zshrc where you're adding your other plugins. Antigen will clone the plugin for you and add it to your antigen setup the next time you start a new shell.

### [zinit](https://github.com/zdharma-continuum/zinit)

Add `zinit load zdharma-continuum/colorize` to your .zshrc, and Zinit will automatically handle cloning the plugin for you the next time you start zsh.

### [zplug](https://github.com/zplug/zplug)

Add the following to your .zshrc file somewhere after you source zplug.

```sh
zplug "zpm-zsh/colorize"
```
