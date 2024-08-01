local get_url = ya.sync(function()
  local tab = cx.active
  local url = tostring(tab.current.hovered.name)
  return url
end)

return {
  entry = function(self, args)
    local url = get_url()
    if (args[1] == "light") then
      ya.manager_emit("shell", {
        "zsh" .. " -ic " .. ya.quote("fwal " .. url .. " light; exit", true),
        block = true,
        confirm = true,
      })
    else
      ya.manager_emit("shell", {
        "zsh" .. " -ic " .. ya.quote("fwal " .. url .. "; exit", true),
        block = true,
        confirm = true,
      })
    end
  end,
}
