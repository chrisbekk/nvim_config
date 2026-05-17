# Neovim Keybinds

Leader key: `<Space>`

---

## Explorer

| Mode   | Keybind     | Action                        |
| ------ | ----------- | ----------------------------- |
| Normal | `<leader>e` | Open file explorer (Lexplore) |

---

## Insert Mode

| Mode   | Keybind | Action           |
| ------ | ------- | ---------------- |
| Insert | `jk`    | Exit insert mode |

---

## Terminal

| Mode     | Keybind     | Action                            |
| -------- | ----------- | --------------------------------- |
| Normal   | `<leader>t` | Open terminal in horizontal split |
| Terminal | `jk`        | Exit terminal mode                |
| Terminal | `<leader>q` | Close terminal buffer             |

---

## Buffer Management

| Mode   | Keybind      | Action               |
| ------ | ------------ | -------------------- |
| Normal | `<leader>q`  | Close current buffer |
| Normal | `<leader>bn` | Next buffer          |
| Normal | `<leader>bp` | Previous buffer      |
| Normal | `<leader>bd` | Delete buffer        |

---

## Window Navigation

### Normal Mode

| Mode   | Keybind | Action               |
| ------ | ------- | -------------------- |
| Normal | `<C-h>` | Move to left window  |
| Normal | `<C-j>` | Move to lower window |
| Normal | `<C-k>` | Move to upper window |
| Normal | `<C-l>` | Move to right window |

### Terminal Mode

| Mode     | Keybind | Action               |
| -------- | ------- | -------------------- |
| Terminal | `<C-h>` | Move to left window  |
| Terminal | `<C-j>` | Move to lower window |
| Terminal | `<C-k>` | Move to upper window |
| Terminal | `<C-l>` | Move to right window |

### Netrw Window Navigation

These mappings are active only inside `netrw`.

| Mode   | Keybind | Action               |
| ------ | ------- | -------------------- |
| Normal | `<C-h>` | Move to left window  |
| Normal | `<C-j>` | Move to lower window |
| Normal | `<C-k>` | Move to upper window |
| Normal | `<C-l>` | Move to right window |

---

## LSP Keybinds

These mappings become active when an LSP server attaches to a buffer.

| Mode   | Keybind      | Action               |
| ------ | ------------ | -------------------- |
| Normal | `gd`         | Go to definition     |
| Normal | `gD`         | Go to declaration    |
| Normal | `gr`         | Show references      |
| Normal | `gi`         | Go to implementation |
| Normal | `K`          | Hover documentation  |
| Normal | `<leader>rn` | Rename symbol        |
| Normal | `<leader>ca` | Code actions         |
| Normal | `<leader>f`  | Format buffer        |
| Normal | `[d`         | Previous diagnostic  |
| Normal | `]d`         | Next diagnostic      |

