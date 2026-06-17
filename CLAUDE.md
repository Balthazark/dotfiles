# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Multi-host nix-darwin + NixOS + home-manager configuration. One flake, nixpkgs-unstable. Homebrew is used for all GUI apps (casks) on darwin, regardless of whether a Nix package exists, to get faster upstream updates.

| Host | System | Description |
|---|---|---|
| `navi` | aarch64-darwin | personal macOS machine |
| `eiri` | x86_64-linux | NixOS on WSL2 |

## Commands

```bash
rb                           # apply config — smart alias, detects OS and hostname automatically
nix fmt                      # format all nix files (nixfmt-tree)
statix check ~/git/dotfiles  # lint for antipatterns
deadnix ~/git/dotfiles       # find unused bindings
# dry-run without applying:
sudo darwin-rebuild check --flake ~/git/dotfiles#navi       # on navi
sudo nixos-rebuild dry-activate --flake ~/git/dotfiles#eiri # on eiri
```

Always run `nix fmt`, `statix check`, and `deadnix` after editing any `.nix` file (the PostToolUse hook does this automatically). Run `rb` to verify the config builds and activates before considering a task done.

## Module structure

```
flake.nix                    # declares nixpkgs-unstable, nix-darwin, home-manager, nixos-wsl
hosts/
  navi/
    default.nix              # darwin system config, imports modules/darwin/
    home.nix                 # navi-specific home assembly, imports modules/common/
  eiri/
    default.nix              # NixOS system config, imports modules/nixos/
    home.nix                 # eiri-specific home assembly, imports modules/common/
modules/
  common/
    default.nix              # imports the common home-manager modules below
    packages.nix             # shared CLI tools
    git.nix                  # programs.git
    zsh.nix                  # programs.zsh, fzf, zoxide — shell config, vi mode, aliases (includes rb)
    ssh.nix                  # programs.ssh — ~/.ssh/config
    bat.nix                  # programs.bat — catppuccin-mocha theme
    starship.nix             # programs.starship — prompt with catppuccin-mocha palette
  darwin/
    default.nix              # imports the darwin modules below
    system.nix               # hostname, primaryUser, stateVersion, experimental-features, unfree allowlist
    security.nix             # Touch ID sudo
    homebrew.nix             # all GUI casks; cleanup = "zap" means unlisted casks are removed on rebuild
    macos.nix                # system.defaults — dock, finder, trackpad, keyboard, screenshots
  nixos/
    default.nix              # imports the nixos modules below
    wsl.nix                  # NixOS-WSL integration
```

darwin modules are nix-darwin modules; nixos modules are NixOS modules; common modules are home-manager modules. All hosts wire home-manager in via the respective `*Modules.home-manager` integration point in `flake.nix`.

## Conventions

**Adding packages:** Shared CLI tools go in `modules/common/packages.nix`. GUI apps go in `modules/darwin/homebrew.nix` as casks. Host-specific tools go in the relevant `hosts/<name>/home.nix`. Programs with configuration (git, zsh, ssh) get their own module in `modules/common/`.

**New modules:** create the file, add it to the relevant `default.nix` imports list. Use `_:` for modules that don't destructure arguments; use `{ pkgs, ... }:` only when `pkgs` is needed.

**Unfree packages:** add the package name to the allowlist in `modules/darwin/system.nix`.

**Nix style:**
- `_:` not `{ ... }:` for modules with no used arguments
- Group repeated keys: `home = { stateVersion = ...; username = ...; }` not `home.stateVersion = ...; home.username = ...;`
- No comments unless the WHY is non-obvious

## Commits

Conventional commits with scopes. Common scopes:

| Scope | Where |
|---|---|
| `chore(system):` | `modules/darwin/system.nix`, `modules/darwin/security.nix` |
| `chore(macos):` | `modules/darwin/macos.nix` |
| `chore(homebrew):` | `modules/darwin/homebrew.nix` |
| `feat(darwin):` / `fix(darwin):` | new darwin modules |
| `feat(nixos):` / `fix(nixos):` | new nixos modules |
| `chore(nixos):` | routine NixOS system config (wsl.nix, system options) |
| `feat(home):` / `fix(home):` | `modules/common/` or `hosts/*/home.nix` |
| `feat(hosts):` / `fix(hosts):` | new per-host features (e.g. WezTerm, host-specific tools) |
| `chore(hosts):` | `hosts/` structure, per-host config |
| `feat(eiri):` / `fix(eiri):` | eiri-specific changes in `hosts/eiri/` |
| `feat(navi):` / `fix(navi):` | navi-specific changes in `hosts/navi/` |
| `chore(flake):` | `flake.nix`, `flake.lock` |
| `ci:` | `.github/workflows/` |

`ci:` never needs a scope. `chore:` without a scope is fine when a change spans multiple modules. Commit body bullets: lowercase, imperative mood, max 100 chars per line — use more bullets rather than wrapping a single one.

## Adding new things

Before adding any new option or package, explain what it does and why. The goal is to understand everything in the config, not just accumulate settings.

## Code intelligence

Prefer LSP over Grep/Glob/Read for code navigation when a language server is available:
- `goToDefinition` / `goToImplementation` to jump to source
- `findReferences` to find all usages across the codebase
- `hover` for type info without reading the file
- `workspaceSymbol` to locate a symbol project-wide

Use Grep/Glob for text/pattern searches (comments, strings, config values) where LSP doesn't apply. After editing, check LSP diagnostics and fix any errors before moving on.
