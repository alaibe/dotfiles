# Dotfiles

Here is the collection of my dotfiles. I do my best to keep them clean and up
to date, but these are constantly changing as I update my dev environment and
shell custimizations so they are bound to be a bit inconsistent from time to
time.

## Setup

### 1. Install Dependencies

```bash
brew bundle install
```

### 2. Terminal Font Configuration (Required for Icons)

**Terminal.app:**

1. Terminal → Preferences (⌘ + ,)
2. Profiles tab → Select your profile
3. Text tab → Click Font button
4. Select: "FiraCode Nerd Font Regular" (NOT "FiraCode Nerd Font Mono")
5. Size: 13-14pt
6. Restart Terminal.app completely

**iTerm2:**

1. iTerm2 → Preferences → Profiles → Text → Font
2. Select: "FiraCode Nerd Font" or "Hack Nerd Font"
3. Size: 12-14pt

**Test Icons:**

```bash
echo "Icons test: 📁 📄 💻 🔧"
```

### 3. Install Neovim Plugins

```bash
nvim +PlugInstall +qall
```

### 4. Link Global Clojure Config

```bash
mkdir -p ~/.clojure
ln -sf ~/code/dotfiles/clojure/deps.edn ~/.clojure/deps.edn
```

## Features

- **Modern Clojure/ClojureScript Development**: deps.edn, shadow-cljs, LSP, REPL integration
- **Enhanced Git Workflow**: Delta diffs, lazygit, automated hooks
- **Smart Navigation**: Zoxide, McFly, fzf integration
- **Rich Editor Experience**: LSP, snippets, structural editing for Clojure
- **AI Integration**: Claude Code aliases and helpers
