return {
  'andrew-george/telescope-themes',
  enabled = false,
  config = function()
    require('telescope').load_extension('themes')
  end
}
