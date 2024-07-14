local get_url = ya.sync(function()
  local tab = cx.active
  local url = tostring(tab.current.hovered.name)
  return url
end)

return {
  entry = function()
    local url = get_url()
    ya.manager_emit("shell", {
			"zsh" .. " -ic " .. ya.quote("fwal " .. url .. "; exit", true),
			block = true,
			confirm = true,
		})
  end,
}
