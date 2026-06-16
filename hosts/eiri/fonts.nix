{ lib, pkgs, ... }:
{
  home.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

  home.activation.installWindowsFonts = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ -d "/mnt/c/Users/Karl.gunnarsson" ]; then
      nixFontsW=$(/sbin/wslpath -w "${pkgs.nerd-fonts.jetbrains-mono}/share/fonts")
      winFontsDirW="C:\\Users\\Karl.gunnarsson\\AppData\\Local\\Microsoft\\Windows\\Fonts"
      $DRY_RUN_CMD /mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -NoProfile -NonInteractive -Command "
        New-Item -ItemType Directory -Force -Path '$winFontsDirW' | Out-Null
        Get-ChildItem -Recurse '$nixFontsW' -Filter '*.ttf' |
          Where-Object { -not (Test-Path (Join-Path '$winFontsDirW' \$_.Name)) } |
          ForEach-Object {
            \$dest = Join-Path '$winFontsDirW' \$_.Name
            Copy-Item \$_.FullName \$dest
            Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts' \`
              -Name (\$_.BaseName + ' (TrueType)') -Value \$dest -Force
          }
      "
    fi
  '';
}
