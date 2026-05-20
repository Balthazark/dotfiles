# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

nix-darwin + home-manager configuration for a single machine (`navi`, aarch64-darwin). One flake, nixpkgs-unstable. Homebrew is used only for GUI apps with no Nix equivalent.

## Commands

```bash
drb                          # apply config (alias for sudo darwin-rebuild switch --flake ~/git/dotfiles#navi)
nix fmt                      # format all nix files (nixfmt-tree)
statix check ~/git/dotfiles  # lint for antipatterns
deadnix ~/git/dotfiles       # find unused bindings
sudo darwin-rebuild check --flake ~/git/dotfiles#navi  # dry-run without applying
```

Always run `nix fmt`, `statix check`, and `deadnix` after editing any `.nix` file (the PostToolUse hook does this automatically). Run `drb` to verify the config builds and activates before considering a task done.

## Module structure

```
flake.nix              # single entry point, declares nixpkgs-unstable + nix-darwin + home-manager
darwin/
  default.nix          # imports the darwin modules below
  system.nix           # hostname, primaryUser, stateVersion, experimental-features, unfree allowlist
  security.nix         # Touch ID sudo
  apps.nix             # GUI apps from nixpkgs — environment.systemPackages for Spotlight visibility
  homebrew.nix         # GUI casks only (no Nix equivalent); cleanup = "zap" means unlisted casks are removed on rebuild
  macos.nix            # system.defaults — dock, finder, trackpad, keyboard, screenshots
home/
  default.nix          # imports the home modules below
  packages.nix         # home.packages — user CLI tools
  git.nix              # programs.git
  zsh.nix              # programs.zsh, fzf, zoxide — shell config, vi mode, aliases
  ssh.nix              # programs.ssh — ~/.ssh/config with macOS Keychain integration
  bat.nix              # programs.bat — catppuccin-mocha theme
  starship.nix         # programs.starship — prompt with catppuccin-mocha palette
```

darwin modules are nix-darwin modules; home modules are home-manager modules. The two systems are composed in `flake.nix` via `home-manager.darwinModules.home-manager`.

## Conventions

**Adding packages:** CLI tools go in `home/packages.nix`. GUI apps with a Nix package go in `darwin/apps.nix` (`environment.systemPackages`) so nix-darwin links them into `/Applications/Nix Apps/` for Spotlight; their config goes in a `home/` module. GUI apps with no Nix equivalent go in `darwin/homebrew.nix`. Programs with configuration (git, zsh, ssh) get their own module in `home/`.

**New modules:** create the file, add it to the relevant `default.nix` imports list. Use `_:` for modules that don't destructure arguments; use `{ pkgs, ... }:` only when `pkgs` is needed.

**Unfree packages:** add the package name to the allowlist in `darwin/system.nix`.

**Nix style:**
- `_:` not `{ ... }:` for modules with no used arguments
- Group repeated keys: `home = { stateVersion = ...; username = ...; }` not `home.stateVersion = ...; home.username = ...;`
- No comments unless the WHY is non-obvious

## Commits

Conventional commits with scopes. Common scopes:

| Scope | Where |
|---|---|
| `chore(system):` | `darwin/system.nix`, `darwin/security.nix` |
| `chore(macos):` | `darwin/macos.nix` |
| `chore(homebrew):` | `darwin/homebrew.nix` |
| `feat(home):` / `fix(home):` | anything in `home/` |
| `chore(flake):` | `flake.nix`, `flake.lock` |
| `ci:` | `.github/workflows/` |

`ci:` never needs a scope. `chore:` without a scope is fine when a change spans multiple modules. Commit body bullets: lowercase, imperative mood.

## Adding new things

Before adding any new option or package, explain what it does and why. The goal is to understand everything in the config, not just accumulate settings.
