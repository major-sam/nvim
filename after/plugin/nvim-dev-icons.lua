require 'nvim-web-devicons'.setup {
  override = {
    Jenkinsfile = {
      icon = "",
      color = "#FF4500",
      cterm_color = "65",
      name = "Jenkinsfile"
    },
    zsh = {
      icon = "",
      color = "#428850",
      cterm_color = "65",
      name = "Zsh"
    },
  },
  default = true,
  color_icons = true,
  strict = true,
  override_by_filename = {
    ["Dockerfile"] = { icon = "", color = "#0034c3", cterm_color = "4", name = "Docker" },
    ["Jenkinsfile"] = { icon = "", color = "#FF4500", name = "Jenkins" },
    ["JenkinsFile"] = { icon = "", color = "#FF4500", name = "Jenkins1" },
    ["jenkinsfile"] = { icon = "", color = "#FF4500", name = "Jenkins2" },
  }
};
