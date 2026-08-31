{ ... }:

let
  autoRemountOpts = [
    "nofail"
    "x-systemd.automount"
    "noauto"
    "x-systemd.device-timeout=5s"   # don't hang long if drive isn't present
  ];
in
{
  fileSystems."/mnt/media/anime_1" = {
    device = "/dev/disk/by-uuid/5841e9b6-ec06-4a60-a0f6-4eae9e11ccbb";
    fsType = "ext4";
    options = autoRemountOpts;
  };

  fileSystems."/mnt/media/anime_2" = {
    device = "/dev/disk/by-uuid/efa28824-f32d-4039-867f-bc9806ac2d71";
    fsType = "ext4";
    options = autoRemountOpts;
  };

  fileSystems."/mnt/media/anime_3" = {
    device = "/dev/disk/by-uuid/0d9d3102-f3aa-4d04-85af-cd9fa069882a";
    fsType = "ext4";
    options = autoRemountOpts;
  };


  fileSystems."/mnt/media/video" = {
    device = "/dev/disk/by-uuid/656029f5-fbc0-431f-8cd2-2b4a28d63222";
    fsType = "ext4";
    options = autoRemountOpts;
  };

  fileSystems."/mnt/storage" = {
    device = "/dev/disk/by-uuid/9cca1279-c675-44c9-824a-9dfbb7e9054a";
    fsType = "btrfs";
    options = autoRemountOpts;
  };
}
