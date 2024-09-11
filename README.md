# nvim-tlv 
This is a [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) fork with some configuration targeted to c++ development in Televic. 

## Prerequisites

Install neovim.
Execute the following to get the latest stable version:

```sh
git clone git@github.com:neovim/neovim.git
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=Release
sudo make install
```

## Install this configuration

1. Fork/Copy this repo so you can make further adjustments
2. Clone this repo in your `$XGD_CONFIG_HOME` or `$HOME/.config` directory.
```sh
cd $HOME/.config
git clone git@github.com:aaronhallaert/nvim-tlv.git
```

If you already have a `$HOME/.config/nvim` directory, you can test out this configuration with the following command:
```sh
NVIM_APPNAME=nvim-tlv nvim
```

3. Edit the file `lua/televic/init.lua` to your personal settings
4. (optional) Rename the folder to `nvim`

If you cloned your own fork, you can rename or symlink to `$HOME/.config/nvim`

```sh
ln -s $HOME/.config/nvim-tlv $HOME/.config/nvim
```

Now you can open nvim without the `NVIM_APPNAME`

## Start customizing your nvim experience 

Edit `init.lua` according to your likings.

Or load in some old vimscript  with 
```lua
-- first copy the `basic.vim` into this folder
-- then append this line to the root init.lua
vim.cmd('source ' .. vim.fn.stdpath 'config' .. '/basic.vim')
```

## Usage

The configuration is mainly intended for usage with `plixus_apps`.
To fetch the `televic sdk` it is recommended to first use the `./build_pc.sh` scripts in the `build_scripts` repo.

### Plugins

> ⚠️ sonarlint will not run in connected mode, so nvim will show all warnings

Plugins installed for development in `plixus_apps`

- sonarlint.nvim
- cmake-tools.nvim

Some utilities will install automatically

- clangd
- sonarlint vscode 4.7.0 (unzip and curl required)

#### Dependencies

- Sonarlint requires Java 17

```bash
apt install openjdk-17-jdk openjdk-17-jre
```


### Commands

- View diagnostics with `:Trouble`
- Select `toolkit` with `:CMakeSelect`

Similar as in VSCode, edit the file `$HOME/.local/share/CMakeTools/cmake-tools-kits.json` so it points to the `televic sdk`.

```json
[
  {
    "name": "Televic SDK 2023.02.7",
    "toolchainFile": "/home/aaron/Developer/televic/build_scripts/toolchains/televic_pc_sdk_2023.02.7/share/buildroot/toolchainfile.cmake",
    "isTrusted": true
  }
]
```
- Generate `compile_commands.json` with `:CMakeGenerate`
- Build project with `:CMakeBuild`
