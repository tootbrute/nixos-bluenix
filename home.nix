{ config, pkgs, ... }:

{
  home.username = "elias";
  home.homeDirectory = "/home/elias";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them

    fastfetch
    #nnn # terminal file manager

    # archives
    #zip
    #xz
    #unzip
    #p7zip

    # utils
    #ripgrep # recursively searches directories for a regex pattern
    #jq # A lightweight and flexible command-line JSON processor
    #yq-go # yaml processor https://github.com/mikefarah/yq
    #eza # A modern replacement for ‘ls’
    #fzf # A command-line fuzzy finder

    # networking tools
    #mtr # A network diagnostic tool
    #iperf3
    #dnsutils  # `dig` + `nslookup`
    #ldns # replacement of `dig`, it provide the command `drill`
    #aria2 # A lightweight multi-protocol & multi-source command-line download utility
    #socat # replacement of openbsd-netcat
    #nmap # A utility for network discovery and security auditing
    #ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    #cowsay
    #file
    #which
    #tree
    #gnused
    #gnutar
    #gawk
    #zstd
    #gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    ## with more details log output
    nix-output-monitor

    # productivity
    #hugo # static site generator
    #glow # markdown previewer in terminal

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    #strace # system call monitoring
    #ltrace # library call monitoring
    #lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Tootbrute";
    userEmail = "tootbrute@tutamail.com";
  };

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
