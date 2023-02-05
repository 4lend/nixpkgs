{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.

  home.username = "alfurqani";
  home.homeDirectory = "/home/alfurqani";
  home.stateVersion = "23.05";

  imports = [
    ./alacritty
    ./kitty
    ./mpv
    ./neovim
    ./tmux
    ./git
    ./yt-dlp
  ];

  home = 
  {
    ## packages ##
    packages = with pkgs; [
      cloudflare-warp
    ];

    ## keyboard ##
    keyboard = 
    {
      layout = "us";
      variant = "qwerty";
      options = 
      [
        "grp:win_space_toggle"
        "grp:caps_toggle,grp_led:scroll"
      ];
    };
  };

  programs =
  {
    home-manager.enable = true;

    # ## FISH ##
    # fish = 
    # {
    #   enable = true;
    #   interactiveShellInit =
    #   "
    #     bind \t accept-autosuggestion
    #   ";
    # };

    ## STARSHIP ##
    starship =
    {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true; 
      settings = 
      {
        add_newline = true;
	command_timeout = 1000;
        cmd_duration = 
	{
          format = " [$duration]($style) ";
          style = "bold #EC7279";
          show_notifications = true;
        };
        nix_shell = 
	{
          format = " [$symbol$state]($style) ";
        };
        battery = 
	{
          full_symbol = "🔋 ";
          charging_symbol = "⚡️ ";
          discharging_symbol = "💀 ";
        };
        git_branch = 
	{
          format = "[$symbol$branch]($style) ";
        };
        gcloud = 
	{
          format = "[$symbol$active]($style) ";
        };
      };
    };

    ## FZF ##
    fzf = 
    {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      tmux.enableShellIntegration = true;
    };

    ## YT-DLP ##
    yt-dlp =
    {
      enable = true;
      settings = 
      {
        sub-langs = "en,id";
	      downloader = "aria2c";  # native, aria2c, axel, curl, wget, ffmpeg, httpie, avconf
	      write-subs = true;
	      write-auto-subs = true;
        # proxy = "http://192.168.49.1:8000";
        # video-multistream = true;
	      # list-formats = true;
	      # progress = true;
      };
      # extraConfig = 
      # "
      #   --write-subs
      #   --write-auto-subs
      #   --sub-langs en
      #   --downloader aria2c 
      # ";
    };

    ## GIT ##
    git = 
    {
      enable = true;
      userEmail = "syifa.alfurqoni@gmail.com";
      userName = "Alfurqani";
      # ignores = "result";
      # signing = 
      # signing.gpgPath = "";
      # signing.key = "";
      # signing.signByDefault = true;
    };

    # ## NEOVIM ## 
    # neovim =
    # {
    #   enable = true;
    #   viAlias = false;
    #   vimAlias = false; 
    #   coc.enable = true;
    #   plugins = with pkgs.vimPlugins;
    #   [
    #     # plugins
    #     telescope-nvim
    #     telescope-project-nvim
    #     telescope-github-nvim
    #     telescope-frecency-nvim
    #     vim-lightline-coc
    #     nvim-lightline-lsp
    #     lightline-vim
    #     lightline-lsp
    #     nvim-treesitter

    #     # colorschemes
    #     onenord-nvim
    #     nordic-nvim
    #     nord-nvim
    #     dracula-vim
    #     dracula-nvim
    #     kanagawa-nvim
    #   ];

    #   extraConfig = 
    #   ''
    #     set number
    #     set relativenumber
    #     set nobackup
    #     imap jj <Esc>
    #     inoremap jj <Esc>
    #     syntax on
    #   '';

    #   # settings = 
    #   # {
    #   #   # vim = 
    #   #   # {
    #   #   #   
    #   #   # };
    #   # };

    #   # generatedConfigs = 
    #   # {
    #   #   viml = 
    #   #   ''
    #   #     imap jj <Esc>
    #   #   '';
    #   # };
    # };

    ## qutebrowser ##
    qutebrowser =
    {
    enable = true;
    enableDefaultBindings = true;
    };

    ## Z-LUA ##
    z-lua = 
    {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };
  };

  # Let Home Manager install and manage itself.

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
}
