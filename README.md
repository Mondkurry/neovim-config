# My personal neovim config.
_readme updated Feb 1_

<img width="1672" alt="image" src="https://github.com/Mondkurry/neovim-config/assets/30964417/52d13c02-7af4-4da7-8637-938573f12328">

## File Tree
**_Clone in ~/.config/nvim_**
```
├── README.md
├── init.lua
├── lazy-lock.json
├── lua
│   └── mondkurry
│       ├── core
│       │   ├── init.lua
│       │   ├── options.lua
│       │   └── remap.lua
│       ├── lazy.lua
│       └── plugins
│           ├── bufferline.lua
│           ├── colorscheme.lua
│           ├── comment.lua
│           ├── copilot-lualine.lua
│           ├── copilot.lua
│           ├── formatter.lua
│           ├── harpoon.lua
│           ├── init.lua
│           ├── lualine.lua
│           ├── nvim-cmp.lua
│           ├── nvim-surround.lua
│           ├── nvim-tree.lua
│           ├── nvim-treesitter.lua
│           ├── remote-nvim.lua
│           ├── vim-illuminate.lua
│           ├── vim-maximizer.lua
│           └── vim-tmux-navigator.lua
└── neoconf.json
```


### Some commands to run:

| File Tree    |                                                   |
| :----------: | :------------------------------------------------ |
| `<leader>pv` | Open file explorer                                |
| `ctrl+hjkl`  | General Neovim way to switch between panes        |
| `a`          | Adds a new file                                   |
| `r`          | Rename a file                                     |
| `x` -> `p`   | Use x and p to cut and paste files                |

| harpoon      |                                                   |
| :----------: | :------------------------------------------------ |
| `<leader>m`  | Mark File with harpoon                            |
| `<leader>h`  | Open Harpoon Menu                                 |
| `<leader>123`| Open Harpooned file 1/2/3                         |

| Commenting   |                                                   |
| :----------: | :------------------------------------------------ |
|  `gb`        | Comments a section of text using block comments   |
|  `gc`        | Comments a section of text using line comments    |
