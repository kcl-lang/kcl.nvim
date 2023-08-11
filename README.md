# vim-kcl
Neovim KCL Extension

### Features
+ Syntax Highlight
+ Code folding
+ Quick Comment
+ Diagnostics:  Warnings and errors in KCL file.

### Install 
1. [Install kcl-language-server](https://kcl-lang.io/docs/user_docs/getting-started/install) from the binary releases.
2. Set an environment variable in Linux.
```
export PATH=$PATH:{install-location}/kclvm/bin
```
3. Install the extension through [packer.nvim](https://github.com/wbthomason/packer.nvim).
```
use 'kcl-lang/vim-kcl'
```
The extension will be installed in ``` ~/.local/share/nvim/site/pack/packer/start/```

### Commands
**Insert mode:**
``Ctrl+\``  Toggle comment.

**Normal mode:**
```zC```  Close all folds under the cursor recursively. 

```zO```  Open all folds under the cursor recursively. 

```zM```  Close all folds.

```zR```   Open all folds. 
