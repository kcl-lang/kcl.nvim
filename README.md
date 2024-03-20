# vim-kcl
Neovim KCL Extension


![image](https://github.com/kcl-lang/vim-kcl/assets/462087/c5bcb1db-87a1-4ddb-ae7d-558f122a08e3)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fkcl-lang%2Fkcl.nvim.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Fkcl-lang%2Fkcl.nvim?ref=badge_shield)


## ⚡️ Requirements

### Manually:

Install the [kcl-language-server](https://kcl-lang.io/docs/user_docs/getting-started/install) from the binary.

> Don't forget to ensure it is in your `$PATH`
```
export PATH=$PATH:{install-location}/kclvm/bin
which kcl-language-server
```

### [mason.nvim](https://github.com/williamboman/mason.nvim):

Simply call `:MasonInstall kcl` to install the `kcl-language-server`

```
:MasonInstall kcl
```

## 📦 Installation

Install the plugin using your prefered plugin manager such as:


### [packer.nvim](https://github.com/wbthomason/packer.nvim):
```lua
use 'kcl-lang/vim-kcl'
```

### [folke/lazy.nvim](https://github.com/folke/lazy.nvim):


```lua
{ "kcl-lang/vim-kcl" },
```


## ⚙️ Configuration

> ❗️ You may want a more advanced configuration to ensure `*.k` files are bound to `ftiletype=kcl`

For example (with the lazy plugin manager)
```
{
	"kcl-lang/vim-kcl",
	init = function()
		vim.api.nvim_command([[autocmd BufRead,BufNewFile *.k set filetype=kcl]])
	end,
	ft = {
		"kcl",
	},
},
```


## 🚀 LSP Config

You may want to adjust your lspconfig.. for example:

```lua
local util = require("lspconfig.util")

return {
	cmd = { "kcl-language-server" },
	filetypes = { "kcl" },
	root_dir = util.root_pattern(".git"),
}
```

## ✨ Features
+ Syntax Highlight
+ Code folding
+ Quick Comment
+ Diagnostics:  Warnings and errors in KCL file.

## 🍭 Commands
**Insert mode:**

``Ctrl+\``  Toggle comment.

**Normal mode:**

```zC```  Close all folds under the cursor recursively. 

```zO```  Open all folds under the cursor recursively. 

```zM```  Close all folds.

```zR```   Open all folds. 


## License
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fkcl-lang%2Fkcl.nvim.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2Fkcl-lang%2Fkcl.nvim?ref=badge_large)