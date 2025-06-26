if vim.g.neovide then
  vim.o.guifont = "Iosevka,JetBrainsMono Nerd Font:h16"
  vim.g.neovide_title_background_color = string.format(
    "%x",
    vim.api.nvim_get_hl(0, {id=vim.api.nvim_get_hl_id_by_name("Normal")}).bg
  )
  vim.g.neovide_opacity = 0.75
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_refresh_rate = 165
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_cursor_vfx_particle_lifetime = 1.5
  vim.g.neovide_cursor_vfx_particle_highlight_lifetime = 0.8
  vim.g.neovide_cursor_vfx_particle_density = 1
end
