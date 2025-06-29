local get_url = ya.sync(function()
  local tab = cx.active
  local url = tostring(tab.current.hovered.url)
  return url
end)

return {
  entry = function(self, job)
    local url = get_url()
    Command("wal-gen"):arg("-i"):arg(url):output()
  end
}
