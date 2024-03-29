{ pkgs, config, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "nightfox";
      editor = {        
        line-number = "relative";
      };
      keys.normal = {
        C-s = "file_picker";
      }; 
    };
  };
}
