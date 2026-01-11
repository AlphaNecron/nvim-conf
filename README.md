<img width="2542" height="1385" alt="image" src="https://github.com/user-attachments/assets/a97e536f-ed6f-42a1-8121-1e390a6d933f" />

## Features
### UI
- Catppuccin colorscheme
- Better `noice`/`snacks`/notify style (yes prob minimal enough)
- 1-2 char mode indicator in `lualine`
- Better diagnostics with icons & trimmed virtual text (by default it stuffs the entire diagnostic (including file:line-number) in one line)
> <img width="805" height="51" alt="image" src="https://github.com/user-attachments/assets/a22ffd25-22a9-4f5d-8a78-fe790b63ce87" />

### Languages
- Rust: Set `root_spec` to prioritize `Cargo.lock` over LSP roots (or in this case - subcrates would take precedence, breaking stuff like Live Grep and Overseer).
> <img width="565" height="150" alt="image" src="https://github.com/user-attachments/assets/33042b7d-2d26-49a2-8527-e108eb49cda2" />

### LeetCode
- LeetCode support with `leetcode.nvim`
- Proper annotation folds (`@leet imports start` and `@leet imports end`)

### Competitive programming
- Testing support with `competitest.nvim`

### Snippets
- A few snippets for Rust (skidded from `friendly-snippets`), Python and C++.

### Better session / project support
- Replaced `project.nvim` with `coffebar/neovim-project`. This does more than preserving opened buffers, like preserve opened `neo-tree` nodes.

### Discord RPC
<img width="479" height="203" alt="image" src="https://github.com/user-attachments/assets/96e41004-ad64-4910-8ed6-31ecbac4ca4b" />

### Misc
- WakaTime
