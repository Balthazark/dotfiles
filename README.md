# dotfiles

nix-darwin + NixOS + home-manager configuration for multiple hosts.

| Host | System |
|---|---|
| `navi` | aarch64-darwin |
| `eiri` | x86_64-linux (NixOS on WSL2) |

## Applying

```bash
rb   # detects OS and hostname automatically
```

## Bootstrap steps

These are one-time manual steps required after a fresh install. Everything else is declarative.

### navi — Plash (animated wallpaper)

Plash is installed automatically via `masApps`. After first install:

1. Open Plash from Applications
2. Click the Plash icon in the menu bar → add a website
3. Set the URL to `file:///Users/kagu/git/dotfiles/hosts/navi/wallpaper/index.html`
4. Grant folder access when prompted
5. Enable "Launch at Login" in Plash preferences

The wallpaper content lives in `hosts/navi/wallpaper/` in this repo and is loaded directly by Plash — changes take effect on reload.

### eiri — NixOS on WSL2

1. Install WSL2 on the Windows machine
2. Download `nixos.wsl` from the [NixOS-WSL releases](https://github.com/nix-community/NixOS-WSL/releases)
3. `wsl --install --from-file nixos.wsl`
4. Launch NixOS (`wsl -d NixOS`), clone this repo to `~/git/dotfiles`
5. `sudo nixos-rebuild switch --flake ~/git/dotfiles#eiri` (run as the default `nixos` user)
6. Set a password for the `kagu` user: `sudo passwd kagu`
7. Optionally make NixOS the default WSL distro: `wsl -s NixOS` (run from PowerShell)
8. Re-open the shell — you'll now be logged in as `kagu` and `rb` works as normal
