{ lib, pkgs, ... }:
let
  catppuccinMocha = {
    name = "Catppuccin Mocha";
    background = "#1E1E2E";
    foreground = "#CDD6F4";
    selectionBackground = "#585B70";
    cursorColor = "#F5E0DC";
    black = "#45475A";
    brightBlack = "#585B70";
    red = "#F38BA8";
    brightRed = "#F38BA8";
    green = "#A6E3A1";
    brightGreen = "#A6E3A1";
    yellow = "#F9E2AF";
    brightYellow = "#F9E2AF";
    blue = "#89B4FA";
    brightBlue = "#89B4FA";
    purple = "#CBA6F7";
    brightPurple = "#F5C2E7";
    cyan = "#94E2D5";
    brightCyan = "#89DCEB";
    white = "#BAC2DE";
    brightWhite = "#A6ADC8";
  };

  settings = {
    "$help" = "https://aka.ms/terminal-documentation";
    "$schema" = "https://aka.ms/terminal-profiles-schema";
    actions = [ ];
    copyFormatting = "none";
    copyOnSelect = false;
    defaultProfile = "{aaa738a6-5f85-5ad5-815f-b72f1454d6d1}";
    keybindings = [
      {
        id = "Terminal.CopyToClipboard";
        keys = "ctrl+c";
      }
      {
        id = "Terminal.PasteFromClipboard";
        keys = "ctrl+v";
      }
      {
        id = "Terminal.FindText";
        keys = "ctrl+shift+f";
      }
      {
        id = "Terminal.DuplicatePaneAuto";
        keys = "alt+shift+d";
      }
    ];
    newTabMenu = [ { type = "remainingProfiles"; } ];
    profiles = {
      defaults = {
        colorScheme = "Catppuccin Mocha";
        font = {
          face = "JetBrainsMono Nerd Font Mono";
          size = 14;
        };
      };
      list = [
        {
          commandline = "%SystemRoot%\\System32\\WindowsPowerShell\\v1.0\\powershell.exe";
          guid = "{61c54bbd-c2c6-5271-96e7-009a87ff44bf}";
          hidden = false;
          name = "Windows PowerShell";
        }
        {
          commandline = "%SystemRoot%\\System32\\cmd.exe";
          guid = "{0caa0dad-35be-5f56-a8ff-afceeeaa6101}";
          hidden = false;
          name = "Command Prompt";
        }
        {
          guid = "{b453ae62-4e3d-5e58-b989-0a998ec441b8}";
          hidden = false;
          name = "Azure Cloud Shell";
          source = "Windows.Terminal.Azure";
        }
        {
          guid = "{aaa738a6-5f85-5ad5-815f-b72f1454d6d1}";
          hidden = false;
          name = "NixOS";
          source = "Microsoft.WSL";
        }
      ];
    };
    schemes = [ catppuccinMocha ];
    themes = [ ];
  };

  settingsFile = pkgs.writeText "wt-settings.json" (builtins.toJSON settings);
  wtSettingsPath = "/mnt/c/Users/Karl.gunnarsson/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json";
in
{
  home.activation.windowsTerminalSettings = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ -d "/mnt/c/Users/Karl.gunnarsson" ]; then
      $DRY_RUN_CMD cp ${settingsFile} "${wtSettingsPath}"
    fi
  '';
}
