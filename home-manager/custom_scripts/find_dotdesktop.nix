
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (pkgs.writers.writeFishBin "find_dotdesktop" ''
      function find_dotdesktop
          if test (count $argv) -eq 0
              echo "Usage: find_dotdesktop <name>"
              return 1
          end

          set -l name $argv[1]

          set -l search_dirs \
              ~/.nix-profile/share/applications \
              /run/current-system/sw/share/applications \
              /etc/profiles/per-user/$USER/share/applications \
              /nix/var/nix/profiles/default/share/applications \
              /usr/share/applications \
              /usr/local/share/applications \
              ~/.local/share/applications

          echo "== Searching known application directories =="
          for dir in $search_dirs
              if test -d $dir
                  find $dir -iname "*$name*.desktop" 2>/dev/null
              end
          end

          echo ""
          echo "== Searching /nix/store (this may take a moment) =="
          find /nix/store -maxdepth 1 -iname "*$name*" -type d 2>/dev/null | while read -l pkgdir
              find "$pkgdir/share/applications" -iname "*.desktop" 2>/dev/null
          end
      end

      find_dotdesktop $argv
    '')
  ];
}
