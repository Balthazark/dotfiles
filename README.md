# dotfiles

nix-darwin + home-manager configuration for `navi` (aarch64-darwin).

## Applying

```bash
drb   # sudo darwin-rebuild switch --flake ~/git/dotfiles#navi
```

## Bootstrap steps

These are one-time manual steps required after a fresh install. Everything else is declarative.

### Plash (animated wallpaper)

Plash is installed automatically via `masApps`. After first install:

1. Open Plash from Applications
2. Click the Plash icon in the menu bar → add a website
3. Set the URL to `file:///Users/kagu/git/dotfiles/home/wallpaper/index.html`
4. Grant folder access when prompted
5. Enable "Launch at Login" in Plash preferences

The wallpaper content lives in `home/wallpaper/` in this repo and is loaded directly by Plash — changes take effect on reload.
